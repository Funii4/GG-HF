resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

client_scripts {
    'clientconfig.lua',
    'client.lua'
}

server_scripts {
    'serverconfig.lua',
    'server.lua',
    "@mysql-async/lib/MySQL.lua"
}