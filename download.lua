--url = "https://example.tweaked.cc"
local url = "https://raw.githubusercontent.com/Gaby4545/ComputerCraftRemoteDL/main/launch.lua"
local res = http.get(url)


local file = fs.open("launch.lua", "w")
file.write(request)
file.close()