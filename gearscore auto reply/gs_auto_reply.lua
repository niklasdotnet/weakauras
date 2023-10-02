function(event, ...)
    if event ~= "CHAT_MSG_WHISPER" then
        return false
    end
    
    -- CONFIGURATION VARIABLES:
    -- to prevent spamming people, we put senders on cooldown for an amout of time:
    local COOLDOWN_TIME = 60 -- in seconds
    -- keywords that triggers a reply
    local KEYWORDS = {'gs?', 'gs??', 'gs ?', 'gs ??', 'gearscore?', 'gearscore??', 'gearscore ?', 'gearscore ??'}
    -- character name and gearscore value
    local MY_CHARACTERS = {
        Patatosa = "5300",
        Pataat = "5200",
    }
    
    -- CODE:
    local msg, sender = ...
    local player = UnitName("player")
    local gs = nil
    local sender_on_cooldown = false
    
    if sender == player then
        return false
    end
    
    gs = MY_CHARACTERS[player]
    
    if gs == nil then
        return false
    end
    
    if aura_env.cooldown == nil then
        aura_env.cooldown = {}
    end
    
    local current_time = GetTime()
    for k, v in pairs(aura_env.cooldown) do
        if v.sender == sender then
            if current_time - v.timestamp < COOLDOWN_TIME then
                sender_on_cooldown = true
            else
                table.remove(aura_env.cooldown, k)
            end
            break
        end
    end
    
    if sender_on_cooldown then
        return false
    end
    
    msg = " " .. msg .. " "
    
    local contains_keyword = false
    local kw
    for _, keyword in ipairs(KEYWORDS) do
        kw = keyword:lower():gsub("?", "%%?")
        if string.find(msg:lower(), kw) then
            contains_keyword = true
            break
        end
    end
    
    if contains_keyword == false then
        return false
    end
    
    SendChatMessage("My gs is ~" .. gs, "whisper", nil, sender)
    
    table.insert(aura_env.cooldown, { sender = sender, timestamp = GetTime() })
    
    return true
end
