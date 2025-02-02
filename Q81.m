sigma_list = linspace(-10,-1,iterations);
freq_list_sim = linspace(1000000,10000000,iterations);
Z_list_imag = zeros(iterations,1);

sigma = 20;
L = sigma/freq_critica;
C = 1/(sigma*freq_critica);
    
for m=1:iterations
    w = freq_list_sim(m);
    Zantena = ( (1j*w*L)*(1/(1j*w*C)) )/( 1j*w*L+((1/(1j*w*C))) ) + 2*1j*w*L;
    Z_list_imag(m) = imag(Zantena);
end

index_ress_sim = 0;
index_crit_sim = 0;
prev = 0;

for n = 1:iterations
    a = Z_list_imag(n);
    if prev <= 0 && a >= 0
        index_ress_sim = find(Z_list_imag(:,1) == a);
    end
    if prev >= 0 && a <= 0
        index_crit_sim = find(Z_list_imag(:,1) == a);
    end 
    prev = a;
end

freq_ress_sim = freq_list_sim(index_ress_sim);
freq_crit_sim = freq_list_sim(index_crit_sim);

plot(freq_list_sim, Z_list_imag)