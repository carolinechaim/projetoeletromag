iterations = 10;

sigma_list = linspace(15,250,iterations);

freq_list = linspace(1000000,10000000,iterations);

Z_list = zeros(length(freq_list),length(sigma_list));

Z_list_temp = zeros(length(freq_list),length(sigma_list));



for m=1:iterations
    w = freq_list(m);
    
    for n=1:iterations
        sigma = sigma_list(n);
        L = sigma/w;
        C = 1/sigma*w;
        
        Zantena = ( 1j*w*L*(1/(1j*w*C)) )/( 1j*w*L+((1/(1j*w*C))) ) + 4*1j*w*L;

        Z_list(m,n) = imag(Zantena);
    end
    plot(Z_list)
    
end
s = surf(freq_list,sigma_list,Z_list);
s.EdgeColor = 'none';
s.FaceColor = 'interp';
colorbar;
xlabel("Frequência");
ylabel("Sigma");
zlabel("Impedância");