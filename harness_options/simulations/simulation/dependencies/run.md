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

/ [harness_options](../../../../harness_options.md) / [simulations](../../../simulations.md) / [simulation](../../simulation.md) / [dependencies](../dependencies.md) /

#run

MULTIPLE (0+) 

attributes: name (string) 

*/simulations/simulation/dependencies/run*

Definition of a run (not a TerraFERMA simulation).

e.g. perhaps a gmsh run

* [input_file](run/input_file.md "child")

    type: string

    */simulations/simulation/dependencies/run/input_file*

    The input_file for this run.
    
    Only a single file name should be entered here, complete with extension.
    
    The input_file does not have to exist but if it doesn't it must be listed
    in the required_output of one of the dependencies of this simulation.
    
    By default the input_file is loaded and its contents made available, in the
    variable 'input_file',  as an ascii string to all parameter updating code.  
    This behaviour can be modified if the file can be loaded by libspud by toggling
    the option spud_file below.

* CHOICE:
    * [run_when (input_changed_or_output_missing)](run/run_when__input_changed_or_output_missing.md "child")

        CHOICE 

        */simulations/simulation/dependencies/run/run_when::input_changed_or_output_missing*

        Select when to run.
        
        Run when the input has changed  (md5sum check) or some specified output is missing.
        Note that if no output is required then it will always run.
        
        Can be overridden with the command line force flag, which will force a run (and possibly a build).

    * [run_when (input_changed)](run/run_when__input_changed.md "child")

        CHOICE 

        */simulations/simulation/dependencies/run/run_when::input_changed*

        Select when to run.
        
        Run when the input has changed (md5sum check).
        
        Can be overridden with the command line force flag, which will force a run (and possibly a build).

    * [run_when (output_missing)](run/run_when__output_missing.md "child")

        CHOICE 

        */simulations/simulation/dependencies/run/run_when::output_missing*

        Select when to run.
        
        Run when some specified output is missing.
        Note that if no output is required then it will always run.
        
        Can be overridden with the command line force flag, which will force a run (and possibly a build).

    * [run_when (always)](run/run_when__always.md "child")

        CHOICE 

        */simulations/simulation/dependencies/run/run_when::always*

        Select when to run.
        
        Always run.  
        
        The command line force flag will also force a build if necessary.

    * [run_when (never)](run/run_when__never.md "child")

        CHOICE 

        */simulations/simulation/dependencies/run/run_when::never*

        Select when to run.
        
        Never run.
        
        Can be overridden with the command line force flag, which will force a run (and possibly a build).

* [parameter_sweep](run/parameter_sweep.md "child")

    OPTIONAL 

    */simulations/simulation/dependencies/run/parameter_sweep*

    Perform a sweep over the listed parameters.  This list should be a subset of the parent simulation parameters.

* [required_input](run/required_input.md "child")

    OPTIONAL 

    */simulations/simulation/dependencies/run/required_input*

    Enter a list of files required as input.
    
    All required_output from dependency simulations/runs are automatically 
    assumed to be required as input so need not be entered here.

* [required_output](run/required_output.md "child")

    OPTIONAL 

    */simulations/simulation/dependencies/run/required_output*

    Enter a list of files that must be output.
    
    This list will be used to check if the simulation has previously successfully run.
    
    If this is a dependency of another simulation, this list will also be used as
    required input to the parent simulation.

* [commands](run/commands.md "child")

    OPTIONAL 

    */simulations/simulation/dependencies/run/commands*

    A list of commands to perform this run.
    
    Parameters are available to the command as $parameter_name and the input filename is available as $input_filename.

* [variables](run/variables.md "child")

    OPTIONAL 

    */simulations/simulation/dependencies/run/variables*

    A list of variables to evaluate.  Each variable name should be unique.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/simulations.rng.)

