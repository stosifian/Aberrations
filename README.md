## Aberrations
An interactive GUI for seeing the effects of first-order optical aberrations on an image

<img width="1013" alt="GUI" src="https://user-images.githubusercontent.com/47396320/81024781-61924280-8e29-11ea-9d2e-d746a8e9d619.png">


### Theory
The response of light to an imaging system can be modeled as a linear system. As a result, we can use the tools of Fourier Analysis to analyze the characteristics of these imaging systems and their responses to input images (essential premise behind field of Fourier Optics)

For this simulator, we treat the imaging system as one for (spatially) incoherent light. Being a linear system, the (normalized) transfer function for an incoherent imager is referred to as the optical transfer function (OTF), whose magnitude is oft-referred to as the modulation transfer function (MTF). The impulse response is referred to as the point spread function (PSF), which is what the output of the system would when the input is an ideal point source (i.e. impulse)

The PSF can be obtained by taking the squared magnitude of the amplitude transfer function (ATF) $'\h(u,v)'$ , which is the impulse response of a coherent imaging system. The ATF is calculated by taking the scaled Fourier Transform of the generalized pupil function P(x,y):

<p align="center">
<img width="299" alt="ATF" src="https://user-images.githubusercontent.com/47396320/81115854-3c5d0d00-8ed9-11ea-9452-485b4c1eba9e.png">
</p>




The generalized pupil function arises from the general aperture of the system (for this simulator, a circular aperture) with a complex optical phase that reflects the aberrations of the system 

<p align="center">
<img width="181" alt="GenPupil" src="https://user-images.githubusercontent.com/47396320/81115872-44b54800-8ed9-11ea-8db7-61cf20d57cc5.png">
</p>

The aberrations of an optical system can generally be written as an expansion of Zernike polynomials, which are complete and orthogonal over the unit circle 

<p align="center">
<img width="383" alt="W_Expansion" src="https://user-images.githubusercontent.com/47396320/81115863-3ebf6700-8ed9-11ea-9503-8d5561b52e95.png">
<img width="238" alt="Zernike" src="https://user-images.githubusercontent.com/47396320/81115837-36672c00-8ed9-11ea-9792-a41bc98dca14.png">
</p>

For this simulator, we only use the first several terms of the Zernike expansion, which represent the effects of first order defocus, astigmatism, coma, and spherical aberration. 


<p align="center">
<img width="430" alt="Abs" src="https://user-images.githubusercontent.com/47396320/81117798-97443380-8edc-11ea-82c4-7674448fab56.png">
</p>


### Notes

You can adjust the amount of each aberration by varying the coefficient of its respective Zernike polynomial. Note that for astigmatism and coma, the aberration in the x and y direction are varied by the same coefficient.

Since we’re dealing with discretized images, we need to be considerate of aliasing when choosing parameters for the simulation. As a good rule of thumb, the sampling frequency should be greater than the frequency cutoff for incoherent imaging systems, which is f0 =  D/(lam*zi)


### Examples

Diffraction-Limited Image (No aberrations)
<p align="center">
<img width="1000" alt="DLim" src="https://user-images.githubusercontent.com/47396320/81118574-02dad080-8ede-11ea-8002-8a2f80874bed.png">
</p>

Defocus
<p align="center">
<img width="1027" alt="defocus" src="https://user-images.githubusercontent.com/47396320/81118616-138b4680-8ede-11ea-97f4-f7a56de83e28.png">
</p>

Astigmatism
<p align="center">
<img width="1024" alt="ast" src="https://user-images.githubusercontent.com/47396320/81118732-4c2b2000-8ede-11ea-9cae-2d7f0618c652.png">
</p>

Coma
<p align="center">
<img width="1025" alt="Sph" src="https://user-images.githubusercontent.com/47396320/81118679-30277e80-8ede-11ea-9a7e-6614de133720.png">
</p>

Spherical
<p align="center">
<img width="1025" alt="Sph" src="https://user-images.githubusercontent.com/47396320/81118679-30277e80-8ede-11ea-9a7e-6614de133720.png">
</p>


## References
1. "Numerical Simulation of Optical Wave Propagation with examples in MATLAB" - Schmidt, Jason D.
