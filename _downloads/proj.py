import numpy as np

class Mesh :
    def __init__(self,nX,x,mat,bc) :
        self.nX = nX
        self.x = x
        self.mat = mat
        self.bc = bc
        self.src = None

class CrossSection :
    def __init__(self,sigTr, sigA, sigF, nuBar, sigS) :
        self.sigTr = sigTr
        self.sigA = sigA
        self.sigF = sigF
        self.nuBar = nuBar
        self.sigS = sigS

def getXS() :
    xsCore = CrossSection([2.23775E-01, 1.03864E+00],
                          [8.52700E-03, 1.58201E-01],
                          [3.95356E-03, 1.26167E-01],
                          2.3,
                          [[1.92423E-01, 0.00000E+00],
                          [2.28253E-02, 8.80439E-01]])
    xsReflector = CrossSection([2.50367E-01, 1.64482E+00],
                               [4.16800E-04, 2.03000E-02],
                               [0.00000E+00, 0.00000E+00],
                               0.0,
                               [[1.93446E-01, 0.00000E+00],
                                [5.65042E-02, 1.62452E+00]])
    xsControlRod = CrossSection([8.52325E-02, 2.17460E-01],
                                [1.74439E-02, 1.82224E-01],
                                [0.00000E+00, 0.00000E+00],
                                0.0,
                                [[0.067724065252800, 0.00000E+00],
                                 [0.000064546067896, 3.52358E-02]])
    return [xsCore, xsReflector, xsControlRod]

def refineMesh(meshIn) :
    nxIn = meshIn.nX
    if nxIn > 1 :
        nxOut = nxIn*2
    else :
        nxOut = nxIn

    x = np.zeros(nxOut+1)
    mat = np.zeros(nxOut, dtype=np.int8)
  
    for i in range(0,nxOut,2) :
        x[i] = meshIn.x[i/2]
        x[i+1] = (meshIn.x[i/2] + meshIn.x[i/2 + 1])/2
    x[nxOut] = meshIn.x[nxIn]
  
    for i in range(0,nxOut,2) :
        mat[i] = meshIn.mat[i/2]
        mat[i+1] = meshIn.mat[i/2]

    return Mesh(nxOut,x,mat,meshIn.bc)

def powerIterationSolve(solnMesh, xs, N, sweep) :
    maxPowerIterations = 1000;

    flux = np.ones((solnMesh.nX, len(xs[0].sigTr)))
    k = 1.0
    F = 1.0
    for kiter in range(maxPowerIterations) :
        Fold = F
        (fissionSource, F) = calculateFissionSource(solnMesh, xs, flux)

        kold = k
        k = k*F/Fold
        if abs(k-kold) < 1.0e-6 :
            break

        solnMesh.src = fissionSource/k
        flux = MultigroupFixedSourceSolve(solnMesh, xs, N, flux, sweep)

    if kiter==maxPowerIterations-1 :
        print "WARNING: eigenvalue iterations not converged"

    fluxNorm = 0
    for i in range(solnMesh.nX) :
        for g in range(len(xs[0].sigTr)) :
            fluxNorm += flux[i,g]*(solnMesh.x[i+1]-solnMesh.x[i])
    flux = flux/fluxNorm

    return (flux,k)

def calculateFissionSource(solnMesh, xs, flux) :
    fissionSourceTotal = 0.0
    fissionSource = np.zeros(solnMesh.nX)
    
    for i in range(solnMesh.nX) :
        fissionRate = 0.0
        for g in range(len(xs[solnMesh.mat[i]-1].sigF)) :
            fissionRate += xs[solnMesh.mat[i]-1].sigF[g]*flux[i,g]
        fissionSource[i] = xs[solnMesh.mat[i]-1].nuBar*fissionRate
        fissionSourceTotal += fissionSource[i]*(solnMesh.x[i+1]-solnMesh.x[i])

    return (fissionSource, fissionSourceTotal)


def MultigroupFixedSourceSolve(solnMesh, xs, N, fluxInit, sweep) :
    nx = solnMesh.nX
    numGroups = len(xs[0].sigTr)

    # Calculate the fixed external source
    fissionSource = np.zeros(nx)
    for j in range(nx) :
        fissionSource[j] = solnMesh.src[j]/2.0;

    flux = fluxInit
    for si in range(100) :
        fluxOld = np.copy(flux)

        for g in range(numGroups) :
            scatterSource = np.zeros(nx)
            for gp in range(numGroups) :
                for j in range(nx) :
                    scatterSource[j] += xs[solnMesh.mat[j]-1].sigS[g][gp]*flux[j,gp]/2.0

            if g==0 :
                bg = scatterSource + fissionSource
            else :
                bg = scatterSource

            flux[:,g] = sweep(solnMesh, xs, bg, N, g+1)
            
        if np.max(abs(flux-fluxOld)) < 1.0e-4 :
            break

    return flux
