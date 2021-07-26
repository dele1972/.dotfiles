-- statusline.lua
-- source https://icyphox.sh/blog/nvim-lua/

 local mode_map = {
	['n'] = 'normal ',
	['no'] = 'n·operator pending ',
	['v'] = 'visual ',
	['V'] = 'v·line ',
	[''] = 'v·block ',
	['s'] = 'select ',
	['S'] = 's·line ',
	[''] = 's·block ',
	['i'] = 'insert ',
	['R'] = 'replace ',
	['Rv'] = 'v·replace ',
	['c'] = 'command ',
	['cv'] = 'vim ex ',
	['ce'] = 'ex ',
	['r'] = 'prompt ',
	['rm'] = 'more ',
	['r?'] = 'confirm ',
	['!'] = 'shell ',
	['t'] = 'terminal '
}

--[[
The idea is to get the current mode from vim.api.nvim_get_mode() and map it to our desired text.
Let’s wrap that around in a small mode() function
]]--
local function mode()
	local m = vim.api.nvim_get_mode().mode
	if mode_map[m] == nil then return m end
	return mode_map[m]
end

--[[
Now, set up your highlights. Again, there isn’t any interface for highlights yet, so whip out that vim.api.nvim_exec()
]]--
vim.api.nvim_exec(
[[
  hi PrimaryBlock   ctermfg=06 ctermbg=00
  hi SecondaryBlock ctermfg=08 ctermbg=00
  hi Blanks   ctermfg=07 ctermbg=00
]], false)

--[[
Create a new table to represent the entire statusline itself.
You can add any other functions you want (like one that returns the current git branch, for instance).

Read :h 'statusline' if you don’t understand what’s going on here.
]]--
local stl = {
  '%#PrimaryBlock#',
  mode(),
  '%#SecondaryBlock#',
  '%#Blanks#',
  '%f',
  '%m',
  '%=',
  '%#SecondaryBlock#',
  '%l,%c ',
  '%#PrimaryBlock#',
  '%{&filetype}',
}

--[[
Finally, with the power of table.concat(), set your statusline.
This is akin to doing a series of string concatenations, but way faster.
]]--

vim.o.statusline = table.concat(stl)
