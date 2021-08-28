module TikzCDs

using TikzPictures

import TikzPictures: PDF, TEX, TIKZ, SVG, save, TikzDocument, push!, tikzCommand
export PDF, TEX, TIKZ, SVG, save, TikzDocument, push!, tikzCommand
import LaTeXStrings: LaTeXString, @L_str, @L_mstr
export LaTeXString, @L_str, @L_mstr

export TikzCD, QuiverCD

function TikzCD(data::AbstractString; preamble="", kw...)
  # check for tikz-cd package being imported
  if !occursin("\\usepackage{tikz-cd}", preamble)
    preamble = strip(string("\\usepackage{tikz-cd}\n", preamble))
  end
  # tikz-cd doesn't support the content being in a $$, so this helps when using LaTeXStrings
  if typeof(data) == LaTeXString
    data = strip(data[2:end-1])
  end
  TikzPicture(data; environment="tikzcd", preamble=preamble, kw...)
end

Quiversty = L"""
% contents of quiver.sty
% `tikz-cd` is necessary to draw commutative diagrams.
\RequirePackage{tikz-cd}
% `amssymb` is necessary for `\lrcorner` and `\ulcorner`.
\RequirePackage{amssymb}
% `calc` is necessary to draw curved arrows.
\usetikzlibrary{calc}
% `pathmorphing` is necessary to draw squiggly arrows.
\usetikzlibrary{decorations.pathmorphing}

% A TikZ style for curved arrows of a fixed height, due to AndréC.
\tikzset{curve/.style={settings={#1},to path={(\tikztostart)
    .. controls ($(\tikztostart)!\pv{pos}!(\tikztotarget)!\pv{height}!270:(\tikztotarget)$)
    and ($(\tikztostart)!1-\pv{pos}!(\tikztotarget)!\pv{height}!270:(\tikztotarget)$)
    .. (\tikztotarget)\tikztonodes}},
    settings/.code={\tikzset{quiver/.cd,#1}
        \def\pv##1{\pgfkeysvalueof{/tikz/quiver/##1}}},
    quiver/.cd,pos/.initial=0.35,height/.initial=0}

% TikZ arrowhead/tail styles.
\tikzset{tail reversed/.code={\pgfsetarrowsstart{tikzcd to}}}
\tikzset{2tail/.code={\pgfsetarrowsstart{Implies[reversed]}}}
\tikzset{2tail reversed/.code={\pgfsetarrowsstart{Implies}}}
% TikZ arrow styles.
\tikzset{no body/.style={/tikz/dash pattern=on 0 off 1mm}}
"""

function QuiverCD(data::AbstractString; preamble=Quiversty, kw...)
  if !occursin("contents of quiver.sty", preamble)
    preamble = strip(string(Quiversty, "\n", preamble))
  end
  TikzCD(data; preamble=preamble, kw...)
end

end