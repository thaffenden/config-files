--[[
source: https://github.com/kyazdani42/nvim-web-devicons/blob/master/lua/nvim-web-devicons.lua
Ones I don't currently need - kept here just in case, but removed from table so they don't have to get loaded every time:
  ["gruntfile"] = {
    icon = "",
    color = "#e37933",
    name = "Gruntfile"
  },
  ["gulpfile"] = {
    icon = "",
    color = "#cc3e44",
    name = "Gulpfile"
  },
  [".gitlab-ci.yml"] = {
    icon = "",
    color = "#e24329",
    name = "GitlabCI"
  };
  ["coffee"] = {
    icon = "",
    color = "#cbcb41",
    name = "Coffee",
  };
  ["dropbox"] = {
    icon = "",
    color = "#0061FE",
    name = "Dropbox",
  },
  ["xls"] = {
    icon = "",
    color = "#207245",
    name = "Xls",
  },
  ["doc"] = {
    icon = "",
    color = "#185abd",
    name = "Doc",
  },
  ["ppt"] = {
    icon = "",
    color = "#cb4a32",
    name = "Ppt",
  },
  ["procfile"] = {
    icon = "",
    color = "#a074c4",
    name = "Procfile"
  },
  ["COMMIT_EDITMSG"] = {
    icon = "",
    color = "#41535b",
    name = "GitCommit"
  };
  [".gvimrc"] = {
    icon = "",
    color = "#019833",
    name = "Gvimrc"
  };
  ["haml"] = {
    icon = "",
    color = "#eaeae1",
    name = "Haml",
  };
  ["hbs"] = {
    icon = "",
    color = "#f0772b",
    name = "Hbs",
  };
  ["hh"] = {
    icon = "",
    color = "#a074c4",
    name = "Hh",
  };
  ["hpp"] = {
    icon = "",
    color = "#a074c4",
    name = "Hpp",
  };
  ["hrl"] = {
    icon = "",
    color = "#B83998",
    name = "Hrl",
  };
  ["kt"] = {
    icon = "𝙆",
    color = "#F88A02",
    name = "Kotlin"
  };
  ["ksh"] = {
    icon = "",
    color = "#4d5a5e",
    name = "Ksh",
  };
  ["leex"] = {
    icon = "",
    color = "#a074c4",
    name = "Leex",
  };
  ["less"] = {
    icon = "",
    color = "#563d7c",
    name = "Less",
  };
  ["lhs"] = {
    icon = "",
    color = "#a074c4",
    name = "Lhs",
  };
  ["mdx"] = {
    icon = "",
    color = "#519aba",
    name = "Mdx",
  };
  ["mix.lock"] = {
    icon = "",
    color = "#a074c4",
    name = "MixLock"
  };
  ["mjs"] = {
    icon = "",
    color = "#f1e05a",
    name = "Mjs",
  };
  ["ml"] = {
    icon = "λ",
    color = "#e37933",
    name = "Ml"
  };
  ["Gemfile$"] = {
    icon = "",
    color = "#701516",
    name = "Gemfile"
  };
  ["xcplayground"] = {
    icon = "",
    color = "#e37933",
    name = "XcPlayground",
  };
  ["xul"] = {
    icon = "",
    color = "#e37933",
    name = "Xul"
  };
  ["edn"] = {
    icon = "",
    color = "#519aba",
    name = "Edn",
  };
  ["eex"] = {
    icon = "",
    color = "#a074c4",
    name = "Eex",
  };
  ["ejs"] = {
    icon = "",
    color = "#cbcb41",
    name = "Ejs",
  };
  ["elm"] = {
    icon = "",
    color = "#519aba",
    name = "Elm",
  };
  ["erl"] = {
    icon = "",
    color = "#B83998",
    name = "Erl",
  };
  ["ex"] = {
    icon = "",
    color = "#a074c4",
    name = "Ex",
  };
  ["exs"] = {
    icon = "",
    color = "#a074c4",
    name = "Exs",
  };
  ["f#"] = {
    icon = "",
    color = "#519aba",
    name = "Fsharp"
  };
  ["fs"] = {
    icon = "",
    color = "#519aba",
    name = "Fs",
  };
  ["fsi"] = {
    icon = "",
    color = "#519aba",
    name = "Fsi",
  };
  ["fsscript"] = {
    icon = "",
    color = "#519aba",
    name = "Fsscript",
  };
  ["fsx"] = {
    icon = "",
    color = "#519aba",
    name = "Fsx",
  };
  ["gemspec"] = {
    icon = "",
    color = "#701516",
    name = "Gemspec",
  };
  ["h"] = {
    icon = "",
    color = "#a074c4",
    name = "H",
  };
  ["hs"] = {
    icon = "",
    color = "#a074c4",
    name = "Hs",
  };
  ["jl"] = {
    icon = "",
    color = "#a270ba",
    name = "Jl",
  };
  ["mli"] = {
    icon = "λ",
    color = "#e37933",
    name = "Mli",
  };
  ["mustache"] = {
    icon = "",
    color = "#e37933",
    name = "Mustache",
  };
  ["nix"] = {
    icon = "",
    color = "#7ebae4",
    name = "Nix",
  };
  ["php"] = {
    icon = "",
    color = "#a074c4",
    name = "Php"
  };
  ["pl"] = {
    icon = "",
    color = "#519aba",
    name = "Pl"
  };
  ["pm"] = {
    icon = "",
    color = "#519aba",
    name = "Pm"
  };
  ["psb"] = {
    icon = "",
    color = "#519aba",
    name = "Psb"
  };
  ["psd"] = {
    icon = "",
    color = "#519aba",
    name = "Psd"
  };
  ["r"] = {
    icon = "ﳒ",
    color = "#358a5b",
    name = "R"
  };
  ["rake"] = {
    icon = "",
    color = "#701516",
    name = "Rake"
  };
  ["rakefile"] = {
    icon = "",
    color = "#701516",
    name = "Rakefile"
  };
  ["rb"] = {
    icon = "",
    color = "#701516",
    name = "Rb"
  };
  ["rlib"] = {
    icon = "",
    color = "#dea584",
    name = "Rlib",
  };
  ["rmd"] = {
    icon = "",
    color = "#519aba",
    name = "Rmd"
  };
  ["rproj"] = {
    icon = "鉶",
    color = "#358a5b",
    name = "Rproj"
  };
  ["rs"] = {
    icon = "",
    color = "#dea584",
    name = "Rs"
  };
  ["twig"] = {
    icon = "",
    color = "#8dc149",
    name = "Twig"
  };
  ["Vagrantfile$"] = {
    icon = "",
    color = "#1563FF",
    name = "Vagrantfile"
  };
  ["t"] = {
    icon = "",
    color = "#519aba",
    name = "Tor"
  };
  ["pp"] = {
    icon = "",
    color = "#302B6D",
    name = "Pp"
  };
  ["_vimrc"] = {
    icon = "",
    color = "#019833",
    name = "Vimrc",
  };
  ["ai"] = {
    icon = "",
    color = "#cbcb41",
    name = "Ai",
  };
  ["_gvimrc"] = {
    icon = "",
    color = "#019833",
    name = "Gvimrc"
  };

-- the rest are all possibly used
]]

