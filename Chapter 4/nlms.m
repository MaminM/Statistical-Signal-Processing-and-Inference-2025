function [yEst,err,weights] = nlms(x,d,u,order)
start = order+1;
nw = order-1;
weights(:,start-1) = zeros(nw,1);
yEst(start-1)=0;
for i=start:length(x)+1
    uA = u/(0.001+x(i-order:i-1)'*x(i-order:i-1)); %gear shifting
    yEst(i-1) = transpose(weights(:,i-1))*flipud(x(i-nw:i-1));
    err(i-1) = d(i-1)-yEst(i-1);
    weights(:,i) = weights(:,i-1)+uA*err(i-1)*flipud(x(i-nw:i-1));
end 
end