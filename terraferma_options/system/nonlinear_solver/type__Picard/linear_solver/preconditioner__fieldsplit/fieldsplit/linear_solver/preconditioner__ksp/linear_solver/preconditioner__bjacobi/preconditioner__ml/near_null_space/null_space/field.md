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

/ [terraferma_options](../../../../../../../../../../../../../../terraferma_options.md) / [system](../../../../../../../../../../../../../system.md) / [nonlinear_solver](../../../../../../../../../../../../nonlinear_solver.md) / [type::Picard](../../../../../../../../../../../type__Picard.md) / [linear_solver](../../../../../../../../../../linear_solver.md) / [preconditioner::fieldsplit](../../../../../../../../../preconditioner__fieldsplit.md) / [fieldsplit](../../../../../../../../fieldsplit.md) / [linear_solver](../../../../../../../linear_solver.md) / [preconditioner::ksp](../../../../../../preconditioner__ksp.md) / [linear_solver](../../../../../linear_solver.md) / [preconditioner::bjacobi](../../../../preconditioner__bjacobi.md) / [preconditioner::ml](../../../preconditioner__ml.md) / [near_null_space](../../near_null_space.md) / [null_space](../null_space.md) /

#field

MULTIPLE (0+) 

attributes: name (string) 

*/system/nonlinear_solver/type::Picard/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::ksp/linear_solver/preconditioner::bjacobi/preconditioner::ml/near_null_space/null_space/field*

Field to include in this index set.

* [components](field/components.md "child")

    OPTIONAL 

    type: integers

    */system/nonlinear_solver/type::Picard/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::ksp/linear_solver/preconditioner::bjacobi/preconditioner::ml/near_null_space/null_space/field/components*

    If this field is a vector or a tensor components may be listed (indexed from 0 by row first if tensorial).
    
    Defaults to all components if not selected.

* [region_ids](field/region_ids.md "child")

    OPTIONAL 

    type: integers

    */system/nonlinear_solver/type::Picard/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::ksp/linear_solver/preconditioner::bjacobi/preconditioner::ml/near_null_space/null_space/field/region_ids*

    A list of the region ids (physical ids in gmsh).
    
    Defaults to the whole mesh if left unspecified.

* [boundary_ids](field/boundary_ids.md "child")

    OPTIONAL 

    type: integers

    */system/nonlinear_solver/type::Picard/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::ksp/linear_solver/preconditioner::bjacobi/preconditioner::ml/near_null_space/null_space/field/boundary_ids*

    A list of the boundary ids (physical ids in gmsh).
    
    If left unspecified, defaults to the whole boundary of the above region(s) (if specified) or the whole mesh (if region_ids are not specified).

* CHOICE:
    * [constant](field/constant.md "child")

        CHOICE 

        values: 1.0

        */system/nonlinear_solver/type::Picard/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::ksp/linear_solver/preconditioner::bjacobi/preconditioner::ml/near_null_space/null_space/field/constant*

        This part of the null space is constant.

    * [python](field/python.md "child")

        CHOICE 

        type: string

        */system/nonlinear_solver/type::Picard/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::ksp/linear_solver/preconditioner::bjacobi/preconditioner::ml/near_null_space/null_space/field/python*

        Python function describing the null space for this field or component of this field.
        
        Functions may only depend on space and should be of the form:
        
            def val(x):
               # Function code
               return # Return value
        
        or:
        
            def val(x):
               # Function code
               return [..., ...] # Return value array
        
        The return value must have the same length as the number of components described above for this field.
        
        The resulting null space will be normalized automatically.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/solvers.rng.)

