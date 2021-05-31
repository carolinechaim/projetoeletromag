iterations = 10;
sigma = 20 %linspace(15,25,iterations);

freq_list = linspace(1000000,10000000,10);
Z_list = zeros(length(freq_list),iterations);
for w = freq_list
    L = sigma/w;
    C = 1/sigma*w;
    
    Zantena = ( 1j*w*L*(1/(1j*w*C)) )/( 1j*w*L+((1/(1j*w*C))) ) + 4*1j*w*L;
    
    Z_list(:,w)= Zantena;
    
end

plot(freq_list,Z_list)