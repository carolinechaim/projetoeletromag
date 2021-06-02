run('Q1.m');

freq_list = linspace(1000000,10000000,200);

z_list = impedance(antena_transmissora,freq_list);
index_resso = 0;
prev =0;
for n = z_list
     a = imag(n);
     if a >= -0.999 && a <= 0.999
         index_resso = find(z_list(:,:)== n);
         break
     end 
end 

freq_ressonancia = freq_list(index_resso)

index_crit = 0;
for n = z_list
     a = imag(n);
     if prev >= 0 && a <= 0
         index_crit = find(z_list(:,:)== n);
         break
     end 
     prev = a;
end 
freq_critica = freq_list(index_crit)
