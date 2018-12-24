local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Chr = Player.Character
local Torso = Chr:WaitForChild("Torso")
local Head = Chr:WaitForChild("Head")
local InputHandler = script.Parent:WaitForChild("InputHandler")
local Mode = InputHandler:WaitForChild("SuperSaiyanPink")
local Effects = game:GetService("ReplicatedStorage"):WaitForChild("Effects")
local Meshes = Effects:WaitForChild("Mesh")
local Particles = Effects:WaitForChild("Particles")
local Modules = Effects:WaitForChild("Modules")
local Hair = Effects:WaitForChild("Hair")
local Function = require(Modules:WaitForChild("Effects"))
local Parts = workspace:WaitForChild("PartStorage")
local Run = true
local On = false
local function Check()
  if Chr:FindFirstChild("InMode") then
    return Chr.InMode
  else
    return false
  end
end
local function SSJ()
  if Check() or not Run or On then
    return
  end
  Run = false
  local Tag = Instance.new("BoolValue")
  Tag.Name = "InMode"
  Tag.Value = true
  Tag.Parent = Chr
  for i = 1, 15 do
    Function.Waves2(BrickColor.new("Sunrise"), Torso, Vector3.new(40, 20, 40), Vector3.new(0.6, 0.3, 0.6))
    Function.Waves(BrickColor.new("Pink"), Torso, 0.6, 0.3)
    wait(0.2)
  end
  for i = 1, 15 do
    wait(0.1)
    Function.Ball(Torso, BrickColor.new("Pink"))
    Function.Cylinder(Torso, BrickColor.new("Pink"), BrickColor.new("Sunrise"))
  end
  Function.WeldHair(Hair.SSJP, Head, Particles.SSJP, Torso, Particles.Lightning)
  Mode.Value = true
  Run = true
  On = true
end
local function OFF()
  if not Check() or not Run or not On then
    return
  end
  Run = false
  for i = 1, 15 do
    wait()
    Function.Ball(Torso, BrickColor.new("Sunrise"))
  end
  Function.RemoveHair(Chr, Torso)
  Mode.Value = false
  Run = true
  On = false
  Chr.InMode:Destroy()
end
Player.Chatted:connect(function(MSG)
  local MSG = MSG:lower()
  if MSG:sub(1, 4) == "ssjr" or MSG:sub(1, 7) == "/e ssjr" then
    SSJ()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    OFF()
  end
end)
