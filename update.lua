-- Settings for location of the Repo
local owner = "Gaby4545"
local repo = "ComputerCraftRemoteDL"
local branch = "main"

-- Download from GitHub then Reboot
function update()
    shell.run("gitdownload", owner, repo, branch)

    print("Rebooting!")
    shell.run("reboot")
end

update()