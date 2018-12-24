local ZeniCount = script.Parent
local player = game.Players.LocalPlayer
local stats = player:WaitForChild("stats")
local Zeni = player.stats.Zeni

local function updateZeni()
	ZeniCount.Text = ""..Zeni.Value..""
end
 
Zeni.changed:Connect(updateZeni)