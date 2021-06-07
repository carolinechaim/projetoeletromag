run('Q6.m');

M = (1/freq_ressonancia);
M_list = linspace(M,M/1000,iterations);

Rc = 1;
R1 = 1;
w = freq_ressonancia;

G_list = zeros(iterations,1);
Uf = 110;

for i=1:iterations
    M = M_list(i);
    i1 = (Uf*Rc)/(R1*Rc + w^2*M^2);
    i2 = (Uf*1j*w*M)/(R1*Rc + w^2*M^2);
    G = (i2/i1)^2;
    G_list(i) = abs(G);
end

plot(M_list, G_list)