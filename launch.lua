print("Hello Rolz!")

local chatBox = peripheral.find("chatBox")

local function update() shell.run("download") end

local function processChat(event, username, message, uuid, isHidden)
    if message == "$update" or message == "$u" then
        print(username .. "called an update")
        chatBox.sendMessage(username .. "called an update")
        update() 
    end
end

local function waitForChat()
    local event, username, message, uuid, isHidden = os.pullEvent("chat")
    processChat(event, username, message, uuid, isHidden)
end

local function waitForKey()
    local event, key, isHeld = os.pullEvent("key")
    if key == keys.up then
        update()
    end
end

require("program")

parallel.waitForAny(mainLoop, waitForChat, waitForKey)