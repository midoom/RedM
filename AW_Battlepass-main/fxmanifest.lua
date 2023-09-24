fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"

author 'AxelWarZ'
description 'Valnera Battlepass'
version '2.0.1'

shared_script 'config.lua'

server_scripts {
	'server.lua'
}

client_scripts {
    'client.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/js/script.js',
	'html/css/*.css',
	'html/font/Prototype.ttf',
    'html/img/background.jpg',
    'html/img/items/*.png',
}

