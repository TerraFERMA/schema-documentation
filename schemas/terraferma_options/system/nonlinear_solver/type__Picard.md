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

/ [terraferma_options](../../../terraferma_options) / [system](../../system) / [nonlinear_solver](../nonlinear_solver) /

#type (Picard)

CHOICE 

*/system/nonlinear_solver/type::Picard*

The type of nonlinear solver. 
A Picard iteration.

* [preamble](type__Picard/preamble "child")

    OPTIONAL 

    type: string

    */system/nonlinear_solver/type::Picard/preamble*

    ufl code preamble to the forms defined below.  
    Any system, field or coefficient ufl symbols defined in this options file may be used in this preamble.

* [form (Bilinear)](type__Picard/form__Bilinear "child")

    type: string

    */system/nonlinear_solver/type::Picard/form::Bilinear*

    ufl code form describing a bilinear form (must return a bilinear form).  
    Any system, field or coefficient ufl symbols defined in this options file may be used in this form as well as any symbols 
    defined in the preamble above.

* [form (BilinearPC)](type__Picard/form__BilinearPC "child")

    OPTIONAL 

    type: string

    */system/nonlinear_solver/type::Picard/form::BilinearPC*

    ufl code form describing a preconditioner bilinear form (must return a bilinear form).  
    Any system, field or coefficient ufl symbols defined in this options file may be used in this form as well as any symbols 
    defined in the preamble and bilinear form above.
    
    If undefined the bilinear form above will be used to precondition itself.

* [form (Linear)](type__Picard/form__Linear "child")

    type: string

    */system/nonlinear_solver/type::Picard/form::Linear*

    ufl code form describing a linear form (must return a linear form).  
    Any system, field or coefficient ufl symbols defined in this options file may be used in this form as well as any symbols 
    defined in the preamble and bilinear forms above.

* [form (Residual)](type__Picard/form__Residual "child")

    type: string

    */system/nonlinear_solver/type::Picard/form::Residual*

    ufl code form describing a linear residual form (must return a linear form).  
    Any system, field or coefficient ufl symbols defined in this options file may be used in this form as well as any symbols 
    defined in the preamble, bilinear and linear forms above.

* [quadrature_degree](type__Picard/quadrature_degree "child")

    OPTIONAL 

    type: integer

    */system/nonlinear_solver/type::Picard/quadrature_degree*

    The quadrature degree that will be used to compute the form.
    
    If unselected ffc will automatically determine the degree for the form.

* CHOICE:
    * [quadrature_rule (default)](type__Picard/quadrature_rule__default "child")

        CHOICE 

        */system/nonlinear_solver/type::Picard/quadrature_rule::default*

        The quadrature rule that will be used when integrating the forms.
        
        The 'default' option covers hand implemented quadrature rules (in ffc) for triangles and tetrahedra with a degree of
        precision less than or equal to six.  Above this 'canonical' will automatically be used.
        
        The 'canonical' option relies on FIAT to compute the quadrature rule which is based on Gauss--Legendre--Jacobi rule mapped
        onto simplices.

    * [quadrature_rule (canonical)](type__Picard/quadrature_rule__canonical "child")

        CHOICE 

        */system/nonlinear_solver/type::Picard/quadrature_rule::canonical*

        The quadrature rule that will be used when integrating the forms.
        
        The 'canonical' option relies on FIAT to compute the quadrature rule which is based on Gauss--Legendre--Jacobi rule mapped
        onto simplices.
        
        The 'default' option covers hand implemented quadrature rules (in ffc) for triangles and tetrahedra with a degree of
        precision less than or equal to six.  Above this 'canonical' will automatically be used.

* [relative_error](type__Picard/relative_error "child")

    type: float

    */system/nonlinear_solver/type::Picard/relative_error*

    The relative error allowed to remain in the vector l2 norm of the nonlinear solver residual (defined above) upon termination
    of the iteration loop.

* [absolute_error](type__Picard/absolute_error "child")

    OPTIONAL 

    type: float

    */system/nonlinear_solver/type::Picard/absolute_error*

    The absolute error allowed to remain in the vector l2 norm of the nonlinear solver residual (defined above) upon termination
    of the iteration loop.
    
    Defaults to 1.e-50.

* [max_iterations](type__Picard/max_iterations "child")

    type: integer

    */system/nonlinear_solver/type::Picard/max_iterations*

    The maximum number of iterations to take in this nonlinear solver loop.

* [min_iterations](type__Picard/min_iterations "child")

    OPTIONAL 

    type: integer

    */system/nonlinear_solver/type::Picard/min_iterations*

    The minimum number of iterations to take in this nonlinear solver loop.

* [monitors](type__Picard/monitors "child")

    */system/nonlinear_solver/type::Picard/monitors*

    Options to give extra information for each iteration of the
    Picard solve. Some of those may really slow down your computation!

* [linear_solver](type__Picard/linear_solver "child")

    */system/nonlinear_solver/type::Picard/linear_solver*

    Options describing a linear solver.

* CHOICE:
    * [never_ignore_solver_failures](type__Picard/never_ignore_solver_failures "child")

        CHOICE 

        */system/nonlinear_solver/type::Picard/never_ignore_solver_failures*

        Never ignore solver failures (the highly recommended default).
        
        This option tests the convergence of the nonlinear solver and terminates the simulations at the end of the next timestep 
        if it has failed to converge.  Note that linear solves within the nonlinear solver may still allowed to fail.

    * [ignore_all_solver_failures](type__Picard/ignore_all_solver_failures "child")

        CHOICE 

        */system/nonlinear_solver/type::Picard/ignore_all_solver_failures*

        Ignore solver failures.  Intended for debugging purposes only!
        
        **Do not use this option in any scientific simulation.**
        
        This option allows the simulation to continue even if this nonlinear solver fails to meet the convergence criteria.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/solvers.rng.)

