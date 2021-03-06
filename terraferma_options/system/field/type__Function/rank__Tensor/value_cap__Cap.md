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

#value_cap (Cap)

MULTIPLE (0+) CHOICE 

*/system/field/type::Function/rank::Tensor/value_cap::Cap*

Cap the values of the field after every nonlinear solve.

This is a postprocessing modification of the vector values and so will affect the value of the non-linear residual.  
In a coupled problem this will likely have implications on the other fields that this simple hack will not consider.  
Perhaps consider using SNES VI instead.

This version defaults to the name Cap.  If specifying more than one value cap (perhaps on different components) the name of each 
one must be unique so multiple instances of this default name are not allowed.

* [upper_cap](value_cap__Cap/upper_cap.md "child")

    OPTIONAL 

    type: float

    */system/field/type::Function/rank::Tensor/value_cap::Cap/upper_cap*

    Do not let the maximum value exceed this cap

* [lower_cap](value_cap__Cap/lower_cap.md "child")

    OPTIONAL 

    type: float

    */system/field/type::Function/rank::Tensor/value_cap::Cap/lower_cap*

    Do not let the minimum value fall below this cap

* CHOICE:
    * [sub_components (All)](value_cap__Cap/sub_components__All.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/value_cap::Cap/sub_components::All*

        Cap all the vector/tensor components.

    * [sub_components (Subset)](value_cap__Cap/sub_components__Subset.md "child")

        CHOICE 

        */system/field/type::Function/rank::Tensor/value_cap::Cap/sub_components::Subset*

        Cap a subset of the vector/tensor components.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)

