How can we characterize neutron interactions?
=============================================

We have now established *how* neutrons interact with matter.  Their collisions may be classified broadly as either scattering or absorption.  Scattering reactions are subdivided into elastic and inelastic collisions, and we have derived some kinematic relationships for these events.

Understanding how *one* neutron interacts with *one* nucleus is important, but leaves us with the question of how can we characterize a *population* of neutrons interacting with a material filled with nuclei.  Thus our third problem is

    How can we characterize the interactions of a population of neutrons inside a dense material?

Enter the *cross section*.

Cross sections enable us to characterize interactions probabilistically.  These "probabilities" are a function of neutron kinetic energy, nuclear configuration of the target, and kinetic energy of the target.  In this section we will derive cross sections from first principles, look at the effect of nuclear structure on cross sections, and examine the influence of thermal nuclear motion on cross sections.  Because cross sections enable us to speak about neutron populations interacting with bulk media, they take us one step closer to begin able to predict neutron distributions.

Background
----------

:download:`Reference notes, Cross Sections <../../notes/crossSections.pdf>`.

Comprehension Assessment
------------------------

1. In general the ratio of the diffusion radius of a nucleus (:math:`a`) to the neutron wavelength (:math:`\lambda`) is much less than one, i.e. :math:`\frac{a}{\lambda} << 1`.  Under this assumption, derive an approximate expression for the *potential* elastic scattering cross section, :math:`\sigma_p^\ell`, for *s*-wave interactions.
2. Derive the Maxwell-Boltzmann distribution as a function of *kinetic energy*, :math:`E = \frac{1}{2}mA|\mathbf{V}_A|^2 = \frac{1}{2} m_A V_A^2`. Start with the Maxwell-Boltzmann distribution written as a function of velocity :math:`\mathbf{V}_A`.  Because this is a *distribution* the change of variables must be done so that :math:`p(\mathbf{V}_A) d^3V_A = p(E) dE`.  (Note that although :math:`\mathbf{V}_A` is a vector, the direction of the vector is not important, as all that appears in the distribution is :math:`V_A^2`, which is proportional to energy.  Thus we may write :math:`d^3 V_A = 4\pi V_A^2 dV_A`.)
3. Plot the Maxwell-Boltzmann distribution as a function of kinetic energy using your results from the previous problem.  Use :math:`T = 300` K.  Does this plot inform the reasoning behind picking an energy of around 1 eV (or less) as the cutoff for "thermal" neutron energies?  How important is thermal motion of nuclei for neutron interactions at thermal vs. non-thermal neutron kinetic energies?  (This speaks to the voracity of the "stationary target" assumption that we often made in the first section of this course.)

In-Class Problem
----------------

1. Plot the single-level Breit-Wigner form of the cross section associated with the following data, which represents one of the resonances from uranium-238.  Plot the capture, elastic scattering and total cross sections corresponding to an s-wave interaction (:math:`\ell=0`).  The angular momentum of the target (:math:`I`) is zero and the angular momentum of the compound nucleus (:math:`J`) is 1/2.  Rather than the diffusion radius (:math:`a`) you may use the "hard sphere" radius, which is given in units of meters by

   .. math::

      R = \left( 0.123 A^{1/3} + 0.08 \right) 10^{-14} \;.

   +---------------------------+-------------+
   | Peak energy, :math:`E_i`  | 80.749 eV   |
   +---------------------------+-------------+
   | :math:`\Gamma_i`          | 0.024865 eV |
   +---------------------------+-------------+
   | :math:`\Gamma_{n,i}`      | 0.001865 eV |
   +---------------------------+-------------+
   | :math:`\Gamma_{g,i}`      | 0.023000 eV |
   +---------------------------+-------------+
