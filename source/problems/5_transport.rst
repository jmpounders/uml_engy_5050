How does the neutron distribution depend on space?
==================================================

In the last section we characterized the neutron *spectrum*.  We saw that the neutron distribution in energy varied roughly with the fission spectrum at high energies, followed a :math:`1/E` shape through the resonance region (asymptotically, at least), then setteld down into a thermal spectrum resembling the Maxwell-Boltzmann distribution.  Within the resonance region, of course, the :math:`1/E` shape was punctuated by sharp dips corresponding to the location of resonances.

All of that, however, was for a system that was initfinitely large and homogeneous.  What if we begin to consider the more realstic case in which materials vary as you move in and out of fuel, clad and cooling regions.  That is,

    How can determine the spatial variation of the neutron flux?

It turns out that considering "space" means also considering direction and, of course, energy.  The emphasis here, however, will be on deriving a neutron balance equation (the transport equation) in which the energy variable takes a momentary back seat.  Transport theory deals principally with following neutrons around as they collide and flow through a medium.  This problem can become quite large and complex very quickly.  We will look at the theoretical basis for neutron transport in a multiplying (i.e., fissioning) medium, some numerical approaches to solving the problem, and approximations that simplify the problem.

Background
----------

:download:`Reference notes, Neutron Transport <../../notes/transport.pdf>`.

(NOTE: this notes will be extended in the near future!  Check back later for an update. 2/22/16)

In-Class Problem
----------------

Consider the 1D angular flux at a point, :math:`\psi(\mu)`, where :math:`\mu` is the cosine of the polar angle.  The polar angle in this case must be the angle between the direction vector and the single axis defining your system.  The flux :math:`\psi(\mu)` in 1D can be seen as the reduction of the of the general flux, :math:`\psi({\bf \Omega}) = \psi(\varphi,\mu)`, in the case that the flux is independent of the azimuthal angle, :math:`\varphi`.

In one spatial dimension there is symmetry with respect to rotation in the azimuthal symmetry, so assuming that the flux is a function of :math:`\mu` alone is indeed valid.  (Draw a picture of this to convince yourself!)

In 1D problems, there is no need integrate over azimuthal angles when performing integrals over "all" angles, since such an integration would simply yield a factor of :math:`2\pi` that will cancel across the equation.  Rather, integrating over "all" angles in 1D simply means integrating over the (cosine of) the polar angle, :math:`\mu`.

If we assume that the 1D flux is *linearly anisotropic*, then the flux can be written

.. math::

   \psi(\mu) = a + b \mu

for some constants :math:`a` and :math:`b`.

1. Find an expression for the *scalar flux* in terms of :math:`a` and :math:`b`.
2. Show that the "vector" current in 1D becomes simply a scalar function.  In other words, if the polar angle is defined with respect to the :math:`z` axis, then the vector elements of the current corresponding to the :math:`x` and :math:`y` directions will be zero.  (HINT: Use the general definition of neutron current in three dimensions, then perform the integrations using the assumption :math:`\psi(\varphi,\mu) \rightarrow \psi(\mu)`.)
3. Find an expression for the 1D *neutron current* in terms of :math:`a` and :math:`b`.
4. Derive the 1D :math:`P_N` transport equations.  *Show every step!*
