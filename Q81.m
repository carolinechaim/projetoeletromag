iterations = 100;

sigma_list = linspace(-10,-1,iterations);

freq_list = linspace(1000000,10000000,iterations);

Z_list_imag = zeros(iterations,1);


sigma = 20;

L = sigma/freq_critica;
C = 1/(sigma*freq_critica);
    
for m=1:iterations
    w = freq_list(m);
    


    Zantena = ( (1j*w*L)*(1/(1j*w*C)) )/( 1j*w*L+((1/(1j*w*C))) ) + 4*1j*w*L;
    Z_list_imag(m) = imag(Zantena);
    
end

plot(freq_list, Z_list_imag)