require'nvim-treesitter.config'.setup {
	auto_install = true,
	ensure_installed = { 'c', 'lua', 'rust', 'go', 'markdown', 'markdown_inline', 'html', 'css', 'json', 'bash', 'yaml', 'toml' },
	highlight = {
		enable = true,
	},
}
