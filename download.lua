-- Downloads a file from a baseURL and a path
function downloadFile(baseURL, filePath)
    local url = baseURL .. filePath
    local res = http.get(url)

    if res == "" or res == nil then return nil end

    local file = fs.open(filePath, "w")
    file.write(res.readAll())
    file.close()
end