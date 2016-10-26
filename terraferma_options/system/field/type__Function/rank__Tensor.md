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

[documentation home](https://github.com/terraferma/terraferma/wiki/Documentation)

/ [terraferma_options](../../../../terraferma_options.md) / [system](../../../system.md) / [field](../../field.md) / [type::Function](../type__Function.md) /

#rank (Tensor)

CHOICE 

*/system/field/type::Function/rank::Tensor*

The rank of the field (tensor, rank 2).

* CHOICE:
    * [element (UserDefined)](rank__Tensor/element__UserDefined.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/element::UserDefined*

        Options describing a user defined finite element for a tensor.

    * [element (P1)](rank__Tensor/element__P1.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/element::P1*

        Options describing piecewise linear continuous Lagrange finite element for a tensor.

    * [element (P2)](rank__Tensor/element__P2.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/element::P2*

        Options describing piecewise quadratic continuous Lagrange finite element for a tensor.

    * [element (P1DG)](rank__Tensor/element__P1DG.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/element::P1DG*

        Options describing piecewise linear discontinuous Lagrange finite element for a tensor.

    * [element (P2DG)](rank__Tensor/element__P2DG.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/element::P2DG*

        Options describing piecewise quadratic discontinuous Lagrange finite element for a tensor.

    * [element (P0)](rank__Tensor/element__P0.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/element::P0*

        Options describing piecewise constant discontinuous Lagrange finite element for a tensor.

    * [element (P0R)](rank__Tensor/element__P0R.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/element::P0R*

        Options describing piecewise constant continuous real for a tensor, e.g. for a global Lagrange multiplier.

    * [element (Quadrature)](rank__Tensor/element__Quadrature.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/element::Quadrature*

        Options describing a piecewise constant quadrature element for a tensor.

* CHOICE:
    * [initial_condition (WholeMesh)](rank__Tensor/initial_condition__WholeMesh.md "child")

        MULTIPLE (0+) CHOICE 

        */system/field/type::Function/rank::Tensor/initial_condition::WholeMesh*

        Options for the description of the initial condition over the whole domain

    * [initial_condition](rank__Tensor/initial_condition.md "child")

        MULTIPLE (0+) CHOICE 

        attributes: name (string) 

        */system/field/type::Function/rank::Tensor/initial_condition*

        Options for the description of the initial condition over a subset of the whole domain

* [boundary_condition](rank__Tensor/boundary_condition.md "child")

    MULTIPLE (0+) 

    attributes: name (string) 

    */system/field/type::Function/rank::Tensor/boundary_condition*

    Options for the description of a boundary condition

* CHOICE:
    * [reference_point (Point)](rank__Tensor/reference_point__Point.md "child")

        MULTIPLE (0+) CHOICE 

        */system/field/type::Function/rank::Tensor/reference_point::Point*

        Options for the description of a reference point at which field values are zeroed during each solve 
        by the imposition of an internal pointwise Dirichlet boundary condition at the nearest node to the
        coordinates specified below.
        
        This version defaults to the name Point.  If specifying more than one reference point (perhaps on different components) the name of each 
        one must be unique so multiple instances of this default name are not allowed.

    * [reference_point](rank__Tensor/reference_point.md "child")

        MULTIPLE (0+) CHOICE 

        attributes: name (string) 

        */system/field/type::Function/rank::Tensor/reference_point*

        Options for the description of a reference point at which field values are zeroed during each solve 
        by the imposition of an internal pointwise Dirichlet boundary condition at the nearest node to the
        coordinates specified below.
        
        Names of each reference point (perhaps on different components) must be unique within this field specification.

* CHOICE:
    * [zero_point (Point)](rank__Tensor/zero_point__Point.md "child")

        MULTIPLE (0+) CHOICE 

        */system/field/type::Function/rank::Tensor/zero_point::Point*

        Options for the description of a zero point at which field values are zeroed after each nonlinear solve.
        
        Unlike reference points, a zero point is a post-processing calculation and so should be used in conjunction 
        with a Lagrange multiplier or the removal of the null space if the solution would be ill conditioned otherwise.
        
        This version defaults to the name Point.  If specifying more than one reference point the name of each 
        one must be unique so multiple instances of this default name are not allowed.

    * [zero_point](rank__Tensor/zero_point.md "child")

        MULTIPLE (0+) CHOICE 

        attributes: name (string) 

        */system/field/type::Function/rank::Tensor/zero_point*

        Options for the description of a zero point at which field values are zeroed after each nonlinear solve.
        
        Unlike reference points, a zero point is a post-processing calculation and so should be used in conjunction 
        with a Lagrange multiplier or the removal of the null space if the solution would be ill conditioned otherwise.
        
        If specifying multiple zero points (perhaps on different components) their names must be unique within this field specification.

* CHOICE:
    * [value_cap (Cap)](rank__Tensor/value_cap__Cap.md "child")

        MULTIPLE (0+) CHOICE 

        */system/field/type::Function/rank::Tensor/value_cap::Cap*

        Cap the values of the field after every nonlinear solve.
        
        This is a postprocessing modification of the vector values and so will affect the value of the non-linear residual.  
        In a coupled problem this will likely have implications on the other fields that this simple hack will not consider.  
        Perhaps consider using SNES VI instead.
        
        This version defaults to the name Cap.  If specifying more than one value cap (perhaps on different components) the name of each 
        one must be unique so multiple instances of this default name are not allowed.

    * [value_cap](rank__Tensor/value_cap.md "child")

        MULTIPLE (0+) CHOICE 

        attributes: name (string) 

        */system/field/type::Function/rank::Tensor/value_cap*

        Cap the values of the field after every nonlinear solve.
        
        This is a postprocessing modification of the vector values and so will affect the value of the non-linear residual.  
        In a coupled problem this will likely have implications on the other fields that this simple hack will not consider.  
        Perhaps consider using SNES VI instead.
        
        If specifying multiple value caps (perhaps on different components) their names must be unique within this field specification.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)

