local options = {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "fish",
        -- "go",
        -- "gomod",
        -- "gosum",
        -- "gotmpl",
        -- "gowork",
        -- "haskell",
        "lua",
        "luadoc",
        -- "make",
        "markdown",
        -- "odin",
        "printf",
        -- "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        --web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "svelte",
        "java",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
    autotag = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
