getgenv().autoFarm = false;
getgenv().doRarity = false;
getgenv().doMold = false;
getgenv().doQuality = false;
getgenv().doClass = false;
getgenv().doEnchant = false;
getgenv().doLevel = false;

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local z = library:CreateWindow("Sword Factory X") -- Creates the window
local a = z:CreateFolder("Auto Ascender")
local b = z:CreateFolder("Timer")
local x = z:CreateFolder("Player")
local y = z:CreateFolder("Settings")

local rtimer = 0
local mtimer = 0
local qtimer = 0
local ctimer = 0
local etimer = 0
local ltimer = 0

a:Toggle("Auto Farmm ",function(bool)
    getgenv().autoFarm = bool
    print('Auto Farm is: ', bool)
    if bool then
        autoFarm()
    end
end)


function autoFarm()
    spawn(function()
        while getgenv().autoFarm == true do
            print("Starting Auto Farm")
            wait()

            --- Start
            while getgenv().doRarity == true do 
                local args = {[1] = "Upgrade",[2] = "Rarity"}
                game:GetService("ReplicatedStorage").Events.Ascender_Event:FireServer(unpack(args))
                wait(rtimer)

                break
            end

            while getgenv().doMold == true do
                local args = {[1] = "Upgrade",[2] = "Mold"}
                game:GetService("ReplicatedStorage").Events.Ascender_Event:FireServer(unpack(args))
                wait(mtimer)
                local args = {[1] = "Cancel",[2] = "Release"}
                game:GetService("ReplicatedStorage").Events.Ascender_Event:FireServer(unpack(args))
                wait(1)
                break
            end

            while getgenv().doQuality == true do
                local args = {[1] = "Upgrade",[2] = "Quality"}
                game:GetService("ReplicatedStorage").Events.Ascender_Event:FireServer(unpack(args))                
                wait(qtimer)
                local args = {[1] = "Cancel",[2] = "Release"}
                game:GetService("ReplicatedStorage").Events.Ascender_Event:FireServer(unpack(args))
                wait(1)
                break
            end

            while getgenv().doClass == true do
                local args = {[1] = "Upgrade",[2] = "Class"}
                game:GetService("ReplicatedStorage").Events.Ascender_Event:FireServer(unpack(args))                
                wait(ctimer)
                local args = {[1] = "Cancel",[2] = "Release"}
                game:GetService("ReplicatedStorage").Events.Ascender_Event:FireServer(unpack(args))
                wait(1)
                break
            end

            while getgenv().doEnchant == true do
                local args = {[1] = "Upgrade",[2] = "Enchant"}
                game:GetService("ReplicatedStorage").Events.Ascender_Event:FireServer(unpack(args))
                wait(etimer)
                local args = {[1] = "Cancel",[2] = "Release"}
                game:GetService("ReplicatedStorage").Events.Ascender_Event:FireServer(unpack(args))
                wait(1)
                break
            end

            while getgenv().doLevel == true do
                local args = {[1] = "Upgrade",[2] = "Level"}
                game:GetService("ReplicatedStorage").Events.Ascender_Event:FireServer(unpack(args))                
                wait(ltimer)
                local args = {[1] = "Cancel",[2] = "Release"}
                game:GetService("ReplicatedStorage").Events.Ascender_Event:FireServer(unpack(args))
                wait(1)
                break
            end

        end
    end)
end



a:Toggle("Rarity",function(bool)
    getgenv().doRarity = bool
    print('Rarity is:', bool)
    if bool then
        doRarity = true
    end
end)

a:Toggle("Mold",function(bool)
    getgenv().doMold = bool
    print('Mold is:', bool)
    if bool then
        doMold = true
    end
end)

a:Toggle("Quality",function(bool)
    getgenv().doQuality = bool
    print('Quality is:', bool)
    if bool then
        doQuality = true
    end
end)

a:Toggle("Class",function(bool)
    getgenv().doClass = bool
    print('Class is:', bool)
    if bool then
        doClass = true
    end
end)

a:Toggle("Enchant",function(bool)
    getgenv().doEnchant = bool
    print('Enchant is:', bool)
    if bool then
        doEnchant = true
    end
end)

a:Toggle("Level",function(bool)
    getgenv().doLevel = bool
    print('Rarity is:', bool)
    if bool then
        doLevel = true
    end
end)

-- Timers

b:Slider("Rarity Timer",{
    min = 1; -- min value of the slider
    max = 600; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    print("Changed Timer to:", value)
    rtimer = value 
end)

b:Slider("Mold Timer",{
    min = 1; -- min value of the slider
    max = 600; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    print("Changed Timer to:", value)
    mtimer = value 
end)

b:Slider("Quality Timer",{
    min = 1; -- min value of the slider
    max = 600; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    print("Changed Timer to:", value)
    qtimer = value 
end)

b:Slider("Class Timer",{
    min = 1; -- min value of the slider
    max = 600; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    print("Changed Timer to:", value)
    ctimer = value 
end)

b:Slider("Enchant Timer",{
    min = 1; -- min value of the slider
    max = 600; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    print("Changed Timer to:", value)
    etimer = value 
end)

b:Slider("Level Timer",{
    min = 1; -- min value of the slider
    max = 600; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    print("Changed Timer to:", value)
    ltimer = value 
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

y:Button("Infinite Yield",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

y:Button("Clear Console",function()
    for i=1, 50 do
        print(string.rep(" ", i%2))
        end
end)

y:DestroyGui()




