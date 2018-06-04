h = [0.05 0.1 0.05 0.1 0.15 0.15 0.35 0.15 0.15 0.1 0.05 0.1 0.05]; %samples
NHL = 0; %linker Rand
NHR = 12 %rechter Rand
IH = 13; % breite

nh = 0:1:12; %indexachse
th = 0:1:12; %zeitachse

[wz, wfs, wbits]=wavread('MENU.WAV');
x=wz;
NXL = 0; %linker Rand
NXR = length(x)-1; %rechter Rand
IX = length(x); % breite
nx = 0:1:length(x)-1; %indexachse
tx = 0:1:length(x)-1; %zeitachse


y = []; %samples
NYL = 0; %linker Rand
NYR = 500; %rechter Rand
IY = 501; % breite
ny = []; %indexachse
ty = []; %zeitachse

fs = wfs;%Abtastfrequenz
T = 1/fs; %Abtastabstand 1/fs

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
        temp = fix(100*temp)/100; 
        x_ind = find(nx == temp);
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

subplot(3,1,1)
stem(nx,x)
axis([-4,12,-3,4])
subplot(3,1,2)
stem(nh,h)
axis([-4,12,-3,4])
subplot(3,1,3)
stem(ny,y)
axis([-4,12,-3,4])

figure
subplot(3,1,1)
stem(tx,x)
axis([0,length(x),-1,1])
subplot(3,1,2)
stem(th,h)
axis([0,12,-0.5,0.5])
subplot(3,1,3)
stem(ty,y)
axis([0,499,-0.05,0.05])