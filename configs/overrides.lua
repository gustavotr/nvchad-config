local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "angular-language-server",
    "tailwindcss-language-server",
    "eslint-lsp",

    -- C/CPP
    "clangd",
    "clang-format",

    -- File formats
    "json-lsp",
    "yaml-language-server",

    -- Rust
    "rust-analyzer",

    -- SQL
    "sqlfluff",

    -- Writing
    "markdownlint",
    "cspell",
    "codespell",

    -- Shell
    "bash-language-server",

    -- Others
    "dockerfile-language-server",
    "dot-language-server",
    "editorconfig-checker",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  view = {
    adaptive_size = true,
  },
}

return M
