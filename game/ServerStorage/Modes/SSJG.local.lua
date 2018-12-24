local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Chr = Player.Character
local Torso = Chr:WaitForChild("Torso")
local Head = Chr:WaitForChild("Head")
local Mode = script.Parent:WaitForChild("InputHandler"):WaitForChild("SuperSaiyanG")
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
  local saiyans = script.Saiyans:Clone()
  saiyans.Parent = Chr
  saiyans.Gohan.Torso.CFrame = Chr.Torso.CFrame * CFrame.new(3, 0, -2.25) * CFrame.Angles(0, 2.4, 0)
  saiyans.Goku.Torso.CFrame = Chr.Torso.CFrame * CFrame.new(-3, 0, -2.25) * CFrame.Angles(0, -2.4, 0)
  saiyans.Goten.Torso.CFrame = Chr.Torso.CFrame * CFrame.new(-3, 0, 2.5) * CFrame.Angles(0, -0.8, 0)
  saiyans.Trunks.Torso.CFrame = Chr.Torso.CFrame * CFrame.new(3, 0, 2.5) * CFrame.Angles(0, 0.8, 0)
  saiyans.Vegeta.Torso.CFrame = Chr.Torso.CFrame * CFrame.new(0, 0, -3) * CFrame.Angles(0, 3.2, 0)
  saiyans.Gohan.Torso.Anchored = true
  saiyans.Goku.Torso.Anchored = true
  saiyans.Goten.Torso.Anchored = true
  saiyans.Trunks.Torso.Anchored = true
  saiyans.Vegeta.Torso.Anchored = true
  local start = Torso.CFrame
  local stop = Torso.CFrame * CFrame.new(0, 10, 0)
  for i = 1, 5 do
    Torso.Anchored = true
    Torso.CFrame = start:Lerp(stop, i / 5)
    wait()
  end
  wait(1)
  Function.SSJG(Torso, BrickColor.new("Cyan"), BrickColor.new("Cyan"), 5)
  wait(15)
  Function.Cylinder(Torso, BrickColor.new("Cyan"), BrickColor.Red())
  Function.WeldHair(Effects.SSJG, Head, Particles.SSJG, Torso)
  wait(3)
  saiyans:Destroy()
  Torso.Anchored = false
  Run = true
  On = true
  Mode.Value = true
end
local function OFF()
  if not Check() or not Run or not On then
    return
  end
  Run = false
  Function.Ball2(Torso, BrickColor.new("Cyan"))
  Function.RemoveHair(Chr, Torso)
  Run = true
  On = false
  Chr.InMode:Destroy()
  Mode.Value = false
end
Player.Chatted:connect(function(MSG)
  local MSG = MSG:lower()
  if MSG:sub(1, 4) == "ssjg" or MSG:sub(1, 7) == "/e ssjg" then
    SSJ()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    OFF()
  end
end)
