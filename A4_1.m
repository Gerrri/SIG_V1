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


z2=1;

for j=ny(1):1:ny(1)+IY-1
    
    z1 = 1; % Zähler
    eintrag = 0;
    for i=nh(1):1:nh(1)+IH
        h_ind = find(nh == i);

        temp = j-i;
        x_ind =find(nx == temp);

        if isempty(h_ind)
            E(z1) = 0;

        elseif isempty(x_ind)
            E(z1) = 0;

        else 

            E(z1) = h(h_ind) * x(x_ind); 
        end

        eintrag = eintrag+E(z1);
        z1 = z1+1;
    end
    
    
    
    
    
    y(z2) = eintrag;
    z2=z2+1;
end

