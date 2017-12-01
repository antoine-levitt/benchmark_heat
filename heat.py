from __future__ import division
from numpy import *
from numpy.linalg import *
def heat(t,D,v,Nx,Nt):
    dt = t/Nt
    dx = 1/Nx
    x = linspace(0,1,Nx)
    u = ones(Nx)
    u_next = zeros(Nx)
    for it in range(0,Nt-1):
        u_next[1:Nx-2] = u[1:Nx-2] + D*dt/(dx*dx)*(u[2:Nx-1]-2*u[1:Nx-2]+u[0:Nx-3]) - v*dt/dx*(u[2:Nx-1] - u[1:Nx-2])
        
        # for ix in range(1,Nx-1):
            # u_next[ix] = u[ix] + D*dt*(u[ix+1]-2*u[ix]+u[ix-1])/dx**2 - v*dt*(u[ix+1] - u[ix])/dx
        u[:] = u_next[:]
    return u

Nx = 1000
Nt = 1000000
print heat(0.01,1.,1.,Nx,Nt)
