function downloadFile(baseUrl, filePath)
    local url = baseUrl .. filePath
    local res = http.get(url)

    if res == "" or res == nil then return nil end

    local file = fs.open(filePath, "w")
    file.write(res.readAll())
    file.close()
end