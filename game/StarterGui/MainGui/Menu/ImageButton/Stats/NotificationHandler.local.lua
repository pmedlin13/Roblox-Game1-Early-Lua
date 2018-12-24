script.Parent.MouseButton1Click:connect(function()
local StatsGui = script.Parent.Parent.Parent.Parent.Stats
if StatsGui.Visible == false then
	StatsGui.Visible = true
else
	StatsGui.Visible = false
end
end)