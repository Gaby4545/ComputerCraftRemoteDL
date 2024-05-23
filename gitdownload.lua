require("download")
require("gitAPI")

local args = {...}

/**
 * Uses the gitHub API for getting a tree of the Repo then downloads each file
 */
function downloadRepo(owner, repo, branch)
    local trees = getGitTrees(owner, repo, branch)
    if trees == nil then
        print("Could not retrieve fileTree from API")
        return nil
    end

    for k, v in pairs(trees) do
        if k == "tree" then
            for k2, v2 in pairs(v) do
                local path = v2["path"]

                downloadFile(getRawUrl(owner, repo, branch), path) 
            end
        end
    end
end


function main(args)
    downloadRepo(args[1], args[2], args[3])
end
main(args)

-- gitdownload Gaby4545 ComputerCraftRemoteDL main
