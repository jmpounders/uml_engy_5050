Up and Running (Jupyter only)
=============================

Running the virtual machine with sufficient memory and operating system compatibility has proven difficult.  (Thanks, Windows.)  It is realtively straightforward, however, to simply install `Jupyter <http://jupyter.org/>`_  without the additional nuclear toolkits.  I recommend two different approaches, based on whether you already have Python installed or not.  If you don't know if you have Python installed, open a command prompt and type ``python --version`` then Enter/Return.  If you have Python installed, it will tell what version you have.  If your computer complains about a bad command or something like that, you don't have it.


You Don't Currently Have Python Installed
-----------------------------------------

Download and install the `Anaconda Python distribution <https://www.continuum.io/downloads>`_.  You have a chose of versions: 2.something or 3.something.  I will be using 2.something when I use Python in this class; be aware that there are several significant changes in version 3.  This distribution wraps Python up with several of the packages that you will want to use for computing and plotting.  Anaconda also comes pre-loaded with Jupyter, so you are done!

To run Jupyter, open a command prompt/terminal and enter ``jupyter notebook``.

You Already Have Python Installed
---------------------------------

If you don't already have it, install `pip <https://pip.pypa.io/en/stable/installing/>`_.  You can then install Jupyter using ``pip install jupyter`` (version 2) or ``pip3 install jupyter`` (version 3).

Launch Jupyter by entering ``jupyter notebook`` from a command prompt/terminal.

If you are using a self-installed (not packaged) version of Python, you should probably go ahead and download the ``matplotlib`` and ``numpy`` modules, as they are indispensable for doing computational engineering work.
