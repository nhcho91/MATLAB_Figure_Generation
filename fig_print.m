function fig_print(fig_handle, legend_string, fig_filename)
grid on, box on
set(findall(fig_handle,'type','line'),'linewidth',1, 'markerindices',round(linspace(1,length(getfield(findall(fig_handle,'type','line'),'XData')),10)))
set(findall(fig_handle,'type','axes'),'fontsize',14) % 'interpreter','latex'
set(findall(fig_handle,'type','legend'),'fontsize',14) 
legend(legend_string, 'Location','best')

figure(fig_handle);
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];

fig_handle.PaperPositionMode = 'auto';
fig_pos = fig_handle.PaperPosition;
fig_handle.PaperSize = [fig_pos(3) fig_pos(4)];

print(fig_handle,[fig_filename,'.pdf'],'-dpdf','-r600')
