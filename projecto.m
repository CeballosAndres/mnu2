R=0.082054

disp('Prorama para encontrar el volumen molar de los gases ideales');
disp('Elija de cual gas desea obtener su volumen molar:');
disp('1-bioxido de carbono ');
disp('2-Oxigeno');
opc=input('Ingrese su eleccion:');
switch (opc)
  case 1
    a=3.59;
    b=0.04267;
   case 2
    a=1.360;
    b=0.03183; 
    otherwise
 endswitch
 
 p=input('Ingrese su presion');
 T=input('Ingrese su temperatura');
 fv=input((p+(a/v**2))*(v-b)-R*T);
 fvol(v)=inline(fv)
 fprintf('Volumen molar de : %f',newtonRaphson(fv));
 
 function v1=newtonRaphson(fv)
  disp('Metodo de Newton-Raphson');
  
  v1=input('Ingresar punto v1: ');
  tol = input('Ingrese la tolerancia: ');
  %Antes de pedir los limites graficar la funcion
  c=0; n=1; %inicializar variables c-- propuesta, punto medio n-- iteraciones, contador
  maxep=abs(fv(v1)); %error
  fprintf('\t n \t a  \t       f(a) \t      maxep \n');

  while(maxep>tol);%Cuando el error sea menor a la tolerancia, se obtiene la raiz  
      %while(abs(fx(c))>tol)
      g=tol/10;
      d=(fv(v1+g)-fv(v1-g))/(2*g);
      if(d==0)
          disp(' la derivada de fx es 0, no se puede encontrar la solucion con este metodo');
          maxep=tol;
      else
         v1=v1-(fv(v1)/d);
         maxep=abs(fv(v1));
         fprintf("\t %i \t %f \t %f \t %f\n",n,v1,fv(v1),maxep);
  
         n=n+1;
      endif
  endwhile

  if(d!=0)
    fprintf('Con la tolerancia de %f:\n\t\n', v1,tol);
  endif
endfunction