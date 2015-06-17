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

/ [harness_options](../../../../harness_options) / [simulations](../../../simulations) / [simulation](../../simulation) / [checkpoint](../checkpoint) /

#parameter

MULTIPLE (1+) 

attributes: name (string) 

*/simulations/simulation/checkpoint/parameter*

A parameter definition.

Each parameter should have a unique name.

Parameters should specify a value and python code describing how the parameter should be updated.

For example, you may wish to update the finish time of the simulation when picking up for a checkpoint.

* [values](parameter/values "child")

    type: string

    */simulations/simulation/checkpoint/parameter/values*

    A value.  Unlike for parameter sweeps, only a single value should be entered for checkpoints.
    
    The value is input as a string.
    The update python code before should convert them to appropriate types within the input file.

* [update](parameter/update "child")

    type: string

    */simulations/simulation/checkpoint/parameter/update*

    Python code specifying how the input file should be modified to update this parameter.
    
    If no code is provided the parameter will not be modified at this level 
    (but may be modified at other dependency levels).
    
    The values of all the parameters for this simulation will be available to this code using 
    the names given to the parameters above.  They will be formatted as strings and should be converted 
    appropriately within the code.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/simulations.rng.)
