
iterations = 10;
distance = linspace(0.05,0.5,iterations);
gain = zeros(200,iterations);
for i=1:iterations
    n=distance(i);
    array.ElementSpacing = n;
    ganho = sparameters(array, freq_list);
    gain(:,i)= abs(ganho.Parameters(2,1,:));
end 


s = surf(freq_list,distance,transpose(gain))
s.EdgeColor = 'none';
s.FaceColor = 'interp';
colorbar;
xlabel("Frequência");
ylabel("Distância");
zlabel("Ganho");
