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

/ [terraferma_options](../../../terraferma_options.md) / [geometry](../../geometry.md) / [mesh::Mesh](../mesh__Mesh.md) /

#source (UnitInterval)

CHOICE 

*/geometry/mesh::Mesh/source::UnitInterval*

Choose the source of this mesh as an internally generated 1d interval of length 1.

Boundary ids will be automatically assigned as:

    (left boundary) 1 ----- 2 (right boundary)

No region ids will be assigned.   


* [number_cells](source__UnitInterval/number_cells.md "child")

    type: integer

    */geometry/mesh::Mesh/source::UnitInterval/number_cells*

    Specify the number of cells.

* [cell](source__UnitInterval/cell.md "child")

    values: interval

    */geometry/mesh::Mesh/source::UnitInterval/cell*

    The ufl cell type (no option allowed).

[autogenerated]: # (This file was automatically generated from the schema file:/home/cwilson/repos/github/TerraFERMA/TerraFERMA/buckettools/schemas/geometry.rng.)

