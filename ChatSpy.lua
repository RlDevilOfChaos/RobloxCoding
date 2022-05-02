function showMessage(text, clr)
game.StarterGui:SetCore("ChatMakeSystemMessage", {
Text = text;
Color = clr;
})
end

function loadStalk(plr)
plr.Chatted:Connect(function(msg)
warn("--------------------------------")
print("[" .. plr.Name .. "]: " .. msg)
if string.find(msg, "/w ") then
for i=4,1000 do
if string.sub(msg,i,i) == " " then
showMessage("[" .. plr.Name .. " to " .. string.sub(msg,4,i-1) .. "]:" .. string.sub(msg,i), Color3.fromRGB(175, 175, 175))
wait()
break
end
end
end
if string.find(msg, "/whisper ") then
for i=4,1000 do
if string.sub(msg,i,i) == " " then
showMessage("[" .. plr.Name .. " to " .. string.sub(msg,10,i-1) .. "]:" .. string.sub(msg,i), Color3.fromRGB(175, 175, 175))
wait()
break
end
end
end
if string.find(msg, "/e ") then
showMessage("[" .. plr.Name .. "]: " .. msg, Color3.fromRGB(175, 175, 175))
wait()
end
if string.find(msg, "/t ") then
if plr.Team ~= game.Players.LocalPlayer.Team then
for i=4,1000 do
if string.sub(msg,i,i) == " " then
showMessage("[" .. plr.Name .. " to team " .. tostring(plr.Team) .. "]:" .. string.sub(msg,i), Color3.fromRGB(175*plr.Team.TeamColor.r, 175*plr.Team.TeamColor.g, 175*plr.Team.TeamColor.b))
wait()
break
end
end
end
end
if string.find(msg, "/team ") then
if plr.Team ~= game.Players.LocalPlayer.Team then
for i=7,1000 do
if string.sub(msg,i,i) == " " then
showMessage("[" .. plr.Name .. " to team " .. tostring(plr.Team) .. "]:" .. string.sub(msg,i), Color3.fromRGB(175*plr.Team.TeamColor.r, 175*plr.Team.TeamColor.g, 175*plr.Team.TeamColor.b))
wait()
break
end
end
end
end
end)
end

local players = game.Players:GetPlayers()
for i=1,#players do
if players[i].Name ~= game.Players.LocalPlayer.Name then
loadStalk(players[i])
end
end

game:GetService("Players").PlayerAdded:Connect(function(plr)
loadStalk(plr)
end)