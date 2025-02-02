run('Q5.m');
spacing = 10;
distance = linspace(0.05,0.5,iterations/spacing);
gain = zeros(iterations,iterations/spacing);

for i=1:length(distance)
    n=distance(i);
    array.ElementSpacing = n;
    ganho = sparameters(array, freq_list);
    gain(:,i)= abs(ganho.Parameters(2,1,:));
end 

s = surf(freq_list,distance,transpose(gain));
s.EdgeColor = 'none';
s.FaceColor = 'interp';
colorbar;
xlabel("Frequência");
ylabel("Distância");
zlabel("Ganho");
