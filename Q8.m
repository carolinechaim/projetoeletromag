iterations = 1000;

sigma_list = linspace(1,30,iterations);
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
end

freq_ress_list = zeros(iterations,1);
freq_crit_list = zeros(iterations,1);
prev =0;

for m = 1:iterations
    for n = 1:iterations
         a = Z_list_imag(m,n);
         if prev <= 0 && a >= 0
             index_ress = find(Z_list_imag(:,n)== a);
             freq_ress_list(m) = freq_list(index_ress);
         end

         if prev >= 0 && a <= 0
             index_crit = find(Z_list_imag(:,n)== a);
             freq_crit_list(m) = freq_list(index_crit);
         end 
         prev = a;
    end
end

% Calcula e armazena a diferença entre as frequencias obtidas e as reais
diff_ress = abs(freq_ress_list - freq_ressonancia);
diff_crit = abs(freq_crit_list - freq_critica);

index_freq_ress = find(diff_ress(:)== min(diff_ress))
index_freq_crit = find(diff_crit(:)== min(diff_crit))

freq_ress_val = freq_list(index_freq_ress);
freq_crit_val = freq_list(index_freq_crit);

s = surf(freq_list,sigma_list,Z_list_imag);
s.EdgeColor = 'none';
s.FaceColor = 'interp';
colorbar;
xlabel("Frequência");
ylabel("Sigma");
zlabel("Impedância");