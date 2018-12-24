local ReplicatedStorage = game.ReplicatedStorage
local SSJ5Event = ReplicatedStorage.Events.SSJ5

SSJ5Event.OnServerEvent:Connect(function(player, Switch)

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
	for i = 1, 15 do
    wait(0.6)
    Function.Waves(BrickColor.Gray(), Torso, 2, 1)
    Function.BackSpike(Torso, BrickColor.DarkGray())
    wait(0.6)
    Function.Waves(BrickColor.DarkGray(), Torso, 2, 1)
    Function.BackSpike(Torso, BrickColor.Gray())
  end
  wait(0.5)
  Function.Ball(Torso, BrickColor.Black())
  Function.Cylinder(Torso, BrickColor.DarkGray(), BrickColor.Gray())
  Function.WeldHair(Hair.SSJ5, Head, Particles.SSJ5, Torso, Particles.Lightning5)
  Run = true
  On = true
end
local function OFF()
  Run = false
  for i = 1, 2 do
    Function.Ball2(Torso, BrickColor.White())
    wait(1)
  end
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


