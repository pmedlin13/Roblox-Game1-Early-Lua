local TweenService = game:GetService("TweenService")
local Blast = script.Parent
local HEALTH_DAMAGE = Blast:WaitForChild("Damage")
local Owner = Blast:WaitForChild("Owner")
local Touched = false

if Owner.Value == "Nil" then return end

function Explode()
	local BlastExplosion = Instance.new('Part')
	BlastExplosion.Color = Blast.Color
	BlastExplosion.Material = Blast.Material
	BlastExplosion.Reflectance = Blast.Reflectance
	BlastExplosion.Transparency = 0
	BlastExplosion.Name = "KI_Explosion"
	BlastExplosion.Parent = workspace
	BlastExplosion.CFrame = CFrame.new(Blast.Position.X,Blast.Position.Y,Blast.Position.Z)
	BlastExplosion.Anchored = false
	BlastExplosion.CanCollide = false
	BlastExplosion.Size = Vector3.new(1,1,1)
	local BlastMesh = Instance.new("SpecialMesh")
	BlastMesh.MeshType = Enum.MeshType.Sphere
	BlastMesh.Parent = BlastExplosion
	local force = Instance.new'BodyForce'
	force.force = Vector3.new(0, BlastExplosion:GetMass()*workspace.Gravity, 0)
	force.Parent = BlastExplosion
	game:GetService("Debris"):AddItem(BlastExplosion, .4)
	game:GetService("Debris"):AddItem(Blast, 0)
	
	local PartGoal = {}
	PartGoal.Color = Color3.fromRGB(95, 10, 255)
	PartGoal.Transparency = 1
	local MeshGoal = {}
	MeshGoal.Scale = Vector3.new(12.5,12.5,12.5)
	
	local Info = TweenInfo.new(.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	local TweenPart = TweenService:Create(BlastExplosion, Info, PartGoal)
	local TweenMesh = TweenService:Create(BlastMesh, Info, MeshGoal)
	
	TweenPart:Play()
	TweenMesh:Play()
	wait()
end

local function getPlayerFromName(name)
   -- loop over all players:
   for _, player in pairs(game:GetService("Players"):GetPlayers()) do
      -- if their name matches (case insensitive), return with that player:
      if player.Name:lower() == name:lower() then
          return player
      end
   end
   -- if we reach the end of the for-loop, no player with that name was found
end

Blast.Touched:connect(function(Part)
	if Part and Part.Parent and Part.Name ~= "Handle" and Part.Parent.ClassName ~= "Accessory" and Part.Parent.ClassName ~= "Hat" and Part.Parent:FindFirstChild("Humanoid") and Part.Parent.Name ~= Owner.Value and Part.Name ~= "KI_Explosion" and Part.Name ~= Blast.Name and Touched == false then
		Touched = true
		local lPlayer = getPlayerFromName(Owner.Value)
		local Ki = lPlayer.stats.Ki.Value / 500
		local Humanoid = Part.Parent:WaitForChild("Humanoid")
		local Character = Humanoid.Parent
		Humanoid:TakeDamage(Ki)
		Humanoid:TakeDamage(5)
		Explode()
	elseif Part and Part.Parent and Part.Name ~= "Handle" and Part.Parent.ClassName ~= "Accessory" and Part.Parent.ClassName ~= "Hat" and Part.Parent.Name ~= Owner.Value and Part.Name ~= "KI_Explosion" and Part.Name ~= Blast.Name and Touched == false then
		Explode()
	end
end)