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

/ [terraferma_options](../../../../../../terraferma_options.md) / [system](../../../../../system.md) / [coefficient](../../../../coefficient.md) / [type::Expression](../../../type__Expression.md) / [rank::Tensor](../../rank__Tensor.md) / [value::WholeMesh](../value__WholeMesh.md) /

#cpp

CHOICE 

*/system/coefficient/type::Expression/rank::Tensor/value::WholeMesh/cpp*

A tensor described by a derived dolfin expression using c++ code.

* [include](cpp/include.md "child")

    OPTIONAL 

    type: string

    */system/coefficient/type::Expression/rank::Tensor/value::WholeMesh/cpp/include*

    Additional headers that are required for this expression.
    
    These should be listed including an include statement, e.g.:
    
        #include <string>
        #include "example.h"
    
    The expression will automatically include:
    
        #include "BoostTypes.h"
        #include "Bucket.h"
        #include "SystemBucket.h"
        #include <dolfin.h>

* [members](cpp/members.md "child")

    type: string

    */system/coefficient/type::Expression/rank::Tensor/value::WholeMesh/cpp/members*

    Private members of this expression. These are variables that will be used in the eval
    function for this expression but that you don't want initialized at every call to the eval
    (expensive).  They should therefore be declared here and initialized in the initialization 
    routines below.
    
    The use of underscores at the end of variable names is discouraged as these are frequesntly used for 
    automatically generated variables.  Additionally the overloaded dolfin eval interface provides
    variables named values, x and cell, so these should not be used to avoid confusion.

* [initialization](cpp/initialization.md "child")

    type: string

    */system/coefficient/type::Expression/rank::Tensor/value::WholeMesh/cpp/initialization*

    Initialization routine for the private members declared above.
    
    This initialization has full access to publicly accessible members of the bucket through
    the automatically provided bucket() function, which returns a pointer to the bucket class.  
    A shortcut to the members of this system is provided through the system() function, which 
    returns a pointer to this system class.  Finally, a boost shared pointer to the time is
    provided through the time() function.
    
    The recommended way of accessing functions is through the function_ptr(time()) interface for
    systems and the genericfunction_ptr(time()) interface for fields and coefficients.  These return
    a boost shared pointer to a dolfin function or generic function respectively.  Importantly however,
    the time() argument will ensure that when this expression is evaluated the appropriate timelevel of 
    dependent function or generic function is also used. *time() may also be used to make the expression
    dependent on time.
    
    For example, to extract a boost shared pointer to a generic function for a coefficient called 
    "ExampleCoefficient", we should have declared in the members section above:
    
        std::shared_pointer< dolfin::GenericFunction > examplecoeff;
    
    or (utilizing the typedefs available to us through BoostTypes.h:
    
        GenericFunction_ptr examplecoeff;
    
    Then, in this initialization function, we could extract the appropriate time level of that 
    coefficient from the "ExampleSystem" system using:
    
        examplecoeff = bucket()->fetch_system("ExampleSystem")->fetch_coeff("ExampleCoefficient")->genericfunction_ptr(time())
    
    or, if "ExampleSystem" is the current system, using the shortcut:
    
        examplecoeff = system()->fetch_coeff("ExampleCoefficient")->genericfunction_ptr(time())

* [eval](cpp/eval.md "child")

    type: string

    */system/coefficient/type::Expression/rank::Tensor/value::WholeMesh/cpp/eval*

    Overload the eval subroutine for this expression.  This has the standard interface for DOLFIN 
    expressions, i.e.:
    
        void eval(dolfin::Array<double>& values, const dolfin::Array<double>& x, const ufc::cell &cell) const
    
    To automatically evaluate and return the values of the "ExampleCoefficient" in the example in the 
    initialization section, all that would be required to write here is:
    
        examplecoeff.eval(values, x, cell);
    
    (assuming examplecoeff and this expression are of appropriately matched rank, shape and size).

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/function.rng.)

