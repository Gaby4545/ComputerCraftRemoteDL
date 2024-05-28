terminal = term.current()
termX, termY = terminal.getSize()


win = nil
actionBar = nil

buttons = {}

function handleClick(button, x, y) 

end

function waitForClick()
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        actionBar.clear()
        actionBar.setCursorPos(1, 5)
        actionBar.write("Btn" .. button .. ": " .. x .. "," .. y)

        actionBar.setCursorPos(1, 1)
        actionBar.write("Back")

        handleClick(button, x, y) 
    end
end

function launchAppInWin(app)
    term.redirect(win)
    shell.run(app)
    term.redirect(terminal)
end

--- The start of it all
function main() 
    terminal.clear()
    win = window.create(terminal, 1, 1, termX, termY-1)
    win.setBackgroundColour(colours.black)
    win.setTextColour(colours.white)
    win.clear()
    win.write("Testing my window!")

    actionBar = window.create(terminal, 1, termY, termX, termY)

    actionBar.setCursorPos(1, 1)
    actionBar.setBackgroundColour(colours.lightGrey)
    actionBar.setBackgroundColour(colours.grey)
    actionBar.write("Back")

    parallel.waitForAll(waitForClick, function() launchAppInWin(app) end)
end

main()