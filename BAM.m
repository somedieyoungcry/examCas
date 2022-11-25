clear all;
clc;
%Valores de X.
x1=[1 -1 -1 1 1 -1 1 -1 -1 1]
x2=[1 1 1 -1 1 1 1 -1 1 -1]
%Valores de Y.
y1=[-1 -1 1 1 1 1]
y2=[-1 -1 1 1 -1 -1]
%Calculo de W.
W=y1'*(x1)+y2'*(x2)
%Aplicando el patron de 
%Patron de ejemplo
%P=[-1 1 -1 1 1 -1 1 -1 -1 1]

%Patron de ejercicio
P=[-1 1 1 -1 1 -1 -1 1 1 1];
% Algoritmo BAM.
Y1=W*(P)'
X2=(W)'*Y1
Y3=(W)*X2
X4=(W)'*Y3


[m , n ]= size(W)
fila=0;
while fila<m
fila = fila +1
[filas , columnas ]= size(W);
    for columna=1:columnas
Y1=W*(P)'
X2=(W)'*Y1
Y3=(W)*X2
X4=(W)'*Y3
        if W>0
            W=-1;
        else
            W=1;
        end

    end

end