-- This file is a self contained downloader for ease of install using pastebin
-- https://pastebin.com/6cadS8nS
-- pastebin get 6cadS8nS install.lua

local baseRawUrl = "https://raw.githubusercontent.com/"
local baseApiUrl = "https://api.github.com/"

-- Settings for location of the Repo
local owner = "Gaby4545"
local repo = "ComputerCraftRemoteDL"
local branch = "main"

-- Returns a concatenated base URL for raw file downloads on GitHub
function getRawUrl(owner, repo, branch)
    return baseRawUrl .. "" .. owner .. "/" .. repo .. "/" .. branch .. "/"
end

-- Returns a fileTree using the GitHub API
function getGitTrees(owner, repo, branch)
    local url = baseApiUrl .. "repos/" .. owner .. "/" .. repo .. "/git/trees/" .. branch .. "?recursive=1"
    local resStr = http.get(url)
    local res = textutils.unserializeJSON(resStr.readAll())

    return res
end

-- Downloads a file from a baseURL and a path
function downloadFile(baseURL, filePath)
    local url = baseURL .. filePath
    local res = http.get(url)

    if res == "" or res == nil then return nil end

    local file = fs.open(filePath, "w")
    file.write(res.readAll())
    file.close()
end

-- Uses the gitHub API for getting a tree of the Repo then downloads every file
function downloadRepo(owner, repo, branch)
    print("Downloading from GitHub branch " .. branch .. " of Repo " .. owner .. "/" .. repo )

    local trees = getGitTrees(owner, repo, branch)
    if trees == nil then
        print("Could not retrieve fileTree from API")
        return nil
    end

    for k, v in pairs(trees["tree"]) do
        local path = v["path"]
        print("Downloading: ../" .. path)
        downloadFile(getRawUrl(owner, repo, branch), path)
    end
end

-- Download from GitHub then Reboot
function install()
    downloadRepo(owner, repo, branch)

    print("Rebooting!")
    shell.run("reboot")
end

install()