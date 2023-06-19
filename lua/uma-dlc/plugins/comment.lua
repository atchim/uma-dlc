local function _1_()
  return (require("ts_context_commentstring.internal")).update_commentstring()
end
local function _2_(_, opts)
  return (require("mini.comment")).setup(opts)
end
return {"echasnovski/mini.comment", event = "BufRead", opts = {hooks = {pre = _1_}, options = {pad_comment_parts = false}}, config = _2_, dependencies = "JoosepAlviste/nvim-ts-context-commentstring"}
