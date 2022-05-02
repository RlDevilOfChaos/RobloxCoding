getgenv().autoTap = false;
getgenv().autoRebirth = false;
getgenv().autoPet = false;

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local z = library:CreateWindow("Tapper Simulator") -- Creates the window
local a = z:CreateFolder("Main Cheats")
local b = z:CreateFolder("Player")
local y = z:CreateFolder("Settings")


a:Toggle("Auto Tap",function(bool)
    getgenv().autoTap = bool
    print('Auto Tap is: ', bool)
    if bool then
        doTap()
    end
end)


a:Toggle("Auto Rebirth",function(bool)
    getgenv().autoRebirth = bool
    print('Auto rebirth is: ', bool)
    if bool then
        autoRebirth(rebirthamount)
    end
end)



a:Dropdown("Rebirth",{"RB001","RB002","RB003","RB004","RB005","RB006","RB007","RB008","RB009","RB010"},true,function(rvalue)
    rebirthamount = rvalue
    print(value)
    autoRebirth()
end)



local selectedPet;
a:Toggle("Auto Pet",function(bool)
    getgenv().autoPet = bool
    print('Auto pet is: ', bool)
    if bool then
        autoPet(selectedPet)
    end
end)


a:Dropdown("Pet Selector",{"Regular", "Striped", "Elemental", "Earth", "Sand", "Lava", "Cosmic", "Skyscraper", "Trade", "Ocean","Sweet", "Brick"},true,function(value)
    selectedPet = value
    print(value)
    autoPet()
end)



b:Slider("MovementSpeed",{
    min = 16; -- min value of the slider
    max = 100; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)
    print(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

b:Slider("Jump Power",{
    min = 50; -- min value of the slider
    max = 200; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)
    print(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

y:Button("The Everything Menu",function()
    loadstring(game:HttpGet('https://pastebin.com/raw/iLvZaRkV'))()
end)


y:Button("Clear Console",function()
    for i=1, 50 do
        print(string.rep(" ", i%2))
        end
end)

y:DestroyGui()




function doTap()
    spawn(function()
        while getgenv().autoTap == true do
            local args = {[1] = 1}
            game:GetService("ReplicatedStorage").Click:FireServer(unpack(args))
            wait()
        end
    end)
end


function autoRebirth(rebirthamount)
    spawn(function()
        while getgenv().autoRebirth == true do

            local args = {[1] = rebirthamount, [2] = false}
            game:GetService("ReplicatedStorage").Rebirth:FireServer(unpack(args))
            wait()
        end
    end)
end


function autoPet(eggType)
    spawn(function()
        while wait() do
            if not getgenv().autoPet then break end;
            local args = {[1] = eggType,[2] = false}
            game:GetService("ReplicatedStorage").OpenEgg:FireServer(unpack(args))
        end
    end)
end


