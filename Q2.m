run('Q1.m');

freq_list = linspace(1000000,10000000,200);
impedance(antena_transmissora,freq_list)
z_list = impedance(antena_transmissora,freq_list);

index_resso = 0;
index_crit = 0;
prev =0;

for n = z_list
     a = imag(n);
     if prev <= 0 && a >= 0
         index_ress = find(z_list(:,:)== n);
     end
     
     if prev >= 0 && a <= 0
         index_crit = find(z_list(:,:)== n);
     end 
     prev = a;
end 

freq_ressonancia = freq_list(index_ress)
freq_critica = freq_list(index_crit)

