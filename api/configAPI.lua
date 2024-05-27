
local configPath = "/config/"

local defaultConfigPath = "/config/default/"


function copyDefaultConfig(program, path)
    local originPath = fs.combine(defaultConfigPath, program, path)
    local destPath = fs.combine(configPath, program, path)

    print(originPath)
    print(fs.exists(originPath))

    if fs.exists(originPath) then 
        fs.copy(originPath, destPath)
        return true;
    end

    return false
end

function getConfig(program, path)
    local file = io.open(fs.combine(configPath, program, path))
    print(file)

    local res = nil
    if file ~= nil then
        res = textutils.unserializeJSON(file.readAll())
        file.close()
    else
        file.close()

        if copyDefaultConfig(program, path) then return getConfig(program, path) end

        return res
    end

    return res
end

--function getConfig(path)
--    getConfig(shell.getRunningProgram(), path)
--end

--function getConfig()
    -- getConfig(shell.getRunningProgram())
--end


function setConfig(program, path, value)
    -- local file = io.open(fs.combine(configPath, program, path))
    -- data = file.read("w")

    -- local res = nil

    -- if data ~= nil then
    --     res = textutils.unserializeJSON(data.readAll())
    --     file.close()
    -- else 
    --     if (copyDefaultConfig(program, path))
    --     file.close()
    --     return getConfig(program, path)
    -- end

    -- return res
end



function listProgramConfigs()

end

function listConfigs(program)

end


--inv = peripheral.find("industrialforegoing:simple_black_hole_unit")
