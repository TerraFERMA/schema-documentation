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

/ [terraferma_options](../../../../terraferma_options.md) / [system](../../../system.md) / [coefficient](../../coefficient.md) / [type::Expression](../type__Expression.md) /

#rank (Vector)

CHOICE 

*/system/coefficient/type::Expression/rank::Vector*

The rank of the coefficient (vector, rank 1).

* CHOICE:
    * [element (UserDefined)](rank__Vector/element__UserDefined.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::UserDefined*

        Options describing a user defined finite element for a vector.

    * [element (P1)](rank__Vector/element__P1.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::P1*

        Options describing piecewise linear continuous Lagrange finite element for a vector.

    * [element (P2)](rank__Vector/element__P2.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::P2*

        Options describing piecewise quadratic continuous Lagrange finite element for a vector.

    * [element (P1DG)](rank__Vector/element__P1DG.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::P1DG*

        Options describing piecewise linear discontinuous Lagrange finite element for a vector.

    * [element (P2DG)](rank__Vector/element__P2DG.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::P2DG*

        Options describing piecewise quadratic discontinuous Lagrange finite element for a vector.

    * [element (P0)](rank__Vector/element__P0.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::P0*

        Options describing piecewise constant discontinuous Lagrange finite element for a vector.

    * [element (RT1)](rank__Vector/element__RT1.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::RT1*

        Options describing first degree Raviart-Thomas element for a vector.

    * [element (RT2)](rank__Vector/element__RT2.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::RT2*

        Options describing second degree Raviart-Thomas element for a vector.

    * [element (DRT1)](rank__Vector/element__DRT1.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::DRT1*

        Options describing first degree discontinuous Raviart-Thomas element for a vector.

    * [element (DRT2)](rank__Vector/element__DRT2.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::DRT2*

        Options describing second degree discontinuous Raviart-Thomas element for a vector.

    * [element (BDM1)](rank__Vector/element__BDM1.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::BDM1*

        Options describing first degree discontinuous Raviart-Thomas element for a vector.

    * [element (BDM2)](rank__Vector/element__BDM2.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::BDM2*

        Options describing second degree discontinuous Raviart-Thomas element for a vector.

    * [element (N1curl1)](rank__Vector/element__N1curl1.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::N1curl1*

        Options describing first degree Nedelec 1st kind H(curl) element for a vector.

    * [element (N1curl2)](rank__Vector/element__N1curl2.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::N1curl2*

        Options describing second degree Nedelec 1st kind H(curl) element for a vector.

    * [element (N2curl1)](rank__Vector/element__N2curl1.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::N2curl1*

        Options describing first degree Nedelec 2nd kind H(curl) element for a vector.

    * [element (N2curl2)](rank__Vector/element__N2curl2.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::N2curl2*

        Options describing second degree Nedelec 2nd kind H(curl) element for a vector.

    * [element (P0R)](rank__Vector/element__P0R.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::P0R*

        Options describing piecewise constant continuous real for a vector, e.g. for a global Lagrange multiplier.

    * [element (Quadrature)](rank__Vector/element__Quadrature.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/element::Quadrature*

        Options describing a piecewise constant quadrature element for a vector.

* CHOICE:
    * [value (WholeMesh)](rank__Vector/value__WholeMesh.md "child")

        MULTIPLE (1+) CHOICE 

        */system/coefficient/type::Expression/rank::Vector/value::WholeMesh*

        Options for the description of an expression over the domain

    * [value](rank__Vector/value.md "child")

        MULTIPLE (1+) CHOICE 

        attributes: name (string) 

        */system/coefficient/type::Expression/rank::Vector/value*

        Options for the description of an expression over regions

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)

