local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
	return
end

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})

-- Virtual Text{{{
local types = require("luasnip.util.types")
ls.config.set_config({
	history = true, --keep around last snippet local to jump back
	updateevents = "TextChanged,TextChangedI", --update changes as you type
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "GruvboxOrange" } },
			},
		},
		-- [types.insertNode] = {
		-- 	active = {
		-- 		virt_text = { { "●", "GruvboxBlue" } },
		-- 	},
		-- },
	},
}) --}}}

-- Key Maps
vim.keymap.set({ "i", "s" }, "<a-p>", function()
	if ls.expand_or_jumpable() then
		ls.expand()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<a-k>", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<a-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<a-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<a-h>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)
