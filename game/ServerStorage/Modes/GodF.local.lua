local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Chr = Player.Character
local Torso = Chr:WaitForChild("Torso")
local Head = Chr:WaitForChild("Head")
local Mode = script.Parent:WaitForChild("InputHandler"):WaitForChild("FriezaGod")
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
  local Last = 0
  for i = 1, 15 do
    Function.Waves(BrickColor.new("Magenta"), Torso, 1.25, 0.5)
    if i % 2 == 0 then
      Function.Cylinder(Torso, BrickColor.new("New Yeller"), BrickColor.new("Bright yellow"))
    end
    if i % 2 == 0 and Last == 0 then
      Function.Ball2(Torso, BrickColor.new("Magenta"))
      Last = 1
    end
    wait(0.3)
  end
  Function.Aura(Torso, Particles.Godf)
  Run = true
  On = true
  Mode.Value = true
end
local function OFF()
  if not Check() or not Run or not On then
    return
  end
  Run = false
  Function.Cylinder2(Torso, BrickColor.new("New Yeller"), BrickColor.Yellow(), BrickColor.new("Magenta"))
  Function.Ball2(Torso, BrickColor.new("Magenta"))
  wait(1)
  Function.RemoveHair(Chr, Torso)
  Run = true
  On = false
  Chr.InMode:Destroy()
  Mode.Value = false
end
Player.Chatted:connect(function(MSG)
  local MSG = MSG:lower()
  if MSG:sub(1, 5) == "godf" or MSG:sub(1, 8) == "/e godf" then
    SSJ()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    OFF()
  end
end)
