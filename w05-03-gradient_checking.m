function [J] = Cost(theta)

%J = theta^3
J = 2*theta^4+4
  
end


EPSILON = 0.01;
theta = 1;

(Cost(theta + EPSILON) - Cost(theta - EPSILON)) / (2 * EPSILON) 

%{
>> J = 1.0303
J = 0.9703
ans = 3.0001
>>

%}

function [grad] GradApprox(theta, EPSILON):
  grad = zeros(size(theta));  
  for i = 1:n,
    thetaPlus = theta;
    thetaPlus(i) = thetaPlus(i) + EPSILON;
    thetaMinus = theta;
    thetaMinus(i) = thetaMinus(i) - EPSILON;
    grad(i) = (Cost(thetaPlus) - Cost(thetaMinus)) / (2 * EPSILON)
  endfor
end  