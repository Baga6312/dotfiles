require "mason".setup()
require "mason-lspconfig".setup({
  ensure_installed = {"lua_ls" , 
                      "pylsp" , 
                      "ast_grep" , 
                      "emmet_ls" , 
                      "html" ,
                      "eslint", 
                      "powershell_es"
                      }
})


require 'lspconfig'.lua_ls.setup {}
require 'lspconfig'.ast_grep.setup{}
require 'lspconfig'.pylsp.setup{}
require 'lspconfig'.emmet_ls.setup{}
require 'lspconfig'.html.setup{}
require 'lspconfig'.powershell_es.setup{}
require 'lspconfig'.eslint.setup{}
