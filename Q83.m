run('Q82.m');

% Calculate Taylor series that best fit the Real Model:
index_freq_crit = find(freq_list(1,:) == freq_ressonancia);
Gain_list = gain(:,index_freq_crit);

p_ant = polyfit(distance, Gain_list, 2);
f_ant = polyval(p_ant, distance);

% Calculate Taylor series that best fit the Simulated Model:
p_sim = polyfit(M_list, Gain_list, 2);
f_sim = polyval(p_ant, M_list);

tiledlayout(2,1)

% Top Plot (Antenna Model):
ax1 = nexttile;
plot(distance, G_list, 'Color', '#7E2F8E', 'LineStyle', '-', 'LineWidth', 2);
hold on
plot(distance, f_ant, 'Color', '#D95319', 'LineStyle', ':', 'Marker', 'o', 'MarkerIndices', 1:length(f_ant)/10:length(f_ant));
%set(gca, 'Xdir', 'reverse');
xlabel("Distância");
ylabel("Ganho");
grid;
hold off

% Top Plot (Circuit Model):
ax2 = nexttile;
plot(M_list, G_list, 'Color', '#7E2F8E', 'LineStyle', '-', 'LineWidth', 2);
hold on
plot(M_list, f_sim, 'Color', '#D95319', 'LineStyle', ':', 'Marker', 'o', 'MarkerIndices', 1:length(f_sim)/10:length(f_sim));
set(gca, 'Xdir', 'reverse');
xlabel("Impedância");
ylabel("Ganho");
grid;
hold off

