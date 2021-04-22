require('nvim-web-devicons').setup {
 override = {
  ["NERD tree"] = {
    icon = "",
    color = "#428850",
    name = "NERD_tree"
  },
 };
 default = true;
}

require("mappings")
require("status-line")
