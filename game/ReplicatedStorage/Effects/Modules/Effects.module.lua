local Function = {}
local Effects = game:GetService("ReplicatedStorage"):WaitForChild("Effects")
local Meshes = Effects:WaitForChild("Mesh")
local Parts = workspace:WaitForChild("PartStorage")
function Function.Waves(Color, Torso, X, Y)
  local Start = Torso.CFrame * CFrame.new(0, -2.6, 0) * CFrame.Angles(0, math.rad(math.random(0, 360), 0), 0)
  local nWave = Meshes.Wave:Clone()
  nWave.Parent = Parts
  nWave.CFrame = Start
  nWave.BrickColor = Color
  game.Debris:AddItem(nWave, 3)
  coroutine.resume(coroutine.create(function()
    for Number = 1, 60 do
      nWave.Mesh.Scale = nWave.Mesh.Scale + Vector3.new(X, Y, X)
      nWave.CFrame = Start * CFrame.Angles(0, math.rad(Number * 3), 0)
      nWave.Transparency = (Number - 20) / 20
      wait()
    end
    nWave:Destroy()
  end))
end
function Function.Waves2(Color, Torso, StartS, Rate)
  local Start = Torso.CFrame * CFrame.new(0, -2.6, 0) * CFrame.Angles(0, math.rad(math.random(0, 360), 0), 0)
  local nWave = Meshes.Wave:Clone()
  nWave.Parent = Parts
  nWave.CFrame = Start
  nWave.BrickColor = Color
  nWave.Mesh.Scale = StartS
  game.Debris:AddItem(nWave, 3)
  coroutine.resume(coroutine.create(function()
    for Number = 1, 60 do
      nWave.Mesh.Scale = nWave.Mesh.Scale - Rate
      nWave.CFrame = Start * CFrame.Angles(0, math.rad(Number * 3), 0)
      nWave.Transparency = (Number - 20) / 20
      wait()
    end
    nWave:Destroy()
  end))
end
function Function.Ball(Torso, Color)
  local Ball = Instance.new("Part")
  Ball.Size = Vector3.new(1, 1, 1)
  Ball.BrickColor = Color
  Ball.Anchored = true
  Ball.CanCollide = false
  Ball.Locked = true
  Ball.Shape = "Ball"
  Ball.TopSurface = 0
  Ball.Material = Enum.Material.SmoothPlastic
  Ball.Transparency = 0
  Ball.BottomSurface = 0
  local Ring = Meshes.BlastRing:Clone()
  Ring.BrickColor = Ball.BrickColor
  Ring.Parent = Parts
  local Ring2 = Ring:Clone()
  Ring2.Parent = Parts
  local Frame = Torso.CFrame
  local X, Y = math.random(-5, 5), math.random(-5, 5)
  local X2, Y2 = math.random(-5, 5), math.random(-5, 5)
  Ball.Parent = Parts
  game.Debris:AddItem(Ring, 5)
  game.Debris:AddItem(Ball, 5)
  game.Debris:AddItem(Ring2, 5)
  local Sound = Instance.new("Sound", Ball)
  Sound.SoundId = "rbxassetid://165970126"
  Sound.Volume = 1
  Sound:Play()
  coroutine.resume(coroutine.create(function()
    for i = 1, 50 do
      Ball.Size = Ball.Size + Vector3.new(0.75, 0.75, 0.75)
      Ball.Transparency = Ball.Transparency + 0.02
      Ring.Mesh.Scale = Ring.Mesh.Scale + Vector3.new(0.75, 0.75, 0.75)
      Ring.Transparency = Ball.Transparency
      Ring2.Mesh.Scale = Ring.Mesh.Scale
      Ring2.Transparency = Ring.Transparency
      Ball.CFrame = Frame * CFrame.Angles(math.rad(X * i), math.rad(Y * i), 0)
      Ring.CFrame = Ball.CFrame
      Ring2.CFrame = Frame * CFrame.Angles(math.rad(X2 * i), math.rad(Y2 * i), 0)
      wait()
    end
    Ball:Destroy()
    Ring:Destroy()
    Ring2:Destroy()
  end))
end
function Function.WeldHair(Hair, Head, Aura, Torso, Aura2)
  if Aura2 then
    Aura2:Clone().Parent = Torso
  end
  Aura:Clone().Parent = Torso
  Hair = Hair:Clone()
  local Child = Hair:GetChildren()
  local Main = Hair.Middle
  for i = 1, #Child do
    if Child[i]:IsA("Part") or Child[i]:IsA("UnionOperation") then
      local Weld = Instance.new("Weld")
      Weld.Part0 = Main
      Weld.Part1 = Child[i]
      local CJ = CFrame.new(Main.Position)
      local C0 = Main.CFrame:inverse() * CJ
      local C1 = Child[i].CFrame:inverse() * CJ
      Weld.C0 = C0
      Weld.C1 = C1
      Weld.Parent = Main
      Child[i].Anchored = false
    end
  end
  local Weld = Instance.new("Weld", Head)
  Weld.Part0 = Head
  Weld.Part1 = Main
  Hair.Parent = Torso.Parent
  for _, v in pairs(Torso.Parent:GetChildren()) do
    if v:IsA("Accoutrement") and v:FindFirstChild("Handle") then
      v.Handle.Transparency = 1
    end
  end
