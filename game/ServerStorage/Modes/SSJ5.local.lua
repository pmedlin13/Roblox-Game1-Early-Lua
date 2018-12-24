local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Chr = Player.Character
local Torso = Chr:WaitForChild("Torso")
local Head = Chr:WaitForChild("Head")
local inputHandler = script.Parent:WaitForChild("InputHandler")
local mode = inputHandler:WaitForChild("SSJ5")
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
  mode.Value = true
  Run = true
  On = true
end
local function OFF()
  if not Check() or not Run or not On then
    return
  end
  Run = false
  for i = 1, 2 do
    Function.Ball2(Torso, BrickColor.White())
    wait(1)
  end
  Function.RemoveHair(Chr, Torso)
  Run = true
  On = false
  mode.Value = false
  Chr.InMode:Destroy()
end
Player.Chatted:connect(function(MSG)
  local MSG = MSG:lower()
  if MSG:sub(1, 4) == "ssj5" or MSG:sub(1, 7) == "/e ssj5" then
    SSJ()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    OFF()
  end
end)
