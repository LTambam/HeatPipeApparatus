function plotMatFile

%insert file name you would like to plot here
filename = 'Exp8_ethanol.mat';

%load data from filename onto Data
Data = load(filename);

%save each column to a separate variable
x = Data.Y(:,1);
y1 = Data.Y(:,2);
y2 = Data.Y(:,3);
y3 = Data.Y(:,4);
y4 = Data.Y(:,5);
y5 = Data.Y(:,6);
y6 = Data.Y(:,7);
y7 = Data.Y(:,8);
y8 = Data.Y(:,9);

%plot everything
plot(x,y1,x,y2,x,y3,x,y4,x,y5,x,y6,x,y7,x,y8);