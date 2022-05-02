getgenv().autoGems = false;
getgenv().autoAlgor = false;
getgenv().autoBoost = false;
getgenv().autoSell = false;

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local z = library:CreateWindow("Any Game") -- Creates the window
local a = z:CreateFolder("Main Stuff")
local b = z:CreateFolder("Player")
local y = z:CreateFolder("Settings")

a:Button("Sell BitCoins",function()
    getCurrentPlayerPos()
    TeleportToShop()
    wait(1)
    local args = {[1] = true}
    game:GetService("ReplicatedStorage").Events.ExchangeMoney:FireServer(unpack(args))
    wait(1)
    local args = {[1] = false}
    game:GetService("ReplicatedStorage").Events.ExchangeMoney:FireServer(unpack(args))
    wait(1)
    TeleportBack()
end)

a:Button("Unlock Teleport",function()
    game:GetService("Players").LocalPlayer.PlayerGui.Phone.Frame.Apps.Warp.Locked.Visible = false
end)


a:Toggle("Auto Sell",function(bool)
    getgenv().autoSell = bool
    print('Auto Sell is: ', bool)
    if bool then
        doSell()
    end
end)

function doSell()
    spawn(function()
        TeleportToShop()
        while getgenv().autoSell == true do
            wait(0.5)
            local args = {[1] = true}
            game:GetService("ReplicatedStorage").Events.ExchangeMoney:FireServer(unpack(args))
            wait(0.5)
            local args = {[1] = false}
            game:GetService("ReplicatedStorage").Events.ExchangeMoney:FireServer(unpack(args))
            wait(0.5)
        end
    end)
end


a:Toggle("Auto Boost",function(bool)
    getgenv().autoAlgor = bool
    print('Auto Boost is: ', bool)
    if bool then
        doBoost()
    end
end)

function doBoost()
    spawn(function()
        while getgenv().autoAlgor == true do
            game:GetService("ReplicatedStorage").Events.ClaimFreeBoostStar:FireServer()
            wait(10)
        end
    end)
end


a:Toggle("Auto Gems",function(bool)
    getgenv().autoGems = bool
    print('Auto Gems is: ', bool)
    if bool then
        doGems()
    end
end)

function doGems()
    spawn(function()
        while getgenv().autoGems == true do
            local children = game:GetService("Workspace").GemsSpawned:GetChildren()
            if game:GetService("Workspace").GemsSpawned:GetChildren() == 0 then
                print("It has nothing")
                wait()
            else
                for num, cont in pairs(children) do
                    print(cont)
                    wait()
                end
                wait()
            end
            -- Out of Check
        end
    end)
end

a:Toggle("Auto Algor",function(bool)
    getgenv().autoAlgor = bool
    print('Auto Algor is: ', bool)
    if bool then
        doAlgor()
    end
end)

function doAlgor()
    spawn(function()
        while getgenv().autoAlgor == true do
            Sha = game:GetService("Players").LocalPlayer.PlayerGui.Phone.Frame.MiningAlgorithms["SHA-512"].Rate.Text
            Dagger = game:GetService("Players").LocalPlayer.PlayerGui.Phone.Frame.MiningAlgorithms.Dagger.Rate.Text
            Scrypt = game:GetService("Players").LocalPlayer.PlayerGui.Phone.Frame.MiningAlgorithms.Scrypt.Rate.Text
            Bloxchain = game:GetService("Players").LocalPlayer.PlayerGui.Phone.Frame.MiningAlgorithms.xs.Rate.Text
            
            Sha1 = string.gsub(Sha, "%D", "")
            Sha2 = string.gsub(Sha1, "512500", "")
            -- print(Sha2)
            
            Dagger1 = string.gsub(Dagger, "%D", "")
            Dagger2 = string.gsub(Dagger1, "500", "")
            -- print(Dagger2)
            
            Scrypt1 = string.gsub(Scrypt, "%D", "")
            Scrypt2 = string.gsub(Scrypt1, "500", "")
            -- print(Scrypt2)
            
            Bloxchain1 = string.gsub(Bloxchain, "%D", "")
            Bloxchain2 = string.gsub(Bloxchain1, "500", "")
            -- print(Bloxchain2)

            local values = {Sha2, Dagger2, Scrypt2, Bloxchain2}
            local highest = nil

            for _, value in pairs(values) do
                if not highest then
                    highest = value
                    -- continue
                end

                if value > highest then
                    highest = value
                end
            end

            if highest == Sha2 then
                local args = {[1] = 1}
                game:GetService("ReplicatedStorage").Events.AlgoChang:FireServer(unpack(args))
            end

            if highest == Dagger2 then
                local args = {[1] = 2}
                game:GetService("ReplicatedStorage").Events.AlgoChang:FireServer(unpack(args))
            end

            if highest == Scrypt2 then
                local args = {[1] = 3}
                game:GetService("ReplicatedStorage").Events.AlgoChang:FireServer(unpack(args))
            end

            if highest == Bloxchain2 then
                local args = {[1] = 4}
                game:GetService("ReplicatedStorage").Events.AlgoChang:FireServer(unpack(args))
            end
            wait(10)
        end
    end)
end

-- Functions / Va

-- Shop
exshop = game:GetService("Workspace")["Region_ExChang1"].Triggers.AtmHitbox.CFrame

--Get Pos
function getCurrentPlayerPos()
    local Plyr = game.Players.LocalPlayer
    tback = Plyr.Character.HumanoidRootPart.CFrame
end
----Teleport
function TeleportToShop()
    local Plyr = game.Players.LocalPlayer
    Plyr.Character.HumanoidRootPart.CFrame = exshop 
end

function TeleportBack()
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




