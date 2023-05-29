%% Signal
t = 0:Te:10;
y = 5*sin(2*pi*(0.1+0.09/2.*t).*t);
%% Polynomial
mu = 5;
k = 0;
q = 4;
n=1;
ksi = 1;
T_sliding = 0.5;
m = T_sliding/Te;
t_0 = (T_sliding+Te)/Te;
%%
result = zeros(size(y,2), 1);
for t_1 = t_0:10/Te
    for i = 1:m
        tau_i = i/m;
        result(t_1) = result(t_1) + Q(k, mu, n, q, ksi, tau_i)*y(t_1-floor((T_sliding*tau_i)));
    end
    result(t_1) = 1/T_sliding^n*result(t_1);
end
%%
figure;
hold on
plot(t, y)
plot(t(1:end-1), diff(y)/Te)
plot(t, result*Te)
%%
y_dot = diff(y)/Te;
y_dot_dot = diff(y_dot)/Te;
max(abs(y_dot_dot))

y_dot_dot_1 = 5*2*pi*0.09.*cos(2*pi*(0.1+0.09/2.*t).*t)-5*2*pi*(0.1+0.09.*t).*2*pi.*(0.1+0.09.*t).*sin(2*pi*(0.1+0.09/2.*t).*t);
figure;
hold on
plot(t, y_dot_dot_1)
plot(t(1:end-2), y_dot_dot)
%%
function result = Q(k, mu, n, q, t, tau)
    choose = @(n,k) gamma(n+1)./(gamma(k+1).*gamma(n-k+1));
    C = @(mu,k,n,i) ((mu+k+2*n+2*i+1)*gamma(mu+k+2*n+i+1)*gamma(n+i+1))/(gamma(k+n+i+1)*gamma(mu+n+i+1));
    P = @(n, mu, k, t) sum(choose(n+mu,(0:n)).*choose(n+k,n-(0:n)).*(t-1).^(n-(0:n)).*t.^(0:n));
    w = @(mu,k, t) (1-t)^mu*t^k;
    result = 0;
    for i = 0:q
        result = result + C(mu,k,n,i)*P(i, mu+n, k+n, t)*P(n+i, mu, k, tau);
    end
    result = w(mu, k, tau)*result;
end