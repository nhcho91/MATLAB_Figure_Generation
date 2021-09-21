clc;
close all;

legend_string = cell(length(p_list),1);
linespec = {'-o','-s','-*','-','-.','--',':'};

for i_case = 1
  for i_p = 1 : length(p_list{i_case})
  p = p_list{i_case}(i_p);
    if i_case == 1
    l_str = {'Proposed Method', 'Existing Method'};

    % elseif i_case == 2
    % l_str{i_p} = sprintf('t_{f_{d}} = %d', p);
    else

    end
  end

%------------------------------------------------------
  f=figure;
  hold on
  for i_p = 1 : length(p_list{i_case})
    plot(sol(i_case,i_p).x, sol(i_case,i_p).y, linespec{i_p})
  end
  hold off, axis equal
  xlabel('x [m]'), ylabel('y [m]')
  fig_print(f,l_str,'Fig_2D_Traj')


end

%---------------------------------------------------------------------------------
% Plots Arrangement
N_FIG = get(gcf,'Number');
arrange_figs(N_FIG,2,3)
