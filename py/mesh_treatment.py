
"""
Fix and decimate meshes
"""
from vedo import *
import pymeshfix
import os
import numpy as np

def fix_mesh(folder_path):
   # Get a list of all .ply files in the folder
    mesh_files = [f for f in os.listdir(folder_path) if f.endswith('.ply')]
    output_path = os.path.join(folder_path, 'fixmeshfull')
    fixed_files = [f for f in os.listdir(output_path) if f.endswith('.ply')]

     # Iterate over each mesh file
    for mesh_file in mesh_files:
      if mesh_file not in fixed_files:
        mesh_path = os.path.join(folder_path, mesh_file)
      
        # Load the mesh object
        # 1. load a mesh
        # Load the mesh object
        a = Mesh(mesh_path)
        b = a.clone().extract_largest_region()
        b = b.clean()
        print(mesh_file)
        printc('initial volume:', b.volume())
        printc('Initial surface area:',b.area())

        printc('is the initial largest mesh watertight?', b.is_closed())

        c = b.clone() # make a copy
        c.non_manifold_faces(tol=0)
        c = c.fill_holes(size = 10)
        printc('is the treated mesh watertight? ', c.is_closed())
        d = pymeshfix.MeshFix(np.array(c.vertices) , np.array(c.cells))
        d.repair()
        d = Mesh(d.mesh)

        printc('Final volume:', d.volume())
        printc('Final surface area:', d.area())
        printc('Is final mesh watertight?', d.is_closed())

        
        out_mesh_path = os.path.join(output_path, mesh_file)

        write(d, out_mesh_path, binary=False)
fix_mesh("/Users/leitejard/prot3d/data")