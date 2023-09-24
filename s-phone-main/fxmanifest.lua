fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'
lua54 'yes'
version '0.0.2'
author 'huzurweriN'

client_scripts {
   'client/main.lua',
   'client/functions.lua',
   'client/menuSetup.lua',
}

server_scripts {
   '@oxmysql/lib/MySQL.lua',
   'server/main.lua',
}

shared_scripts {
   'shared/config.lua',
   'locale.lua',
   'languages/*.lua'
}

files {
   'images/phone.png',
 }

dependencies { 
    'vorp_core',
    'xsound'
}

