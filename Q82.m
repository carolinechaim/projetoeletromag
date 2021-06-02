iterations = 100;
M = (1/freq_ress_sim) * (2*pi); % rads/s
M_list = linspace(M,M/1000,iterations);

Rc = 1;
w = 120;
R1 = 1;

i1_list =  zeros(iterations,1);
i2_list =  zeros(iterations,1);
G_list = zeros(iterations,1);

for m=1:2000
    Uf = 182*cos(w*t);
    i1 = (Rc*Uf)/(Rc*R1 + w^2*M^2);
    i2 = (1j*w*M*Uf)/(Rc*R1 + w^2*M^2);
    G = i2/i1;
    
    i1_list(t) = i1;
    i2_list(t) = i2;
    G_list(t) = G;
end
G_list
plot(G)
