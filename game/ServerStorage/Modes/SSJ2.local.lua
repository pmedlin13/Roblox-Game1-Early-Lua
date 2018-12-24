local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Chr = Player.Character
local Torso = Chr:WaitForChild("Torso")
local Head = Chr:WaitForChild("Head")
local InputHandler = script.Parent:WaitForChild("InputHandler")
local Mode = InputHandler:WaitForChild("SuperSaiyan2")
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
local function SSJ2()
  if Check() or not Run or On then
    return
  end
  Run = false
  local Tag = Instance.new("BoolValue")
  Tag.Name = "InMode"
  Tag.Value = true
  Tag.Parent = Chr
  local Cloud = Function.Cloud(Torso)
  for i = 1, 10 do
    wait(0.5)
    local Start = Torso.Position + Vector3.new(math.random(-5, 5), -3, math.random(-5, 5))
    local Start2 = Start + Vector3.new(0, 50, 0)
    Function.Cylinder2(Torso, BrickColor.Yellow(), BrickColor.new("New Yeller"), BrickColor.Yellow())
  end
  wait(1)
  wait(0.2)
  Function.Ball(Torso, BrickColor.new("New Yeller"))
  Function.Cylinder2(Torso, BrickColor.Yellow(), BrickColor.new("New Yeller"), BrickColor.Yellow())
  Function.WeldHair(Hair.SSJ2, Head, Hair.SSJ2, Torso, Particles.Lightning)
  Mode.Value = true
  wait(2)
  Function.RemoveCloud(Cloud)
  Run = true
  On = true
  Mode.Value = true
end
local function OFF()
  if not Check() or not Run or not On then
    return
  end
  Run = false
  for i = 1, 20 do
    Function.RingDown(Torso, BrickColor.Yellow())
    wait(0.2)
  end
  Mode.Value = false
  Function.RemoveHair(Chr, Torso)
  Run = true
  On = false
  Chr.InMode:Destroy()
  Mode.Value = false
end
Player.Chatted:connect(function(MSG)
  local MSG = MSG:lower()
  if MSG:sub(1, 4) == "ssj2" or MSG:sub(1, 7) == "/e ssj2" then
    SSJ2()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    OFF()
  end
end)
