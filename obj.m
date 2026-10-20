function J=obj(p)
[t,x]=solvemodel(p,0);
 J=x(end,5);
end

  

