local colors = require('colors')
local icons = require('devicons')

local api = vim.api
local M = {}

-- spacer to put in-between sections
local spacer = ' '

-- Vim mode identifiers
local current_mode = setmetatable({
      ['c'] = 'COMMAND',
      ['ce'] = 'EX',
      ['cv'] = 'VIM EX',
      ['i'] = 'INSERT',
      ['ic'] = 'INSERT',
      ['ix'] = 'INSERT',
      ['n'] = 'NORMAL',
      ['no'] = 'N·Operator Pending',
      ['r'] = 'PROMPT',
      ['rm'] = 'MORE',
      ['r?'] = 'CONFIRM',
      ['R'] = 'REPLACE',
      ['Rv'] = 'V·REPLACE',
      ['s'] = 'SELECT',
      ['S'] = 'S·LINE',
      ['^S'] = 'S·BLOCK',
      ['t'] = 'TERMINAL',
      ['v'] = 'VISUAL',
      ['V'] = 'V·LINE',
      ['^V'] = 'V·BLOCK',
      ['!'] = 'SHELL',
    }, {
      -- can't identify v blocks properly, but it's the only one I use that I can't flag
      -- so just assume it's that if this check fails
      __index = function(_, _)
        return 'V·BLOCK'
      end
    }
)

-- get an icon with a fallback to flag when values aren't set in devicons
local get_icon = function(filetype)
  local icon = icons.deviconTable[filetype]
  if icon == nil then
    icon = "🤷"
  end

  return icon
end

-- get colors for different modes
local get_mode_colors = function(mode)
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

  return mode_bg, mode_fg

end

-- create string to use for tabs in the tab bar
local get_tab_label = function(n)
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

  local icon = get_icon(file_name)
  return icon..' '..file_name
end

-- get counter value and apply padding to stop jumping around when navigating
local pad_counter = function(counter)
  local val = api.nvim_call_function(counter, {"."})
  while string.len(val) < 3 do
    val = ' '..val
  end
  return val
end

-- function to output create a new pill on the status line
local pill = function(pill_name, text, bg_color, fg_color, bold)
  local gui_string = ""
  if bold == true then
    gui_string = " gui=bold"
  end
  api.nvim_command("hi "..pill_name.." guibg="..bg_color.." guifg="..fg_color..gui_string)

  local left = ""
  local right = ""

  if bg_color ~= "None" then
    api.nvim_command("hi "..pill_name.."Separator guifg="..bg_color)
    left = "%#"..pill_name.."Separator#"
    right = "%#"..pill_name.."Separator#"
  end
  return left.."%#"..pill_name.."#"..text..right
end

-- draw the active buffer status line
function M.activeLine()
  local statusline = ""
  local filetype = api.nvim_buf_get_option(0, 'filetype')
  -- if it's NERDTree don't bother with full status line
  if filetype == "nerdtree" then
    return ""
  end

  -- mode indicator
  local mode = current_mode[api.nvim_get_mode()['mode']]
  local mode_bg, mode_fg = get_mode_colors(mode)
  statusline = statusline..pill("MODE", mode, mode_bg, mode_fg, true)..spacer

  -- current file indicator
  local file_name = api.nvim_call_function('expand', {'%F'})
  if file_name ~= nil or file_name == "" then
    statusline = statusline..pill("FILE", file_name, colors.black, colors.white, true)..spacer
  end

  -- left align
  statusline = statusline.."%="

  -- local lsp_function = vim.b.lsp_current_function
  -- if lsp_function ~= nil then
  --   statusline = statusline.."%#Function# "..lsp_function
  -- end

  -- file type indicator
  local icon = get_icon(filetype)
  statusline = statusline..pill("FILETYPE", icon..spacer..filetype, "None",  colors.purple, false)..spacer

  -- row and column counter
  local line = pad_counter("line")
  local col = pad_counter("col")
  statusline = statusline..pill("LINE", "ℓ"..line..":𝚌"..col, mode_bg, mode_fg, false)

  return statusline
end

function M.inActiveLine()
  -- local file_name = api.nvim_call_function('expand', {'%F'})
  -- return "%#InActive# "..file_name
  return ""
end

function M.TabLine()
  local tabline = spacer
  local tab_list = api.nvim_list_tabpages()
  local current_tab = api.nvim_get_current_tabpage()

  for _, val in ipairs(tab_list) do
    local file_name = get_tab_label(val)
    if val == current_tab then
      tabline = tabline..pill("SELECTEDTAB", file_name, colors.black, colors.white, true)..spacer
    else
      tabline = tabline..pill("UNSELECTEDTAB", file_name, "None", colors.white, false)..spacer
    end
  end

  return tabline
end

return M
