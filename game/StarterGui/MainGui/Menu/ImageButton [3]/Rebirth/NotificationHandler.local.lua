script.Parent.MouseButton1Click:connect(function()
local RebirthGui = script.Parent.Parent.Parent.Parent.Rebirth
if RebirthGui.Visible == false then
	RebirthGui.Visible = true
else
	RebirthGui.Visible = false
end
end)