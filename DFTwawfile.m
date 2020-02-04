[x,fs]=audioread('sounds/blowMyWhistleBaby.wav');
%x sztere�, dobjuk el a fel�t!
xMajdnemMono = x(:,1);
%441kHz nek�nk most t�l sok. Minden 44 -b�l csak egy adatk�t tartsunk meg:
%�gy is marad kb 10kHz
downSample = 20;
xMajdnemMono = xMajdnemMono(1:downSample:end);
%rajzoljuk ki ellen�rz�sk�ppen
plot(xMajdnemMono)
%el�z� k�dot m�soljuk ide, �s alkossunk!
signal = xMajdnemMono;
signalDuration = length(signal)/(fs/downSample); %sec-ben.
freqs = linspace(1,5000,5000);
freqsInHertz = freqs/(signalDuration);
complexCoeffs = zeros(1,length(freqs));
for k = 1:length(freqs)
   sum = 0;
   for n = 1:length(signal)
    sum = sum + signal(n)*exp(1i*2*pi*n*k/length(signal));
   end
   complexCoeffs(1,k) = sum; 
end
figure('Name','Saj�t DFT')
plot(freqsInHertz,abs(complexCoeffs))