local icons = {
  [".babelrc"] = {
    icon = "ﬥ",
    color = "#cbcb41",
    name = "Babelrc"
  };
  [".bashprofile"] = {
    icon = "",
    color = "#89e051",
    name = "BashProfile"
  };
  [".bashrc"] = {
    icon = "",
    color = "#89e051",
    name = "Bashrc"
  };
  [".ds_store"] = {
    icon = "",
    color = "#41535b",
    name = "DsStore"
  };
  [".git"] = {
    icon = "",
    color = "#F14C28",
    name = "GitLogo"
  };
  [".gitattributes"] = {
    icon = "",
    color = "#41535b",
    name = "GitAttributes"
  };
  [".gitconfig"] = {
    icon = "",
    color = "#41535b",
    name = "GitConfig"
  };
  [".gitignore"] = {
    icon = "",
    color = "#41535b",
    name = "GitIgnore"
  };
  [".npmignore"] = {
    icon = "",
    color = "#E8274B",
    name = "NPMIgnore"
  };
  [".settings.json"] = {
    icon = "",
    color = "#854CC7",
    name = "SettingsJson",
  },
  [".vimrc"] = {
    icon = "",
    color = "#019833",
    name = "Vimrc"
  };
  [".zshrc"] = {
    icon = "",
    color = "#89e051",
    name = "Zshrc"
  };
  ["awk"] = {
    icon = "",
    color = "#4d5a5e",
    name = "Awk",
  };
  ["bash"] = {
    icon = "",
    color = "#89e051",
    name = "Bash",
  };
  ["bat"] = {
    icon = "",
    color = "#C1F12E",
    name = "Bat"
  };
  ["bmp"] = {
    icon = "",
    color = "#a074c4",
    name = "Bmp"
  };
  ["c"] = {
    icon = "",
    color = "#599eff",
    name = "C"
  };
  ["c++"] = {
    icon = "",
    color = "#f34b7d",
    name = "CPlusPlus"
  };
  ["cc"] = {
    icon = "",
    color = "#f34b7d",
    name = "CPlusPlus"
  };
  ["clj"] = {
    icon = "",
    color = "#8dc149",
    name = "Clojure",
  };
  ["cljc"] = {
    icon = "",
    color = "#8dc149",
    name = "ClojureC"
  };
  ["cljs"] = {
    icon = "",
    color = "#519aba",
    name = "ClojureJS",
  };
  ["cmakelists.txt"] = {
    icon = "",
    color = "#6d8086",
    name = "CmakeLists"
  };
  ["conf"] = {
    icon = "",
    color = "#6d8086",
    name = "Conf",
  };
  ["config.ru"] = {
    icon = "",
    color = "#701516",
    name = "ConfigRu"
  };
  ["cp"] = {
    icon = "",
    color = "#519aba",
    name = "Cp",
  };
  ["cpp"] = {
    icon = "",
    color = "#519aba",
    name = "Cpp",
  };
  ["cs"] = {
    icon = "",
    color = "#596706",
    name = "Cs",
  },
  ["csh"] = {
    icon = "",
    color = "#4d5a5e",
    name = "Csh",
  };
  ["css"] = {
    icon = "",
    color = "#563d7c",
    name = "Css",
  };
  ["cxx"] = {
    icon = "",
    color = "#519aba",
    name = "Cxx",
  };
  ["d"] = {
    icon = "",
    color = "#427819",
    name = "D",
  };
  ["dart"] = {
    icon = "",
    color = "#03589C",
    name = "Dart",
  };
  ["db"] = {
    icon = "",
    color = "#dad8d8",
    name = "Db",
  };
  ["diff"] = {
    icon = "",
    color = "#41535b",
    name = "Diff",
  };
  ["dockerfile"] = {
    icon = "",
    color = "#384d54",
    name = "Dockerfile",
  };
  ["dump"] = {
    icon = "",
    color = "#dad8d8",
    name = "Dump",
  };
  ["favicon.ico"] = {
    icon = "",
    color = "#cbcb41",
    name = "Favicon"
  };
  ["fish"] = {
    icon = "",
    color = "#4d5a5e",
    name = "Fish",
  };
  ["gif"] = {
    icon = "",
    color = "#a074c4",
    name = "Gif",
  };
  ["git-branch"] = {
    icon = "",
    color = "#ed8a09",
    name = "GitBranch"
  },
  ["go"] = {
    icon = "",
    color = "#519aba",
    name = "Go",
  };
  ["htm"] = {
    icon = "",
    color = "#e34c26",
    name = "Htm",
  };
  ["html"] = {
    icon = "",
    color = "#e34c26",
    name = "Html",
  };
  ["hxx"] = {
    icon = "",
    color = "#a074c4",
    name = "Hxx",
  };
  ["ico"] = {
    icon = "",
    color = "#cbcb41",
    name = "Ico",
  };
  ["ini"] = {
    icon = "",
    color = "#6d8086",
    name = "Ini",
  };
  ["java"] = {
    icon = "",
    color = "#cc3e44",
    name = "Java",
  };
  ["jpeg"] = {
    icon = "",
    color = "#a074c4",
    name = "Jpeg",
  };
  ["jpg"] = {
    icon = "",
    color = "#a074c4",
    name = "Jpg",
  };
  ["js"] = {
    icon = "",
    color = "#cbcb41",
    name = "Js",
  };
  ["json"] = {
    icon = "",
    color = "#cbcb41",
    name = "Json",
  };
  ["jsx"] = {
    icon = "",
    color = "#519aba",
    name = "Jsx",
  };
  ["license"] = {
    icon = "",
    color = "#cbcb41",
    name = "License",
  };
  ["lua"] = {
    icon = "",
    color = "#51a0cf",
    name = "Lua",
  };
  ["makefile"] = {
    icon = "",
    color = "#6d8086",
    name = "Makefile",
  };
  ["markdown"] = {
    icon = "",
    color = "#519aba",
    name = "Markdown",
  };
  ["md"] = {
    icon = "",
    color = "#519aba",
    name = "Md",
  };
  ["node_modules"] = {
    icon = "",
    color = "#E8274B",
    name = "NodeModules",
  };
  ["pdf"] = {
    icon = "",
    color = "#b30b00",
    name = "Pdf"
  };
  ["png"] = {
    icon = "",
    color = "#a074c4",
    name = "Png"
  };
  ["ps1"] = {
    icon = "",
    color = "#4d5a5e",
    name = "PromptPs1"
  };
  ["py"] = {
    icon = "",
    color = "#3572A5",
    name = "Py"
  };
  ["pyc"] = {
    icon = "",
    color = "#519aba",
    name = "Pyc"
  };
  ["pyd"] = {
    icon = "",
    color = "#519aba",
    name = "Pyd",
  };
  ["pyo"] = {
    icon = "",
    color = "#519aba",
    name = "Pyo"
  };
  ["rss"] = {
    icon = "",
    color = "#FB9D3B",
    name = "Rss"
  };
  ["sass"] = {
    icon = "",
    color = "#f55385",
    name = "Sass"
  };
  ["scala"] = {
    icon = "",
    color = "#cc3e44",
    name = "Scala"
  };
  ["scss"] = {
    icon = "",
    color = "#f55385",
    name = "Scss"
  };
  ["sh"] = {
    icon = "",
    color = "#4d5a5e",
    name = "Sh"
  };
  ["slim"] = {
    icon = "",
    color = "#e34c26",
    name = "Slim"
  };
  ["sln"] = {
    icon = "",
    color = "#854CC7",
    name = "Sln"
  };
  ["sql"] = {
    icon = "",
    color = "#dad8d8",
    name = "Sql"
  };
  ["styl"] = {
    icon = "",
    color = "#8dc149",
    name = "Styl"
  };
  ["suo"] = {
    icon = "",
    color = "#854CC7",
    name = "Suo"
  };
  ["svg"] = {
    icon = "ﰟ",
    color = "#FFB13B",
    name = "Svg",
  },
  ["swift"] = {
    icon = "",
    color = "#e37933",
    name = "Swift"
  };
  ["terminal"] = {
    icon = "",
    color = "#31B53E",
    name = "Terminal"
  };
  ["tex"] = {
    icon = "ﭨ",
    color = "#3D6117",
    name = "Tex"
  };
  ["toml"] = {
    icon = "",
    color = "#6d8086",
    name = "Toml"
  };
  ["ts"] = {
    icon = "",
    color = "#519aba",
    name = "Ts"
  };
  ["tsx"] = {
    icon = "",
    color = "#519aba",
    name = "Tsx"
  };
  ["vim"] = {
    icon = "",
    color = "#019833",
    name = "Vim"
  };
  ["vue"] = {
    icon = "﵂",
    color = "#8dc149",
    name = "Vue"
  };
  ["webmanifest"] = {
    icon = "",
    color = "#f1e05a",
    name = "Webmanifest"
  };
  ["webp"] = {
    icon = "",
    color = "#a074c4",
    name = "Webp"
  };
  ["webpack"] = {
    icon = "ﰩ",
    color = "#519aba",
    name = "Webpack",
  },
  ["xml"] = {
    icon = "謹",
    color = "#e37933",
    name = "Xml",
  },
  ["yaml"] = {
    icon = "",
    color = "#6d8086",
    name = "Yaml"
  };
  ["yml"] = {
    icon = "",
    color = "#6d8086",
    name = "Yml"
  };
  ["zsh"] = {
    icon = "",
    color = "#89e051",
    name = "Zsh"
  };
}

