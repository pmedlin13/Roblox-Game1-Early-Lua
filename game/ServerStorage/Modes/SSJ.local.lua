local Player = game.Players.LocalPlayer
repeat
  wait()
until Player.Character
local Character = Player.Character
local Torso = Character:WaitForChild("Torso")
local Humanoid = Character:WaitForChild("Humanoid")
local Head = Character:WaitForChild("Head")
local Camera = workspace.CurrentCamera
local InputHandler = script.Parent:WaitForChild("InputHandler")
local SSJ = InputHandler:WaitForChild("SuperSaiyan")
local ModeTab = game:GetService("ReplicatedStorage"):WaitForChild("Effects")
local Hairs = game.ReplicatedStorage:WaitForChild("SSJVariants"):GetChildren()
local PartTab = workspace:WaitForChild("PartStorage")
local ModTab = ModeTab:WaitForChild("Modules")
local WeldTab = require(ModTab:WaitForChild("WeldModule"))
local ModeNames = {
  "ssj",
  "/e ssj",
  "super saiyan",
  "/e super saiyan"
}
local WaveCount = 20
local Active = false
local InMode = false
local Angle = function()
  return math.rad(math.random(0, 360))
end
local function Check()
  return Character:FindFirstChild("InMode")
end
local function ModeNameCheck(MSG)
  for _, String in pairs(ModeNames) do
    if MSG:sub(1, string.len(String) + 1) == String then
      return true
    end
  end
  return false
