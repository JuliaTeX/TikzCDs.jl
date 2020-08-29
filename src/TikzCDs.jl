module TikzCDs

using TikzPictures

import TikzPictures: PDF, TEX, TIKZ, SVG, save, TikzDocument, push!, tikzCommand
export PDF, TEX, TIKZ, SVG, save, TikzDocument, push!, tikzCommand
import LaTeXStrings: LaTeXString, @L_str, @L_mstr
export LaTeXString, @L_str, @L_mstr

export TikzCD

function TikzCD(data::AbstractString; options="", preamble="", enableWrite18=true)
  # check for tikz-cd package being imported
  if !occursin("\\usepackage{tikz-cd}", preamble)
    preamble = strip(string("\\usepackage{tikz-cd}\n", preamble))
  end
  # tikz-cd doesn't support the content being in a $$, so this helps when using LaTeXStrings
  if typeof(data) == LaTeXString
    data = strip(data[2:end-1])
  end
  TikzPicture(data, options=options, preamble=preamble, environment="tikzcd", enableWrite18=enableWrite18)
end

end
