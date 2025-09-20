local ls = require("luasnip")
local utils = require("luasnip-latex-snippets.util.utils")
local pipe = utils.pipe

local M = {}

function M.retrieve(not_math)
  local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, {
    wordTrig = false,
    condition = pipe({ not_math }),
  }) --[[@as function]]

  return {
    parse_snippet({ trig = " lab", name = "label" }, "~\\label{${1:${TM_SELECTED_TEXT}}} $0"),
    -- parse_snippet({ trig = "lab", name = "label" }, "~\\label{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = " ref", name = "ref" }, "~\\ref{${1:${TM_SELECTED_TEXT}}} $0"),
    -- parse_snippet({ trig = "ref", name = "ref" }, "~\\ref{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "cite", name = "cite" }, "~\\cite{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "citep", name = "citep" }, "~\\citep{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "citet", name = "citet" }, "~\\citet{${1:${TM_SELECTED_TEXT}}} $0"),
  }
end

return M
