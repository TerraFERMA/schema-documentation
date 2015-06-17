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

/ [terraferma_options](../../../../../terraferma_options.md) / [system](../../../../system.md) / [coefficient](../../../coefficient.md) / [type::Expression](../../type__Expression.md) / [rank::Vector](../rank__Vector.md) /

#value

MULTIPLE (1+) CHOICE 

attributes: name (string) 

*/system/coefficient/type::Expression/rank::Vector/value*

Options for the description of an expression over regions

* [region_ids](value/region_ids.md "child")

    type: integers

    */system/coefficient/type::Expression/rank::Vector/value/region_ids*

    A list of the region ids (physical ids in gmsh) that this expression applies to

* CHOICE:
    * [internal](value/internal.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/value/internal*

        A vector described by an internal derived dolfin expression.

    * [cpp](value/cpp.md "child")

        CHOICE 

        */system/coefficient/type::Expression/rank::Vector/value/cpp*

        A vector described by a derived dolfin expression using c++ code.

    * [python](value/python.md "child")

        CHOICE 

        type: string

        */system/coefficient/type::Expression/rank::Vector/value/python*

        A vector described by a python function.
        
        Functions should be of the form:
        
            def val(x):
              # Function code
              return [..., ...] # Return value
        
         for steady (time independent) expressions or:
        
            def val(x,t):
              # Function code
              return [..., ...] # Return value
        
         for time dependent expressions.
        
        The return value must have the same size as the vector element.

    * [constant (dim)](value/constant__dim.md "child")

        CHOICE 

        type: floats

        */system/coefficient/type::Expression/rank::Vector/value/constant::dim*

        A constant vector of length /geometry/dimension

    * [constant (arbitrary)](value/constant__arbitrary.md "child")

        CHOICE 

        type: floats

        */system/coefficient/type::Expression/rank::Vector/value/constant::arbitrary*

        A constant vector of arbitrary length (must be the same as the size of the vector element).

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)
