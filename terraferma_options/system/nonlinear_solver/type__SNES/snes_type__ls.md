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

/ [terraferma_options](../../../../terraferma_options.md) / [system](../../../system.md) / [nonlinear_solver](../../nonlinear_solver.md) / [type::SNES](../type__SNES.md) /

#snes_type (ls)

CHOICE 

*/system/nonlinear_solver/type::SNES/snes_type::ls*

The SNES type.  Line search.

* CHOICE:
    * [ls_type (cubic)](snes_type__ls/ls_type__cubic.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/snes_type::ls/ls_type::cubic*

        Performs a cubic line search (default line search method).

    * [ls_type (quadratic)](snes_type__ls/ls_type__quadratic.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/snes_type::ls/ls_type::quadratic*

        Performs a quadratic line search.

    * [ls_type (basic)](snes_type__ls/ls_type__basic.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/snes_type::ls/ls_type::basic*

        This routine is not a line search at all; it simply uses the full Newton step.  
        Thus, this routine is intended to serve as a template and is not recommended for general use.

    * [ls_type (basicnonorms)](snes_type__ls/ls_type__basicnonorms.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/snes_type::ls/ls_type::basicnonorms*

        This routine is not a line search at all; it simply uses the full Newton step.  
        This version does not even compute the norm of the function or search direction; 
        this is intended only when you know the full step is fine and are not checking for 
        convergence of the nonlinear iteration (for example, you are running always for a 
        fixed number of Newton steps).

* CHOICE:
    * [convergence_test (default)](snes_type__ls/convergence_test__default.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/snes_type::ls/convergence_test::default*

        Default convergence test. See SNESConvergedReason.

    * [convergence_test (skip)](snes_type__ls/convergence_test__skip.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/snes_type::ls/convergence_test::skip*

        Skip standard convergence tests, allowing maximum iterations to be reached.

* [alpha](snes_type__ls/alpha.md "child")

    OPTIONAL 

    type: float

    */system/nonlinear_solver/type::SNES/snes_type::ls/alpha*

    The scalar such that .5*f_{n+1} . f_{n+1} <= .5*f_n . f_n - alpha |p_n . J . f_n|.
    
    We are finding the zero of f() so the one dimensional minimization problem we are 
    solving in the line search is minimize .5*f(x_n + lambda*step_direction) . f(x_n + lambda*step_direction)
    
    Defaults to 1.e-4 if unset.

* [max_step](snes_type__ls/max_step.md "child")

    OPTIONAL 

    type: float

    */system/nonlinear_solver/type::SNES/snes_type::ls/max_step*

    The maximum norm of the update vector.
    
    We are finding the zero of f() so the one dimensional minimization problem we are 
    solving in the line search is minimize .5*f(x_n + lambda*step_direction) . f(x_n + lambda*step_direction)
    
    Defaults to 1.e8 if unset.

* [min_lambda](snes_type__ls/min_lambda.md "child")

    OPTIONAL 

    type: float

    */system/nonlinear_solver/type::SNES/snes_type::ls/min_lambda*

    lambda is not allowed to be smaller than minlambda/( max_i y[i]/x[i]).
    
    We are finding the zero of f() so the one dimensional minimization problem we are 
    solving in the line search is minimize .5*f(x_n + lambda*step_direction) . f(x_n + lambda*step_direction)
    
    NOTE: setting this parameter is only available when using PETSc >= 3.2, it will error with older versions.
    
    Defaults to 1.e-12 if unset.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/solvers.rng.)

