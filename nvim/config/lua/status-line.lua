local api = vim.api
local colors = require('colors')
local icons = require('devicons')
local M = {}

-- Separators
local left_separator = ''
local right_separator = ''

-- Blank Between Components
local blank = ' '

------------------------------------------------------------------------
--                             StatusLine                             --
------------------------------------------------------------------------

-- Mode Prompt Table
local current_mode = setmetatable({
      ['n'] = 'NORMAL',
      ['no'] = 'N·Operator Pending',
      ['v'] = 'VISUAL',
      ['V'] = 'V·LINE',
      ['^V'] = 'V·BLOCK',
      ['s'] = 'SELECT',
      ['S'] = 'S·LINE',
      ['^S'] = 'S·BLOCK',
      ['i'] = 'INSERT',
      ['ic'] = 'INSERT',
      ['ix'] = 'INSERT',
      ['R'] = 'REPLACE',
      ['Rv'] = 'V·REPLACE',
      ['c'] = 'COMMAND',
      ['cv'] = 'VIM EX',
      ['ce'] = 'EX',
      ['r'] = 'PROMPT',
      ['rm'] = 'MORE',
      ['r?'] = 'CONFIRM',
      ['!'] = 'SHELL',
      ['t'] = 'TERMINAL'
    }, {
      -- fix weird issues
      __index = function(_, _)
        return 'V·BLOCK'
      end
    }
)

-- Filename Color
api.nvim_command('hi File guibg='..colors.white..' guifg='..colors.purple..' gui=bold')
api.nvim_command('hi FileSeparator guifg='..colors.white)

-- Working directory Color
api.nvim_command('hi Directory guibg='..colors.black..' guifg='..colors.white..' gui=bold')
api.nvim_command('hi DirSeparator guifg='..colors.black)

-- FileType Color
api.nvim_command('hi Filetype guibg=None guifg='..colors.purple)

-- Redraw different colors for different mode
local RedrawColors = function(mode)
  local mode_bg = colors.black
  local mode_fg = colors.white

  if mode == "NORMAL" then
    mode_bg = colors.green
    mode_fg = colors.black
  end
  if mode == "INSERT" then
    mode_bg = colors.blue
    mode_fg = colors.black
  end
  if mode == "VISUAL" or mode == "V·LINE" or mode == "V·BLOCK" then
    mode_bg = colors.purple
    mode_fg = colors.black
  end
  if mode == "COMMAND" then
    mode_bg = colors.dark_yellow
    mode_fg = colors.black
  end
  if mode == "REPLACE" or mode == "V·REPLACE" then
    mode_bg = colors.red
    mode_fg = colors.black
  end

  api.nvim_command('hi Mode guibg='..mode_bg..' guifg='..mode_fg..' gui=bold')
  api.nvim_command('hi ModeSeparator guifg='..mode_bg)
  api.nvim_command('hi Line guibg='..mode_bg..' guifg='..mode_fg)
  api.nvim_command('hi LineSeparator guifg='..mode_bg)
end

function M.activeLine()
  local statusline = ""
  -- Component: Mode
  local mode = current_mode[api.nvim_get_mode()['mode']]
  RedrawColors(mode)
  statusline = statusline.."%#ModeSeparator#"..left_separator.."%#Mode# "..mode.." %#ModeSeparator#"..right_separator
  statusline = statusline..blank

  -- Component: Current file
  local file_name = api.nvim_call_function('expand', {'%F'})
  statusline = statusline.."%#DirSeparator#"..left_separator.."%#Directory# "..file_name.." %#DirSeparator#"..right_separator

  -- Alignment to left
  statusline = statusline.."%="

  -- local lsp_function = vim.b.lsp_current_function
  -- if lsp_function ~= nil then
  --   statusline = statusline.."%#Function# "..lsp_function
  -- end

  -- Component: FileType
  local filetype = api.nvim_buf_get_option(0, 'filetype')
  local icon = icons.deviconTable[filetype]
  if icon == nil then
    icon = "🤷"
  end

  statusline = statusline.."%#Filetype#"..icon..blank..filetype
  statusline = statusline..blank

  -- Component: row and col
  local line = api.nvim_call_function('line', {"."})
  while string.len(line) < 3 do
    line = ' '..line
  end
  local col = api.nvim_call_function('col', {"."})
  while string.len(col) < 3 do
    col = ' '..col
  end
  statusline = statusline.."%#LineSeparator#"..left_separator.."%#Line#ℓ"..line..":𝚌"..col.."%#LineSeparator#"..right_separator

  return statusline
end

api.nvim_command('hi InActive guibg=None guifg='..colors.white)

function M.inActiveLine()
  -- local file_name = api.nvim_call_function('expand', {'%F'})
  -- return "%#InActive# "..file_name
  return ""
end

------------------------------------------------------------------------
--                              TabLine                               --
------------------------------------------------------------------------

local getTabLabel = function(n)
  local current_win = api.nvim_tabpage_get_win(n)
  local current_buf = api.nvim_win_get_buf(current_win)
  local file_name = api.nvim_buf_get_name(current_buf)
  if string.find(file_name, 'term://') ~= nil then
    return ' '..api.nvim_call_function('fnamemodify', {file_name, ":p:t"})
  end
  file_name = api.nvim_call_function('fnamemodify', {file_name, ":p:t"})
  if file_name == '' then
    return "No Name"
  end
  local icon = icons.deviconTable[file_name]
  if icon ~= nil then
    return icon..' '..file_name
  end
  return file_name
end

api.nvim_command('hi TabLineSel gui=Bold guibg=#81A1C1 guifg=#292929')
api.nvim_command('hi TabLineSelSeparator gui=bold guifg=#81A1C1')
api.nvim_command('hi TabLine guibg=#4d4d4d guifg=#c7c7c7 gui=None')
api.nvim_command('hi TabLineSeparator guifg=#4d4d4d')
api.nvim_command('hi TabLineFill guibg=None gui=None')


function M.TabLine()
  local tabline = ''
  local tab_list = api.nvim_list_tabpages()
  local current_tab = api.nvim_get_current_tabpage()
  for _, val in ipairs(tab_list) do
    local file_name = getTabLabel(val)
    if val == current_tab then
      tabline = tabline.."%#TabLineSelSeparator# "..left_separator
      tabline = tabline.."%#TabLineSel# "..file_name
      tabline = tabline.." %#TabLineSelSeparator#"..right_separator
    else
      tabline = tabline.."%#TabLineSeparator# "..left_separator
      tabline = tabline.."%#TabLine# "..file_name
      tabline = tabline.." %#TabLineSeparator#"..right_separator
    end
  end
  return tabline
end
return M
