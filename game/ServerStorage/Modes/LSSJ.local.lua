local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Chr = Player.Character
local Torso = Chr:WaitForChild("Torso")
local Head = Chr:WaitForChild("Head")
local Input = script.Parent:WaitForChild("InputHandler")
local Mode = Input:WaitForChild("LegendSaiyan")
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
  for i = 1, 10 do
    if math.random(1, 2) == 1 then
      Function.Waves(BrickColor.new("Lime green"), Torso, 0.75, 0.375)
    else
      Function.Waves(BrickColor.Black(), Torso, 0.5, 0.25)
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
  Function.WeldHair(Effects.LSSJ, Head, Particles.LSSJ, Torso, Particles.Lightning2)
  Run = true
  On = true
  Mode.Value = true
end
local function OFF()
  if not Check() or not Run or not On then
    return
  end
  Run = false
  Function.Ball2(Torso, BrickColor.new("Lime green"))
  wait(1)
  Function.RemoveHair(Chr, Torso)
  Run = true
  On = false
  Chr.InMode:Destroy()
  Mode.Value = false
end
Player.Chatted:connect(function(MSG)
  local MSG = MSG:lower()
  if MSG:sub(1, 6) == "lssj" or MSG:sub(1, 9) == "/e lssj" then
    SSJ()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    OFF()
  end
end)
