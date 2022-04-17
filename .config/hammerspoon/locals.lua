function locals()
    local variables = {}
    local idx = 1
    while true do
        local ln, lv = debug.getlocal(2, idx)
        if ln ~= nil then
            variables[ln] = lv
        else
            break
        end
        idx = 1 + idx
    end
    return variables
end

for x, v in pairs(locals()) do
    print(x, v)
end
print()
collectgarbage("collect")
for x, v in pairs(locals()) do
    print(x, v)
end
print()
collectgarbage("collect")
for x, v in pairs(locals()) do
    print(x, v)
end
print()
