local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

repeat
  wait()
until player.Character
local character = player.Character
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local head = character:WaitForChild("Head")
local track = Instance.new("Animation")
track.AnimationId = "rbxassetid://590070518"
track = humanoid:LoadAnimation(track)
local gui = script.Parent:WaitForChild("MainGui")
local frame = script:WaitForChild("Frame"):Clone()
local inputHandler = script.Parent:WaitForChild("InputHandler")
local mode = inputHandler:WaitForChild("Kaioken")
local assets = game:GetService("ReplicatedStorage"):WaitForChild("Assets")
local particles = assets:WaitForChild("Particles")
local chat = game:GetService("Chat")
local active = false
local transformed = false
local function check()
  return character:FindFirstChild("InMode")
end
local function activateMode()
  if active or transformed or check() then
    return
  end
  active = true
  local bal = Instance.new("BoolValue")
  bal.Name = "InMode"
  bal.Parent = character
  local loading, exploding
  local sound = Instance.new("Sound")
  sound.SoundId = "rbxassetid://165970126"
  sound.Volume = 1
  sound.Parent = rootPart
  track.KeyframeReached:connect(function(keyframe)
    keyframe = keyframe:lower()
    if keyframe == "loading" then
      track:AdjustSpeed(0.5)
      loading = true
    elseif keyframe == "explode" then
      track:AdjustSpeed(1)
      exploding = true
    end
  end)
  track:Play()
  track:AdjustSpeed(0.1)
  chat:Chat(head, "Let's do this!", 2)
  local i = 0
  repeat
    wait()
    if i % 5 == 0 then
      do
        local rotation = math.random(0, 360)
        local wave = Instance.new("Part")
        wave.Size = Vector3.new(0.2, 0.2, 0.2)
        wave.BrickColor = BrickColor.Red()
        wave.Anchored = true
        wave.CanCollide = false
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = "rbxassetid://20329976"
        mesh.Scale = Vector3.new(1, 0.7, 1)
        mesh.Parent = wave
        wave.Parent = workspace.PartStorage
        game.Debris:AddItem(wave, 10)
        spawn(function()
          for i = 1, 20 do
            wave.Transparency = i / 20
            mesh.Scale = mesh.Scale + Vector3.new(1, 0.49, 1)
            local pos = rootPart.CFrame * CFrame.new(0, -3.05, 0) * CFrame.Angles(0, math.rad(rotation), 0)
            wave.CFrame = pos
            wait()
          end
          wave:Destroy()
        end)
      end
    end
    i = i + 1
  until loading
  repeat
    wait()
  until exploding
  chat:Chat(head, "AHHHHHHH", 2)
  spawn(function()
    local ball = Instance.new("Part")
    ball.Size = Vector3.new(1, 1, 1)
    ball.Shape = "Ball"
    ball.Anchored = true
    ball.CanCollide = false
    ball.Material = Enum.Material.Neon
    ball.BrickColor = BrickColor.Red()
    local rotation = math.random(0, 360)
    local wave = Instance.new("Part")
    wave.Size = Vector3.new(0.2, 0.2, 0.2)
    wave.BrickColor = BrickColor.Red()
    wave.Anchored = true
    wave.CanCollide = false
    local mesh = Instance.new("SpecialMesh")
    mesh.MeshId = "rbxassetid://20329976"
    mesh.Scale = Vector3.new(2, 1.5, 2)
    mesh.Parent = wave
    wave.Parent = workspace.PartStorage
    ball.Parent = workspace.PartStorage
    game.Debris:AddItem(ball, 10)
    game.Debris:AddItem(wave, 10)
    sound:Play()
    sound.Ended:connect(function()
      wait(0.1)
      sound:Destroy()
    end)
    for i = 1, 30 do
      ball.Transparency = i / 30
      wave.Transparency = i / 30
      ball.Size = ball.Size + Vector3.new(1.2, 1.2, 1.2)
      mesh.Scale = mesh.Scale + Vector3.new(1, 0.3, 1)
      local pos = rootPart.CFrame * CFrame.new(0, -3.05, 0) * CFrame.Angles(0, math.rad(rotation), 0)
      wave.CFrame = pos
      ball.CFrame = rootPart.CFrame
      if i == 15 then
        particles.Kaioken:Clone().Parent = rootPart
      end
      wait()
    end
    wave:Destroy()
    ball:Destroy()
  end)
  local newFrame = frame:Clone()
  newFrame.Parent = gui
  game.Debris:AddItem(newFrame, 10)
  spawn(function()
    for i = 1, 4 do
      newFrame.BackgroundTransparency = 1 + -0.25 * i
      wait()
    end
    wait(0.2)
    for i = 1, 20 do
      newFrame.BackgroundTransparency = 0.05 * i
      wait()
    end
    newFrame:Destroy()
  end)
  wait(0.5)
  chat:Chat(head, "KAIOKEN!", 2)
  mode.Value = true
  wait(2)
  active = false
  transformed = true
end
local function deactivateMode()
  if active or not transformed then
    return
  end
  active = true
  local sound = Instance.new("Sound")
  sound.SoundId = "rbxassetid://191345948"
  sound.PlaybackSpeed = 1.5
  sound.Volume = 1
  sound.Parent = rootPart
  spawn(function()
    local x, y, z = math.random(0, 360), math.random(0, 360), math.random(0, 360)
    local xX, xY, xZ = math.random(-5, 5), math.random(-5, 5), math.random(-5, 5)
    local wave = Instance.new("Part")
    wave.Transparency = 0.5
    wave.Size = Vector3.new(0.2, 0.2, 0.2)
    wave.BrickColor = BrickColor.White()
    wave.Anchored = true
    wave.CanCollide = false
    local mesh = Instance.new("SpecialMesh")
    mesh.MeshId = "rbxassetid://24388358"
    mesh.Scale = Vector3.new(2, 1.5, 2)
    mesh.Parent = wave
    wave.Parent = workspace.PartStorage
    game.Debris:AddItem(wave, 10)
    local rate = 0.016666666666666666
    for i = 1, 30 do
      wave.Transparency = 0.5 + rate * i
      mesh.Scale = mesh.Scale + Vector3.new(1, 0.3, 1)
      local pos = rootPart.CFrame * CFrame.Angles(math.rad(y), math.rad(x), math.rad(z))
      wave.CFrame = pos
      x = x + xX
      y = y + xY
      z = z + xZ
      wait()
    end
    wave:Destroy()
  end)
  local newFrame = frame:Clone()
  newFrame.BackgroundColor3 = Color3.new(1, 1, 1)
  newFrame.Parent = gui
  game.Debris:AddItem(newFrame, 10)
  spawn(function()
    sound:Play()
    spawn(function()
      wait(10)
      sound:Destroy()
    end)
    for i = 1, 4 do
      newFrame.BackgroundTransparency = 1 + -0.25 * i
      wait()
    end
    wait(0.2)
    for i = 1, 20 do
      newFrame.BackgroundTransparency = 0.05 * i
      wait()
    end
    newFrame:Destroy()
  end)
  local particle = rootPart:FindFirstChild("Kaioken")
  if particle then
    particle.Enabled = false
    spawn(function()
      wait(10)
      particle:Destroy()
    end)
  end
  if character:FindFirstChild("InMode") then
    character.InMode:Destroy()
  end
  mode.Value = false
  transformed = false
  active = false
end

mouse.KeyDown:connect(function(key)
	if string.lower(key) == "v" and player.Humanoid.Health > 0 and active == false then
			activateMode()
	else
		deactivateMode()
	end
end)
