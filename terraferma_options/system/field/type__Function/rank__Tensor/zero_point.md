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

/ [terraferma_options](../../../../../terraferma_options.md) / [system](../../../../system.md) / [field](../../../field.md) / [type::Function](../../type__Function.md) / [rank::Tensor](../rank__Tensor.md) /

#zero_point

MULTIPLE (0+) CHOICE 

attributes: name (string) 

*/system/field/type::Function/rank::Tensor/zero_point*

Options for the description of a zero point at which field values are zeroed after each nonlinear solve.

Unlike reference points, a zero point is a post-processing calculation and so should be used in conjunction 
with a Lagrange multiplier or the removal of the null space if the solution would be ill conditioned otherwise.

If specifying multiple zero points (perhaps on different components) their names must be unique within this field specification.

* [coordinates](zero_point/coordinates.md "child")

    type: floats

    */system/field/type::Function/rank::Tensor/zero_point/coordinates*

    The coordinates of the zero point.

* CHOICE:
    * [sub_components (Subset)](zero_point/sub_components__Subset.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/zero_point/sub_components::Subset*

        Zero a subset of the vector/tensor components at this reference point.

    * [sub_components (All)](zero_point/sub_components__All.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/zero_point/sub_components::All*

        Zero all the vector/tensor components at this reference point.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)

