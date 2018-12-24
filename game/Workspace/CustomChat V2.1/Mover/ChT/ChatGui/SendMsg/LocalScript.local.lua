repeat wait() until game.Workspace:findFirstChild("Chattz") and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head")
local head = game.Players.LocalPlayer.Character.Head
local deb = true
local lstmsg = ""

script.Parent.Send.MouseButton1Click:connect(function()
if deb and script.Parent.Text ~= lstmsg then
deb = false
local nm = Instance.new("StringValue")
nm.Value = game.Players.LocalPlayer.Name
local msg = Instance.new("StringValue", nm)
msg.Value = script.Parent.Text
msg.Name = "Msg"
nm.Parent = game.Workspace:findFirstChild("Chattz")
game:service("Debris"):AddItem(nm,1)
if script.Parent.Text:sub(1,1) ~= "@" and script.Parent.Text:sub(1,1) ~= "#" then
game:service("Chat"):Chat(head, script.Parent.Text, "Red")
end
lstmsg = script.Parent.Text
wait(1)
deb = true
end
end)

script.Parent.Hide.MouseButton1Click:connect(function()
if script.Parent.Position == UDim2.new(0,0,1,40) then
script.Parent:TweenPosition(UDim2.new(0,-200,1,40))
script.Parent.Hide.Text = "Show"
elseif script.Parent.Position == UDim2.new(0,-200,1,40) then
script.Parent:TweenPosition(UDim2.new(0,0,1,40))
script.Parent.Hide.Text = "Hide"
end
end)