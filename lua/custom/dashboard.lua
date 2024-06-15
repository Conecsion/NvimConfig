local opt = {}
opt.theme = 'doom'
opt.config = {
  week_header = {
    enable = true,
  },
  disable_move = true,
    center = {
      {
        icon = '󰈞 ',
        -- icon_hl = 'Title',
        desc = 'Find File           ',
        -- desc_hl = 'String',
        key = 'f',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'Telescope find_files'
      },
      {
        icon = ' ',
        desc = 'Grep',
        key = 'g',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'Telescope live_grep'
      },
      {
        icon = ' ',
        desc = 'Recent Files',
        key = 'r',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'Telescope oldfiles'
      },
      {
        icon = ' ',
        desc = 'Quit',
        key = 'q',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'quit'
      },
    },
    footer = {}  --your footer
}
opt.hide = {
  -- statusline = true,
  -- tabline = true,
  -- winbar = true,
}

-- opt.preview = {
--   command = 'catimg',
--   file_path = '/home/shaodi/Downloads/amiya.png',
--   file_width = 50,
--   file_height = 50,
-- }


return opt
