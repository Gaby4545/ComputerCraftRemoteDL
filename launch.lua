print("Hello Rolz!")

local chatBox = peripheral.find("chatBox")

function update() shell.run("download") end

function waitForChat()
    local event, username, message, uuid, isHidden = os.pullEvent("chat")
    processChat(event, username, message, uuid, isHidden)
end

function processChat(event, username, message, uuid, isHidden)
    if message == "$update" or message == "$u" then
        update() 
    end
end

waitForChat()