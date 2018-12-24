local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Chr = Player.Character
local Torso = Chr:WaitForChild("Torso")
local Head = Chr:WaitForChild("Head")
local Mode = script.Parent:WaitForChild("InputHandler"):WaitForChild("Mystic")
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
  for i = 1, 20 do
    Function.Waves(BrickColor.White(), Torso, 0.8, 0.25)
    if i % 4 == 0 then
      Function.Ball2(Torso, BrickColor.new("Baby blue"))
    end
    wait(0.4)
  end
  Function.Aura(Torso, Particles.Mystic, Particles.Lightning)
  Run = true
  On = true
  Mode.Value = true
end
local function OFF()
  if not Check() or not Run or not On then
    return
  end
  Run = false
  Function.Ball2(Torso, BrickColor.new("Baby blue"))
  Function.RemoveHair(Chr, Torso)
  Run = true
  On = false
  Chr.InMode:Destroy()
  Mode.Value = false
end
Player.Chatted:connect(function(MSG)
  local MSG = MSG:lower()
  if MSG:sub(1, 7) == "mystic" or MSG:sub(1, 10) == "/e mystic" then
    SSJ()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    OFF()
  end
end)
