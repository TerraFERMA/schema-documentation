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

/ [terraferma_options](../../../../../../terraferma_options.md) / [system](../../../../../system.md) / [coefficient](../../../../coefficient.md) / [type::Constant](../../../type__Constant.md) / [rank::Scalar](../../rank__Scalar.md) / [value::WholeMesh](../value__WholeMesh.md) /

#functional

CHOICE 

type: string

*/system/coefficient/type::Constant/rank::Scalar/value::WholeMesh/functional*

ufl code and symbol describing a functional.  This must return a single number, which is used to set a spatially constant coefficient value.

* [ufl_symbol (functional)](functional/ufl_symbol__functional.md "child")

    type: string

    */system/coefficient/type::Constant/rank::Scalar/value::WholeMesh/functional/ufl_symbol::functional*

    The ufl symbol used above to describe a functional.  This need not be unique as it is only accessible
    from this description.  No additional symbols will be automatically generated based on this symbol.

* [quadrature_degree](functional/quadrature_degree.md "child")

    OPTIONAL 

    type: integer

    */system/coefficient/type::Constant/rank::Scalar/value::WholeMesh/functional/quadrature_degree*

    The quadrature degree that will be used to compute the form.
    
    If unselected ffc will automatically determine the degree for the form.

* CHOICE:
    * [quadrature_rule (default)](functional/quadrature_rule__default.md "child")

        CHOICE 

        */system/coefficient/type::Constant/rank::Scalar/value::WholeMesh/functional/quadrature_rule::default*

        The quadrature rule that will be used when integrating the forms.
        
        The 'default' option covers hand implemented quadrature rules (in ffc) for triangles and tetrahedra with a degree of
        precision less than or equal to six.  Above this 'canonical' will automatically be used.
        
        The 'canonical' option relies on FIAT to compute the quadrature rule which is based on Gauss--Legendre--Jacobi rule mapped
        onto simplices.

    * [quadrature_rule (canonical)](functional/quadrature_rule__canonical.md "child")

        CHOICE 

        */system/coefficient/type::Constant/rank::Scalar/value::WholeMesh/functional/quadrature_rule::canonical*

        The quadrature rule that will be used when integrating the forms.
        
        The 'canonical' option relies on FIAT to compute the quadrature rule which is based on Gauss--Legendre--Jacobi rule mapped
        onto simplices.
        
        The 'default' option covers hand implemented quadrature rules (in ffc) for triangles and tetrahedra with a degree of
        precision less than or equal to six.  Above this 'canonical' will automatically be used.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)

