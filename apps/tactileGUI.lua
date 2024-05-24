


--- The start of it all
function main() 
    local window = window.create(term.current(), 1, 1, 20, 5)
    window.setBackgroundColour(colours.grey)
    window.setTextColour(colours.white)
    window.clear()
    window.write("Testing my window!")
end

main()