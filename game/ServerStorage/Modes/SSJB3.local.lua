local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Chr = Player.Character
local Torso = Chr:WaitForChild("Torso")
local Head = Chr:WaitForChild("Head")
local Mode = script.Parent:WaitForChild("InputHandler"):WaitForChild("SuperSaiyanB3")
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
  for i = 1, 12 do
    Function.Waves(BrickColor.new("Cyan"), Torso, 2, 1)
    if i % 3 == 0 then
      Function.Cylinder2(Torso, BrickColor.Blue(), BrickColor.new("Cyan"), BrickColor.Blue())
      Function.Ball2(Torso, BrickColor.new("Cyan"))
    end
    wait(0.2)
  end
  Function.WeldHair(Hair.SSJB3, Head, Particles.SSJB3, Torso)
  Run = true
  On = true
  Mode.Value = true
end
local function OFF()
  if not Check() or not Run or not On then
    return
  end
  Run = false
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
  Mode.Value = false
end
Player.Chatted:connect(function(MSG)
  local MSG = MSG:lower()
  if MSG:sub(1, 5) == "ssjb3" or MSG:sub(1, 8) == "/e ssjb3" then
    SSJ()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    OFF()
  end
end)
