data = load('ex1data1.txt');
X = data(:,1);
y = data(:,2);
m = length(y);

plot(X,y,'rx','MarkerSize',10);

X = [ones(m,1),data(:,1)]; 

theta = zeros(2,1);         

J = (sum(((theta' * X')'-y).^2))/(2*m);

fprintf('the value of theta of zeroes is :%f \n',J);
alpha = 0.01;
for iter = 1:1500  
  delta =((theta'*X')' - y)/m;
    theta = theta - (alpha*delta'*X)';
    
    J_hist = (sum(((theta' * X')'-y).^2))/(2*m);
 %  disp(J_hist);
end

disp(theta);  
hold  on;
plot(X(:,2), X*theta)
pause;
hold off
  predict = [1,7]*theta;
  predict=predict*10000;
  disp (predict);
  
plot(predict,'gx','MarkerSize',10)  