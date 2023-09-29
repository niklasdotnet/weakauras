** Auto Reply Gearscore
Make a new weakaura. Add a trigger, choose Custom and Event, and under Event(s) enter CHAT_MSG_WHISPER.

Under custom trigger paste this code, modify it to contain your characters name(s) and gearscore value(s).
Of course you can edit keywords.

```
function( event, ... )
    if event ~= "CHAT_MSG_WHISPER" then
        return false
    end

    -- keywords that triggers the auto reply
    local keywords = {'gs?', 'gearscore?'}
    local msg, sender = ...
    local player  = UnitName("player")
    local gs = nil

    -- character name and gearscore value
    local my_characters = {
        Patatosa = "5300-5500", 
        Pataat = "5200",
    }
    
    gs = my_characters[player]
    
    if gs == nil then
        return false        
    end
    
    local contains_keyword = false
    
    for _, keyword in ipairs(keywords) do
        if msg:lower() == keyword:lower() then
            contains_keyword = true
            break
        end
    end
    
    if contains_keyword == false then
        return false
    end
    
    SendChatMessage("My gs is ~"..gs..".", "whisper", nil, sender)
   
end
```
