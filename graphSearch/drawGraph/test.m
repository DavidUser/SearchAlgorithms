clear();
scale = 100;
S = [0 0;
     2 3
     5 3
     3 0]*scale;
G(1,2) = 18;
G(1,4) = 24;
G(2,3) = 36;
G(3,4) = 10;
drawGraph(S,G, scale);
pause();
