local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Chr = Player.Character
local Torso = Chr:WaitForChild("Torso")
local Head = Chr:WaitForChild("Head")
local Mode = script.Parent:WaitForChild("InputHandler"):WaitForChild("SuperSaiyan4")
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
    wait(0.3)
    Function.Waves(BrickColor.new("Crimson"), Torso, 1, 0.5)
    Function.BackSpike(Torso, BrickColor.Black())
    wait(0.3)
    Function.Waves(BrickColor.Black(), Torso, 1, 0.5)
    Function.BackSpike(Torso, BrickColor.new("Crimson"))
  end
  Function.Ball(Torso, BrickColor.Black())
  Function.Cylinder(Torso, BrickColor.new("Crimson"), BrickColor.new("Really red"))
  Function.WeldHair(Effects.SSJ4, Head, Particles.SSJ4, Torso, Particles.Lightning3)
  Run = true
  On = true
  Mode.Value = true
end
local function OFF()
  if not Check() or not Run or not On then
    return
  end
  Run = false
  for i = 1, 2 do
    Function.Ball2(Torso, BrickColor.new("Crimson"))
    wait(1)
  end
  Function.RemoveHair(Chr, Torso)
  Run = true
  On = false
  Chr.InMode:Destroy()
  Mode.Value = false
end
Player.Chatted:connect(function(MSG)
  local MSG = MSG:lower()
  if MSG:sub(1, 4) == "ssj4" or MSG:sub(1, 7) == "/e ssj4" then
    SSJ()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    OFF()
  end
end)
