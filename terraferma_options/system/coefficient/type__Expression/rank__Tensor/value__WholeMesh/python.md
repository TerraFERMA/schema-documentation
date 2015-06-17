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

/ [terraferma_options](../../../../../../terraferma_options.md) / [system](../../../../../system.md) / [coefficient](../../../../coefficient.md) / [type::Expression](../../../type__Expression.md) / [rank::Tensor](../../rank__Tensor.md) / [value::WholeMesh](../value__WholeMesh.md) /

#python

CHOICE 

type: string

*/system/coefficient/type::Expression/rank::Tensor/value::WholeMesh/python*

A tensor described by a python function.

Functions should be of the form:

    def val(x):
      # Function code
      return [[..., ...],[..., ...],...] # Return value

 for steady (time independent) expressions or:

    def val(x,t):
      # Function code
      return [[..., ...],[..., ...],...] # Return value

 for time dependent expressions.

The return value must have the same shape as the tensor element.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)
