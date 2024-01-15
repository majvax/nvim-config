---@type ChadrcConfig
local M = {}
local vim = vim
local opt = vim.opt
local g = vim.g

opt.shell = "pwsh.exe"
opt.shellxquote = ""
opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy Bypass -Command "
opt.shellquote = ""
opt.shellpipe = "| Out-File -Encoding UTF8 %s"
opt.shellredir = "| Out-File -Encoding UTF8 %s"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = true
opt.foldlevel = 99
g.python3_host_prog = "C:\\Users\\majvax\\.pyenv\\pyenv-win\\versions\\3.10.11\\python.exe"





local enable_providers = {
  "python3_provider",
  "node_provider",
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end

M.ui = {
  hl_override = {
    NvDashAscii = { fg = "white", bg = "NONE" },
  },
  theme = 'catppuccin',
  nvdash = {
    load_on_startup = true,
    header = require("custom.ascii").hydra,
  },
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")


return M
