freq_list = linspace(1000000,10000000,200);

z_list = impedance(ant,freq_list);

index = 0;
for n = z_list
     a = imag(n);
     if a >= -0.999 && a <= 0.999
         index = find(z_list(:,:)== n)
         break
     end 

end 

freq = freq_list(index)
