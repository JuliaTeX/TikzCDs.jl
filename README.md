# TikzCDs.jl

![Tests](https://github.com/JuliaTeX/TikzCDs.jl/workflows/Tests/badge.svg)
[![codecov](https://codecov.io/gh/JuliaTeX/TikzCDs.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JuliaTeX/TikzCDs.jl)

A wrapper around [TikzPictures.jl](https://github.com/JuliaTeX/TikzPictures.jl)
for easier drawing of commutative diagrams using
[`tikz-cd`](https://www.ctan.org/pkg/tikz-cd)

### Dependencies

In order to use this library, `lualatex` must be installed.
You must also have `dvisvgm` installed.

On Ubuntu, you can get these, if not already present, by running:

```
$ sudo apt-get install texlive-latex-base texlive-binaries texlive-luatex
```

## Example

```julia
tp = TikzCD(L"""
A \arrow{rd} \arrow{r} & B \\
                       & C
""", options="scale=0.25")
```

For more usage details, check out the
[TikzPictures.jl repository](https://github.com/JuliaTeX/TikzPictures.jl).

## Quiver Support

You can use [Quiver](q.uiver.app) to draw your diagrams and then render them with TikzCD by taking the body of the tikzcd from the exported tex file.
The `QuiverCD` function will append the quiver.sty file to your TikzCD diagram.

```julia
triangle = L"""        A &&& Q \\
               \\
               &&& P
               \arrow["h", from=1-4, to=3-4]
               \arrow["f", from=1-1, to=1-4]
               \arrow["g"', from=1-1, to=3-4]
            """
tridiagram = QuiverCD(triangle)
```