[x,fs]=audioread('sounds/blowMyWhistleBaby.wav');
%x sztereó, dobjuk el a felét!
xMajdnemMono = x(:,1);
%441kHz nekünk most túl sok. Minden 44 -bõl csak egy adatkát tartsunk meg:
%így is marad kb 10kHz
downSample = 20;
xMajdnemMono = xMajdnemMono(1:downSample:end);
%rajzoljuk ki ellenõrzésképpen
plot(xMajdnemMono)
%elõzõ kódot másoljuk ide, és alkossunk!
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
figure('Name','Saját DFT')
plot(freqsInHertz,abs(complexCoeffs))

