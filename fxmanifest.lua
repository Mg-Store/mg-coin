fx_version "adamant"

description "Mg Store | mg-coin"
author "MG"
version "1.0.0"
lua54 "yes"
game "gta5"

escrow_ignore { 
    "Settings.lua"
}

shared_script '@ox_lib/init.lua'

client_script {
    'Settings.lua',
    'client/client.lua',
}

server_script {
    'server/server.lua'
}
