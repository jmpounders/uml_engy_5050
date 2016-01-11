The Grand Problem
=================

The fundamental question of reactor physics can be expressed as follows:

    *Where* and *how much* power is being generated in a nuclear reactor at any given point in time?

We will spend the semester breaking down this question into a series of consecutative, hierarchical problems to be solved.  Before proceeding we must first begin by asking how is energy created in a reactor in the first place. 

How Is Energy Created in a Reactor?
-----------------------------------

For *fission* reactors, which is the exclusive purvey of this course, the answer is unsurprisingly that energy is released whenever an atom fissions.  This energy appears in the form of kinetic energy born by ejected neutrons, fission fragmens, and photons.  This initial burst of kinetic energy is the *prompt* release.  In contrast, the fission fragments are almost always unstable and tend to emit a succession of beta particles and neutrinos, and in some cases neutrons until stability is reached.  The drawn out release of energy associated with the decay of fission fragments is the *delayed* energy release.  The kinetic energy of these particles, in way or another, is imparted to the reactor itself through collisions, thereby heating the reactor.

Where Is Energy Created in a Reactor?
-------------------------------------

The preceeding addresses, in rough measure, *how* energy is created, but not *where* it is created.
- Fission fragments are very large and tend not to travel very far from the site of fission.
- Photons may travel anywhere from 10 to 100 cm, loosing energy through collisions as the go.
- Neutrons likewise travel anywhere from 10 to 100 cm, loosing energy through collisions as they go.  Neutrons may also be absorbed into nuclei.  When this happens, the absorbing nuclei tends to respond by emitting a photon (a *capture gammas*), which will continue the transport of energy through the reactor.
- Beta particles emitted from fission fragments will not travel very far.
- Most neutrinos will zip through the reactor, through the center of the earth and into outer space and never be heard from again.

As you can now imagine, the generation of energy in a reactor, even from a single fission, is a very dynamic and somewhat chaotic process.  Fortunately, most of the fission energy appears as the kinetic energy of the fission fragments, which tend to stay put.  Thus most of the *recoverable* energy from fission is deposited very near the point where the fission occured.  Looking at the table below, you can see that with uranium-235, there is about 200 MeV of energy released per fission.  If this fission occurs in a fuel rod, about 90% of that energy will be deposited *inside* the fuel rod.  In fact, it is common practice to assume that *all* fission energy is deposited inside the fuel rod as this makes modeling nuclear reactors much simpler.

+-----------------------------------+--------------+
| Source of Energy (U-235 fission)  | Energy (MeV) |
+===================================+==============+
| Kinetic energy, fission fragments |          168 |
+-----------------------------------+--------------+
| Kinetic energy, prompt neutrons   |            5 |
+-----------------------------------+--------------+
| Kinetic energy, prompt photons    |            7 |
+-----------------------------------+--------------+
| Kinetic energy, capture gammas    |            7 |
+-----------------------------------+--------------+
| Kinetic energy, beta particles    |            8 |
+-----------------------------------+--------------+
| Kinetic energy, neutrinos         |           12 |
+-----------------------------------+--------------+

What Next?
----------

We have addressed how energy is created (fission) and where most of the energy that is created gets deposited in the reactor (where the fission happened).  As to *how much* energy is created, we saw that roughly 200 MeV of recoverable energy is released per fission.

We are now able to refine our "fundamental question" a bit.  To determine where and how much power is being is generated (i.e., the rate at which energy is being deposited into the reactor) we need to determine where fission is happening and the fission reaction rate.

Fissions in a reactor are part of a *chain reaction*.  That is, a neutron induces fission in a fissile isotope, several neutrons are released, and on average one of those neutrons will cause an additional fission.  Therefore if we can determine, to a reasonable degree of accuracy, where the neutrons are in a reactor then we can calculate the fission reaction rate and subsequently the distribution of power in the reactor.

Thus we may rephrase the fundamental question we began with as the following problem:

    To determine  where and how much *power* is begin generated in a nuclear reactor we need to determine the distribution of *neutrons* in space and time.

This course will unpack this question in stages, building off your undergraduate foundation in basic radiation science, nuclear reactor theory, and mathematics.
