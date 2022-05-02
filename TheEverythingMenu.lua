getgenv().autoupdatews = false;

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local z = library:CreateWindow("The Everything Menu") -- Creates the window
local a = z:CreateFolder("Main Scripts")
local b = z:CreateFolder("Scripts")
local x = z:CreateFolder("Player")
local y = z:CreateFolder("Settings")



-- Main Cheats
a:Button("Any Game",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RlDevilOfChaos/RobloxCoding/main/AnyGame.lua'))()
end)

a:Button("Infinite Yield",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
a:Button("Server Hop",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RlDevilOfChaos/RobloxCoding/main/Everything/ServerHop.lua'))()
end)
a:Button("Chat Spy",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RlDevilOfChaos/RobloxCoding/main/ChatSpy.lua'))()
end)
-- My Other Stuff

b:Button("Sword Factory X",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RlDevilOfChaos/RobloxCoding/main/Everything/SwordFactoryX.lua'))()
end)

b:Button("BladeQuest",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RlDevilOfChaos/RobloxCoding/main/Everything/BladeQuest.lua'))()
end)

b:Button("BitCoin",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RlDevilOfChaos/RobloxCoding/main/Everything/BitCoin.lua'))()
end)

b:Button("Bot Clicking Sim",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RlDevilOfChaos/RobloxCoding/main/Everything/BotClicckingSim.lua'))()
end)


-- Player
x:Slider("MovementSpeed",{
    min = 16; -- min value of the slider
    max = 100; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    print("Changed walk speed to:", value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value 
end)

x:Slider("Jump Power",{
    min = 50; -- min value of the slider
    max = 200; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    print("Changed Jump Power to: ", value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

local wsl = x:Label("Click the button", {
    TextSize = 15;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
})

local jpl = x:Label("Click the button", {
    TextSize = 15;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
})

x:Button("Get WS and JP",function()
    local ws = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
    local jp = game.Players.LocalPlayer.Character.Humanoid.JumpPower
    wsl:Refresh(ws)
    jpl:Refresh(jp)
end)

y:Button("Clear Console",function()
    for i=1, 50 do
        print(string.rep(" ", i%2))
        end
end)

y:DestroyGui()