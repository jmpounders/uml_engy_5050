Neutron Interaction Resonances
==============================

**Due date:** Feb. 19, 11:59 PM

In this first project, we will take a close a look at resonance cross sections.

Note that specific project items will be rolled out as we cover the associated material in class.  Thus what is listed below is not the entire project, but I want to give you all the opportunity to start early.  In case, lake tapas, you chose to work "little and often."

1. Plot the 0 K single-level Breit-Wigner form of the cross section associated with the following data, which represents one of the resonances from uranium-238.  Plot the capture, elastic scattering and total cross sections corresponding to an s-wave interaction (:math:`\ell=0`).  The angular momentum of the target (:math:`I`) is zero and the angular momentum of the compound nucleus (:math:`J`) is 1/2.  Rather than the diffusion radius (:math:`a`) you may use the "hard sphere" radius, which is given in units of meters by

   .. math::

      R = \left( 0.123 A^{1/3} + 0.08 \right) 10^{-14} \;.

   +-------------------------------------+-------------+
   | Peak energy, :math:`E_i`            | 6.67 eV     |
   +-------------------------------------+-------------+
   | Total width, :math:`\Gamma_i`       | 0.02752 eV  |
   +-------------------------------------+-------------+
   | Neutron width, :math:`\Gamma_{n,i}` | 0.00152 eV  |
   +-------------------------------------+-------------+
   | Capture width, :math:`\Gamma_{g,i}` | 0.02600 eV  |
   +-------------------------------------+-------------+

2. Now that we have the 0 K resonance cross section, broaden the cross sections buy assuming the target nuclei are in thermal equilibrium at 100 K and 600 K.  Use the :math:`\psi` and :math:`\phi` functions derived in class, and because :math:`\Gamma_i << E_i`, you may assume that :math:`\Gamma_i/E_i \approx 0`, which leads to :math:`\alpha \approx 0`.  You should evaluate the integrals numerically using a Gauss-Hermite quadrature (see Appendix, Mathematical Odds and Ends). As one final simplification, you may assume that in the vicinity of the resonance :math:`E \approx E_i` in the definition of :math:`\Delta`.

3. Use  the narrow resonance approximation to calculate and plot the neutron flux in and around the resonance at each of the three temperatures.  Assume that the ratio of the moderator density to the resonance isotope density is 115.

4. Estimate the neutron capture rate at each of the three temperatures.  Note that the normalization on the resonance isotope is arbitrary; I suggest using a value of 1.0 per barn-cm for "nice" numbers.  Also note that the neutron capture rate should be integrated over energy.  You may pick a finite interval around the resonance to do this integration, but extend the interval at least a few eV in either direction of the peak.  It is not possible to do this integral analytically, but a very simple quadrature (such as midpoint/rectangle) will suffice.  (HINT: this should be simple!  If in doubt, let's chat.)


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
