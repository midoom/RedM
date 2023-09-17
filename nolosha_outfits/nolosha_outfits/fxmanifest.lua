fx_version "cerulean"

description "Outfits as items in player VORP inventory"
author "Lezd"
version '1.0.0'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

games {
  "rdr3"
}

client_script "client.lua"
server_script "server.lua"

shared_scripts {
  'config.lua',
}