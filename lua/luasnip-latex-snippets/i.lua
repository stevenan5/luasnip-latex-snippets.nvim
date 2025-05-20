local M = {}

local ls = require("luasnip")
local utils = require("luasnip-latex-snippets.util.utils")
local pipe = utils.pipe

function M.retrieve(not_math)
  local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, {
    wordTrig = false,
    condition = pipe({ not_math }),
    show_condition = not_math,
  }) --[[@as function]]

  return {
    ls.parser.parse_snippet(
      { trig = "pac", name = "Package" },
      "\\usepackage[${1:options}]{${2:package}}$0"
    ),
    parse_snippet({ trig = "lab", name = "label" }, "~\\label{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "ref", name = "ref" }, "~\\ref{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "cite", name = "cite" }, "~\\cite{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "citep", name = "citep" }, "~\\citep{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "citet", name = "citet" }, "~\\citet{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "bol", name = "bold" }, "\\textbf{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "ita", name = "italic" }, "\\textit{${1:${TM_SELECTED_TEXT}}} $0"),

    parse_snippet(
      { trig = "table", name = "table env" },
      "\\begin{table}[${1:htpb}]\n\\centering\n\\caption{${2:caption}}\n\\label{tab:${3:label}}\n\\begin{tabular}{${5:c}}\n\\toprule\n$0${5/((?<=.)c|l|r)|./ & /g} \\\\\\ \n\\midrule\n\\bottomrule\n\\end{tabular}\n\\end{table}"
    ),
    parse_snippet(
      { trig = "fig", name = "figure env" },
      "\\begin{figure}[${1:htpb}]\n\\centering\n${2:\\includegraphics[width=0.8\\textwidth]{$3}}\n\\caption{${4:$3}}\n\\label{fig:${5:${3/\\W+/-/g}}}\n\\end{figure}"
    ),
  }
end

return M
