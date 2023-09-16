fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

author 'Dietrich | TWH-Scripts' -- https://discord.gg/8KwVa7NYKW
description 'Lottery and scratchcard system'

client_script {
	"client/*.lua",
}
server_script {
	"server/*.lua"
}
shared_scripts {
    'config.lua',
    'locale.lua',
    'languages/*.lua'
}

ui_page("html/index.html")

files {
	"html/scripts.js",
	"html/img/*.jpg",
	"html/img/*.png",
	"html/font/*.ttf",
	"html/styles.css",
    "html/index.html",
}
