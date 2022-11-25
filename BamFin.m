clc
clear
close all

%patron entrada o corrupto
x1 = [1 -1 -1 1 1 -1 1 -1 -1 1]
x2 = [1 1 1 -1 1 1 1 -1 1 -1]

%patron a recuperar salida o deseado
y1 = [-1 -1 1 1 1 1]
y2 = [-1 -1 1 1 -1 -1]

%sacamos la matriz de pesos
w1 = y1'*x1
w2 = y2'*x2
w = w1 + w2

%aplicamos la normalizacion de bam en la matriz de pesos
tam = size(w);
for i=1: tam(1)
    for j=1:tam(2)
        if w(i, j) > 0
            w(i, j) == 2;
        elseif w(i, j) < 0
            w(i, j) == -2;
        else
            w(i, j) == -2;
        end
    end
end
%patron prueba
x0 = [-1 1 1 -1 1 -1 -1 1 1 1];
x = [-1 1 1 -1 1 -1 -1 1 1 1];
%para guardar nuestros resultados
tamX = size(x1);
tamY = size(y1);
xGuardadas = zeros(5, tamX(2));
yGuardadas = zeros(5, tamY(2));

%contadores para ver los cambios en x y
contx = 0;
conty = 0;

%ahora recorremos y vamos evaluando con nuetra matriz de pesos
for i=1:5
    y = w*x';
    yGuardadas(i, :) = y;
    
    %normalizamos nuestro vector
    for j = 1: tamY(2)
        if y(j) > 0
            yGuardadas(i, j) = 1;
        elseif y(j) < 0
            yGuardadas(i, j) = -1;
        else
            yGuardadas(i, j) = 0;
        end
    end
    
    %calculamos x y normalizamos
    x = w'*y;
    x = x';
    for j = 1: tamX(2)
        if x(j) > 0
            xGuardadas(i, j) = 1;
        elseif x(j) < 0
            xGuardadas(i, j) = -1;
        else
            xGuardadas(i, j) = 0;
        end
    end
    
    %ahora revisamos si se recupero correctamente
    if x == x0
        imprime = 'Recuperacion correctamente'
        break
        
    %en caso de que no se recupere vemos si es estable o no
    else
        if i ~= 1
            if xGuardadas(i, :) ~= xGuardadas(i-1, :)
                contx = contx + 1;
            end
            if yGuardadas(i, :) ~= yGuardadas(i-1, :)
                conty = conty + 1;
            end
        end
    end
end
if contx == 0 & conty == 0
    imprime = 'Red estable'
    xGuardadas(1, :) 
else
    imprime = 'Red inestable'
end