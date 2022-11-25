clc
clear all
close all

%Se declaran los 6 patrones de entrada
p=[[-0.216   0.993]
   [ 0.216   0.993]
   [ 0.993   0.216]
   [ 0.993  -0.216]
   [-0.622  -0.873]
   [-0.873  -0.622]]

%Se declaran los pesos de las 3 neuronas
w=[[ 0.7071  -0.7071]
   [ 0.7071   0.7071]
   [-1.0000   0.0000]]

%Se obtiene la distancia entre el patrón n y la neurona 1
tamneu=size(w);
tampat=size(p);

for neuronas=1:tamneu
    conjSel = [];
    %Se calcula la distancia de cada neurona con todos los patrones
    for patrones=1:tampat
        wp = p(patrones,:)-w(neuronas,:);
        dwp = sqrt((wp(1)^2)+(wp(2)^2));
        %Se genera un arreglo con los resultados para seleccionar el menor
        conjSel = [conjSel,dwp];
    end

    %Se selecciona el patrón ganador(el menor) con respecto a la neurona 1 (W1)
    [valor, posicion] = min(conjSel);
    "El patrón " + posicion + " es el patrón ganador con respecto a la neurona "+neuronas
    
    % Se almacena la mejor neurona, junto con el mejor patron
    pp = p(posicion,:);
    wnuevo=w(neuronas,:);
     %Se itera el proceso para acercar que el ajuste mejore 
    for rec=1:2
        %Se ajustan pesos y calculan salidas para cada neurona ganadora
        wnuevo = wnuevo + 0.5*(pp-wnuevo);
        m = sqrt((wnuevo(1)^2)+(wnuevo(2)^2));
        o = atand(wnuevo(2)/wnuevo(1));
        "Magnitud de " + m + " & " + o + ""
    end

end
