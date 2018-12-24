script.Parent.MouseButton1Click:connect(function()
local TutGui = script.Parent.Parent.Parent.Tutorial
if TutGui.Visible == false then
	TutGui.Visible = true
else
	TutGui.Visible = false
end
end)