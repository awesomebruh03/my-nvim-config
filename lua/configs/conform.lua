local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        go = { "gofumpt", "goimports-reviser", "golines" },
        -- haskell = { "fourmolu", "stylish-haskell" },
        python = { "isort", "black" },
        -- web dev
        svelte = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        java = { "google-java-format" },
    },

    formatters = {
        -- C & C++
        ["clang-format"] = {
            prepend_args = {
                [[-style={
                        IndentWidth: 4,
                        TabWidth: 4,
                        UseTab: Never,
                        AccessModifierOffset: 0,
                        IndentAccessModifiers: true,
                        PackConstructorInitializers: Never}]], -- Corrected: Used [[...]] for multi-line string
            },
        },
        -- Golang
        ["goimports-reviser"] = {
            prepend_args = { "-rm-unused" },
        },
        golines = {
            prepend_args = { "--max-len=80" },
        },
        -- Lua
        stylua = {
            prepend_args = {
                "--column-width",
                "80",
                "--line-endings",
                "Unix",
                "--indent-type",
                "Spaces",
                "--indent-width",
                "4",
                "--quote-style",
                "AutoPreferDouble",
            },
        },
        -- Python
        black = {
            prepend_args = {
                "--fast",
                "--line-length",
                "80",
            },
        },
        isort = {
            prepend_args = {
                "--profile",
                "black",
            },
        },
        ["google-java-format"] = {
            prepend_args = { "--aosp" },
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 5000,
        lsp_fallback = true,
    },
}

require("conform").setup(options)
