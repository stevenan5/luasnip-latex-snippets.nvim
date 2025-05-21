local ls = require("luasnip")
local utils = require("luasnip-latex-snippets.util.utils")
local pipe = utils.pipe

local M = {}

function M.retrieve(not_math)
  local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, {
    condition = pipe({ not_math }),
  }) --[[@as function]]

  return {
    parse_snippet({ trig = "mk", name = "Math" }, "\\( ${1:${TM_SELECTED_TEXT}} \\) $0"),
    parse_snippet(
      { trig = "dm", name = "Block Math" },
      "\\[\n\t${1:${TM_SELECTED_TEXT}}\n\\]\n$0"
    ),
    parse_snippet({ trig = " .", name = "Period" }, "."),
    parse_snippet({ trig = " ,", name = "Comma" }, ","),
    parse_snippet({ trig = " '", name = "Apostrophe" }, "'"),
    parse_snippet({ trig = " !", name = "Exclam. Mark" }, "!"),
    parse_snippet({ trig = " ?", name = "Question Mark" }, "?"),
    parse_snippet({ trig = "ie", name = "ie" }, "i.e.~"),
    parse_snippet({ trig = "Ie", name = "Ie" }, "I.e.~"),
    parse_snippet({ trig = "eg", name = "eg" }, "e.g.~"),
    parse_snippet({ trig = "Eg", name = "Eg" }, "E.g.~"),
  }
end

return M
