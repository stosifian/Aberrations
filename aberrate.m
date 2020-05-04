function [aberrated_img, u, v] = aberrate(L,D,wvl,Dz,defocus,ast,coma,sph,img)

    N = 512; %number of grid points per side
    delta= L / N; %gridspacing[m]
    
    % pupil-plane coordinates
    [x y] = meshgrid((-N/2 : N/2-1) * delta);
    [theta r] = cart2pol(x, y);
    
    %Wavefront aberrations (defocus,astigmatism,coma,spherical)
    W = defocus*zernike(4,2*r/D,theta) + ast*zernike(5,2*r/D,theta) + ast*zernike(6,2*r/D,theta) ...
        + coma*zernike(7,2*r/D,theta) + coma*zernike(8,2*r/D,theta) + sph*zernike(11,2*r/D,theta);
    
    % complex pupil function
    P=circ(x,y,D).*exp(-i*2*pi*W);
    
    h = ft2(P, delta);
    U=wvl*Dz/(N*delta);
    [u v] = meshgrid((-N/2 : N/2-1) * U);
    
    %PSF
    PSF = abs(h).^2;
    
    %Obtain aberrated image
    aberrated_img = myconv2(PSF,img,delta);
end
    