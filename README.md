# Benchmark a simple PDE
Scalar 1D advection-diffusion equation, finite differences, explicit Euler

Benchmark results:
```
|-------------------------------+--------|
|                               | laptop |
|-------------------------------+--------|
| gcc                           |   17.8 |
| gcc -O3                       |    3.4 |
| gcc -march-native             |      7 |
| gcc -O3 -march=native         |   0.46 |
| clang                         |     10 |
| clang -O3                     |      7 |
| clang -march=native           |      7 |
| clang -O3 -march=native       |    1.2 |
| clang -Ofast -march=native    |   0.85 |
|                               |        |
| julia (loops, script)         |    500 |
| julia (loops)                 |    2.1 |
| julia (loops, @inbounds)      |   0.41 |
| julia (vect, 0.6)             |    9.4 |
| julia (vect, 0.7)             |    3.5 |
|                               |        |
| python (loops)                |   1200 |
| python (vect)                 |      9 |
|                               |        |
| scilab (loop)                 |   5900 |
| scilab (vect)                 |     45 |
|                               |        |
| octave (loop)                 |  22000 |
| octave (vect)                 |     45 |
|                               |        |
| matlab 2017a (loop, script)   |     15 |
| matlab 2017a (loop, function) |      8 |
| matlab 2017a (vec)            |     10 |
|-------------------------------+--------|
```
