function heat()
    Nx = 1000;
    Nt = 1000000;
    x = linspace(0,1,Nx);
    u = zeros(Nx,1);
    u(:) = 42;
    u_next = zeros(Nx,1);
    D = 1;
    v = 1;
    dt = 1e-8;
    dx = 1e-1;

    tic
    for it=1:Nt
        u_next(2:Nx-1) = u(2:Nx-1) + D*dt/(dx*dx)*(u(3:Nx)-2*u(2:Nx-1)+u(1:Nx-2)) - v*dt/dx*(u(3:Nx) - u(2:Nx-1));
        %for ix=2:Nx-1
        %u_next(ix) = u(ix) + D*dt/(dx*dx)*(u(ix+1)-2*u(ix)+u(ix-1)) - v*dt/dx*(u(ix+1) - u(ix));
        %end
        u(:) = u_next(:);
    end
    toc
end
