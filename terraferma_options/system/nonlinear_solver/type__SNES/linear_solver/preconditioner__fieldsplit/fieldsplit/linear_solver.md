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

/ [terraferma_options](../../../../../../../terraferma_options.md) / [system](../../../../../../system.md) / [nonlinear_solver](../../../../../nonlinear_solver.md) / [type::SNES](../../../../type__SNES.md) / [linear_solver](../../../linear_solver.md) / [preconditioner::fieldsplit](../../preconditioner__fieldsplit.md) / [fieldsplit](../fieldsplit.md) /

#linear_solver

*/system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver*

Solver options for the full solve done by this preconditioner

* CHOICE:
    * [iterative_method (gmres)](linear_solver/iterative_method__gmres.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::gmres*

        GMRES
        
        Your safest bet for non-symmetric systems.

    * [iterative_method (fgmres)](linear_solver/iterative_method__fgmres.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::fgmres*

        FGMRES

    * [iterative_method (cg)](linear_solver/iterative_method__cg.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::cg*

        Conjugate gradient method
        
        Only works for symmetric systems.

    * [iterative_method (preonly)](linear_solver/iterative_method__preonly.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::preonly*

        Direct method
        
        This is for non-iterative methods
        Only makes sense in combination with preconditioners that do a complete solve, e.g. lu.

    * [iterative_method (richardson)](linear_solver/iterative_method__richardson.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method::richardson*

        Richardson iteration
        
        Only apply preconditioner each iteration, no krylov acceleration

    * [iterative_method](linear_solver/iterative_method.md "child")

        CHOICE 

        attributes: name (string) 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/iterative_method*

        Other methods
        
        Any method provided by the PETSc library
        http://www.mcs.anl.gov/petsc/petsc-current/docs/manualpages/KSP/KSPType.html
        (available methods may depend on the PETSc library installed on your system)

* CHOICE:
    * [preconditioner (sor)](linear_solver/preconditioner__sor.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::sor*

        Succesive Over-Relaxation
        
        This includes SSOR (symmetric sor)

    * [preconditioner (eisenstat)](linear_solver/preconditioner__eisenstat.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::eisenstat*

        The Eisenstat method
        
        This preconditioner is equivalent to SOR but only uses
        half the number of flops,
        i.e. same convergence rate but twice as fast per
        iteration. Because it computes
        a different preconditioned residual the convergence in
        practice may be quite different though.

    * preconditioner (fieldsplit)

        RECURSIVE CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::fieldsplit*

        A fieldsplit preconditioner.

    * [preconditioner (ilu)](linear_solver/preconditioner__ilu.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::ilu*

        Incomplete LU decomposition

    * [preconditioner (lu)](linear_solver/preconditioner__lu.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::lu*

        LU direct solver
        
        This performs a complete, direct solve of the equation and should only be used in combination with preonly as iterative method.

    * [preconditioner (prometheus)](linear_solver/preconditioner__prometheus.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::prometheus*

        Prometheus multigrid method

    * [preconditioner (hypre)](linear_solver/preconditioner__hypre.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::hypre*

        Hypre preconditioners (includes boomeramg)

    * [preconditioner (gamg)](linear_solver/preconditioner__gamg.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::gamg*

        The Geometric-Algrbraic MultiGrid Method
        
        NOTE: Only available with petsc > 3.2.

    * [preconditioner (ml)](linear_solver/preconditioner__ml.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::ml*

        The ML MultiGrid Method
        
        NOTE: Only available if petsc is configured with ml!

    * [preconditioner (jacobi)](linear_solver/preconditioner__jacobi.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::jacobi*

        Jacobi

    * [preconditioner (bjacobi)](linear_solver/preconditioner__bjacobi.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::bjacobi*

        Block Jacobi
        
        This option is for parallel runs. A preconditioner is applied
        locally within each domain. This means within the domain you can
        choose whatever preconditioner you would choose in serial. Because
        there is no coupling between the domains in the preconditioning
        the performance may be less than in serial and degrade with 
        increasing number of processors/decreasing local domain size.

    * [preconditioner (asm)](linear_solver/preconditioner__asm.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::asm*

        Additive Schwartz Method
        
        This option is for parallel runs. A preconditioner is applied
        locally within each domain (like bjacobi) only the local domains
        are extended a bit to overlap. This increases the coupling between
        the domain and thus improves the convergence. This does of course
        increase the communication cost, so iterations may be more expensive
        than with bjacobi.

    * [preconditioner (ksp)](linear_solver/preconditioner__ksp.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::ksp*

        A ksp preconditioner.
        
        This only makes sense for solves where a different approximated preconditioner
        matrix is provided.
        
        NOTE: If you are using a krylov method (cg/gmres) for this preconditioner 
        solve you either need to set your tolerances much stricter for it
        than in the outer solve (so that the preconditioner is close to an
        exact matrix inversion), or use fgmres in the outer solve.

    * [preconditioner (lsc)](linear_solver/preconditioner__lsc.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::lsc*

        An lsc preconditioner.
        
        This only makes sense as a preconditioner for schur fieldsplit blocks.
        
        No options for the subksp are currently exposed so defaults are assumed.

    * [preconditioner (none)](linear_solver/preconditioner__none.md "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner::none*

        No preconditioner

    * [preconditioner](linear_solver/preconditioner.md "child")

        CHOICE 

        attributes: name (string) 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/preconditioner*

        Other preconditioners
        
        Any preconditioner provided by the PETSc library
        http://www.mcs.anl.gov/petsc/petsc-current/docs/manualpages/PC/PCType.html
        (available preconditioners may depend on the PETSc library installed on your system)

* [remove_null_space](linear_solver/remove_null_space.md "child")

    OPTIONAL 

    */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/fieldsplit/linear_solver/remove_null_space*

    Remove Null-space from residual after applying preconditioner.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/solvers.rng.)

