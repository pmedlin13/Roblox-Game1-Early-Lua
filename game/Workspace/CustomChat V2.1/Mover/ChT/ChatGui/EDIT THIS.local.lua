repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character

function AddChat(titlec,title,msgc,msg)
for i = 1, 10 do
local line = script.Parent:findFirstChild("Line" .. tostring(i))
if i ~= 10 then
line.Text = script.Parent:findFirstChild("Line" .. tostring(i + 1)).Text
line.TextColor3 = script.Parent:findFirstChild("Line" .. tostring(i + 1)).TextColor3
line.Msg.Text = script.Parent:findFirstChild("Line" .. tostring(i + 1)).Msg.Text
line.Msg.TextColor3 = script.Parent:findFirstChild("Line" .. tostring(i + 1)).Msg.TextColor3
line.Msg.Position = UDim2.new(0,(line.TextBounds.X + 5),0,0)
else
if string.sub(msg,1,1) == "$" then
line.Text = ("[Team]" .. title)
line.Msg.Text = string.sub(msg,2)
line.TextColor3 = Color3.new(1,1,1)
line.Msg.TextColor3 = Color3.new(1,1,1)
elseif string.sub(msg,1,1) == "@" then
line.Text = ("[PRIVATE MSG]" .. title)
line.Msg.Text = string.sub(msg,2)
line.TextColor3 = Color3.new(0.4,0.5,1)
line.Msg.TextColor3 = Color3.new(0.5,0.7,1)
else
line.Text = title
line.Msg.Text = msg
line.TextColor3 = titlec
line.Msg.TextColor3 = msgc
end
line.Msg.Position = UDim2.new(0,(line.TextBounds.X + 5),0,0)
end
end
end

function UpdateChat(title,msg)
if title == "" then
local titlec = Color3.new(0,1,0)
local msgc = Color3.new(0,1,0)
AddChat(titlec,title,msgc,msg)
elseif title == "selvius13" or title == "rainbowlocks13" then   ---------------------------------------------------------------------------------------{Your Username Here
local titlec = Color3.new(1,1,1)
local msgc = Color3.new(1,1,0)
AddChat(titlec,title,msgc,msg)
elseif title == "%ERROR%" .. game.Players.LocalPlayer.Name then
title = "%ERROR%"
local titlec = Color3.new(1,0,0)
local msgc = Color3.new(1,0,0)
AddChat(titlec,title,msgc,msg)
elseif game.Players:findFirstChild(title) then
local titlec = Color3.new(1,0.9,0)
local msgc = Color3.new(1,1,1)
AddChat(titlec,title,msgc,msg)
end
end

function CheckChat(nm,mg)
if mg:sub(1,1) == "#" then
if game.Players:findFirstChild(nm) and game.Players.LocalPlayer.TeamColor == game.Players:findFirstChild(nm).TeamColor then
UpdateChat(nm,mg)
end
elseif mg:sub(1,1) == "@" then
mg = mg:sub(2)
if string.find(mg," ") ~= nil then
local spcnum = string.find(mg," ")
local wname = mg:sub(1,spcnum - 1)
if (nm:lower() == game.Players.LocalPlayer.Name:lower()) or game.Players.LocalPlayer.Name:lower():find(wname:lower()) then
UpdateChat(nm,"@" .. mg:sub(spcnum + 1))
end
else
UpdateChat("%ERROR%" .. nm,"Incorrect Syntax, try '@<target> <msg>'.")
end
else
UpdateChat(nm,mg)
end
end

game.Players.LocalPlayer.Chatted:connect(function(msg) CheckChat(game.Players.LocalPlayer.Name, msg) end)
for i, v in ipairs(game.Players:children()) do
if v:IsA("Player") and v ~= game.Players.LocalPlayer then
v.Chatted:connect(function(msg) CheckChat(v.Name, msg) end)
end
end

game.Players.ChildAdded:connect(function(plr)
plr.Chatted:connect(function(msg) CheckChat(plr.Name, msg) end)
if plr.Name == "selvius13" or plr.Name == "rainbowlocks13" then   ------------------------------------------------------------------------------------{Your Username Here
CheckChat("", plr.Name .. ", The Game Creator has joined!")
else
CheckChat("", plr.Name .. " has joined!")
end
end)

game.Players.ChildRemoved:connect(function(plr)
if plr.Name == "selvius13" or "rainbowlocks13" then   ------------------------------------------------------------------------------------{Your Username Here
CheckChat("", plr.Name .. ", The Game Creator Has Left!")
else
CheckChat("", plr.Name .. " has left!")
end
end)


if not game.Workspace:findFirstChild("Chattz") then
local mod = Instance.new("Model", game.Workspace)
mod.Name = "Chattz"
end

game.Workspace:findFirstChild("Chattz").ChildAdded:connect(function(obj)
if obj:IsA("StringValue") then CheckChat(obj.Value, obj.Msg.Value) end
end)

wait(1)

CheckChat("", "[System] Welcome To Dragonball: Super Simulator") -------------------------------------------------------------------[YOURTEXT HERE
wait()
CheckChat("", "[System] Thanks For Playing!") -------------------------------------------------------------------[YOURTEXT HERE
wait()