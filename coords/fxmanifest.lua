--resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"
fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
    'qalle-coords.lua',
    'eclipse-client.lua'
} 

ui_page "html/index.html"

files {
    'html/index.html',
    'html/index.js',
    'html/style.css'
}