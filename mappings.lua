---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>tt"] = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
    ["<leader>tc"] = { "<cmd>CoverageToggle<CR>", "Toggle Coverage" },
    ["<leader>gl"] = { "<cmd>lua vim.diagnostic.open_float() <CR>", "Line Diagnostic" },

    -- Navigation
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "window up" },
    ["<S-h>"] = { "<cmd>bp<CR>", "previous buffer" },
    ["<S-l>"] = { "<cmd>bn<CR>", "next buffer" },
    ["<leader>co"] = { "<cmd>wa|%bd|e#<CR>", "Close other buffers" },
    ["<leader>sl"] = { "<cmd>SessionManager load_last_session<CR>", "Load last session" },

    -- DEBUG
    ["<leader>dh"] = { "<cmd>lua require'dap.ui.widgets'.hover()<CR>", "Debug Hover" },
    ["<leader>dw"] = {
      "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",
      "Debug Widgets",
    },
    ["<leader>dU"] = {
      "<cmd>lua require'dapui'.toggle()<cr>",
      "Debug UI",
    },
    ["<F5>"] = {
      "<cmd>lua require'dap'.continue()<cr>",
      "Debug Continue",
    },
    ["<F10>"] = {
      "<cmd>lua require'dap'.step_over()<cr>",
      "Debug Step Over",
    },
    ["<F11>"] = {
      "<cmd>lua require'dap'.step_into()<cr>",
      "Debug Step Into",
    },
    ["<F12>"] = {
      "<cmd>lua require'dap'.step_out()<cr>",
      "Debug Step Into",
    },
    ["<leader>db"] = {
      "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
      "Debug Step Into",
    },
    ["<leader>dB"] = {
      "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
      "Debug Set Breakpoint Log",
    },
    ["<leader>dr"] = {
      "<cmd>lua require'dap'.repl_open()<cr>",
      "Debug Open REPL",
    },

    -- GIT
    ["<leader>gd"] = { "<cmd>Gitsigns diffthis<cr>", "Git Diff" },
    ["<leader>gp"] = { "<cmd>Gitsigns preview_hunk<cr>", "Git Preview" },
    ["<leader>gg"] = { "<cmd>LazyGit<cr>", "LazyGit" },
  },
}

M.nvterm = {
  t = {
    ["<C-k>"] = {
      "<cmd>lua require'nvterm.terminal'.send('<C-x>') vim.cmd('TmuxNavigateUp')<CR>",
      "",
    },
    ["<C-j>"] = {
      "<cmd>lua require'nvterm.terminal'.send('<C-x>') vim.cmd('TmuxNavigateDown')<CR>",
      "",
    },
    ["<C-h>"] = {
      "<cmd>lua require'nvterm.terminal'.send('<C-x>') vim.cmd('TmuxNavigateLeft')<CR>",
      "",
    },
    ["<C-l>"] = {
      "<cmd>lua require'nvterm.terminal'.send('<C-x>') vim.cmd('TmuxNavigateRight')<CR>",
      "",
    },
  },
}

return M
