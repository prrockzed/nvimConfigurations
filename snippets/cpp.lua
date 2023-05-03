local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("CP Snippets", { clear = true })
local file_pattern = "*.cpp"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --

local snip = s("snip", {
	t({ "#include <algorithm>", "" }),
	t({ "#include <iostream>", "" }),
	t({ "#include <math.h>", "" }),
	t({ "#include <string>", "" }),
	t({ "#include <tuple>", "" }),
	t({ "#include <utility>", "" }),
	t({ "#include <vector>", "" }),
	t({ "#include <set>", "", "" }),
	t({ "#define fastio                                                                 \\", "" }),
	t({ "  ios::sync_with_stdio(0);                                                     \\", "" }),
	t({ "  cin.tie(0);                                                                  \\", "" }),
	t({ "  cout.tie(0);", "" }),
	t({ "#define ll long long", "" }),
	t({ "#define li long int", "" }),
	t({ "#define ld long double", "" }),
	t({ "#define vi vector<int>", "" }),
	t({ "#define vii vector<int, int>", "" }),
	t({ "#define vis vector<int, string>", "" }),
	t({ "#define PB(a) push_back(a)", "" }),
	t({ "#define MP(a, b) make_pair(a, b)", "" }),
	t({ "#define PR pair<int, int>", "" }),
	t({ "#define F first", "" }),
	t({ "#define S second", "" }),
	t({ "#define loop(i, n) for (int i = 0; i < n; i++)", "" }),
	t({ "#define loopr(i, a, n) for (int i = a; i >= n; i--)", "" }),
	t({ "#define loops(i, a, n, step) for (int i = a; i < n; i += step)", "" }),
	t({ "#define looprs(i, a, n, step) for (int i = a; i >= n; i -= step)", "", "" }),
	t({ "using namespace std;", "", "" }),
	t({ "void solve() {", "  " }),
	i(1, "// Your Code Here"),
	t({ "", "}", "", "" }),
	t({ "int main() {", "" }),
	t({ "  fastio;", "" }),
	t({ "  int t = 1;", "" }),
	t({ "  cin >> t;", "" }),
	t({ "  while (t--) {", "" }),
	t({ "    solve();", "" }),
	t({ "  }", "", "" }),
	t({ "  return 0;", "" }),
	t("}"),
})
table.insert(snippets, snip)

-- End Refactoring --

return snippets, autosnippets
