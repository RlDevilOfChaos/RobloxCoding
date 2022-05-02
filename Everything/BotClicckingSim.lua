getgenv().autoCoins = false;

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local z = library:CreateWindow("Bot Sim Game") -- Creates the window
local a = z:CreateFolder("Main Stuff")
local b = z:CreateFolder("Player")
local y = z:CreateFolder("Settings")




a:Toggle("Auto Coin",function(bool)
    getgenv().autoCoins = bool
    print('Auto Coin is: ', bool)
    if bool then
        doCoin()
    end
end)

function doCoin()
    spawn(function()
        while getgenv().autoCoins == true do
            local playerHead = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

            local children = game:GetService("Workspace").PICK:GetChildren()
            for num, cont in pairs(children) do
                local args = {[1] = cont.Name}
                game:GetService("ReplicatedStorage").Remotes.PickRE:FireServer(unpack(args))
            end
            wait()
        end
    end)
end


local playerHead = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

local children = game:GetService("Workspace").PICK:GetChildren()
for num, cont in pairs(children) do
    local args = {[1] = cont.Name}
    game:GetService("ReplicatedStorage").Remotes.PickRE:FireServer(unpack(args))
end


a:Button("Bot 1",function()
    local args = {[1] = false}
    workspace.Area.W_01.Base.Store.robo_lottery004.DrawRE:FireServer(unpack(args))
end)

a:Button("Bot 2",function()
    local args = {[1] = false}
    workspace.Area.W_01.Base.Store.robo_lottery003.DrawRE:FireServer(unpack(args))
end)

a:Button("Bot 3",function()
    local args = {[1] = false}
    workspace.Area.W_01.Base.Store.robo_lottery002.DrawRE:FireServer(unpack(args))
end)


-- Playeraw
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




