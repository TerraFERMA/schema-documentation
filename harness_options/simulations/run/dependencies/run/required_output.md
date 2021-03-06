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

/ [harness_options](../../../../../harness_options.md) / [simulations](../../../../simulations.md) / [run](../../../run.md) / [dependencies](../../dependencies.md) / [run](../run.md) /

#required_output

OPTIONAL 

*/simulations/run/dependencies/run/required_output*

Enter a list of files that must be output.

This list will be used to check if the simulation has previously successfully run.

If this is a dependency of another simulation, this list will also be used as
required input to the parent simulation.

* [filenames](required_output/filenames.md "child")

    MULTIPLE (1+) 

    attributes: name (string) 

    */simulations/run/dependencies/run/required_output/filenames*

    Enter filenames, either as a string or returned from python code.
    
    All filenames must have a unique name.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/simulations.rng.)

