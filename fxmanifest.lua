fx_version 'cerulean'
game 'gta5'

author 'DEV-TILT'
discord 'https://discord.gg/NsgmZaTPa7'
github 'https://github.com/DEV-TILT/'
version '1.4'

shared_scripts {
    "configs/**.lua"
}

server_script {
    "server/**.lua"
}

client_script {
    "client/**.lua"
}

escrow_ignore {
    "configs/**.lua",
    "README.lua"
}

files {
    'stream/prop_cs_shopping_bag.ydr'
}

dependencies {
    'qb-core',
    'qb-target'
}

lua54 'yes'
this_is_a_map 'yes'
