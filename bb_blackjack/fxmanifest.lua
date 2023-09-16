game 'rdr3'

fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'




client_scripts {
	'config.lua',
  'cl_blackjack.lua',
}


server_scripts {
  'config.lua',
  'sv_blackjack.lua',
}


files {
	'ui/index.html',
	'ui/PNG/*.png',
	'ui/crock.ttf',
	'ui/style.css'
}
ui_page 'ui/index.html'