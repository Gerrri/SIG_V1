A = 0.3; %Amplitude
f0 = 400; %Frequenz in Hz
p = 0; %Phase
d = 3; %Dauer in s
fs = 22050; %Abtast Frequenz in Hz
vonx=0.0; %Plot Start x
bisx=0.01; %Plot Ende x
vony=-0.35; %Plot Start y
bisy=0.35; %Plot Ende y
%Definition der x Werte
x = 0:1/fs:d; % Array {Startwert, sekunde/abtastfrequenz, dauer)
%Definition y Werte
y = A*cos(2*pi*f0*x+p); %gegeben Funktion aus Aufgabe
%Plot erstellen
subplot(1,1,1);
%Funktion auf Plot Zeichnen
stem(x,y);
%PLot Skalieren (0.1 = 10ms) x -> 0 bis 0.1 // y -> -0.4 bis 0.4
axis([vonx bisx vony bisy]);
%Ton Ausgabe
sound(y,fs);
