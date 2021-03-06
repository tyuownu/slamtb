function [v,Vpy] = py2vec(py)

% PY2VEC  Pitch and yaw to 3D direction vector.
%   V = PY2VEC(PY) returns a unit direction vector V with the pitch and yaw
%   given in input vector PY.
%
%   [V,Vpy] = PY2VEC(...) returns also the Jacobian wrt PY.

%   Copyright 2008-2009 Joan Sola @ LAAS-CNRS.

p = py(1,:);
y = py(2,:);

v = [cos(p).*cos(y)
    cos(p).*sin(y)
    sin(p)];

if size(py,2) ==1 && nargout > 1 % we want jacobians
    Vpy = [...
        [ -sin(p)*cos(y), -cos(p)*sin(y)]
        [ -sin(p)*sin(y),  cos(p)*cos(y)]
        [         cos(p),              0]];

end

return

%% build jacobians

syms p y real
py  = [p;y];
v   = py2vec(py);
Vpy = simple(jacobian(v,py))



% ========== End of function - Start GPL license ==========


%   # START GPL LICENSE

%---------------------------------------------------------------------
%
%   This file is part of SLAMTB, a SLAM toolbox for Matlab.
%
%   SLAMTB is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   (at your option) any later version.
%
%   SLAMTB is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with SLAMTB.  If not, see <http://www.gnu.org/licenses/>.
%
%---------------------------------------------------------------------

%   SLAMTB is Copyright:
%   Copyright (c) 2008-2010, Joan Sola @ LAAS-CNRS,
%   Copyright (c) 2010-2013, Joan Sola,
%   Copyright (c) 2014-2015, Joan Sola @ IRI-UPC-CSIC,
%   SLAMTB is Copyright 2009 
%   by Joan Sola, Teresa Vidal-Calleja, David Marquez and Jean Marie Codol
%   @ LAAS-CNRS.
%   See on top of this file for its particular copyright.

%   # END GPL LICENSE

