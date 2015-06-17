[copyright]: # (Copyright (C) 2013 Columbia University in the City of New York and others.)
[copyright]: # ( )
[copyright]: # (Please see the AUTHORS file in the main source directory for a full list)
[copyright]: # (of contributors.)
[copyright]: # ( )
[copyright]: # (This file is part of TerraFERMA.)
[copyright]: # ( )
[copyright]: # (TerraFERMA is free software: you can redistribute it and/or modify)
[copyright]: # (it under the terms of the GNU Lesser General Public License as published by)
[copyright]: # (the Free Software Foundation, either version 3 of the License, or)
[copyright]: # ((at your option) any later version.)
[copyright]: # ( )
[copyright]: # (TerraFERMA is distributed in the hope that it will be useful,)
[copyright]: # (but WITHOUT ANY WARRANTY; without even the implied warranty of)
[copyright]: # (MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the)
[copyright]: # (GNU Lesser General Public License for more details.)
[copyright]: # ( )
[copyright]: # (You should have received a copy of the GNU Lesser General Public License)
[copyright]: # (along with TerraFERMA. If not, see <http://www.gnu.org/licenses/>.)

[documentation home](Documentation)

/ [terraferma_options](../../../../terraferma_options) / [system](../../../system) / [field](../../field) / [type::Function](../type__Function) /

#rank (Scalar)

CHOICE 

*/system/field/type::Function/rank::Scalar*

The rank of the field (scalar, rank 0).

* CHOICE:
    * [element (P0)](rank__Scalar/element__P0 "child")

        CHOICE 

        */system/field/type::Function/rank::Scalar/element::P0*

        Options describing piecewise constant discontinuous Lagrange finite element.

    * [element (P0R)](rank__Scalar/element__P0R "child")

        CHOICE 

        */system/field/type::Function/rank::Scalar/element::P0R*

        Options describing piecewise constant continuous real, e.g. for a global Lagrange multiplier.

    * [element (Quadrature)](rank__Scalar/element__Quadrature "child")

        CHOICE 

        */system/field/type::Function/rank::Scalar/element::Quadrature*

        Options describing a piecewise constant quadrature element.

    * [element (P1)](rank__Scalar/element__P1 "child")

        CHOICE 

        */system/field/type::Function/rank::Scalar/element::P1*

        Options describing piecewise linear continuous Lagrange finite element.

    * [element (P2)](rank__Scalar/element__P2 "child")

        CHOICE 

        */system/field/type::Function/rank::Scalar/element::P2*

        Options describing piecewise quadratic continuous Lagrange finite element.

    * [element (P1DG)](rank__Scalar/element__P1DG "child")

        CHOICE 

        */system/field/type::Function/rank::Scalar/element::P1DG*

        Options describing piecewise linear discontinuous Lagrange finite element.

    * [element (P2DG)](rank__Scalar/element__P2DG "child")

        CHOICE 

        */system/field/type::Function/rank::Scalar/element::P2DG*

        Options describing piecewise quadratic discontinuous Lagrange finite element.

    * [element (UserDefined)](rank__Scalar/element__UserDefined "child")

        CHOICE 

        */system/field/type::Function/rank::Scalar/element::UserDefined*

        Options describing a user defined finite element.

* CHOICE:
    * [initial_condition (WholeMesh)](rank__Scalar/initial_condition__WholeMesh "child")

        MULTIPLE (1+) CHOICE 

        */system/field/type::Function/rank::Scalar/initial_condition::WholeMesh*

        Options for the description of the initial condition over the whole domain

    * [initial_condition](rank__Scalar/initial_condition "child")

        MULTIPLE (1+) CHOICE 

        attributes: name (string) 

        */system/field/type::Function/rank::Scalar/initial_condition*

        Options for the description of the initial condition over a subset of the whole domain

* [boundary_condition](rank__Scalar/boundary_condition "child")

    MULTIPLE (0+) 

    attributes: name (string) 

    */system/field/type::Function/rank::Scalar/boundary_condition*

    Options for the description of a boundary condition

* [reference_point (Point)](rank__Scalar/reference_point__Point "child")

    OPTIONAL 

    */system/field/type::Function/rank::Scalar/reference_point::Point*

    Options for the description of a reference point at which field values are zeroed during each solve 
    by the imposition of an internal pointwise Dirichlet boundary condition at the nearest node to the
    coordinates specified below.

* [zero_point (Point)](rank__Scalar/zero_point__Point "child")

    OPTIONAL 

    */system/field/type::Function/rank::Scalar/zero_point::Point*

    Options for the description of a zero point at which field values are zeroed after each nonlinear solve.
    
    Unlike reference points, a zero point is a post-processing calculation and so should be used in conjunction 
    with a Lagrange multiplier or the removal of the null space if the solution would be ill conditioned otherwise.

* [value_cap (Cap)](rank__Scalar/value_cap__Cap "child")

    OPTIONAL 

    */system/field/type::Function/rank::Scalar/value_cap::Cap*

    Cap the values of the field after every nonlinear solve.
    
    This is a postprocessing modification of the vector values and so will affect the value of the non-linear residual.  
    In a coupled problem this will likely have implications on the other fields that this simple hack will not consider.  
    Perhaps consider using SNES VI instead.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)

