
% To represents signals using cosine functions and Fourier series

ncoef=20;   %number of Fourier Series coefficients

% Generate a signal, select one only

gauss=0;
rectangle=1;
trangle=0;
if (gauss) 
w=1.0;
t=-5:0.01:5;
d=-5:2*w:5;
y2=2*pulstran(t,d,'gauspuls',w)-0;
elseif (rectangle)
w=1.0;
t=-5:0.01:5;
d=-5:2*w:5;
y2=2*pulstran(t,d,'rectpuls',w)-1;
else
w=1.0;
t=-5:0.01:5;
d=-5:1*w:5;
y2=2*pulstran(t,d,'tripuls',w)-1;
end    
figure
plot(t,y2,'r-','Linewidth',2);
cs=zeros(1,length(t));

% Set number of coefficients

for i=0:ncoef

% Compute Coefficiennts of Fourier series

ci = 2*sum(cos(i*pi*t).*y2)/(length(t));    

% Add cosines with coef

cs = cs + ci*cos(i*pi*t);
end
hold on
plot(t,cs,'b-')
ylabel('Amplitude')
xlabel('Time')
legend('Original','Constructed')