local function get_highlight_name(data)
  return data.name and "DevIcon" .. data.name
end

local loaded = false

local default_icon = {
  icon = "",
  color = "#6d8086",
  name = "Default",
}

local function setup(opts)
  loaded = true

  local user_icons = opts or {}

  icons = vim.tbl_extend("force", icons, user_icons.override or {});

  table.insert(icons, default_icon)
  for _, icon_data in pairs(icons) do
    if icon_data.color and icon_data.name then
      local hl_group = get_highlight_name(icon_data)
      if hl_group then
        vim.api.nvim_command("highlight! "..hl_group.. " guifg="..icon_data.color)
      end
    end
  end
end

local function get_icon(name, ext)
  if not loaded then
    setup()
  end

  local icon_data = icons[name]
  local by_name = icon_data and icon_data.icon or nil

  if by_name then
    return by_name, get_highlight_name(icon_data)
  else
    icon_data = icons[ext]

    if not icon_data then
      icon_data = default_icon
    end

    if icon_data then
      local by_ext = icon_data.icon
      return by_ext, get_highlight_name(icon_data)
    end
  end
end

local function get_icon_new(name)
  local icon = icons[name]
  if icon == nil then
    return default_icon.icon
  end

  return icon.icon
end

return {
  get_icon = get_icon,
  get_icon_new = get_icon_new,
  has_loaded = function() return loaded end,
  setup = setup,
}