end
function Function.Aura(Torso, Aura, Aura2)
  Aura:Clone().Parent = Torso
  if Aura2 then
    Aura2:Clone().Parent = Torso
  end
end
function Function.RemoveHair(Char, Torso)
  local TChild = Torso:GetChildren()
  local CChild = Char:GetChildren()
  for i = 1, #TChild do
    if TChild[i]:IsA("ParticleEmitter") and TChild[i].Name ~= "Charge" then
      TChild[i]:Destroy()
    end
  end
  for i = 1, #CChild do
    if CChild[i]:FindFirstChild("Middle") then
      CChild[i]:Destroy()
    elseif CChild[i]:IsA("Accoutrement") then
      CChild[i].Handle.Transparency = 0
    end
  end
end
function Function.Cylinder(Torso, Color1, Color2)
  local Start = Torso.CFrame * CFrame.Angles(0, 0, math.rad(90))
  local Out = Instance.new("Part")
  Out.Size = Vector3.new(100, 1, 1)
  Out.Shape = "Cylinder"
  Out.TopSurface = 0
  Out.BottomSurface = 0
  Out.Material = Enum.Material.SmoothPlastic
  Out.BrickColor = Color1
  Out.Transparency = 0.2
  Out.Anchored = true
  Out.CanCollide = false
  local In = Out:Clone()
  In.Size = Vector3.new(100, 0.6, 0.6)
  In.BrickColor = Color2
  In.Transparency = 0
  In.Parent = Parts
  Out.Parent = Parts
  game.Debris:AddItem(In, 5)
  game.Debris:AddItem(Out, 5)
  coroutine.resume(coroutine.create(function()
    for i = 1, 30 do
      Out.Size = Out.Size + Vector3.new(0, 0.5, 0.5)
      In.Size = In.Size + Vector3.new(0, 0.5, 0.5)
      Out.CFrame = Start
      In.CFrame = Start
      Out.Transparency = (6 + (i - 6)) / 30
      In.Transparency = i / 30
      wait()
    end
    In:Destroy()
    Out:Destroy()
  end))
end
function Function.BackSpike(Torso, Color)
  local Start = Torso.CFrame
  local X, Y = math.random(-10, 10), math.random(-10, 10)
  local Spike = Meshes.Spikes:Clone()
  Spike.BrickColor = Color
  Spike.Mesh.Scale = Vector3.new(10, 10, 10)
  Spike.CFrame = Start
  Spike.Parent = Parts
  game.Debris:AddItem(Spike, 5)
  coroutine.resume(coroutine.create(function()
    for i = 1, 40 do
      Spike.CFrame = Start * CFrame.Angles(math.rad(X * i), math.rad(Y * i), 0)
      Spike.Mesh.Scale = Spike.Mesh.Scale - Vector3.new(0.3, 0.3, 0.3)
      Spike.Transparency = i / 40
      wait()
    end
    Spike:Destroy()
  end))
end
function Function.Cylinder2(Torso, Color1, Color2, Color)
  local Start2 = Torso.CFrame * CFrame.new(0, -2, 0)
  local Start = Torso.CFrame * CFrame.Angles(0, 0, math.rad(90))
  local Ring = Meshes.Wave:Clone()
  Ring.BrickColor = Color
  Ring.Mesh.Scale = Vector3.new(2, 1, 2)
  local Out = Instance.new("Part")
  Out.Size = Vector3.new(100, 1, 1)
  Out.Shape = "Cylinder"
  Out.TopSurface = 0
  Out.BottomSurface = 0
  Out.Material = Enum.Material.SmoothPlastic
  Out.BrickColor = Color1
  Out.Transparency = 0.2
  Out.Anchored = true
  Out.CanCollide = false
  local In = Out:Clone()
  In.Size = Vector3.new(100, 0.6, 0.6)
  In.BrickColor = Color2
  In.Transparency = 0
  In.Parent = Parts
  Ring.Parent = Parts
  Out.Parent = Parts
  game.Debris:AddItem(In, 5)
  game.Debris:AddItem(Out, 5)
  game.Debris:AddItem(Ring, 5)
  coroutine.resume(coroutine.create(function()
    for i = 1, 30 do
      Out.Size = Out.Size + Vector3.new(0, 0.5, 0.5)
      In.Size = In.Size + Vector3.new(0, 0.5, 0.5)
      Ring.Mesh.Scale = Ring.Mesh.Scale + Vector3.new(0.5, 0.25, 0.5)
      Out.CFrame = Start
      In.CFrame = Start
      Ring.CFrame = Start2 * CFrame.Angles(0, math.rad(10 * i), 0)
      Out.Transparency = (6 + (i - 6)) / 30
      In.Transparency = i / 30
      Ring.Transparency = i / 30
      wait()
    end
    In:Destroy()
    Ring:Destroy()
    Out:Destroy()
  end))
