local ReplicatedStorage = game.ReplicatedStorage
local SSJB3Event = ReplicatedStorage.Events.SSJB3

SSJB3Event.OnServerEvent:Connect(function(player, Switch)

    if player.stats.VIP.Value == true or player.Name == "Player1" or player.Name == "Rainbowlocks13" or player.Name == "Selvius13" then
	local Player = player
	local Chr = Player.Character
	local Torso = Player.Character.Humanoid.RigType == "R6" and Player.Character.Torso or Player.Character.UpperTorso
	local Head = Chr:WaitForChild("Head")
	local Humanoid = Chr:WaitForChild("Humanoid")
	local stats = Player:WaitForChild("stats")
	local Effects = game:GetService("ReplicatedStorage"):WaitForChild("Effects")
	local Meshes = Effects:WaitForChild("Mesh")
	local Particles = Effects:WaitForChild("Particles")
	local Modules = Effects:WaitForChild("Modules")
	local Hair = Effects:WaitForChild("Hair")
	local Function = require(Modules:WaitForChild("Effects"))
	local Parts = workspace:WaitForChild("PartStorage")
	local Run = true
local function SSJ()
  local Tag = Instance.new("BoolValue")
  Tag.Name = "InMode"
  Tag.Value = true
  Tag.Parent = Chr
  for i = 1, 12 do
    Function.Waves(BrickColor.new("Cyan"), Torso, 2, 1)
    if i % 3 == 0 then
      Function.Cylinder2(Torso, BrickColor.Blue(), BrickColor.new("Cyan"), BrickColor.Blue())
      Function.Ball2(Torso, BrickColor.new("Cyan"))
    end
    wait(0.2)
  end
  Function.WeldHair(Hair.SSJB3, Head, Particles.SSJB3, Torso)
  On = true
end
local function OFF()
  for i = 1, 10 do
    Function.BackSpike(Torso, BrickColor.Blue())
    Function.Cylinder(Torso, BrickColor.Blue(), BrickColor.new("Cyan"))
    Function.Waves(BrickColor.new("Cyan"), Torso, 2, 1)
    wait(0.3)
  end
  Function.RemoveHair(Chr, Torso)
  Run = true
  On = false
  Chr.InMode:Destroy()
end
if Switch == true then
	SSJ()
end

if Switch == false then
	OFF()
end
end
end)
