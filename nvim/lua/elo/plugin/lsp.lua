return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local methods = vim.lsp.protocol.Methods
          local bufopts = { noremap = true, silent = true, buffer = bufnr }

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
        end,
      })
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "denols",
          "tsserver",
          "hls",
          "marksman",
          "eslint",
          "pyright",
          "angularls",
          "clangd",
          "emmet_language_server",
        },
        handlers = {
          function(server)
            lspconfig[server].setup({
              capabilities = capabilities,
            })
          end,
          ["angularls"] = function()
            local ok, mason_registry = pcall(require, "mason-registry")
            if not ok then
              vim.notify("mason-registry could not be loaded")
              return
            end

            local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()

            local cmd = {
              "ngserver",
              "--stdio",
              "--tsProbeLocations",
              table.concat({
                angularls_path,
                vim.uv.cwd(),
              }, ","),
              "--ngProbeLocations",
              table.concat({
                angularls_path .. "/node_modules/@angular/language-server",
                vim.uv.cwd(),
              }, ","),
            }
            lspconfig.angularls.setup({
              cmd = cmd,
              on_new_config = function(new_config, new_root_dir)
                new_config.cmd = cmd
              end,
            })
          end,
        },
      })
    end,
  },
}
