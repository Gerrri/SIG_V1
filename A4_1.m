h   = [1 0 -1 1 -1]; %samples
NHL = -0.2; %linker Rand
NHR = 0.6; %rechter Rand
IH  = 5; % breite
nh  = [-1 0 1 2 3]; %indexachse
th  = [-0.2 0.0 0.2 0.4 0.6]; %zeitachse


x = [1 3 2 2 2 1]; %samples
NXL = -0.4; %linker Rand
NXR = 0.6; %rechter Rand
IX  = 5; % breite
nx  = [-2 -1 0 1 2 3]; %indexachse
tx  = [-0.4 -0.2 0.0 0.2 0.4 0.6]; %zeitachse


y = []; %samples
NYL = -0.6; %linker Rand
NYR = 1.2; %rechter Rand
IY  = 10; % breite
ny  = []; %indexachse
ty  = []; %zeitachse


fs = 22050;%Abtastfrequenz
T  = 1/fs; %Abtastabstand 1/fs


%zeitachse Start
ty(1) = NYL;
ty(IY) = NYR;
schritt = (abs(NYL)+abs(NYR)) / (IY-1);

for i=2:1:(IY-1)
    ty(i) = NYL + ((i-1)*schritt);
end
%zeitachse Ende

%indexachse Start
for i=1:1:IY
    ny(i) = ty(i)/schritt;
end

%indexachse Ende




zaehler = 1;
for i=nh(1):1:nh(1)+IH
    y(zaehler) = h(nh==i) * x(nx==(-2-(nh==i)));
    zaehler = zaehler+1;
end
zaehler = zaehler-1;

