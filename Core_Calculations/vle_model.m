% this file is to calculate equilibrium compositions of components between vapor and liquid phases(for ideal gas behavior)
function [y,K] = vle_model(T, P, X, A, B,C)
  % Inputs:
  % T - Temperture (in °C)
  % P - Total pressure (in mmHg)
  % X - Liquid-phase mole fractions
  % A, B, C - Antoine constants for each component
  % Outputs :
  % y - Vapor-phase mole fractions
  % K - Equilibrium constant for each component

  % Number of components
  numComponents = length(X);

  % Initialize output arrays
  Psat = zeros(1, numComponents); % Saturation pressure
  K = zeros(1, numComponents); % Equilibrium constants
  y = zeros(1, numComponents); % Vapor-phase mole fractions

  % Calculate each component's Psat and K
  for i = 1:numComponents
    % Antoine equation for Psat
    Psat(i) = 10^(A(i) - B(i)/(T + C(i)));

    % Equilibrium constant
    K(i) = Psat(i) / P;

    % Vapor-phase composition (for ideal gas behavior)
    y(i) = gamma(i) * X(i) * K(i);
  end

  % Normalize vapor-phase mole fractions to sum to 1
  y = y / sum(y);
end
