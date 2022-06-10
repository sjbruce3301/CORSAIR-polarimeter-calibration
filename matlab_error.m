load('stokes_2.mat');

figure
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x,y,log10(I))
axis image xy
colormap gray
colorbar
%caxis([11.5, 13.3])

title('Solar Corona (simulated)');

%row = 165 column = 302
%row = 165;
%column = 302;

load wp_red.mat

S = [];
Imeas = zeros(400, 400);
Qmeas = zeros(400, 400);
Umeas = zeros(400);
Vmeas = zeros(400);

Isim = zeros(400, 400);
Qsim = zeros(400, 400);
Usim = zeros(400);
Vsim = zeros(400);

for row = 1:1:400
    for column = 1:1:400
        scol = [I(row, column); Q(row, column); U(row, column); V(row, column)];
        V_meas = M_meas*scol;
        S_meas = D_meas*V_meas;
        S_sim = D_sim*V_meas;
        Imeas(row, column) = S_meas(1);
        Qmeas(row, column) = S_meas(2);
        Umeas(row, column) = S_meas(3);
        Vmeas(row, column) = S_meas(4);
        
        Isim(row, column) = S_sim(1);
        Qsim(row, column) = S_sim(2);
        Usim(row, column) = S_sim(3);
        Vsim(row, column) = S_sim(4);
    end
end

%% percent errors

error_I = abs(I - Imeas)./abs(I)*100;
error_Q = abs(Q - Qmeas)./abs(Q)*100;
error_U = abs(U - Umeas)./abs(U)*100;
error_V = abs(V - Vmeas)./abs(V)*100;

figure
subplot(2,2,1)
%imagesc(stokes_2.x, stokes_2.y, log10(I))
imagesc(x, y, error_I)
axis image xy
colormap(gca, 'gray')
colorbar
caxis([0, 1e-15])
title('I error')

subplot(2,2,2)
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x, y, error_Q)
axis image xy
colormap (gca, 'gray')
colorbar
caxis([0, 1e-12])
title('Q error')

subplot(2,2,3)
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x, y, error_U)
axis image xy
colormap (gca, 'gray')
colorbar
caxis([0, 1e-12])
title('U error')

subplot(2,2,4)
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x, y, error_V)
axis image xy
colormap (gca, 'gray')
colorbar
caxis([0, 4*1e-8])
title('V error')

%% Figures
figure
subplot(2,2,1)
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x, y, log10(I))
axis image xy
colormap(gca, 'gray')
colorbar
%caxis([0, 1])
title('I')

subplot(2,2,2)
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x, y, Q)
axis image xy
colormap (gca, cmap)
colorbar
caxis([-.005, .005])
title('Q')

subplot(2,2,3)
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x, y, U)
axis image xy
colormap (gca, cmap)
colorbar
caxis([-.005, .005])
title('U')

subplot(2,2,4)
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x, y, V)
axis image xy
colormap (gca, cmap)
colorbar
caxis([-.0001, .0001])
title('V')


figure
subplot(2,2,1)
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x, y, log10(Isim))
axis image xy
colormap(gca, 'gray')
colorbar
%caxis([0, 1])
title('I sim')

subplot(2,2,2)
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x, y, Qsim)
axis image xy
colormap (gca, cmap)
colorbar
caxis([-.005, .005])
title('Q sim')

subplot(2,2,3)
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x,y,Usim)
axis image xy
colormap (gca, cmap)
colorbar
caxis([-.005, .005])
title('U sim')

subplot(2,2,4)
%imagesc(stokes.x, stokes.y, log10(I))
imagesc(x,y,Vsim)
axis image xy
colormap (gca, cmap)
colorbar
caxis([-.0001, .0001])
title('V sim')

%in real life, start with V to find S

%S = [I(row, column); Q(row, column); U(row, column); V(row, column)];
%S = S/S(1);

%V_meas = M_meas*S; %measurement vector
%V_sim = M_sim*S;

%S_meas = D_meas*V_meas;
%S_sim = D_sim*V_meas;
