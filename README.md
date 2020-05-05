## Aberrations
An interactive GUI for seeing the effects of first-order optical aberrations on an image

<img width="1013" alt="GUI" src="https://user-images.githubusercontent.com/47396320/81024781-61924280-8e29-11ea-9d2e-d746a8e9d619.png">


# Theory
The response of light to an imaging system can be modeled as a linear system. As a result, we can use the tools of Fourier Analysis to analyze the characteristics of these imaging systems and their responses to input images (essential premise behind field of Fourier Optics)

For this simulator, we treat the imaging system as one for (spatially) incoherent light. Being a linear system, the (normalized) transfer function for an incoherent imager is referred to as the optical transfer function (OTF), whose magnitude is oft-referred to as the modulation transfer function (MTF). The impulse response is referred to as the point spread function (PSF), which is what the output of the system would when the input is an ideal point source (i.e. impulse)

The PSF can be obtained by taking the squared magnitude of the amplitude transfer function (ATF), which is the impulse response of a coherent imaging system. The ATF is calculated by taking the scaled Fourier Transform of the generalized pupil function P(x,y) 

