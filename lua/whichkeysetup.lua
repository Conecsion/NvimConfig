local wk = require("which-key")
-- wk.register({
-- 	w = { "<cmd>w<cr>", "Save" },
-- 	q = { "<cmd>quit<cr>", "Quit" },
-- 	j = {
-- 	    name = 'Easy Motion',
-- 	    w = { '<cmd>HopWord<cr>', 'By Word' },
-- 	    l = { '<cmd>HopVertical<cr>', 'By Line' },
-- 	    a = { '<cmd>HopAnywhere<cr>', 'Anywhere' },
-- 	},
--
--     {
-- 	    mode = "n",
--     },
--
-- })


-- wk.register({
-- 	["<leader>"] = {
-- 		    j = {
-- 			    name = 'Easy Motion',
-- 			    w = { '<cmd>HopWord<cr>', 'By Word' },
-- 		    },
-- 	    },
--     {
-- 	    mode = "v",
--     },
-- })


wk.register({
  j = {
    name = 'Easy Motion',
    w = { '<cmd>HopWord<cr>', 'By Word' },
    l = { '<cmd>HopVertical<cr>', 'By Line' },
    a = { '<cmd>HopAnywhere<cr>', 'Anywhere' },
  },
  w = { '<cmd>w<cr>', 'Save' },
  q = { '<cmd>q<cr>', 'Quit' },

  f = {
    name = 'Telescope',
    f = { '<cmd>Telescope find_files<cr>', 'Find Files' },
    b = { '<cmd>Telescope buffers<cr>', 'Find Buffers' },
    g = { '<cmd>Telescope live_grep<cr>', 'ripgrep' },
    h = { '<cmd>Telescope help_tags<cr>', 'Help Tags' },
    n = { '<cmd>Telescope notify<cr>', 'Notify history' },
  },

  e = { '<cmd>NvimTreeToggle<cr>', 'Toggle Nvim Tree' },
},
  { prefix = "<leader>", mode = "n" }
)


wk.register({
  j = {
    name = 'Easy Motion',
    w = { '<cmd>HopWord<cr>', 'By Word' },
    l = { '<cmd>HopVertical<cr>', 'By Line' },
    a = { '<cmd>HopAnywhere<cr>', 'Anywhere' },
  }
},
  { prefix = "<leader>", mode = "v" }
)

