
-- https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3
-- https://raw.githubusercontent.com/RlDevilOfChaos/RobloxCoding/main/gui
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local z = library:CreateWindow("Any Game") -- Creates the window
local a = z:CreateFolder("Main Stuff")
local b = z:CreateFolder("Player")
local y = z:CreateFolder("Settings")


a:Button("Teleport POS",function()
    TeleportPOS()
end)

a:Button("GCP",function()
    getCurrentPlayerPos()
end)


--Get Pos
function getCurrentPlayerPos()
    local Plyr = game.Players.LocalPlayer
    tback = Plyr.Character.HumanoidRootPart.CFrame
end
----Teleport
function TeleportPOS()
    local Plyr = game.Players.LocalPlayer
    Plyr.Character.HumanoidRootPart.CFrame = tback 
end




-- Player
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

y:Button("Infinite Yield",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

y:Button("Clear Console",function()
    for i=1, 50 do
        print(string.rep(" ", i%2))
        end
end)

y:DestroyGui()




