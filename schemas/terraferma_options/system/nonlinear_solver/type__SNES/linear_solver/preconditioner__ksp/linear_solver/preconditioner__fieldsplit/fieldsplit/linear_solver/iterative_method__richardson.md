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

/ [terraferma_options](../../../../../../../../../../terraferma_options) / [system](../../../../../../../../../system) / [nonlinear_solver](../../../../../../../../nonlinear_solver) / [type::SNES](../../../../../../../type__SNES) / [linear_solver](../../../../../../linear_solver) / [preconditioner::ksp](../../../../../preconditioner__ksp) / [linear_solver](../../../../linear_solver) / [preconditioner::fieldsplit](../../../preconditioner__fieldsplit) / [fieldsplit](../../fieldsplit) / [linear_solver](../linear_solver) /

#iterative_method (richardson)

CHOICE 

*/system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::richardson*

Richardson iteration

Only apply preconditioner each iteration, no krylov acceleration

* [relative_error](iterative_method__richardson/relative_error "child")

    type: float

    */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::richardson/relative_error*

    Relative error
    
    The solver finishes if the preconditioned error becomes smaller than the original preconditioned error times this value.
    Suggested value: 1.0e-7

* [absolute_error](iterative_method__richardson/absolute_error "child")

    OPTIONAL 

    type: float

    */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::richardson/absolute_error*

    Absolute error bound
    
    The solver finishes if the preconditioned error becomes smaller than this value.
    
    Defaults to 1.e-50.

* [divergence_error](iterative_method__richardson/divergence_error "child")

    OPTIONAL 

    type: float

    */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::richardson/divergence_error*

    Divergence error bound
    
    The solver finishes if the solutions diverge by more than this value.
    
    Defaults to 10000.

* [max_iterations](iterative_method__richardson/max_iterations "child")

    type: integer

    */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::richardson/max_iterations*

    Maximum number of iterations allowed in the linear solver
    before giving up.

* [monitors](iterative_method__richardson/monitors "child")

    */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::richardson/monitors*

    Options to give extra information for each iteration of the
    the solve. Some of those may really slow down your computation!

* CHOICE:
    * [nonzero_initial_guess](iterative_method__richardson/nonzero_initial_guess "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::richardson/nonzero_initial_guess*

        Use an initial guess from the previous solver or initial condition.
        
        NOTE: some solvers always start at zero in which case this switch will have no effect.
        Also the value of this switch on any parent solves may effect its behaviour.

    * [zero_initial_guess](iterative_method__richardson/zero_initial_guess "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::richardson/zero_initial_guess*

        Zero the initial guess.
        
        NOTE: some solvers always start at zero in which case this switch will have no effect.  
        Also the value of this switch on any parent solves may effect its behaviour.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/solvers.rng.)
