local packer = require('packer')
packer.util = require('packer.util')

packer.init({
	git = {
		clone_timeout = 60,
	},
	-- log = { level = 'debug' }
})
