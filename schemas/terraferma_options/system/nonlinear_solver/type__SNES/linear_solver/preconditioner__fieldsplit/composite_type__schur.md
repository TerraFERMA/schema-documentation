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

/ [terraferma_options](../../../../../../terraferma_options) / [system](../../../../../system) / [nonlinear_solver](../../../../nonlinear_solver) / [type::SNES](../../../type__SNES) / [linear_solver](../../linear_solver) / [preconditioner::fieldsplit](../preconditioner__fieldsplit) /

#composite_type (schur)

CHOICE 

*/system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/composite_type::schur*

Composite type of the fieldsplit preconditioner - schur.

NOTE: Only two fieldsplits may be specified.  The first is for the upper left diagonal block (A00),
while the second must describe the lower right diagonal block (A11).

* CHOICE:
    * [factorization_type (full)](composite_type__schur/factorization_type__full "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/composite_type::schur/factorization_type::full*

        The full factorization is:
        
        (A00   A01)  = (1           0) (A00   0) (1  A00inv*A01)
        
        (A10   A11)    (A10*A00inv  1) (0     S) (0         1  )
        
        where S = A11 - A10*A00inv*A01. In practice, the full factorization is applied via block triangular solves 
        with the grouping L*(D*U).
        
        Upper uses D*U, lower uses L*D, and diag is the diagonal part with the sign of S flipped (because 
        this makes the preconditioner positive definite for many formulations, thus allowing the use of KSPMINRES).

    * [factorization_type (upper)](composite_type__schur/factorization_type__upper "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/composite_type::schur/factorization_type::upper*

        The full factorization is:
        
        (A00   A01)  = (1           0) (A00   0) (1  A00inv*A01)
        
        (A10   A11)    (A10*A00inv  1) (0     S) (0         1  )
        
        where S = A11 - A10*A00inv*A01. In practice, the full factorization is applied via block triangular solves 
        with the grouping L*(D*U).
        
        Upper uses D*U, lower uses L*D, and diag is the diagonal part with the sign of S flipped (because 
        this makes the preconditioner positive definite for many formulations, thus allowing the use of KSPMINRES).

    * [factorization_type (lower)](composite_type__schur/factorization_type__lower "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/composite_type::schur/factorization_type::lower*

        The full factorization is:
        
        (A00   A01)  = (1           0) (A00   0) (1  A00inv*A01)
        
        (A10   A11)    (A10*A00inv  1) (0     S) (0         1  )
        
        where S = A11 - A10*A00inv*A01. In practice, the full factorization is applied via block triangular solves 
        with the grouping L*(D*U).
        
        Upper uses D*U, lower uses L*D, and diag is the diagonal part with the sign of S flipped (because 
        this makes the preconditioner positive definite for many formulations, thus allowing the use of KSPMINRES).

    * [factorization_type (diag)](composite_type__schur/factorization_type__diag "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/composite_type::schur/factorization_type::diag*

        The full factorization is:
        
        (A00   A01)  = (1           0) (A00   0) (1  A00inv*A01)
        
        (A10   A11)    (A10*A00inv  1) (0     S) (0         1  )
        
        where S = A11 - A10*A00inv*A01. In practice, the full factorization is applied via block triangular solves 
        with the grouping L*(D*U).
        
        Upper uses D*U, lower uses L*D, and diag is the diagonal part with the sign of S flipped (because 
        this makes the preconditioner positive definite for many formulations, thus allowing the use of KSPMINRES).

* CHOICE:
    * [schur_preconditioner (diag)](composite_type__schur/schur_preconditioner__diag "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/composite_type::schur/schur_preconditioner::diag*

        The preconditioner for the Schur complement is generated by the block diagonal 
        part of the original matrix associated with the Schur complement (i.e. A11).
        
        When solving a saddle point problem, where the A11 block is identically zero, 
        using diag as the preconditioner only makes sense when additionally setting the pc to none. 
        Usually for saddle point problems one would use a preconditioner of self and pc lsc 
        which uses the least squares commutator compute a preconditioner for the Schur 
        complement.

    * [schur_preconditioner (self)](composite_type__schur/schur_preconditioner__self "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/composite_type::schur/schur_preconditioner::self*

        The preconditioner for the Schur complement is generated from the Schur complement matrix itself:
        The only preconditioner that currently works directly with the Schur complement matrix object is the PCLSC 
        preconditioner
        
        Usually for saddle point problems one would use a preconditioner of self and pc lsc 
        which uses the least squares commutator compute a preconditioner for the Schur 
        complement.

    * [schur_preconditioner (user)](composite_type__schur/schur_preconditioner__user "child")

        CHOICE 

        */system/nonlinear_solver/type::SNES/linear_solver/preconditioner::fieldsplit/composite_type::schur/schur_preconditioner::user*

        The preconditioner for the Schur complement is described by a ufl form.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/solvers.rng.)

