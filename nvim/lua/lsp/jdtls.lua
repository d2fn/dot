local M = {}

function M:setup()
	-- See `:help vim.lsp.start` for an overview of the supported `config` options.
	local config = {
		name = "jdtls",


		-- `cmd` defines the executable to launch eclipse.jdt.ls.
		-- `jdtls` must be available in $PATH and you must have Python3.9 for this to work.
		--
		-- As alternative you could also avoid the `jdtls` wrapper and launch
		-- eclipse.jdt.ls via the `java` executable
		-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
		cmd = {"jdtls"},


		-- `root_dir` must point to the root of your project.
		-- See `:help vim.fs.root`
		root_dir = vim.fs.root(0, {'gradlew', '.git', 'settings.gradle'}),


		-- Here you can configure eclipse.jdt.ls specific settings
		-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
		-- for a list of options

		settings = {
			java = {
				imports = {
					gradle = {
						wrapper = {
							checksums = {
								{ sha256 = "81a82aaea5abcc8ff68b3dfcb58b3c3c429378efd98e7433460610fecd7ae45f", allowed = true },
							}
						}
					}
				},
				configuration = {
					runtimes = {
						{
							name = "JavaSE-24",
							path = "/home/d/.sdkman/candidates/java/24.0.2-oracle",
							default = true,
						}
					}
				}
			}
		},

		-- This sets the `initializationOptions` sent to the language server
		-- If you plan on using additional eclipse.jdt.ls plugins like java-debug
		-- you'll need to set the `bundles`
		--
		-- See https://codeberg.org/mfussenegger/nvim-jdtls#java-debug-installation
		--
		-- If you don't plan on any eclipse.jdt.ls plugins you can remove this
		init_options = {
			bundles = {}
		},
	}
	require("jdtls").start_or_attach(config)
end

return M

