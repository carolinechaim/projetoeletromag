syms M
w = freq_ress_sim;
G_M_function = abs( ( (1j*w*M)/(Rc) )^2 )

F = taylor(G_M_function(M), 'Order', 5)
