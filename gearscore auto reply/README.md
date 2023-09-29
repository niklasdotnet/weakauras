# Gearscore Auto Reply

##### Steps:
1. Make a new weakaura
2. Add trigger, choose:
	a. Type: **Custom**
	b. Event Type: **Event**
	c. Event(s): **CHAT_MSG_WHISPER**
3. Under Custom trigger, paste this code:

```
function( event, ... )
	if event ~= "CHAT_MSG_WHISPER" then
		return false
    	end

	-- your trigger keywords, feel free to change:
	local keywords = {'gs?', 'gearscore?'}
	local msg, sender = ...
	local player  = UnitName("player")
	local gs = nil
    
	-- your character name(s) and gearscore value(s)
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