end
function Function.Cloud(Torso)
  local Cloud = Meshes.Cloud:Clone()
  Cloud.Position = Torso.Position + Vector3.new(0, 50, 0)
  Cloud.Parent = Parts
  game.Debris:AddItem(Cloud, 15)
  for i = 1, 30 do
    Cloud.Mesh.Scale = Cloud.Mesh.Scale + Vector3.new(2, 2, 2)
    Cloud.Position = Torso.Position + Vector3.new(0, 50, 0)
    wait()
  end
  return Cloud
end
function Function.RemoveCloud(Cloud)
  for i = 1, 30 do
    Cloud.Mesh.Scale = Cloud.Mesh.Scale - Vector3.new(2, 2, 2)
    Cloud.CFrame = Cloud.CFrame
    wait()
  end
  Cloud:Destroy()
end
function Function.RingDown(Torso, Color)
  local Ring = Meshes.BlastRing:Clone()
  Ring.BrickColor = Color
  Ring.Parent = Parts
  game.Debris:AddItem(Ring, 5)
  coroutine.resume(coroutine.create(function()
    for i = 100, 1, -1 do
      Ring.CFrame = Torso.CFrame * CFrame.new(0, 1 * (i / 10), 0) * CFrame.Angles(math.rad(90), 0, 0)
      Ring.Mesh.Scale = Ring.Mesh.Scale + Vector3.new(0.2, 0.2, 0.2)
      Ring.Transparency = Ring.Transparency + 0.005
      wait()
    end
    for i = 1, 5 do
      Ring.Transparency = Ring.Transparency + 0.1
      wait()
    end
    Ring:Destroy()
  end))
end
function Strike(Pos1, Pos2, Color, Parts)
  local Bolt = Instance.new("Model")
  local Path = {}
  Path[1] = Pos1
  local Main = Instance.new("Part")
  Main.Anchored = true
  Main.CanCollide = false
  Main.TopSurface = 0
  Main.BottomSurface = 0
  Main.Material = Enum.Material.Neon
  local Light = Instance.new("PointLight", Main)
  Light.Range = 12
  Light.Brightness = 1.5
  local Distance = (Pos1 - Pos2).magnitude
  local Points = math.random(Parts, Parts * 1.5)
  local Var = Distance / Points * 0.6
  for i = 1, Points do
    local Pos = Path[1]:Lerp(Pos2, i / Points)
    if i ~= Points then
      Pos = Pos + Vector3.new(math.random(-Var, Var), math.random(-Var, Var), math.random(-Var, Var))
    end
    table.insert(Path, Pos)
  end
  for i, Part in pairs(Path) do
    if Path[i - 1] then
      local Brick = Main:Clone()
      Brick.BrickColor = Color
      Brick.PointLight.Color = Brick.BrickColor.Color
      Brick.Size = Vector3.new(0.3, 0.3, (Path[i - 1] - Part).magnitude)
      Brick.CFrame = CFrame.new(Path[i - 1], Part)
      Brick.CFrame = Brick.CFrame + Brick.CFrame.lookVector * Brick.Size.Z / 2
      Brick.Parent = Bolt
    end
  end
  return Bolt
end
function Function.Flash(Times, Color, Pos1, Pos2, Part)
  coroutine.resume(coroutine.create(function()
    for i = 1, Times + math.random(0, 1) do
      local OBJ = Strike(Pos1, Pos2, Color, Part)
      OBJ.Parent = Parts
      wait(0.1)
      OBJ.Parent = nil
      OBJ:Destroy()
      wait(0.1)
    end
  end))
