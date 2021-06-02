iterations = 100;

sigma_list = linspace(10,30,iterations);

freq_list = linspace(1000000,10000000,iterations);

Z_list_imag = zeros(iterations,iterations);



for m=1:iterations
    sigma = sigma_list(m);
    L = sigma/freq_critica;
    C = 1/(sigma*freq_critica);
    
    for n=1:iterations
        w = freq_list(n);

        
        Zantena = ( (1j*w*L)*(1/(1j*w*C)) )/( 1j*w*L+((1/(1j*w*C))) ) + 4*1j*w*L;

        Z_list_imag(m,n) = imag(Zantena);
    end
    plot(Z_list)
    
end
s = surf(freq_list,sigma_list,Z_list_imag);
s.EdgeColor = 'none';
s.FaceColor = 'interp';
colorbar;
xlabel("Frequência");
ylabel("Sigma");
zlabel("Impedância");