function [P] = integral(methode,Sp,fmin,fmax,n)
    if (strcmp(methode,'rectangle'))
       h = (fmax-fmin)/n;
       x=a+h/2:h:b; 
       f = Sp(x);
       P = h*sum(f);    
    end
    if (strcmp(methode,'trapeze'))
       h = (fmax-fmin)/n;
       x=a:h:b ; % points de discretisation
        f=Sp(x);
        val=(f(1)+f(n+1))/2 ;
        for i=2:n
             val=val+f(i);
        end
        val=val*h;
    end


end