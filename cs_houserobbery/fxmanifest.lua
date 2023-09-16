fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Skate'
description 'St-Denis House Robbery'
version '1.0'

server_scripts {
	'config.lua',
	'server.lua'
}

client_scripts {
	'config.lua',
	'client.lua'
}

ui_page('index.html')

files({
'index.html',
'scripts.js',
"css/style.css"
})

export "taskBar"
export "closeGuiFail"