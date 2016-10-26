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

/ [harness_options](../../harness_options.md) / [simulations](../simulations.md) /

#simulation

MULTIPLE (0+) 

attributes: name (string) 

*/simulations/simulation*

Definition of a top level TerraFERMA simulation.

* [input_file](simulation/input_file.md "child")

    type: string

    */simulations/simulation/input_file*

    The input_file for this simulation.
    
    Only a single file name should be entered here, complete with extension.
    This should be a tfml file and is assumed to be libspud compatible.
    
    The input_file does not have to exist but if it doesn't it must be listed
    in the required_output of one of the dependencies of this simulation.

* CHOICE:
    * [run_when (input_changed_or_output_missing)](simulation/run_when__input_changed_or_output_missing.md "child")

        CHOICE 

        */simulations/simulation/run_when::input_changed_or_output_missing*

        Select when to run.
        
        Run when the input has changed  (md5sum check) or some specified output is missing.
        Note that if no output is required then it will always run.
        
        Can be overridden with the command line force flag, which will force a run (and possibly a build).

    * [run_when (input_changed)](simulation/run_when__input_changed.md "child")

        CHOICE 

        */simulations/simulation/run_when::input_changed*

        Select when to run.
        
        Run when the input has changed (md5sum check).
        
        Can be overridden with the command line force flag, which will force a run (and possibly a build).

    * [run_when (output_missing)](simulation/run_when__output_missing.md "child")

        CHOICE 

        */simulations/simulation/run_when::output_missing*

        Select when to run.
        
        Run when some specified output is missing.
        Note that if no output is required then it will always run.
        
        Can be overridden with the command line force flag, which will force a run (and possibly a build).

    * [run_when (always)](simulation/run_when__always.md "child")

        CHOICE 

        */simulations/simulation/run_when::always*

        Select when to run.
        
        Always run.  
        
        The command line force flag will also force a build if necessary.

    * [run_when (never)](simulation/run_when__never.md "child")

        CHOICE 

        */simulations/simulation/run_when::never*

        Select when to run.
        
        Never run.
        
        Can be overridden with the command line force flag, which will force a run (and possibly a build).

* [number_processes](simulation/number_processes.md "child")

    OPTIONAL 

    type: integer

    */simulations/simulation/number_processes*

    The base number_processes that this simulation should be run on.
    
    This may be scaled with the parameter process_scale but if unset defaults to 1.

* [valgrind_options](simulation/valgrind_options.md "child")

    OPTIONAL 

    type: string

    */simulations/simulation/valgrind_options*

    Turning this option on runs the simulation through valgrind with whatever
    options are specified here.  e.g.:
    
    --tool=callgrind
    
    --tool=memcheck

* [parameter_sweep](simulation/parameter_sweep.md "child")

    OPTIONAL 

    */simulations/simulation/parameter_sweep*

    Perform a sweep over the listed parameters.  Each parameter requires a unique name.

* [required_input](simulation/required_input.md "child")

    OPTIONAL 

    */simulations/simulation/required_input*

    Enter a list of files required as input.
    
    All required_output from dependency simulations/runs are automatically 
    assumed to be required as input so need not be entered here.

* [required_output](simulation/required_output.md "child")

    OPTIONAL 

    */simulations/simulation/required_output*

    Enter a list of files that must be output.
    
    This list will be used to check if the simulation has previously successfully run.
    
    If this is a dependency of another simulation, this list will also be used as
    required input to the parent simulation.

* [dependencies](simulation/dependencies.md "child")

    OPTIONAL 

    */simulations/simulation/dependencies*

    A list of the dependencies of this simulation.

* [checkpoint](simulation/checkpoint.md "child")

    OPTIONAL 

    */simulations/simulation/checkpoint*

    Options for updating and restarting simulations from checkpoint.

* [variables](simulation/variables.md "child")

    OPTIONAL 

    */simulations/simulation/variables*

    A list of variables to evaluate.  Each variable name should be unique.

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/simulations.rng.)

