-- complete --
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- Use <C-b/f> to scroll the docs
        -- ['<C-b>'] = cmp.mapping.scroll_docs( -4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- Use <C-k/j> to switch in items
        -- ['<C-k>'] = cmp.mapping.select_prev_item(),
        -- ['<C-j>'] = cmp.mapping.select_next_item(),
        -- Use <CR>(Enter) to confirm selection
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- A super tab
        -- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- Hint: if the completion menu is visible select next one
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }), -- i - insert mode; s - select mode
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable( -1) then
                luasnip.jump( -1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

  -- Let's configure the item's appearance
  -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
  formatting = {
      -- Set order from left to right
      -- kind: single letter indicating the type of completion
      -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
      -- menu: extra text for the popup menu, displayed after "word" or "abbr"
      fields = { 'abbr', 'menu' },

      -- customize the appearance of the completion menu
      format = function(entry, vim_item)
          vim_item.menu = ({
              nvim_lsp = '[Lsp]',
              luasnip = '[Luasnip]',
              buffer = '[File]',
              path = '[Path]',
          })[entry.source.name]
          return vim_item
      end,
  },

  -- Set source precedence
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },    -- For nvim-lsp
    { name = 'luasnip' },     -- For luasnip user
    { name = 'buffer' },      -- For buffer word completion
    { name = 'path' },        -- For path completion
  })
})

-- lsp --
require("mason").setup()
require("mason-lspconfig").setup({
  -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
  -- This setting has no relation with the `automatic_installation` setting.
  ---@type string[]
  ensure_installed = {"clangd", "cmake", "lua_ls", "ts_ls", "marksman"},

  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  -- Can either be:
  --   - false: Servers are not automatically installed.
  --   - true: All servers set up via lspconfig are automatically installed.
  --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
  --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
  ---@type boolean
  automatic_installation = true,

  -- See `:h mason-lspconfig.setup_handlers()`
  ---@type table<string, fun(server_name: string)>?
  handlers = nil,
})


require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {}
  end
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function ()
  --     require("rust-tools").setup {}
  -- end
}

local lspconfig = require('lspconfig')
lspconfig['ts_ls'].setup({})
lspconfig['lua_ls'].setup({}) -- default config for lua
lspconfig['clangd'].setup({})
lspconfig['cmake'].setup({})
lspconfig['marksman'].setup({})
