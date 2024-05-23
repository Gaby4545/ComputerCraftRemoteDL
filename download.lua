local baseUrl = "https://raw.githubusercontent.com/Gaby4545/ComputerCraftRemoteDL/main/"

function downloadFile(baseUrl, filePath)
    local url = baseUrl .. filePath
    print("Downloading : " .. url)
    local res = http.get(url)

    if (res == "" or res == nil) return nil

    local file = fs.open(filePath, "w")
    file.write(res.readAll())
    file.close()
end

downloadFile(baseUrl, "download.lua")
downloadFile(baseUrl, "launch.lua")

shell.run("launch")