local ReplicatedStorage = game.ReplicatedStorage
local LSSJGEvent = ReplicatedStorage.Events.LSSJG

LSSJGEvent.OnServerEvent:Connect(function(player, Switch)

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
  Tag.Name = "InMode"
  Tag.Value = true
  Tag.Parent = Chr
  local Last = 0
  for i = 1, 10 do
    if math.random(1, 2) == 1 then
      Function.Waves(BrickColor.new("Lime green"), Torso, 1.5, 0.8)
    else
      Function.Waves(BrickColor.Black(), Torso, 1.5, 0.8)
    end
    Function.Cylinder(Torso, BrickColor.Black(), BrickColor.new("Lime green"))
    if i % 2 == 0 then
      if Last == 0 then
        Function.Ball2(Torso, BrickColor.new("Lime green"))
        Last = 1
      else
        Function.Ball2(Torso, BrickColor.Black())
        Last = 0
      end
    end
    wait(0.6)
  end
  Function.WeldHair(Hair.LSSJG, Head, Particles.LSSJG, Torso, Particles.Lightning4)
  Run = true
  On = true

end
local function OFF()

  Run = false
  for i = 1, 5 do
    wait(0.4)
    Function.Ball2(Torso, BrickColor.new("Lime green"))
  end
  wait(1)
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


