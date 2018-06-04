    A = 0.3; %Amplitude
    f0 = 300; %Frequenz in Hz
    p = 0; %Phase
    d = 3; %Dauer in s
    fs = 22050; %Abtast Frequenz in Hz
    vonx=0.0; %Plot Start x
    bisx=0.01; %Plot Ende x
    vony=-1; %Plot Start y
    bisy=1; %Plot Ende y
    %Definition der x Werte
    x = 0:1/fs:d; % Array {Startwert, sekunde/abtastfrequenz, dauer)
    xm = [0.1, 0.05, 0.05, 0.05, 0.2, 0.2, 0.05, 0.05, 0.05, 0.1];
    xm_pi = [-1/3*pi, 1/3*pi, -1/4*pi, 2/3*pi, 0, 0, -2/3*pi, 1/4*pi, -1/3*pi, 1/3*pi];
    m = [-14, -12, -10, -8, -1 ,1  8, 10, 12, 14];
    signal_1=xm(1)*cos(2*pi*f0*m(1)*x+xm_pi(1));
    signal_2=xm(2)*cos(2*pi*f0*m(2)*x+xm_pi(2));
    signal_3=xm(3)*cos(2*pi*f0*m(3)*x+xm_pi(3));
    signal_4=xm(4)*cos(2*pi*f0*m(4)*x+xm_pi(4));
    signal_5=xm(5)*cos(2*pi*f0*m(5)*x+xm_pi(5));
    signal_6=xm(6)*cos(2*pi*f0*m(6)*x+xm_pi(6));
    signal_7=xm(7)*cos(2*pi*f0*m(7)*x+xm_pi(7));
    signal_8=xm(8)*cos(2*pi*f0*m(8)*x+xm_pi(8));
    signal_9=xm(9)*cos(2*pi*f0*m(9)*x+xm_pi(9));
    signal_10=xm(10)*cos(2*pi*f0*m(10)*x+xm_pi(10));
    y = signal_1+signal_2+signal_3+signal_4+signal_5+signal_6+signal_7+signal_8+signal_9+signal_10;
    %Definition y Werte

    %Plot erstellen
    subplot(1,1,1);
    %Funktion auf Plot Zeichnen
    stem(x,y);
    %PLot Skalieren (0.1 = 10ms) x -> 0 bis 0.1 // y -> -0.4 bis 0.4
    axis([vonx bisx vony bisy]);
    %Ton Ausgabe
    sound(y,fs);
