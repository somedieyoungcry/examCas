%añadimos cambio
P = [1 2 3];         
T = [2.0 4.1 5.9]  

net = newgrnn(P,T);        
x=[1.5,2.5];               
y=sim(net,x)     
input = 'dataset1.csv'
inputs = csvread(input); 

net = competlayer(100);            
net = train(net,inputs);       
outputs = net(inputs);         
classes = vec2ind(outputs)      
c=hist(classes,3)              
  
xy = 'dataset2.csv'
x = csvread(xy);  
plot(x(1,:),x(2,:),'o')  
set(gcf,'color','w')  
title('Datos sin procesar')  
net = selforgmap([8 8]);        
net = train(net,x);            
y = net(x);  
classes = vec2ind(y);  
hist(classes,64)                
set(gcf,'color','w')  
title('Resultados de agrupamiento')  
xlabel('Categoria')  
ylabel('Numero de muestras que contiene la clase')  
net = selforgmap([4,5]);  
net = train(net,x);  
y = net(x);  

classes = vec2ind(y);  
c=hist(classes,8)           
plotsomhits(net,x)        
plotsompos(net,x)            
plotsompos(net,x)   