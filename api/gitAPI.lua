local baseRawUrl = "https://raw.githubusercontent.com/"
local baseApiUrl = "https://api.github.com/"


-- Returns a concatenated base URL for raw file downloads on GitHub
function getRawUrl(owner, repo, branch)
    return fs.combine(baseRawUrl, owner, repo, branch)
end

-- Returns a fileTree using the GitHub API
function getGitTrees(owner, repo, branch)
    local url = baseApiUrl .. "repos/" .. owner .. "/" .. repo .. "/git/trees/" .. branch .. "?recursive=1"
    local resStr = http.get(url)
    local res = textutils.unserializeJSON(resStr.readAll())

    return res
end