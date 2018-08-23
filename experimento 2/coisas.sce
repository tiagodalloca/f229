function ans=L(n,T)
    ans=n/(2*120).*sqrt(T/1e-4)
endfunction

function ans=select_n(m,n)
    ans=m(m(:,2)==n,:)
endfunction


function [a,b,sig,x,y]=analize(mt)
    n = mt(:,2)
    m = mt(:,3)
    l = mt(:,1)
    t = m*9.8
    f=120
    y = t.*(n./(2*f))^2
    x = l^2
    x = x'
    y = y'
    
    [a,b,sig] = reglin(x,y)
    
    plot(x,x*a+b)
    scatter(x, y, "markerEdgeColor",[0 .4 .4],...
                  "markerFaceColor",[0 .8 .8],...
                  "linewidth",1.5);
endfunction

n = [1:1:5]
T = [50e-3:1e-3:130e-3]

csv = csvRead("/home/tiago/Documents/Unicamp/f229/dados_aula1.csv")
csv = csv(2:size(csv)(:,1),:)

clf


[a3,b3,sig3,x3,y3]=analize(select_n(csv,3))
[a4,b4,sig4,x4,y4]=analize(select_n(csv,4))
[a,b,sig,x,y]=analize(csv)
plot(x3,x3*a3+b3,"red")
plot(x4,x4*a4+b4,"green")
plot(x,x*a+b)
