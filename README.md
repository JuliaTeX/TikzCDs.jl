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
