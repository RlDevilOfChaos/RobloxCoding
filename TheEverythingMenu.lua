getgenv().autoupdatews = false;

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local z = library:CreateWindow("The Everything Menu") -- Creates the window
local a = z:CreateFolder("Scripts")
local b = z:CreateFolder("Player")
local y = z:CreateFolder("Settings")



-- Main Cheats

a:Button("Remote Spy Menu",function()
    loadstring(game:HttpGet('https://pastebin.com/raw/fdzWP5nN'))()
end)

a:Button("Infinite Yield",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)


a:Button("Anime Clicking Sim",function()
    loadstring(game:HttpGet('https://pastebin.com/raw/fb4DaLiT'))()
end)


a:Button("Server Hop",function()
    loadstring(game:HttpGet('https://pastebin.com/raw/420dss1v'))()
end)



-- Main Cheats

b:Slider("MovementSpeed",{
    min = 16; -- min value of the slider
    max = 100; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    print("Changed walk speed to:", value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value 
end)

b:Slider("Jump Power",{
    min = 50; -- min value of the slider
    max = 200; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    print("Changed Jump Power to: ", value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

local wsl = b:Label("Click the button", {
    TextSize = 15;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
})

local jpl = b:Label("Click the button", {
    TextSize = 15;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
})

b:Button("Get WS and JP",function()
    local ws = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
    local jp = game.Players.LocalPlayer.Character.Humanoid.JumpPower
    wsl:Refresh(ws)
    jpl:Refresh(jp)
end)

-- Main Cheats


-- Settings

y:Button("Clear Console",function()
    for i=1, 100 do
        print(string.rep(" ", i%2))
        end
end)

y:DestroyGui()
-- Settings

y:Label("https://pastebin.com/raw/6sDy2832",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
})