clear ; close all; clc
fprintf('-------------------------------------------------\n')
fprintf('Criando um vetor único com os dados de 3 matrizes\n')
fprintf('-------------------------------------------------\n')

fprintf('Cria a matriz 1:\n')
Theta1 = ones(10, 11)

fprintf('Cria a matriz 2:\n')
Theta2 = 2 * ones(10, 11)

fprintf('Cria a matriz 3:\n')
Theta3 = 3 * ones(1, 11)

fprintf('Serializando todos os dados em um só vetor:\n')
fprintf('thetaVec = [Theta1(:); Theta2(:); Theta3(:)]\n')
thetaVec = [Theta1(:); Theta2(:); Theta3(:)];
thetaVec'

fprintf('-------------------------------------------------\n')
fprintf('Retornando os dados para a forma de matrizes\n')
fprintf('-------------------------------------------------\n')

fprintf('Theta1:\nreshape(thetaVec(1:110), 10, 11)\n')
reshape(thetaVec(1:110), 10, 11)

fprintf('Theta2:\nreshape(thetaVec(111:220), 10, 11)\n')
reshape(thetaVec(111:220), 10, 11)

fprintf('Theta3:\nreshape(thetaVec(221:231), 1, 11)\n')
reshape(thetaVec(221:231), 1, 11)

%{
-------------------------------------------------
Criando um vetor único com os dados de 3 matrizes
-------------------------------------------------
Cria a matriz 1:
Theta1 =

   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1

Cria a matriz 2:
Theta2 =

   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2

Cria a matriz 3:
Theta3 =

   3   3   3   3   3   3   3   3   3   3   3

Serializando todos os dados em um só vetor:
thetaVec = [Theta1(:); Theta2(:); Theta3(:)]
ans =

 Columns 1 through 40:

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

 Columns 41 through 80:

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

 Columns 81 through 120:

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   2   2   2   2   2   2   2   2   2   2

 Columns 121 through 160:

   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2

 Columns 161 through 200:

   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2

 Columns 201 through 231:

   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   2   3   3   3   3   3   3   3   3   3   3   3

-------------------------------------------------
Retornando os dados para a forma de matrizes
-------------------------------------------------
Theta1:
reshape(thetaVec(1:110), 10, 11)
ans =

   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1
   1   1   1   1   1   1   1   1   1   1   1

Theta2:
reshape(thetaVec(111:220), 10, 11)
ans =

   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2
   2   2   2   2   2   2   2   2   2   2   2

Theta3:
reshape(thetaVec(221:231), 1, 11)
ans =

   3   3   3   3   3   3   3   3   3   3   3

>>

>>

}%
