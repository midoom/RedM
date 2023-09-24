fx_version "adamant"
games { "rdr3" }

author 'edit by outsider'
lua54 'yes'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

exports {
    'DataViewNativeGetEventData2'
}
server_script { 'server.lua' }

client_scripts { 'client.lua', 'client.js' }

shared_script 'config.lua'
