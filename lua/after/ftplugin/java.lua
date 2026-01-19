local jdtls = require("jdtls")
local lsp_utils = require("nvchad.configs.lspconfig")

local root_markers = { "gradlew", "build.gradle", "pom.xml", ".git" }
local root_dir = jdtls.setup.find_root(root_markers)

-- Dynamic workspace name based on project folder
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data")
    .. "/site/java/workspace-root/"
    .. project_name

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
    cmd = {
        "jdtls", -- Assumes 'jdtls' is in your $PATH (Mason does this)
        "-data",
        workspace_dir,
    },
    root_dir = root_dir,
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = "/usr/lib/jvm/java-21-openjdk/",
                        default = true,
                    },
                },
            },
        },
    },
    -- Use your existing NvChad handlers
    on_attach = lsp_utils.on_attach,
    capabilities = lsp_utils.capabilities,
    init_options = {
        extendedClientCapabilities = extendedClientCapabilities,
    },
}

jdtls.start_or_attach(config)
jdtls.start_or_attach(config)
