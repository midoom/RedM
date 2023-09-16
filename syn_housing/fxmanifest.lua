fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

game "rdr3"

client_script {'config.lua', 'doorhashes.lua','client.lua'}
server_script {'config.lua', 'server.lua'}

escrow_ignore {
	'config.lua',
	'doorhashes.lua',
	'client.lua',
}
dependency '/assetpacks'