# BASED ON TIKZPICTURES.JL TESTS

using TikzCDs
using Test

for file in ["testCD.pdf", "testCDDoc.pdf", "testCD.tex"]
  if isfile(file)
    rm(file)
  end
end

# check that the TEX file contains the desired environments
function has_environment(content::String, environment::String)
    has_begin = occursin("\\begin{$environment}", content)
    has_end = occursin("\\end{$environment}", content)
    if has_begin && has_end
        return true # has both
    elseif !has_begin && !has_end
        return false # has neither
    else
        error("\\begin{$environment} and \\end{$environment} do not match")
    end
end

# Test tikz-cd

data = L"""
A \arrow[rd] \arrow[r, "\phi"] & B \\
                               & C
"""
tp = TikzCD(data, options="scale=0.25")

td = TikzDocument()
push!(td, tp, caption="hello")

save(TEX("testCD"), tp)
@test isfile("testCD.tex")

filecontent = join(readlines("testCD.tex", keep=true)) # read with line breaks
@test occursin(strip(data[2:end-1]), filecontent) # also check that the data is contained
@test has_environment(filecontent, "tikzcd")
@test has_environment(filecontent, "document")

if success(`lualatex -v`)
    save(PDF("testCD"), tp)
    @test isfile("testCD.pdf")

    save(PDF("testCDDoc"), td)
    @test isfile("testCDDoc.pdf")
else
    @warn "lualatex is missing; can not test compilation"
end
