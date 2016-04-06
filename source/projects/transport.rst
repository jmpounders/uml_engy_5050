Transport Theory in Reactor Physics
===================================

**Due date:** April 11, 2016, 11:59 PM

Neutron transport theory plays an important role in reactor physcis.  In this project we will develop a simple transport theory model of a notional 1D reactor.

Project Specification
---------------------

This project will consist of three parts.  The following assumptions may be made universally:

1. Isotropic neutron emission from fission;
2. Isotropic scattering;
3. One spatial dimension.

Part 1
~~~~~~

1. Derive the :math:`S_N` sweep equations for both forward (:math:`\mu_m > 0`) and backward (:math:`\mu_m < 0`) directions.  You may assume one energy group, and the scattering and fission sources should be represented by a single variable (e.g., :math:`q_{m,i}`).
2. Implement a function (in either Matlab or Python) that solves the :math:`S_N` sweep equations.  The function should accept mesh and cross section data structures (see the :ref:`dataStructures` below) and return the a vector array consisting of the *scalar* flux in each spatial cell.  This function should solve the *within-group* transport equation.  In other words, assume that you have a known, given source term that takes the place of the scattering and fission sources.  This is effectively a one-group, fixed-source transport sweep with no fission or scattering.  (See details below for guidance on implementing this function.)
3. Calculate the scalar flux of a homogeneous 1D system.  Let the reactor be 10 cm wide, and use 6 discrete directions.  For the cross sections, use the group-2 (thermal) cross sections for material 1.  Set the source term to be equal to 1/2 everywhere.  For convenience, Python and Matlab templates are provided below.  All you need to do is implement your sweep function (step 2 previously) and insert it into the code below.

Python:

::

   from proj import *
   import numpy as np
   import matplotlib.pyplot as plt

   # Create the mesh
   solnMesh = Mesh(10, 
                   np.linspace(0.0,10,11), 
                   [1,1,1,1,1,1,1,1,1,1],
                   [1,1])

   # Refine the mesh
   for i in range(4) :
       solnMesh = refineMesh(solnMesh);

   # Get the cross sections
   xs = getXS()

   # Create the source array
   q = 0.5*np.ones(solnMesh.nX)

   # Implement the sweep function
   def sweep(solnMesh, xs, q, N, g) : 
   #
   # !!!PUT YOUR FUNCTION HERE!!!
   # (...or in the proj file)
   #

   # Calculate the scalar flux
   g = 2
   phi = sweep(solnMesh,xs,q,6,g)

   # Plot your results at cell centers
   xCell = np.zeros(solnMesh.nX);
   for i in range(solnMesh.nX) :
       xCell[i] = (solnMesh.x[i]+solnMesh.x[i+1])/2.0;

   plt.plot(xCell,phi)
   plt.xlabel('z')
   plt.ylabel('Scalar flux')

Matlab:

::

   clear;
   clc;

   % Create the mesh
   solnMesh = struct('nX',  10, ...
                     'x',   linspace(0,10,11), ...
                     'mat', [1;1;1;1;1;1;1;1;1;1],  ...
                     'bc',  [1,1]);

   % Refine the mesh
   for i = 1:4
      solnMesh = refineMesh(solnMesh);
   end

   % Get the cross sections
   xs = getXS();

   % Create the source array
   q = 1/2*ones(solnMesh.nX,1);

   % Make sure your sweep file (sweep.m) is in your path

   % Calculate the scalar flux
   g = 2;
   phi = sweep(solnMesh,xs,q,6, g);

   % Plot your results at cell centers
   xCell = zeros(solnMesh.nX,1);
   for i = 1:solnMesh.nX
      xCell(i) = (solnMesh.x(i)+solnMesh.x(i+1))/2.0;
   end
   plot(xCell,phi)
   xlabel('z')
   ylabel('Scalar flux')








Part 2
~~~~~~

1. Derive the one-group diffusion equation from the one-group :math:`P_1` equations.
2. Derive the analytical solution of the diffusion equation for a homogeneous medium.  Boundary conditions should approximate the condition of no incoming neutrons.  Part of your solution should be an expression for the effective multiplication factor, :math:`k = k_\text{eff} = \lambda^{-1}`.

