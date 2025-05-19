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
    parse_snippet({ trig = "lab", name = "label" }, "~\\label_{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "ref", name = "ref" }, "~\\ref_{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "cite", name = "cite" }, "~\\cite_{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "citep", name = "citep" }, "~\\citep_{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "citet", name = "citet" }, "~\\citet_{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "bol", name = "bold" }, "~\\textbf_{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "ita", name = "italic" }, "~\\textit_{${1:${TM_SELECTED_TEXT}}} $0"),
  }
end

return M
