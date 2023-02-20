%Расчет количества совпадения для случай, когда Lp=Li, Ls=0


clc
close all
clear all

%ПЕРЕМЕННЫЕ НАКАЧКА, РАДИАЛЬНЫЕ И АЗИМУТАЛЬНЫЕ ИНДЕКСЫ

Lp=2;
pi=0;
ps=0;


% Matx=ones(3,3,1)
Li=[-5 : 5]; % azimutal index signal beam and общий радиальный индекс (signal)
Ls=[-5 : 5]; % azimutal index signal beam and общий радиальный индекс (ilder)
% Lp=Ls+Li;


%По формуле 8
for i=1:length(Li)
for j=1:length(Ls)
    if Li(i)-Ls(j)~=Lp
    else C(i,j)=0;
%         for m=0 : pi
%             for n=0 : ps 
syms m n
C(i,j)=double(symsum(symsum(((2/3)^((2*m+2*n+abs(Li(i))+abs(Ls(j))+abs(Lp))/2))*((-1)^(m+n))*((sqrt(factorial(pi)*factorial(ps)*factorial(abs(Li(i))+pi)*factorial(abs(Ls(j))+ps))/(factorial(pi-m)*factorial(ps-n)*factorial(abs(Li(i))+m)*factorial(abs(Ls(j))+n)*factorial(m)*factorial(n))))*factorial((2*m+2*n+abs(Li(i))+abs(Ls(j))+abs(Lp))/2), m, 0, pi), n, 0, ps));

% C(i,j)=(0.6^(0.5*(abs(Li(i))+abs(Lp(j)))))*(sqrt(factorial(abs(Li(i)))/(factorial(abs(Lp(j))))))*factorial(((abs(Li)+abs(Lp(j)))/2));

end
end
end

C=abs(C).^2;
Bmax=max(max(C));
C=C/Bmax

% F=histogram(C,)
width = 0.5;
% figure
b=bar3(C);
colorbar


for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end

% mesh(Lp,Li,C);
% bar(Li,C)

set(gca,'XTickLabel',Li)
set(gca,'YTickLabel',Lp)
set(0,'DefaultAxesFontSize',18,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontSize',18,'DefaultTextFontName','Times New Roman');
set(gca,'view',[-15 25]);
ylabel('Li');
xlabel('Lp');

% title('Lp=1')
% colormap gray
title('Относительная амплитуда вероятности')
