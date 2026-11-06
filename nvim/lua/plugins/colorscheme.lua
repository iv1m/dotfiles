return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard",
      overrides = {
        -- transparent statusline fill (lualine sections fall through to these)
        StatusLine = { bg = "NONE" },
        StatusLineNC = { bg = "NONE" },
        -- text in quotes
        String = { fg = "#228B22" },
        ["@string"] = { fg = "#228B22" },
        ["@lsp.type.string"] = { fg = "#228B22" },
      },
      palette_overrides = {
        bright_green = "#BC8F8F", -- rosy brown instead of green
      },
      transparent_mode = true, -- take the background from the terminal (ghostty: #000000, opacity 0.80)
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("gruvbox")
      end,
    },
  },

  -- Statusline: mode block in the same yellow-brown as the active tmux tab.
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local theme = require("lualine.themes.gruvbox")
      theme.normal.a.bg = "#d79921"
      -- transparent statusline fill (section c) in every mode; section b keeps gruvbox gray
      for _, mode in pairs(theme) do
        if mode.c then
          mode.c.bg = "NONE"
        end
      end
      opts.options = opts.options or {}
      opts.options.theme = theme
    end,
  },
}
