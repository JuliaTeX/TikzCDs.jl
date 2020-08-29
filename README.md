# TikzCDs.jl

A wrapper around [TikzPictures.jl](https://github.com/JuliaTeX/TikzPictures.jl)
for easier drawing of commutative diagrams using
[`tikz-cd`](https://www.ctan.org/pkg/tikz-cd)

### Dependencies

*Currently requires `TikzPictures.jl` to be added in development using `]dev
TikzPictures`*

In order to use this library, `lualatex` must be installed.
The `texlive` and `miktex` distributions include `lualatex`.
You must also have `dvisvgm` installed.

On Ubuntu, you can get these, if not already present, by running:

```
sudo apt-get install texlive-latex-base and sudo apt-get install texlive-binaries
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
