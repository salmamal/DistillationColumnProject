function x = succesive_substitution(func, x0, tol)
  x = x0;
  error = tol + 1;
  iter = 0;
  while error > tol
    x_new = func(x);
    error = abs(x_new - x);
    x = x_new;
    iter = iter + 1;
  end
  fprintf('The root is approximately %f after %d iterations.\n', x, iter);
end
