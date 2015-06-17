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

#rank (Vector)

CHOICE 

*/system/field/type::Function/rank::Vector*

The rank of the field (vector, rank 1).

* CHOICE:
    * [element (UserDefined)](rank__Vector/element__UserDefined "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::UserDefined*

        Options describing a user defined finite element for a vector.

    * [element (P1)](rank__Vector/element__P1 "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::P1*

        Options describing piecewise linear continuous Lagrange finite element for a vector.

    * [element (P2)](rank__Vector/element__P2 "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::P2*

        Options describing piecewise quadratic continuous Lagrange finite element for a vector.

    * [element (P1DG)](rank__Vector/element__P1DG "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::P1DG*

        Options describing piecewise linear discontinuous Lagrange finite element for a vector.

    * [element (P2DG)](rank__Vector/element__P2DG "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::P2DG*

        Options describing piecewise quadratic discontinuous Lagrange finite element for a vector.

    * [element (P0)](rank__Vector/element__P0 "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::P0*

        Options describing piecewise constant discontinuous Lagrange finite element for a vector.

    * [element (RT1)](rank__Vector/element__RT1 "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::RT1*

        Options describing first degree Raviart-Thomas element for a vector.

    * [element (RT2)](rank__Vector/element__RT2 "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::RT2*

        Options describing second degree Raviart-Thomas element for a vector.

    * [element (DRT1)](rank__Vector/element__DRT1 "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::DRT1*

        Options describing first degree discontinuous Raviart-Thomas element for a vector.

    * [element (DRT2)](rank__Vector/element__DRT2 "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::DRT2*

        Options describing second degree discontinuous Raviart-Thomas element for a vector.

    * [element (BDM1)](rank__Vector/element__BDM1 "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::BDM1*

        Options describing first degree discontinuous Raviart-Thomas element for a vector.

    * [element (BDM2)](rank__Vector/element__BDM2 "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::BDM2*

        Options describing second degree discontinuous Raviart-Thomas element for a vector.

    * [element (P0R)](rank__Vector/element__P0R "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::P0R*

        Options describing piecewise constant continuous real for a vector, e.g. for a global Lagrange multiplier.

    * [element (Quadrature)](rank__Vector/element__Quadrature "child")

        CHOICE 

        */system/field/type::Function/rank::Vector/element::Quadrature*

        Options describing a piecewise constant quadrature element for a vector.

* CHOICE:
    * [initial_condition (WholeMesh)](rank__Vector/initial_condition__WholeMesh "child")

        MULTIPLE (1+) CHOICE 

        */system/field/type::Function/rank::Vector/initial_condition::WholeMesh*

        Options for the description of the initial condition over the whole domain

    * [initial_condition](rank__Vector/initial_condition "child")

        MULTIPLE (1+) CHOICE 

        attributes: name (string) 

        */system/field/type::Function/rank::Vector/initial_condition*

        Options for the description of the initial condition over a subset of the whole domain

* [boundary_condition](rank__Vector/boundary_condition "child")

    MULTIPLE (0+) 

    attributes: name (string) 

    */system/field/type::Function/rank::Vector/boundary_condition*

    Options for the description of a boundary condition

* CHOICE:
    * [reference_point (Point)](rank__Vector/reference_point__Point "child")

        MULTIPLE (0+) CHOICE 

        */system/field/type::Function/rank::Vector/reference_point::Point*

        Options for the description of a reference point at which field values are zeroed during each solve 
        by the imposition of an internal pointwise Dirichlet boundary condition at the nearest node to the
        coordinates specified below.
        
        This version defaults to the name Point.  If specifying more than one reference point (perhaps on different components) the name of each 
        one must be unique so multiple instances of this default name are not allowed.

    * [reference_point](rank__Vector/reference_point "child")

        MULTIPLE (0+) CHOICE 

        attributes: name (string) 

        */system/field/type::Function/rank::Vector/reference_point*

        Options for the description of a reference point at which field values are zeroed during each solve 
        by the imposition of an internal pointwise Dirichlet boundary condition at the nearest node to the
        coordinates specified below.
        
        Names of each reference point (perhaps on different components) must be unique within this field specification.

* CHOICE:
    * [zero_point (Point)](rank__Vector/zero_point__Point "child")

        MULTIPLE (0+) CHOICE 

        */system/field/type::Function/rank::Vector/zero_point::Point*

        Options for the description of a zero point at which field values are zeroed after each nonlinear solve.
        
        Unlike reference points, a zero point is a post-processing calculation and so should be used in conjunction 
        with a Lagrange multiplier or the removal of the null space if the solution would be ill conditioned otherwise.
        
        This version defaults to the name Point.  If specifying more than one reference point the name of each 
        one must be unique so multiple instances of this default name are not allowed.

    * [zero_point](rank__Vector/zero_point "child")

        MULTIPLE (0+) CHOICE 

        attributes: name (string) 

        */system/field/type::Function/rank::Vector/zero_point*

        Options for the description of a zero point at which field values are zeroed after each nonlinear solve.
        
        Unlike reference points, a zero point is a post-processing calculation and so should be used in conjunction 
        with a Lagrange multiplier or the removal of the null space if the solution would be ill conditioned otherwise.
        
        If specifying multiple zero points (perhaps on different components) their names must be unique within this field specification.

* CHOICE:
    * [value_cap (Cap)](rank__Vector/value_cap__Cap "child")

        MULTIPLE (0+) CHOICE 

        */system/field/type::Function/rank::Vector/value_cap::Cap*

        Cap the values of the field after every nonlinear solve.
        
        This is a postprocessing modification of the vector values and so will affect the value of the non-linear residual.  
        In a coupled problem this will likely have implications on the other fields that this simple hack will not consider.  
        Perhaps consider using SNES VI instead.
        
        This version defaults to the name Cap.  If specifying more than one value cap (perhaps on different components) the name of each 
        one must be unique so multiple instances of this default name are not allowed.

    * [value_cap](rank__Vector/value_cap "child")

        MULTIPLE (0+) CHOICE 

        attributes: name (string) 

        */system/field/type::Function/rank::Vector/value_cap*

        Cap the values of the field after every nonlinear solve.
        
        This is a postprocessing modification of the vector values and so will affect the value of the non-linear residual.  
        In a coupled problem this will likely have implications on the other fields that this simple hack will not consider.  
        Perhaps consider using SNES VI instead.
        
        If specifying multiple value caps (perhaps on different components) their names must be unique within this field specification.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)

