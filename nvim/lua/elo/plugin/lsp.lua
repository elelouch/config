return {
  {
    "neovim/nvim-lspconfig",
    dependencies={
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config=function(args)
      local lspconfig = require("lspconfig")

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)               
            local methods = vim.lsp.protocol.Methods
            local bufopts = { noremap = true, silent = true, buffer = bufnr }

          ------------------------------------------ builtin autocompletion
          ---Utility for keymap creation.
          ---@param lhs string
          ---@param rhs string|function
          ---@param opts string|table
          ---@param mode? string|string[]
          local function keymap(lhs, rhs, opts, mode)
              opts = type(opts) == 'string' and { desc = opts }
                  or vim.tbl_extend('error', opts --[[@as table]], { buffer = bufnr })
              mode = mode or 'n'
              vim.keymap.set(mode, lhs, rhs, opts)
          end

          ---For replacing certain <C-x>... keymaps.
          ---@param keys string
          local function feedkeys(keys)
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', true)
          end

          ---Is the completion menu open?
          local function pumvisible()
              return tonumber(vim.fn.pumvisible()) ~= 0
          end

          -- Enable completion and configure keybindings.
          if client.supports_method(methods.textDocument_completion) then
              -- vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
              
              -- Use enter to accept completions.
              -- keymap('<C-y>', function()
              --     return pumvisible() and '<C-y>' or '<cr>'
              -- end, { expr = true }, 'i')
              
              -- Use slash to dismiss the completion menu.
              -- keymap('/', function()
              --     return pumvisible() and '<C-e>' or '/'
              -- end, { expr = true }, 'i')
          
              -- Use <C-n> to navigate to the next completion or:
              -- - Trigger LSP completion.
              -- - If there's no one, fallback to vanilla omnifunc.
              -- keymap('<C-n>', function()
              --     if pumvisible() then
              --         feedkeys '<C-n>'
              --     else
              --         if next(vim.lsp.get_clients { bufnr = 0 }) then
              --             vim.lsp.completion.trigger()
              --         else
              --             if vim.bo.omnifunc == '' then
              --                 feedkeys '<C-x><C-n>'
              --             else
              --                 feedkeys '<C-x><C-o>'
              --             end
              --         end
              --     end
              -- end, 'Trigger/select next completion', 'i')
          
              -- Buffer completions.
              -- keymap('<C-u>', '<C-x><C-n>', { desc = 'Buffer completions' }, 'i')
          
              -- Use <Tab> to accept a Copilot suggestion, navigate between snippet tabstops,
              -- or select the next completion.
              -- Do something similar with <S-Tab>.
              -- keymap('<Tab>', function()
              --     local copilot = require 'copilot.suggestion'

              --     if copilot.is_visible() then
              --         copilot.accept()
              --     elseif pumvisible() then
              --         feedkeys '<C-n>'
              --     elseif vim.snippet.active { direction = 1 } then
              --         vim.snippet.jump(1)
              --     else
              --         feedkeys '<Tab>'
              --     end
              -- end, {}, { 'i', 's' })
              -- keymap('<S-Tab>', function()
              --     if pumvisible() then
              --         feedkeys '<C-p>'
              --     elseif vim.snippet.active { direction = -1 } then
              --         vim.snippet.jump(-1)
              --     else
              --         feedkeys '<S-Tab>'
              --     end
              -- end, {}, { 'i', 's' })

              -- -- Inside a snippet, use backspace to remove the placeholder.
              -- keymap('<BS>', '<C-o>s', {}, 's')
          end


          --------------------------------------------------

          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
          vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
          vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, bufopts)
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        end
      })
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "hls",
          "marksman",
          "eslint",
          "pyright",
          "angularls",
          "clangd",
          "emmet_language_server"
      },
      handlers={
        function(server)
          lspconfig[server].setup({
          })
        end,
        ['angularls']=function()
          local ok, mason_registry = pcall(require, 'mason-registry')
          if not ok then
              vim.notify 'mason-registry could not be loaded'
              return
          end

          local angularls_path =
              mason_registry.get_package('angular-language-server'):get_install_path()

          local cmd = {
              'ngserver',
              '--stdio',
              '--tsProbeLocations',
              table.concat({
                  angularls_path,
                  vim.uv.cwd(),
              }, ','),
              '--ngProbeLocations',
              table.concat({
                  angularls_path .. '/node_modules/@angular/language-server',
                  vim.uv.cwd(),
              }, ','),
          }
          lspconfig.angularls.setup({
            cmd = cmd,
            on_new_config = function(new_config, new_root_dir)
                new_config.cmd = cmd
            end,
          })
        end
      }
    })
    end
  }
}
