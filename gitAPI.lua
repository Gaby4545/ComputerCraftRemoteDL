local baseRawUrl = "https://raw.githubusercontent.com/"
local baseApiUrl = "https://api.github.com/"

local owner = "Gaby4545"
local repo = "ComputerCraftRemoteDL"
local branch = "main"


function getRawUrl(owner, repo, branch)
    return baseRawUrl .. "" .. owner .. "/" .. repo .. "/" .. branch .. "/"
end


function getGitTrees(owner, repo, branch)
    local url = baseApiUrl .. "repos/" .. owner .. "/" .. repo .. "/git/trees/" .. branch .. "?recursive=1"
    local resStr = http.get(url)
    local res = textutils.unserializeJSON(resStr.readAll())

    return res
end