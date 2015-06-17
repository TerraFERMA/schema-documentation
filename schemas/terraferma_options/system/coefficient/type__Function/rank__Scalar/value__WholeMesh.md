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

/ [terraferma_options](../../../../../terraferma_options) / [system](../../../../system) / [coefficient](../../../coefficient) / [type::Function](../../type__Function) / [rank::Scalar](../rank__Scalar) /

#value (WholeMesh)

MULTIPLE (1+) CHOICE 

*/system/coefficient/type::Function/rank::Scalar/value::WholeMesh*

Options for the description of an expression over the domain

* CHOICE:
    * [internal](value__WholeMesh/internal "child")

        CHOICE 

        */system/coefficient/type::Function/rank::Scalar/value::WholeMesh/internal*

        A scalar described by an internal derived dolfin expression.

    * [cpp](value__WholeMesh/cpp "child")

        CHOICE 

        */system/coefficient/type::Function/rank::Scalar/value::WholeMesh/cpp*

        A scalar described by a derived dolfin expression using c++ code.

    * [python](value__WholeMesh/python "child")

        CHOICE 

        type: string

        */system/coefficient/type::Function/rank::Scalar/value::WholeMesh/python*

        A scalar described by a python function.
        
        Functions should be of the form:
        
            def val(x):
              # Function code
              return ... # Return value
        
         for steady (time independent) expressions or:
        
            def val(x,t):
              # Function code
              return ... # Return value
        
         for time dependent expressions.
        
        The return value should be scalar.

    * [constant](value__WholeMesh/constant "child")

        CHOICE 

        type: float

        */system/coefficient/type::Function/rank::Scalar/value::WholeMesh/constant*

        A constant scalar

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)
