% renvoie l'itération suivante
function xtp1 = iter(N, X)
    global PARAMS;
    switch PARAMS.method
      case 1
        xtp1 = iter_m1(N,X);
      case 2
        xtp1 = iter_m2(N,X);
      case 3
        xtp1 = iter_m3(N,X);
    end
