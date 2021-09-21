function []=arrange_figs(N_FIG, N_rows_FIG, N_cols_FIG)
%---------------------------------------------------------------------------------
% Arrangement of Figures
% N_FIG: Number of Figures to be arranged
% N_cols_FIG: Number of columns of arranged figures
% N_rows_FIG: Number of rows of arranged figures
% => This function rearranges the N_FIG figures on the screen into a N_rows_FIG X N_cols_FIG grid
%---------------------------------------------------------------------------------
h = groot;
screen_width = h.ScreenSize(3);
screen_height = h.ScreenSize(4);

fig_x = linspace(1,screen_width,N_cols_FIG+1);
fig_x = fig_x(1:end-1);
fig_y = fliplr(linspace(1,screen_height,N_rows_FIG+1));
fig_y = fig_y(2:end);

i_col_list = repmat(1:N_cols_FIG, 1,ceil(N_FIG/N_cols_FIG));
i_row_list = repmat(reshape(repmat(1:N_rows_FIG, N_cols_FIG,1) ,1, []), 1,ceil(N_FIG/N_cols_FIG/N_rows_FIG) );

for i = 1:N_FIG
f=figure(i);
f.Position(1) = fig_x(i_col_list(i));
f.Position(2) = fig_y(i_row_list(i));

% if i/N_cols_FIG <= 1
% f.Position(2) = screen_height - 750;
% f.Position(3) = round(560);
% f.Position(4) = round(3/4*640);
% end
% 
% if i/N_cols_FIG > 1
% f.Position(2) = 100;
% % f.Position(3) = round(560);
% % f.Position(4) = round(420);
% end
end
