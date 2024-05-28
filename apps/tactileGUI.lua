terminal = term.current()

window = nil


buttons = nil

function waitForClick()
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        window.clear()
        window.setCursorPos(0, 0)
        window.write("Button" .. button .. "was clicked at" .. x .. "," .. y)
    end
end

--- The start of it all
function main() 
    terminal.clear()
    window = window.create(terminal, 1, 1, 20, 5)
    window.setBackgroundColour(colours.grey)
    window.setTextColour(colours.white)
    window.clear()
    window.write("Testing my window!")

    waitForClick()
end

main()