game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Skate'
description 'Put Bucket on Somebody else Head'
version '1.0'

client_script {
    'client.lua'
}

server_script {
    'server.lua'    
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/assets/images/bucket.jpg',
	'html/assets/css/style.css',
	'html/assets/js/jquery.js',
	'html/assets/js/init.js',
}