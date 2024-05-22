local request = http.get("https://example.tweaked.cc")
print(request.readAll())

local file = fs.open("out.txt", "w")
file.write(request)
file.close()