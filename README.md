# Akihub-QB-Aimbot-Fixed (SOLARA SUPPORTED)

# Original Leaked Code : https://robloxscripts.com/football-fusion-2-leaked-qb-aimbot-script-from-akihub/

# Credit : https://v3rm.net/members/ggbro.51890/

I'll just quote what was said so you won't have to waste your time. 

Quote: "***I know this game extremely well. The game "Football Fusion 2" on ROBLOX has a detection for not entirely your hook, but just your arguments. They have a fake power argument in the actual public place of the game which is argument 4 for football fusion 2. If you set the value of argument 4, you will be banned in less then 10 minutes. Just set argument 4 to 95 and then argument 5 to your power variable. Like bro ts easy asl to debug***"

Original: ```fbRemote:FireServer('Clicked', originPosAdjusted, originPosAdjusted+throwDir*10000, pow, pow)``` (Detected)

Fixed : ```fbRemote:FireServer('Clicked', originPosAdjusted, originPosAdjusted+throwDir*10000, 95, pow)``` (Undetected)


# Minor Interface Issues (UI)

- Replaced ```game.Players``` with ```FindFirstChildOfClass``` or you could use ```GetService``` which would also work.
- Ball traces won't work with solara as far as my concern. have not tried with wave but should most likley work.

# Upadates

I Added a keybind (J) to change from bullet to mag since most of the functions return nil and the UI not being able to show due to solara being a shit executor. Wave recommended for better experience.

1 = Bullet, 2 = Mag/Dive

You can change the keybind here: ```getgenv().QBAimbotSettings.TimeToggleKeybind = 'J'```

