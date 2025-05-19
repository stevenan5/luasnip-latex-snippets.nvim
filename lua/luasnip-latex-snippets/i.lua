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
    parse_snippet({ trig = "lab", name = "label" }, "~\\label{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "ref", name = "ref" }, "~\\ref{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "cite", name = "cite" }, "~\\cite{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "citep", name = "citep" }, "~\\citep{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "citet", name = "citet" }, "~\\citet{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "bol", name = "bold" }, "\\textbf{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "ita", name = "italic" }, "\\textit{${1:${TM_SELECTED_TEXT}}} $0"),

    parse_snippet({ trig = "table", name = "table env" }, "\\begin{table}[${1:htpb}]\\centering\\caption{${2:caption}}\\label{tab:${3:label}}\\begin{tabular}{${5:c}}\\toprule$0${5/((?<=.)c|l|r)|./(?1: & )/g} \\\\\\midrule\\bottomrule\\end{tabular}\\end{table}"),
  }
end

return M
