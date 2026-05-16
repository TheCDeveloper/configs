local dap = require "dap"


dap.adapters.lldb = {
  type = "executable",
  command = "lldb-dap",
  name = "lldb-dap"
}


dap.configurations.c = {
  {
    name = "Debug C/C++/Rust",
    type = "lldb",
    request = "launch",
    program = function()
      local path = vim.fn.input({
        prompt = "Path to executable: ",
        default = vim.fn.getcwd() .. "/",
        completion = "file"
      })

      return (path and path ~= "") and path or dap.ABORT
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false
  }
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c


vim.fn.sign_define("DapBreakpoint", { text = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "" })
vim.fn.sign_define("DapLogPoint", { text = "" })
vim.fn.sign_define("DapBreakPointRejected", { text = "󰜺" })


vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
