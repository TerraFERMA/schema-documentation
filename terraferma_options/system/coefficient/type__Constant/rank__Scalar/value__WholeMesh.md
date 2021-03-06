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

/ [terraferma_options](../../../../../terraferma_options.md) / [system](../../../../system.md) / [coefficient](../../../coefficient.md) / [type::Constant](../../type__Constant.md) / [rank::Scalar](../rank__Scalar.md) /

#value (WholeMesh)

*/system/coefficient/type::Constant/rank::Scalar/value::WholeMesh*

Options for the description of an expression over the domain

* CHOICE:
    * [functional](value__WholeMesh/functional.md "child")

        CHOICE 

        type: string

        */system/coefficient/type::Constant/rank::Scalar/value::WholeMesh/functional*

        ufl code and symbol describing a functional.  This must return a single number, which is used to set a spatially constant coefficient value.

    * [constant](value__WholeMesh/constant.md "child")

        CHOICE 

        type: float

        */system/coefficient/type::Constant/rank::Scalar/value::WholeMesh/constant*

        A constant scalar

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)

