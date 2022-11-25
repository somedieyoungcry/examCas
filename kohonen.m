clc
clear all
close all

%Se declaran los 6 patrones de entrada
p=[[0.5   1.0]
   [0.5  -0.5]
   [1.5  -0.5]
   [0.8   0.6]
   [0.2  -0.5]]

%Se declaran la capa neuronal
w=[[0.247   0.241]
   [0.235   0.286]]

%Se declara la vecindad
vecindad = 1.5

tamneu=size(w);
tampat=size(p);

vG = [];
pG = [];

%Se hace el proceso para cada neurona
for neuronas=1:tamneu
conjSel = [];

%Se hace el proceso para cada patron
    for patrones=1:tampat
        wp = p(patrones,:)-w(neuronas,:);
        dwp = sqrt((wp(1)^2)+(wp(2)^2));
        %Se agregan los resultados para seleccionar el menor
        conjSel = [conjSel,dwp];
    end
    conjSel;
    %Se selecciona el patrÃ³n ganador(el menor) con respecto a la neurona 1 (W1)
    [valorG, posicionG] = min(conjSel);
    "El patrón " + posicionG + " es el patrón ganador con respecto a la neurona "+ neuronas

    %Se guardan los mejores valores y sus posiciones
    vG = [vG, valorG];
    pG = [pG, posicionG];

end

%------ EN ESTE CASO EL MISMO PATRON HACE GANADOR A LAS DOS NEURONAS ------
%-------------SE CALCULA LA SALIDA Y PESOS PARA LA GANADORA---------------

if pG(1) == pG(2)  %if pG(1) ~= pG(2)        if pG(1) == pG(2)
    %Si son iguales, se elige la menor
    
    [vminG, pminG] = min(vG)
    "La neurona "+ pminG + " fue la de menor distancia con el patron " + posicionG
    "---------------  GANADORA -------------------"
    %Se almacena la neurona selecciona en w2, para actualizar valor
    w2=w(pminG,:);
    %Se declara el simbolo o para ir reduciendolo en el for
    o=5;
    for gan=1:3
        "Iteración --> " + gan
        "Neurona --> " + pminG
        %Calculo de la salida
        a = (w2)*(transpose(p(posicionG,:))); 
        a = 1; 
    
        %Ajuste de peso de la ganadora     
        distancia=0;    %No hay distancia entre si misma
        A =  2.71828^((-1*(distancia)^2)/(2*(o)^2));    
        o=o-1;
        %Se actualiza la nueva w2
        w2 = (w2)+0.5*A*((p(posicionG,:))-(w2))
        %Se calcula o actualiza la distancia
            pred = abs(p(posicionG,:) - w2 );
        d1 = sqrt((pred(1)^2)+(pred(2)^2))
    end

    "--------------- NO GANADORA -------------------"
    for tn=1:tamneu
        if tn ~= pminG
            %Se almacena la neurona selecciona en w2, para actualizar valor
            w2=w(tn,:);
            for gan=1:2
                "Iteración --> " + gan
                "Neurona --> " + tn
                %Calculo de la salida
                a = (w2)*(transpose(p(posicionG,:)));
                a = 1; 
            
                %Ajuste de peso de la ganadora
                distancia=0;    %No hay distancia entre si misma
                A =  2.71828^((-1*(distancia)^2)/(2*(o)^2));    
                o=o-1;
                %Se actualiza la nueva w2
                w2 = (w2)+0.5*A*((p(posicionG,:))-(w2))
                %Se calcula o actualiza la distancia
                    pred = abs(p(posicionG,:) - w2 );
                d1 = sqrt((pred(1)^2)+(pred(2)^2))
            end
        end
    end

else
%---------- EN ESTE CASO CADA NEURONA TIENE UN PATRON GANADOR -------------
%-------------SE CALCULA LA SALIDA Y PESOS PARA LA GANADORA---------------
   
    %Se calcula salida y se ajusta peso para el patron ganador de cada
    %neurona
    noGanNeu = [];
    noGanPat = [];
    o=5;
   "---------------  GANADORA -------------------"
    for pgan=1:tamneu
        "Neurona --> " + pgan
        %Se almacena la neurona selecciona en p2, para actualizar valor
        p2 = p(pG(pgan),:);
        %Se almacena la neurona selecciona en w2, para actualizar valor
        w2 = w(pgan,:);
        for pgan=1:3
            "Iteración --> " + pgan
            a = (w2)*(transpose(p2)); 
            a = 1; 
        
            %Ajuste de peso de la ganadora
            distancia=0;    %No hay distancia entre si misma
            A =  2.71828^((-1*(distancia)^2)/(2*(o)^2));    
            o=o-1;
            %Se actualiza la nueva w2
            w2 = (w2)+0.5*A*((p2)-(w2))
            %Se calcula o actualiza la distancia
                pred = abs(p2 - w2 );
            d1 = sqrt((pred(1)^2)+(pred(2)^2))
        end
        neu = [pgan];
        pat = [pG(pgan)];
        %Se almacenan patrones a comparar con los no ganadores
        noGanNeu = [noGanNeu,neu];
        noGanPat = [noGanPat,pat];
    end
   "--------------- NO GANADORA -------------------"
    noGanNeu;
    noGanPat;
    for noGan=1:noGanNeu
        "Perdedoras de la neurona --> "+ noGan
        for tn=1:tamneu
            if tn ~= noGanNeu(noGan)
                %Se almacena la neurona selecciona en w2, para actualizar valor
                w2=w(tn,:);
                for gan=1:2
                    "Iteración --> " + gan
                    "Neurona --> " + tn
                    %Calculo de la salida
                    a = (w2)*(transpose(p(noGanPat(noGan),:))); 
                    a = 1; 
                
                    %Ajuste de peso de la ganadora
                    distancia=0;    %No hay distancia entre si misma
                    A =  2.71828^((-1*(distancia)^2)/(2*(o)^2));    
                    o=o-1;
                    %Se actualiza la nueva w2
                    w2 = (w2)+0.5*A*((p(noGanPat(noGan),:))-(w2))
                    %Se calcula o actualiza la distancia
                        pred = abs(p(noGanPat(noGan),:) - w2 );
                    d1 = sqrt((pred(1)^2)+(pred(2)^2))
                end
            end
        end
    end
    
end

