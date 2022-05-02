
getgenv().autoFreeze = false
getgenv().autoHit = false
getgenv().autoDamage = false
getgenv().autoSupport = false


local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local z = library:CreateWindow("Blade Quest") -- Creates the window
local a = z:CreateFolder("Main Cheats")
local b = z:CreateFolder("AutoFarm")
local x = z:CreateFolder("Player")
local y = z:CreateFolder("Settings")

a:Button("Freeze enemies",function()
    local children = game:GetService("Workspace").Enemies:GetChildren()

    for num, Enemy in pairs(children) do
        Enemy.Enemy.WalkSpeed = 0
    end
    
end)

a:Toggle("Auto Freeze",function(bool)
    getgenv().autoFreeze = bool
    print('Auto Freeze is: ', bool)
    if bool then
        autoDoFreeze()
    end
end)

a:Toggle("Auto Hit",function(bool)
    getgenv().autoHit = bool
    print('Auto hit is: ', bool)
    if bool then
        autoDoHit()
    end
end)


b:Dropdown("MapLevel",{"Forest", "Ghost Town", "Crystal Mines", "Toy World", "Dragon's Den"},true,function(rvalue)
    maplevel = rvalue
    print(value)
end)

b:Dropdown("Difficulty",{"Easy","Medium","Hard","Expert"},true,function(rvalue)
    difficultyrank = rvalue
    print(value)
end)

b:Button("Start level",function()
    local args = {
        [1] = "Create",
        [2] = maplevel,
        [3] = difficultyrank,
        [4] = true,
        [5] = true
    }
    game:GetService("ReplicatedStorage").RF:InvokeServer(unpack(args))
    
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





-- Functions

function autoDoFreeze()
    spawn(function()
        while wait(1) do
            if not getgenv().autoFreeze then break end;
            local children = game:GetService("Workspace").Enemies:GetChildren()

            for num, Enemy in pairs(children) do
                Enemy.Enemy.WalkSpeed = 0
                print(Enemy, "is frozen")
            end
        end
    end)
end

function autoDoHit()
    spawn(function()
        while wait() do
            if not getgenv().autoHit then break end;
            local children = game:GetService("Workspace").Enemies:GetChildren()
            
            for num, Enemy in pairs(children) do
                local args = {[1] = "Hit",[2] = Enemy,[3] = nil --[[Vector3]],[4] = 0.5}
                game:GetService("ReplicatedStorage").RE:FireServer(unpack(args))
            end
        end
    end)
end


