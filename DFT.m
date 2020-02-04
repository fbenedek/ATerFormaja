%vegy�nk egy diszkr�t jelet, amin kipr�b�lhatjuk a DFT-t.
t = linspace(0,2*pi,1000);
signal = sin(4*t)+sin(40*t);
figure('Name', 'A jel')
plot(signal)
sample = signal(1:100);
%stem(sample)

%mi lehet a legnagyobb k�rfrekvenci�j� alapharmonikus? e^(i*2pi*n/N):
sum0 = 0;
for n = 1:length(signal)
    sum0 = sum0 + signal(n)*exp(1i*2*pi*n*50/length(signal));
end
%szuper! Mostm�r vagy egy "frekvenciavizsg�l�nk". Mostm�r csak ezt k�ne
%kipr�b�lni sok frekire. TODO: pr�b�lgat�s, freki eltal�l�s.
%akkor lesz nagy a kimenet, amikor pont �gy tekerem k�rbe, ahogy a sin
%halad. 
freqs = linspace(1,100, 100);
complexCoeffs = zeros(1,100);
for k = 1:length(freqs)
   sum = 0;
   for n = 1:length(signal)
    sum = sum + signal(n)*exp(1i*2*pi*n*k/length(signal));
   end
   complexCoeffs(1,k) = sum; 
end
figure('Name','Saj�t DFT')
plot(abs(complexCoeffs))

%hasonl�tsuk �ssze!
builtinfft = fft(signal);
figure('Name', 'Be�p�tett DFT')
plot(abs(builtinfft))