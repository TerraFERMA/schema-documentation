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

/ [terraferma_options](../../../terraferma_options.md) / [system](../../system.md) / [nonlinear_solver](../nonlinear_solver.md) /

#type (SNES)

CHOICE 

*/system/nonlinear_solver/type::SNES*

The type of nonlinear solver. 
PETSc SNES - a Newton iteration with line search.

* [preamble](type__SNES/preamble.md "child")

    OPTIONAL 

    type: string

    */system/nonlinear_solver/type::SNES/preamble*

    ufl code preamble to the forms defined below.  
    Any system, field or coefficient ufl symbols defined in this options file may be used in this preamble.

* [form (Residual)](type__SNES/form__Residual.md "child")

    type: string

    */system/nonlinear_solver/type::SNES/form::Residual*

    ufl code form describing a linear residual form (must return a linear form).  
    Any system, field or coefficient ufl symbols defined in this options file may be used in this form as well as any symbols 
    defined in the preamble above.

* [form (Jacobian)](type__SNES/form__Jacobian.md "child")

    type: string

    */system/nonlinear_solver/type::SNES/form::Jacobian*

    ufl code form describing a jacobian bilinear form (must return a bilinear form).  
    Any system, field or coefficient ufl symbols defined in this options file may be used in this form as well as any symbols 
    defined in the preamble and residual linear form above.

* [form (JacobianPC)](type__SNES/form__JacobianPC.md "child")

    OPTIONAL 

    type: string

    */system/nonlinear_solver/type::SNES/form::JacobianPC*

    ufl code form describing a preconditioner jacobian bilinear form (must return a bilinear form).  
    Any system, field or coefficient ufl symbols defined in this options file may be used in this form as well as any symbols 
    defined in the preamble and bilinear form above.
    
    If undefined the jacobian bilinear form above will be used to precondition itself.

* [quadrature_degree](type__SNES/quadrature_degree.md "child")

    OPTIONAL 

    type: integer

    */system/nonlinear_solver/type::SNES/quadrature_degree*

    The quadrature degree that will be used to compute the form.
    
    If unselected ffc will automatically determine the degree for the form.

* CHOICE:
    * [quadrature_rule (default)](type__SNES/quadrature_rule__default.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/quadrature_rule::default*

        The quadrature rule that will be used when integrating the forms.
        
        The 'default' option covers hand implemented quadrature rules (in ffc) for triangles and tetrahedra with a degree of
        precision less than or equal to six.  Above this 'canonical' will automatically be used.
        
        The 'canonical' option relies on FIAT to compute the quadrature rule which is based on Gauss--Legendre--Jacobi rule mapped
        onto simplices.

    * [quadrature_rule (canonical)](type__SNES/quadrature_rule__canonical.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/quadrature_rule::canonical*

        The quadrature rule that will be used when integrating the forms.
        
        The 'canonical' option relies on FIAT to compute the quadrature rule which is based on Gauss--Legendre--Jacobi rule mapped
        onto simplices.
        
        The 'default' option covers hand implemented quadrature rules (in ffc) for triangles and tetrahedra with a degree of
        precision less than or equal to six.  Above this 'canonical' will automatically be used.

* CHOICE:
    * [snes_type (ls)](type__SNES/snes_type__ls.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/snes_type::ls*

        The SNES type.  Line search.

    * [snes_type (vi)](type__SNES/snes_type__vi.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/snes_type::vi*

        The SNES type. Variational Inequality.
        
        NOTE: only available with Petsc >= 3.2 and with petsc > 3.2 this maps to virs.

    * [snes_type (ksponly)](type__SNES/snes_type__ksponly.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/snes_type::ksponly*

        The SNES type.  KSP only - treat as a linear problem.

    * [snes_type](type__SNES/snes_type.md "child")

        CHOICE 

        attributes: name (string) 

        */system/nonlinear_solver/type::SNES/snes_type*

        The SNES type.  Any valid PETSc SNES type may be entered.

* [relative_error](type__SNES/relative_error.md "child")

    type: float

    */system/nonlinear_solver/type::SNES/relative_error*

    The relative error allowed to remain in the l2 norm of the nonlinear solver residual upon termination
    of the iteration loop.

* [absolute_error](type__SNES/absolute_error.md "child")

    OPTIONAL 

    type: float

    */system/nonlinear_solver/type::SNES/absolute_error*

    The absolute error allowed to remain in the vector l2 norm of the nonlinear solver residual upon termination
    of the iteration loop.
    
    Defaults to 1.e-50.

* [solution_error](type__SNES/solution_error.md "child")

    OPTIONAL 

    type: float

    */system/nonlinear_solver/type::SNES/solution_error*

    Defaults to 1.e-8.

* [max_iterations](type__SNES/max_iterations.md "child")

    type: integer

    */system/nonlinear_solver/type::SNES/max_iterations*

    The maximum number of iterations to take in this nonlinear solver loop.

* [max_function_evaluations](type__SNES/max_function_evaluations.md "child")

    OPTIONAL 

    type: integer

    */system/nonlinear_solver/type::SNES/max_function_evaluations*

    The maximum number of solver evaluations allowed in this nonlinear solver loop.
    
    Defaults to 10000.

* [monitors](type__SNES/monitors.md "child")

    */system/nonlinear_solver/type::SNES/monitors*

    Options to give extra information for each iteration of the
    the SNES solve. Some of those may really slow down your computation!

* [linear_solver](type__SNES/linear_solver.md "child")

    */system/nonlinear_solver/type::SNES/linear_solver*

    Options describing a linear solver.

* CHOICE:
    * [never_ignore_solver_failures](type__SNES/never_ignore_solver_failures.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/never_ignore_solver_failures*

        Never ignore solver failures (the highly recommended default).
        
        This option tests the convergence of the nonlinear solver and terminates the simulations at the end of the next timestep 
        if it has failed to converge.  Note that linear solves within the nonlinear solver may still allowed to fail.

    * [ignore_all_solver_failures](type__SNES/ignore_all_solver_failures.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/ignore_all_solver_failures*

        Ignore solver failures.  Intended for debugging purposes only!
        
        **Do not use this option in any scientific simulation.**
        
        This option allows the simulation to continue even if this nonlinear solver fails to meet the convergence criteria.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/solvers.rng.)