end
function Function.Ball2(Torso, Color)
  local Ball = Instance.new("Part")
  Ball.Size = Vector3.new(1, 1, 1)
  Ball.BrickColor = Color
  Ball.Anchored = true
  Ball.Material = Enum.Material.Neon
  Ball.CanCollide = false
  Ball.Locked = true
  Ball.Shape = "Ball"
  Ball.TopSurface = 0
  Ball.Transparency = 0.2
  Ball.BottomSurface = 0
  local Frame = Torso.CFrame
  Ball.Parent = Parts
  game.Debris:AddItem(Ball)
  local Sound = Instance.new("Sound", Ball)
  Sound.SoundId = "rbxassetid://165970126"
  Sound.Volume = 1
  Sound:Play()
  coroutine.resume(coroutine.create(function()
    for i = 1, 50 do
      Ball.Size = Ball.Size + Vector3.new(0.75, 0.75, 0.75)
      Ball.CFrame = Frame
      wait()
    end
    for i = 1, 25 do
      Ball.Size = Ball.Size - Vector3.new(0.75, 0.75, 0.75)
      Ball.CFrame = Frame
      wait()
    end
    for i = 1, 25 do
      Ball.Size = Ball.Size + Vector3.new(0.75, 0.75, 0.75)
      Ball.CFrame = Frame
      wait()
    end
    for i = 1, 25 do
      Ball.Size = Ball.Size - Vector3.new(0.75, 0.75, 0.75)
      Ball.CFrame = Frame
      wait()
    end
    for i = 1, 25 do
      Ball.Size = Ball.Size + Vector3.new(1.5, 1.5, 1.5)
      Ball.CFrame = Frame
      Ball.Transparency = i / 25
      wait()
    end
    Ball:Destroy()
  end))
end
local Cframe = function()
  return math.random(0, 360), math.random(0, 360), math.random(0, 360)
end
function Function.SSJG(Torso, Color1, Color2, Number)
  Number = Number or Number == 2
  local cframe = Torso.CFrame
  local Spike = Meshes.Spikes:Clone()
  Spike.BrickColor = Color1
  Spike.Mesh.Scale = Vector3.new(4, 4, 4)
  local Ring = Meshes.BlastRing:Clone()
  Ring.BrickColor = Color2
  Ring.Transparency = 0.2
  Ring.Mesh.Scale = Vector3.new(15, 15, 15)
  local Ring2 = Ring:Clone()
  local X = math.random(-6, 6)
  local X2 = math.random(-6, 6)
  local Y = math.random(-6, 6)
  local Y2 = math.random(-6, 6)
  local Z = math.random(-6, 6)
  local Z2 = math.random(-6, 6)
  local XX, XY, XZ = Cframe()
  local YX, YY, YZ = Cframe()
  game.Debris:AddItem(Ring, 20)
  game.Debris:AddItem(Ring2, 20)
  game.Debris:AddItem(Spike, 20)
  Ring.Parent = Parts
  Ring2.Parent = Parts
  Spike.Parent = Parts
  coroutine.resume(coroutine.create(function(Ring, Ring2, Spike)
    local ringframe = Torso.CFrame * CFrame.Angles(math.rad(XX), math.rad(XY), math.rad(XZ))
    local ringframe2 = Torso.CFrame * CFrame.Angles(math.rad(YX), math.rad(YY), math.rad(YZ))
    local total = 0
    print(1)
    for i = 1, Number do
      for _ = 1, 50 do
        Spike.Mesh.Scale = Spike.Mesh.Scale + Vector3.new(0.05, 0.05, 0.05)
        Spike.CFrame = Torso.CFrame
        Ring.Mesh.Scale = Ring.Mesh.Scale + Vector3.new(0.25, 0.25, 0.25)
        Ring2.Mesh.Scale = Ring.Mesh.Scale
        Ring.CFrame = ringframe * CFrame.Angles(math.rad(X * total), math.rad(Y * total), math.rad(Z * total))
        Ring2.CFrame = ringframe2 * CFrame.Angles(math.rad(X2 * total), math.rad(Y2 * total), math.rad(Z2 * total))
        total = total + 1
        wait()
      end
      for _ = 1, 50 do
        Spike.Mesh.Scale = Spike.Mesh.Scale - Vector3.new(0.05, 0.05, 0.05)
        Spike.CFrame = Torso.CFrame
        Ring.Mesh.Scale = Ring.Mesh.Scale - Vector3.new(0.25, 0.25, 0.25)
        Ring2.Mesh.Scale = Ring.Mesh.Scale
        Ring.CFrame = ringframe * CFrame.Angles(math.rad(X * total), math.rad(Y * total), math.rad(Z * total))
        Ring2.CFrame = ringframe2 * CFrame.Angles(math.rad(X2 * total), math.rad(Y2 * total), math.rad(Z2 * total))
        total = total + 1
        wait()
      end
    end
    for i = 1, 15 do
      Ring.Transparency = i / 15
      Ring2.Transparency = i / 15
      Spike.Transparency = i / 15
      wait()
    end
    Ring:Destroy()
    Ring2:Destroy()
    Spike:Destroy()
  end), Ring, Ring2, Spike)
end
return Function
