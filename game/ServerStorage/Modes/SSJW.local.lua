local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Chr = Player.Character
local Torso = Chr:WaitForChild("Torso")
local Head = Chr:WaitForChild("Head")
local InputHandler = script.Parent:WaitForChild("InputHandler")
local Mode = InputHandler:WaitForChild("SuperSaiyanWhite")
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
  for i = 1, 10 do
    Function.Waves2(BrickColor.White(), Torso, Vector3.new(40, 20, 40), Vector3.new(0.6, 0.3, 0.6))
    wait(0.2)
  end
  for i = 1, 5 do
    wait()
    Function.Ball(Torso, BrickColor.White())
    Function.Cylinder(Torso, BrickColor.White(), BrickColor.White())
  end
  Function.WeldHair(Hair.SSJW, Head, Particles.SSJW, Torso, Particles.Lightning)
  Mode.Value = true
  Run = true
  On = true
end
local function OFF()
  if not Check() or not Run or not On then
    return
  end
  Run = false
  for i = 1, 10 do
    wait()
    Function.Ball(Torso, BrickColor.White())
  end
  Function.RemoveHair(Chr, Torso)
  Mode.Value = false
  Run = true
  On = false
  Chr.InMode:Destroy()
end
Player.Chatted:connect(function(MSG)
  local MSG = MSG:lower()
  if MSG:sub(1, 4) == "ssjw" or MSG:sub(1, 7) == "/e ssjw" then
    SSJ()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    OFF()
  end
end)
