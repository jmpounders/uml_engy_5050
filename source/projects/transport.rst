Transport Theory in Reactor Physics
===================================

**Due date:** April 6, 2016, 11:59 PM

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
2. Implement a function (in either Matlab or Python) that solves the :math:`S_N` sweep equations.  The function should accept mesh and cross section data structures (see the framework notes below) and return the a vector array consisting of the *scalar* flux in each spatial cell.  Use the group-2 core cross sections provided to you.
3. TBA

Part 2
~~~~~~

1. Derive the one-group diffusion equation from the one-group :math:`P_1` equations.
2. Derive the analytical solution of the diffusion equation for a homogeneous medium.  Boundary conditions should approximate the condition of no incoming neutrons.  Part of your solution should be an expression for the effective multiplication factor, :math:`k = k_\text{eff} = \lambda^{-1}`.
3. TBA

Part 3
~~~~~~

TBA

Project Framework
-----------------

This project will be done with a framework that will (a) make everyone's work somewhat uniform, (b) provide a convenient mechanism for loading and representing data, and (c) make it possible to generalize and extend your work with minimal effort.

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

Downloads
~~~~~~~~~

The code containing the framework items described above can be downloaded below:

Matlab:

- :download:`getXS.m <project2/getXS.m>`

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

