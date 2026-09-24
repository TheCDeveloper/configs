require("nvchad.configs.lspconfig").defaults()

local servers = {
    "html",
    "emmet_ls",
    "ts_ls",
    "cssls",
    "pyright",
    "clangd",
    "rust_analyzer",
    "gdscript"
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