end
local function ModeOn()
  if Check() or Active or InMode then
    return
  end
  Active = true
  local InModeValue = Instance.new("BoolValue", Character)
  InModeValue.Name = "InMode"
  InModeValue.Value = true
  local SuperExplode = ModeTab:WaitForChild("SuperExplode"):Clone()
  SuperExplode.Parent = Torso
  local Waves = ModeTab:WaitForChild("Wave"):Clone()
  Waves.BrickColor = BrickColor.new("Daisy orange")
  local Lightning = Instance.new("Part")
  Lightning.BrickColor = BrickColor.new("Cyan")
  Lightning.Anchored = true
  Lightning.CanCollide = false
  Lightning.TopSurface = 0
  Lightning.BottomSurface = 0
  Lightning.Material = Enum.Material.Neon
  Lightning.Size = Vector3.new(4, 200, 4)
  Lightning.Transparency = 0.1
  local CylinderMesh = Instance.new("CylinderMesh", Lightning)
  CylinderMesh.Scale = Vector3.new(1, 10, 1)
  CylinderMesh.Name = "Mesh"
  for Num = 1, WaveCount do
    do
      local StartCFrame = Torso.CFrame * CFrame.new(0, -3, 0) * CFrame.Angles(0, math.rad(math.random(0, 360)), 0)
      local Wave = Waves:Clone()
      Wave.Parent = PartTab
      Wave.CFrame = StartCFrame
      coroutine.resume(coroutine.create(function()
        for i = 1, 20 do
          wait()
          Wave.Mesh.Scale = Wave.Mesh.Scale + Vector3.new(0.8, 0.2, 0.8)
          Wave.CFrame = StartCFrame * CFrame.Angles(0, math.rad(6 * i), 0)
        end
        for i = 1, 20 do
          wait()
          Wave.Mesh.Scale = Wave.Mesh.Scale + Vector3.new(0.4, 0.1, 0.4)
          Wave.CFrame = StartCFrame * CFrame.Angles(0, math.rad(3 * i + 120), 0)
          Wave.Transparency = i / 21
        end
        Wave:Destroy()
      end))
      if Num % 2 == 0 then
        do
          local Bolt = Lightning:Clone()
          Bolt.CFrame = Torso.CFrame * CFrame.new(math.random(-30, 30), 0, math.random(-30, 30))
          local Inner = Bolt:Clone()
          Inner.Mesh.Scale = Vector3.new(1.1, 10, 1.1)
          Inner.CFrame = Bolt.CFrame
          Inner.Transparency = 0.6
          Inner.Material = Enum.Material.Foil
          Bolt.Transparency = 0
          Bolt.BrickColor = BrickColor.White()
          coroutine.resume(coroutine.create(function()
            for i = 1, math.random(1, 3) do
              Bolt.Parent = PartTab
              Inner.Parent = PartTab
              wait(0.1)
              Bolt.Parent = nil
              Inner.Parent = nil
              wait(0.1)
            end
            Bolt:Destroy()
            Inner:Destroy()
          end))
        end
      end
      wait(0.2)
    end
  end
  SuperExplode:Emit(50)
  ModeTab:WaitForChild("SuperSaiyanP"):Clone().Parent = Torso
  SSJ.Value = true
  local Hair = Hairs[math.random(1, #Hairs)]:Clone()
  WeldTab.Hair(Hair, Hair.Middle, Head)
  Head.face.Face = "Back"
  local Face = Instance.new("Decal")
  Face.Texture = "rbxassetid://231488725"
  Face.Parent = Head
  Face.Name = "ModeFace"
  InMode = true
  Active = false
end
local function ModeOff()
  if not InMode or Active or not Check() then
    return
  end
  InMode = false
  Active = true
  local X1, Y1, Z1 = Angle(), Angle(), Angle()
  local X2, Y2, Z2 = Angle(), Angle(), Angle()
  local X3, Y3, Z3 = Angle(), Angle(), Angle()
  local BallStart1 = Torso.CFrame * CFrame.Angles(X1, Y1, Z1)
  local BallStart2 = Torso.CFrame * CFrame.Angles(X2, Y2, Z2)
  local BallStart3 = Torso.CFrame * CFrame.Angles(X3, Y3, Z3)
  local Ball1Angle = CFrame.Angles(0, 0, 0)
  local Ball2Angle = CFrame.Angles(0, 0, 0)
  local Ball3Angle = CFrame.Angles(0, 0, 0)
  local BX1, BY1 = math.rad(math.random(-6, 6)), math.rad(math.random(-6, 6))
  local BX2, BY2 = math.rad(math.random(-6, 6)), math.rad(math.random(-6, 6))
  local BX3, BY3 = math.rad(math.random(-6, 6)), math.rad(math.random(-6, 6))
  local Ball1 = Instance.new("Part")
  Ball1.Size = Vector3.new(24.2, 24.2, 24.2)
  Ball1.BrickColor = BrickColor.White()
  Ball1.Material = Enum.Material.Neon
  Ball1.Anchored = true
  Ball1.CanCollide = false
  Ball1.Parent = PartTab
  Ball1.CFrame = BallStart1
  local Ball2 = Ball1:Clone()
  Ball2.Parent = PartTab
  local Ball3 = Ball1:Clone()
  Ball3.Parent = PartTab
  for i = 1, 20 do
    wait()
    Ball1Angle = Ball1Angle * CFrame.Angles(BX1, BY1, 0)
    Ball1.Size = Ball1.Size - Vector3.new(0.8, 0.8, 0.8)
    Ball1.CFrame = BallStart1 * Ball1Angle
    Ball2Angle = Ball2Angle * CFrame.Angles(BX2, BY2, 0)
    Ball2.Size = Ball1.Size
    Ball2.CFrame = BallStart2 * Ball2Angle
    Ball3Angle = Ball3Angle * CFrame.Angles(BX3, BY3, 0)
    Ball3.Size = Ball1.Size
    Ball3.CFrame = BallStart3 * Ball3Angle
  end
  if Torso:FindFirstChild("SuperSaiyanP") then
    Torso.SuperSaiyanP:Destroy()
  end
  WeldTab.Hats("SuperSaiyan", Character)
  Head.face.Face = "Front"
  if Head:FindFirstChild("ModeFace") then
    Head.ModeFace:Destroy()
  end
  for i = 1, 20 do
    wait()
    Ball1Angle = Ball1Angle * CFrame.Angles(BX1, BY1, 0)
    Ball1.Size = Ball1.Size - Vector3.new(0.2, 0.2, 0.2)
    Ball1.CFrame = BallStart1 * Ball1Angle
    Ball1.Transparency = i / 21
    Ball2Angle = Ball2Angle * CFrame.Angles(BX2, BY2, 0)
    Ball2.Size = Ball1.Size
    Ball2.CFrame = BallStart2 * Ball2Angle
    Ball2.Transparency = i / 21
    Ball3Angle = Ball3Angle * CFrame.Angles(BX3, BY3, 0)
    Ball3.Size = Ball1.Size
    Ball3.CFrame = BallStart3 * Ball3Angle
    Ball3.Transparency = i / 21
  end
  Ball1:Destroy()
  Ball2:Destroy()
  Ball3:Destroy()
  SSJ.Value = false
  if Check() then
    local InModeValue = Check()
    InModeValue:Destroy()
  end
  Active = false
end
Player.Chatted:connect(function(MSG)
  MSG = MSG:lower()
  if ModeNameCheck(MSG) then
    ModeOn()
  elseif MSG:sub(1, 4) == "off" or MSG:sub(1, 7) == "/e off" then
    ModeOff()
  end
end)
