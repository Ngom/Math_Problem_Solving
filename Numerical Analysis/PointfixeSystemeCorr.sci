function [x]=PointfixeSysteme(f,x0,niter)
  x(:,1)=x0;
  for i=1:niter,
    x(:,i+1)=f(x(:,i));
  end
  endfunction