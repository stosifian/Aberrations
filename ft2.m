function G = ft2(g, delta)
% function G = ft2(g, delta)
    g1 = fftshift(g);
    g1(isnan(g1))=0;
    g2 = fft2(g1);
    g2(isnan(g2))=0;
    G = fftshift(g2);
    G(isnan(G))=0;
    G = G*delta^2;
    %G = fftshift(fft2(fftshift(g))) * delta^2;