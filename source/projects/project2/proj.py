
class Mesh :
    def __init__(self,nX,x,mat,bc) :
        self.nX = nX
        self.x = x
        self.mat = mat
        self.bc = bc

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

    meshOut = meshIn
    meshOut.nX = nxOut
  
    meshOut.x = np.zeros(nxOut+1)
    meshOut.mat = np.zeros(nxOut)
  
    for i in range(0,nxOut,2) :
        meshOut.x[i] = meshIn.x[i/2]
        meshOut.x[i+1] = (meshIn.x[i/2] + meshIn.x[i/2 + 1])/2
    meshOut.x[nxOut] = meshIn.x[nxIn]
  
    for i in range(0,nxOut,2) :
        meshOut.mat[i] = meshIn.mat[i/2]
        meshOut.mat[i+1] = meshIn.mat[i/2]
