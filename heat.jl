function heat(t,D,v,Nx,Nt)
    T = typeof(D)
    dt = t/Nt
    dx = 1/Nx
    x = linspace(0,1,Nx)
    u = zeros(T,Nx)
    u_next = zeros(T,Nx)
    f(x) = sin(2pi*x) - sin(4pi*x)
    u .= f.(x)
    for it=1:Nt
        # @views @. u_next[2:Nx-1] = u[2:Nx-1] + D*dt/(dx*dx)*(u[3:Nx]-2u[2:Nx-1]+u[1:Nx-2]) - v*dt/dx*(u[3:Nx] - u[2:Nx-1])
        @inbounds for ix=2:Nx-1
            u_next[ix] = u[ix] + D*dt/(dx*dx)*(u[ix+1]-2u[ix]+u[ix-1]) - v*dt/dx*(u[ix+1] - u[ix])
        end
        u .= u_next
    end
    return u
end

Nx = 1_000
Nt = 1_000_000
D = 1.14
v = .85
t = 0.1

@time heat(t,D,v,Nx,Nt)
@time heat(t,D,v,Nx,Nt)
@time heat(t,D,v,Nx,Nt)
@time heat(t,D,v,Nx,Nt)
@time heat(t,D,v,Nx,Nt)
nothing
