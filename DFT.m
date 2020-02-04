%vegyünk egy diszkrét jelet, amin kipróbálhatjuk a DFT-t.
t = linspace(0,2*pi,1000);
signal = sin(4*t)+sin(40*t);
figure('Name', 'A jel')
plot(signal)
sample = signal(1:100);
%stem(sample)

%mi lehet a legnagyobb körfrekvenciájú alapharmonikus? e^(i*2pi*n/N):
sum0 = 0;
for n = 1:length(signal)
    sum0 = sum0 + signal(n)*exp(1i*2*pi*n*50/length(signal));
end
%szuper! Mostmár vagy egy "frekvenciavizsgálónk". Mostmár csak ezt kéne
%kipróbálni sok frekire. TODO: próbálgatás, freki eltalálás.
%akkor lesz nagy a kimenet, amikor pont úgy tekerem körbe, ahogy a sin
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
figure('Name','Saját DFT')
plot(abs(complexCoeffs))

%hasonlítsuk össze!
builtinfft = fft(signal);
figure('Name', 'Beépített DFT')
plot(abs(builtinfft))