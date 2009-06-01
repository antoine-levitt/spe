% renvoie l'itération suivante
function [xtp1,u] = iter(N, X)
    global PARAMS;
    switch PARAMS.method
      case 1
        [xtp1, u] = iter_m1(N,X);
      case 2
        [xtp1, u] = iter_m2(N,X);
      case 3
        xtp1 = iter_m3(N,X);
        u = [1];
    end
