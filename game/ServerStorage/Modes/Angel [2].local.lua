local ReplicatedStorage = game.ReplicatedStorage
local Transform = ReplicatedStorage.Events.Transform

Transform.OnServerEvent:Connect(function(player, SSJ)

if player.stats.VIP == true then

	local Player = player
	local Character = Player.Character
	local Torso = Player.Character.Humanoid.RigType == "R6" and Player.Character.Torso or Player.Character.UpperTorso
	local Head = Character:WaitForChild("Head")
	local Humanoid = Character:WaitForChild("Humanoid")
	local stats = Player:WaitForChild("stats")
	local Undead = Player.VIP:WaitForChild("Angel")
	local ModeTab = game:GetService("ReplicatedStorage"):WaitForChild("Effects")
	local PartTab = workspace:WaitForChild("PartStorage")
	local ModTab = ModeTab:WaitForChild("Modules")
	local WeldTab = require(ModTab:WaitForChild("WeldModule"))
	local WaveCount = 20
	local WaveLifeTicks = 50
	local Active = false
	local InMode = false
	local Angle = function()
  		return math.rad(math.random(0, 360))
	end

local function Check()
  return Character:FindFirstChild("InMode")
end
local function ModeOn()
  if Check() or Active or InMode then
    return
  end
  Active = true
  local InModeValue = Instance.new("BoolValue", Character)
  InModeValue.Name = "InMode"
  InModeValue.Value = true
  local Wave = ModeTab.Wave:Clone()
  Wave.BrickColor = BrickColor.White()
  for i = 1, WaveCount do
    do
      local StartCFrame = Torso.CFrame * CFrame.new(0, -3, 0) * CFrame.Angles(0, math.rad(math.random(0, 360)), 0)
      local SpinWave = Wave:Clone()
      local PointLight = Instance.new("PointLight", SpinWave)
      PointLight.Range = SpinWave.Mesh.Scale.X
      PointLight.Color = SpinWave.BrickColor.Color
      PointLight.Name = "EffectLight"
      SpinWave.Parent = PartTab
      SpinWave.CFrame = StartCFrame
      game.Debris:AddItem(SpinWave)
      coroutine.resume(coroutine.create(function(StartCFrame, PointLight)
        for Num = 1, WaveLifeTicks do
          SpinWave.Mesh.Scale = SpinWave.Mesh.Scale + Vector3.new(0.45, 0.15, 0.45)
          SpinWave.CFrame = StartCFrame * CFrame.Angles(0, math.rad(Num * 3), 0)
          PointLight.Range = SpinWave.Mesh.Scale.X
          if Num >= WaveLifeTicks / 2 then
            SpinWave.Transparency = SpinWave.Transparency + 1 / (WaveLifeTicks / 2)
            PointLight.Brightness = 1 - 1 / WaveLifeTicks * Num
          end
          wait()
        end
        SpinWave:Destroy()
      end), StartCFrame, PointLight)
      wait(0.1)
    end
  end
  local X1, Y1, Z1 = Angle(), Angle(), Angle()
  local X2, Y2, Z2 = Angle(), Angle(), Angle()
  local BallStart1 = Torso.CFrame * CFrame.Angles(X1, Y1, Z1)
  local BallStart2 = Torso.CFrame * CFrame.Angles(X2, Y2, Z2)
  local Ball1Angle = CFrame.Angles(0, 0, 0)
  local Ball2Angle = CFrame.Angles(0, 0, 0)
  local BX1, BY1 = math.rad(math.random(-6, 6)), math.rad(math.random(-6, 6))
  local BX2, BY2 = math.rad(math.random(-6, 6)), math.rad(math.random(-6, 6))
  local Ball1 = Instance.new("Part")
  Ball1.Size = Vector3.new(0.2, 0.2, 0.2)
  Ball1.BrickColor = BrickColor.Yellow()
  Ball1.Material = Enum.Material.Neon
  Ball1.Anchored = true
  Ball1.CanCollide = false
  Ball1.Parent = PartTab
  Ball1.CFrame = BallStart1
  local Ball2 = Ball1:Clone()
  Ball2.Parent = PartTab
  for i = 1, 20 do
    wait()
    Ball1Angle = Ball1Angle * CFrame.Angles(BX1, BY1, 0)
    Ball1.Size = Ball1.Size + Vector3.new(0.8, 0.8, 0.8)
    Ball1.CFrame = BallStart1 * Ball1Angle
    Ball2Angle = Ball2Angle * CFrame.Angles(BX2, BY2, 0)
    Ball2.Size = Ball1.Size
    Ball2.CFrame = BallStart2 * Ball2Angle
  end
  ModeTab.AngelP:Clone().Parent = Torso
  local Hair = ModeTab:WaitForChild("Angel"):Clone()
  WeldTab.Hair(Hair, Hair.Middle, Head)
  for i = 1, 20 do
    wait()
    Ball1Angle = Ball1Angle * CFrame.Angles(BX1, BY1, 0)
    Ball1.Size = Ball1.Size + Vector3.new(0.2, 0.2, 0.2)
    Ball1.CFrame = BallStart1 * Ball1Angle
    Ball1.Transparency = i / 21
    Ball2Angle = Ball2Angle * CFrame.Angles(BX2, BY2, 0)
    Ball2.Size = Ball1.Size
    Ball2.CFrame = BallStart2 * Ball2Angle
    Ball2.Transparency = i / 21
  end
  Ball1:Destroy()
  Ball2:Destroy()
  Undead.Value = true
  InMode = true
  Active = false
end
local function ModeOff()
  if not InMode or Active or not Check() then
    return
  end
  Active = true
  local X1, Y1, Z1 = Angle(), Angle(), Angle()
  local X2, Y2, Z2 = Angle(), Angle(), Angle()
  local BallStart1 = Torso.CFrame * CFrame.Angles(X1, Y1, Z1)
  local BallStart2 = Torso.CFrame * CFrame.Angles(X2, Y2, Z2)
  local Ball1Angle = CFrame.Angles(0, 0, 0)
  local Ball2Angle = CFrame.Angles(0, 0, 0)
  local BX1, BY1 = math.rad(math.random(-6, 6)), math.rad(math.random(-6, 6))
  local BX2, BY2 = math.rad(math.random(-6, 6)), math.rad(math.random(-6, 6))
  local Ball1 = Instance.new("Part")
  Ball1.Size = Vector3.new(24.2, 24.2, 24.2)
  Ball1.BrickColor = BrickColor.Yellow()
  Ball1.Material = Enum.Material.Neon
  Ball1.Anchored = true
  Ball1.CanCollide = false
  Ball1.Parent = PartTab
  Ball1.CFrame = BallStart1
  local Ball2 = Ball1:Clone()
  Ball2.Parent = PartTab
  for i = 1, 20 do
    wait()
    Ball1Angle = Ball1Angle * CFrame.Angles(BX1, BY1, 0)
    Ball1.Size = Ball1.Size - Vector3.new(0.8, 0.8, 0.8)
    Ball1.CFrame = BallStart1 * Ball1Angle
    Ball2Angle = Ball2Angle * CFrame.Angles(BX2, BY2, 0)
    Ball2.Size = Ball1.Size
    Ball2.CFrame = BallStart2 * Ball2Angle
  end
  if Torso:FindFirstChild("AngelP") then
    Torso.AngelP:Destroy()
  end
  WeldTab.Hats("Angel", Character)
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
  end
  Ball1:Destroy()
  Ball2:Destroy()
  if Check() then
    local InModeValue = Check()
    InModeValue:Destroy()
  end
  Undead.Value = false
  Active = false
  InMode = false
end
  end

if SSJ == "angel" or SSJ == "/e angel" then
	ModeOn()
elseif SSJ == "off" or SSJ == "/e off" then
    ModeOff()
end

end)

