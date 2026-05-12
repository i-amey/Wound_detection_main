% CIRCULARSTRUCT
%
% Function to construct a circular structuring element
% for morphological operations.
%
% function strel = circularstruct(radius)
%
% Note radius can be a floating point value though the resulting
% circle will be a discrete approximation
%

% Copyright (c) 2000 Peter Kovesi
% Centre for Exploration Targeting
% The University of Western Australia
% peter.kovesi at uwa edu au
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in 
% all copies or substantial portions of the Software.
%
% The Software is provided "as is", without warranty of any kind.

% Peter Kovesi   March 2000

function strel = circularstruct(radius)

if radius < 1
  error('radius must be >= 1');
end

dia = ceil(2*radius);  % Diameter of structuring element

if mod(dia,2) == 0     % If diameter is a odd value
 dia = dia + 1;        % add 1 to generate a `centre pixel'
end

r = fix(dia/2);
[x,y] = meshgrid(-r:r);
rad = sqrt(x.^2 + y.^2);  
strel = rad <= radius;
