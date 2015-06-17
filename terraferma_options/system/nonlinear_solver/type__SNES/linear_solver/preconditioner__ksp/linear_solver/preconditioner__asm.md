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

/ [terraferma_options](../../../../../../../terraferma_options.md) / [system](../../../../../../system.md) / [nonlinear_solver](../../../../../nonlinear_solver.md) / [type::SNES](../../../../type__SNES.md) / [linear_solver](../../../linear_solver.md) / [preconditioner::ksp](../../preconditioner__ksp.md) / [linear_solver](../linear_solver.md) /

#preconditioner (asm)

CHOICE 

*/system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::asm*

Additive Schwartz Method

This option is for parallel runs. A preconditioner is applied
locally within each domain (like bjacobi) only the local domains
are extended a bit to overlap. This increases the coupling between
the domain and thus improves the convergence. This does of course
increase the communication cost, so iterations may be more expensive
than with bjacobi.

* CHOICE:
    * [preconditioner (sor)](preconditioner__asm/preconditioner__sor.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::asm/preconditioner::sor*

        Succesive Over-Relaxation
        
        This includes SSOR (symmetric sor)

    * [preconditioner (eisenstat)](preconditioner__asm/preconditioner__eisenstat.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::asm/preconditioner::eisenstat*

        The Eisenstat method
        
        This preconditioner is equivalent to SOR but only uses
        half the number of flops,
        i.e. same convergence rate but twice as fast per
        iteration. Because it computes
        a different preconditioned residual the convergence in
        practice may be quite different though.

    * [preconditioner (ilu)](preconditioner__asm/preconditioner__ilu.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::asm/preconditioner::ilu*

        Incomplete LU decomposition

    * [preconditioner (icc)](preconditioner__asm/preconditioner__icc.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::asm/preconditioner::icc*

        Incomplete Cholesky decomposition (only works for symmetric matrices)

    * [preconditioner (lu)](preconditioner__asm/preconditioner__lu.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::asm/preconditioner::lu*

        LU direct solver
        
        This performs a complete, direct solve of the equation and should only be used in combination with preonly as iterative method.

    * [preconditioner (prometheus)](preconditioner__asm/preconditioner__prometheus.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::asm/preconditioner::prometheus*

        Prometheus multigrid method

    * [preconditioner (hypre)](preconditioner__asm/preconditioner__hypre.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::asm/preconditioner::hypre*

        Hypre preconditioners (includes boomeramg)

    * [preconditioner (gamg)](preconditioner__asm/preconditioner__gamg.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::asm/preconditioner::gamg*

        The Geometric-Algrbraic MultiGrid Method
        
        NOTE: Only available with petsc > 3.2.

    * [preconditioner (ml)](preconditioner__asm/preconditioner__ml.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::asm/preconditioner::ml*

        The ML MultiGrid Method
        
        NOTE: Only available if petsc is configured with ml!

    * [preconditioner](preconditioner__asm/preconditioner.md "child")

        CHOICE 

        attributes: name (string) 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::ksp/linear_solver/preconditioner::asm/preconditioner*

        Other preconditioners
        
        Any preconditioner provided by the PETSc library
        http://www.mcs.anl.gov/petsc/petsc-current/docs/manualpages/PC/PCType.html
        (available preconditioners may depend on the PETSc library installed on your system)

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/solvers.rng.)

