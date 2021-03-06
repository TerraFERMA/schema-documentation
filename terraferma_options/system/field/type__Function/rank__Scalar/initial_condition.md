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

/ [terraferma_options](../../../../../terraferma_options.md) / [system](../../../../system.md) / [field](../../../field.md) / [type::Function](../../type__Function.md) / [rank::Scalar](../rank__Scalar.md) /

#initial_condition

MULTIPLE (0+) CHOICE 

attributes: name (string) 

*/system/field/type::Function/rank::Scalar/initial_condition*

Options for the description of the initial condition over a subset of the whole domain

If unspecified the initial value will be set to 0.

NOTE: this initial condition will be interpolated onto the dofs.  Some elements do not support this so you should instead
solve the system at the start of the simulation to set the initial condition.

* [region_ids](initial_condition/region_ids.md "child")

    type: integers

    */system/field/type::Function/rank::Scalar/initial_condition/region_ids*

    A list of the region ids (physical ids in gmsh) that this  condition applies to

* CHOICE:
    * [cpp](initial_condition/cpp.md "child")

        CHOICE 

        */system/field/type::Function/rank::Scalar/initial_condition/cpp*

        A scalar described by a derived dolfin expression using c++ code.

    * [python](initial_condition/python.md "child")

        CHOICE 

        type: string

        */system/field/type::Function/rank::Scalar/initial_condition/python*

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

    * [constant](initial_condition/constant.md "child")

        CHOICE 

        type: float

        */system/field/type::Function/rank::Scalar/initial_condition/constant*

        A constant scalar

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)