Part 3
~~~~~~

1. Consider a 25-cm "slab" reactor composed of a homogenous material (material number 1 from the project).  Calculate the effective multiplication constant and the two-group fluxes using both diffusion theory and S6 transport theory.  Compare your solutions and discuss the differences.  (Note that you need to extend your results from part 2 to two-group to do this.)  For this part you will also need the most-up-to-date files from the website (updated 4/4/16).  You can then generate the multigroup solution as follows:

Matlab:

::

   solnMesh = struct('nX',  10, ...
                     'x',   [linspace(0,25,11)], ...
                      'mat', [1;1;1;1;1;1;1;1;1;1],  ...
                      'bc',  [1,1]);
   for i = 1:4
      solnMesh = refineMesh(solnMesh);
   end
   xs = getXS();
   [ flux_s6, k_s6 ] = powerIterationSolve( solnMesh,xs,6 );


Python:

::

   solnMesh = Mesh(10, 
                np.linspace(0.0,25,11), 
                [1,1,1,1,1,1,1,1,1,1],
                [2,1])
   for i in range(4) :
       solnMesh = refineMesh(solnMesh);
   xs = getXS()
   [ flux_s6, k_s6 ] = powerIterationSolve( solnMesh,xs,6,sweep )

   
2. What happends to the effective multiplication constant and the two-group fluxes if you add 5 cm of reflector (water, material number 2 from the project) to both ends of the reactor?  Plot and discuss.

.. _framework:

Project Framework
-----------------

This project will be done with a framework that will (a) make everyone's work somewhat uniform, (b) provide a convenient mechanism for loading and representing data, and (c) make it possible to generalize and extend your work with minimal effort.

.. _dataStructures:

Data Structures
~~~~~~~~~~~~~~~

A *data structure*, for our purposes, will be a convenient method of encapsulating similar data for your transport solver.  We will use to two distinct data structures for this project: a mesh structure and a cross section structure.

The mesh structure consists of the following data:

- the number of spatial cells, ``nX``;
- an array of the cell interface locations, ``x``;
- an array of cell material identifiers, ``mat``;
- a length-2 array of boundary condition identifiers, ``bc``.

In Matlab, for example, you can create a mesh strucure as follows.

::

   solnMesh = struct('nX',  10, ...
                     'x',   linspace(0,400,11), ...
                     'mat', [2;1;1;1;3;3;1;1;1;2],  ...
                     'bc',  [2,1]);

In Python, this code becomes

::

   solnMesh = Mesh(10, 
                   np.linspace(0.0,400,11), 
                   [2,1,1,1,3,3,1,1,1,2],
                   [2,1])

Note that in the Python version the names are implicit in the ordering.  Both versions of the code will create a 10-cell geometry starting at :math:`x=0` and extending to :math:`x=400`.  There are three different materials, indexed by the integers one through three.  The left boundary condition is type 2 and the right boundary condition is type 1.  The boundary condition "types" are defined in the implementation of transport sweep.

Each member of the data structure can be accessed using the dot (``.``) operator.  To get the array of materials, for example, we would use ``solnMesh.mat`` in both Python and Matlab.

The cross section structure consists of the following data:

- the total cross section, ``sigTr``;
- the absorption cross section, ``sigA``;
- the fission cross section, ``sigF``;
- the average number of neutrons per fission, ``nuBar``;
- the scattering kernel, ``sigS``.

You will be provided with a function, ``getXS``, that will automatically generate an array of these cross section structures.  Each element of the array will be a set of cross sections corresponding to unique material.  The position in the array corresponds to material identifier.  In both Matlab and Python, the cross section array is obtained by the following code.

::

   xs = getXS();

The first element in the ``xs`` array consists of the core cross sections.  The second element of the array consists of the reflector cross sections.  The third element of the array consists of control rod cross sections.

To demonstrate the use of the cross section array, say that we wanted to print the thermal (group-2) absorption cross sections for each cell in our geometry.  In Matlab we could write

::

   for i = 1:solnMesh.nX
     disp(xs(solnMesh.mat(i)).sigA(2))
   end

