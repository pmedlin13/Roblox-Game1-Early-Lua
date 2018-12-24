local ReplicatedStorage = game.ReplicatedStorage
local OmegaEvent = ReplicatedStorage.Events.Omega

OmegaEvent.OnServerEvent:Connect(function(player, Switch)

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
	local On = false

local function SSJ()
  Run = false
  local Tag = Instance.new("BoolValue")
  for i = 1, 20 do
    Function.Waves(BrickColor.new("Magenta"), Torso, 3, 1)
    if i % 4 == 0 then
      Function.Ball(Torso, BrickColor.Black())
    end
    wait(0.3)
  end
  Function.Cylinder2(Torso, BrickColor.new("Magenta"), BrickColor.Black(), BrickColor.new("Magenta"))
  Function.WeldHair(Hair.Omega, Head, Particles.Omega, Torso)
  Run = true
  On = true
end
local function OFF()
  Run = false
  Function.Cylinder2(Torso, BrickColor.new("Magenta"), BrickColor.Black(), BrickColor.new("Magenta"))
  Function.RemoveHair(Chr, Torso)
  Run = true
  On = false
end

if Switch == true then
	SSJ()
end

if Switch == false then
	OFF()
end
end
end)


