
a = [];
for n = linspace(0.05,0.5)
    array.ElementSpacing = n
    ganho  = sparameters(array, freq_list);
    a = [a; ganho];
end 


rfplot(a,2,1,'abs')