In Python we could write

::

   for i in range(solnMesh.nX) :
      print xs[solnMesh.mat[i]-1].sigA[1]

.. _quadrature:

Refining Your Mesh
~~~~~~~~~~~~~~~~~~

The accuracy of solution depends on how closely spaced your grid points are.  A *finer mesh*, with grid points spaced more closely, will lead to a more accurate solution, but it will take longer to compute such a solution.  For this project you may begin by defining, for example, 10 cells but then realize you need more for an accurate answer.

To make this easy, a function called ``refineMesh`` has been included with this project.  This function takes an original ``solnMesh`` structure and refines it by splitting each cell into two.  This process may be repeated to create a mesh that is aribtrarily fine.

For example, if your mesh originall has 10 cells, the following code will produce a mesh with 160 cells.  In Python,

::

   for i in range(4) :
       solnMesh = refineMesh(solnMesh)

In Matlab,

::

   for i = 1:4
      solnMesh = refineMesh(solnMesh);
   end
       
Angular Quadrature
~~~~~~~~~~~~~~~~~~

In selecting your discrete ordinates, you should use the Gauss-Legendre quadrature.  In Python, you can get the quadrature points and weights from numpy

::

   (mu,w) = np.polynomial.legendre.leggauss(M)

where ``M`` is the integer number of ordinates you want, ``mu`` is an array of the oridnates, and ``w`` is an array of the weights.

In Matlab, I have made a file available from `MatLab File Exchange <http://www.mathworks.com/matlabcentral/fileexchange/4540-legendre-gauss-quadrature-weights-and-nodes>`_ that performs the same function.  The function is named `lgwt` and should be used as follows:

::

   [mu,w] = lgwt(N,-1,1);

The vectors ``mu`` and ``w`` contain the ordinate directions and weights, respectively.

.. _sweepImplementation:
      
Sweep Implementation
~~~~~~~~~~~~~~~~~~~~

In part 1 of this projection you have to implement a function that solves the within-group transport equation.  There only requirement is that this implementation be in a *function*.  In implementing your function, avoid global variables.  This means that all of the input to your function should be provided as function arguments.  These arguments should be (in order) the ``solnMesh``, ``xs``, a source array, and the number of quadrature points to use.  The output should be the *scalar* flux for each *cell center* (the interface values are not needed).

In Python the function declaration should thus be

::

   def sweep(solnMesh, xs, q, N, g) :

In Matlab is should be

::

   function phi = sweep(solnMesh, xs, q, N, g)
   
Downloads
~~~~~~~~~

The code containing the framework items described above can be downloaded below:

Matlab:

- :download:`getXS.m <project2/getXS.m>`
- :download:`refineMesh.m <project2/refineMesh.m>`
- :download:`lgwt.m <project2/lgwt.m>`
- :download:`calculateFissionSource.m <project2/calculateFissionSource.m>`
- :download:`MultigroupFixedSourceSolve.m <project2/MultigroupFixedSourceSolve.m>`
- :download:`powerIterationSolve.m <project2/powerIterationSolve.m>`

Python:

- :download:`proj.py <project2/proj.py>`

To use the Matlab functions, simply place them in the directory in which you are running Matlab (i.e., your working directory) or in the Matlab path.  To use the Python functions, place the python file in the directory in which you are running Python or another accessible path, and put ``from proj import *`` at the top of your script or Jupyter notebook.
  
Project Guidelines
------------------

- You may use any software you like to do the calculations and plotting.  I suggest using the one that you are already most familiar/comfortable with.
- I encourage you to work with others on this project, but...
- Each *individual* must submit their own project report.
- The report should contain the following information

  - **Background:** What is the significance of understanding this concept?  How does it impact Reactor Physics?
  - **Theory:** What equations, formulas, and assumptions are used to obtain the results?
  - **Results:** Plots *and* discussion.
  - **Summary:** What do you take away from this project?

- The report should be neat, well-organized, and appropriately styled, i.e., follow the basic rules of manuscript writing:

  - label tables/figures;
  - reference all tables/figures explicitly from the text;
  - use clear, concise language, avoiding fluff and flower;
  - number equations consistently.

