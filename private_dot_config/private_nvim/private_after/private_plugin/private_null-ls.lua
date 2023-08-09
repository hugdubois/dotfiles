require("null-ls").setup({
	debug = true,
	sources = {
        require("null-ls").builtins.formatting.goimports.with({
            extra_args = function(params)
                local cmd = string.format("head -1 %s/go.mod | awk '{print $2}'", params.root)
                local output = vim.split(vim.fn.system(cmd), "\n")[1]
                return { "-v", "-local", output }
            end,
        })
	},
})
