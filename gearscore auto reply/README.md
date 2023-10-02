# Gearscore Auto Reply

##### Steps:
1. Make a new weakaura
2. Add trigger, choose:
   1. Type: **Custom**
   2. Event Type: **Event**
   3. Event(s): **CHAT_MSG_WHISPER**
3. Under Custom trigger, paste code from [gs_auto_reply.lua](https://github.com/niklasdotnet/weakauras/blob/main/gearscore%20auto%20reply/gs_auto_reply.lua):
4. Modify variables under CONFIGURATION VARIABLES according to your needs;

```
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
```

