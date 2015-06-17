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

/ [terraferma_options](../terraferma_options) /

#io

*/io*

Input/Output options

* [output_base_name](io/output_base_name "child")

    type: string

    */io/output_base_name*

    Base name for files output by the model

* [visualization](io/visualization "child")

    */io/visualization*

    Options to control the functionspace that the visualization output is interpolated to.

* [dump_periods](io/dump_periods "child")

    */io/dump_periods*

    Options to control the period between dumps of diagnostic data.
    
    NOTE that unless fields and coefficients are explicitly included in diagnostic output
    then information about them will not appear in the data, regardless of the periods set.  
    i.e. even setting the dump_period to every timestep will produce no output if no fields 
    or coefficients are selected to be included!

* [detectors](io/detectors "child")

    */io/detectors*

    Detectors options

* [checkpointing](io/checkpointing "child")

    OPTIONAL 

    */io/checkpointing*

    Options to enable checkpointing

* [debugging](io/debugging "child")

    OPTIONAL 

    */io/debugging*

    Debugging output options.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/io.rng.)
