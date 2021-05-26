frequencia = linspace(1000000,10000000,200);

z = impedance(ant,frequencia);


freq = 0;

for n = z
     a = imag(n)
     if a >= -0.999 && a <= 0.999
         freq = n
         break
     end 

end 

