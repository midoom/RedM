fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

server_scripts {

	'server/main.lua'
}

shared_script 'config.lua'

client_scripts {
	'client/main.lua'
}

dependencies { 
    'vorp_core',
    'vorp_character',
    'vorp_inventory',
    'lockpick'
}
