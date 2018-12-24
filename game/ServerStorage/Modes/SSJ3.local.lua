local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Chr = Player.Character
local Torso = Chr:WaitForChild("Torso")
local Head = Chr:WaitForChild("Head")
local Input = script.Parent:WaitForChild("InputHandler")
local Mode = Input:WaitForChild("SuperSaiyan3")
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
  for i = 1, 5 do
    wait(1)
    Function.BackSpike(Torso, BrickColor.new("New Yeller"))
    Function.Waves(BrickColor.new("New Yeller"), Torso, 0.5, 0.25)
  end
  for i = 1, 3 do
    wait(0.3)
    Function.Ball(Torso, BrickColor.Yellow())
    Function.Cylinder(Torso, BrickColor.Yellow(), BrickColor.new("New Yeller"))
  end
  Function.WeldHair(Effects.SSJ3, Head, Particles.SSJ3, Torso, Particles.Lightning)
  Run = true
  On = true
  Mode.Value = true
end
local function OFF()
  if not Check() or not Run or not On then
    return
  end
  Run = false
  for i = 1, 3 do
    wait(0.1)
    Function.Ball(Torso, BrickColor.Yellow())
    Function.Cylinder(Torso, BrickColor.Yellow(), BrickColor.new("New Yeller"))
  end
  Function.RemoveHair(Chr, Torso)
  Run = true
  On = false
  Chr.InMode:Destroy()
  Mode.Value = false
end
Player.Chatted:connect(function(MSG)
  local MSG = MSG:lower()
  if MSG:sub(1, 4) == "ssj3" or MSG:sub(1, 7) == "/e ssj3" then
    SSJ()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    OFF()
  end
end)
