-- Written by FullMetalEdward45221

local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
local Object = game:GetService("ServerStorage"):WaitForChild("Blast_Model")
local physicsService = game:GetService("PhysicsService")

local Blast_Speed = 80 --// Default [120]
local Damage = 5 		--// Default [8]

function NewBlast(Damage,Speed,Target,StartPos,pName)
	local Blast = Object:Clone()
	Blast:WaitForChild('Damage').Value = Damage
	Blast.Parent = workspace
	Blast.CFrame = StartPos
	Blast.Velocity = ((Target - Blast.Position).unit) * Speed
	local force = Instance.new'BodyForce'
	force.force = Vector3.new(0, Blast:GetMass()*workspace.Gravity, 0)
	force.Parent = Blast
	local BlastColor = ColorSequence.new(Blast.Color)
	Blast.Trail.Color = BlastColor
	
	--glowy--
	for i, v in pairs(Blast:GetChildren()) do
	if v:IsA("ParticleEmitter") then
		v.Rate = 20
		end
	end

	
	Blast:WaitForChild('Owner').Value = pName
	Blast:WaitForChild('Damage').Value = Damage
	Blast:WaitForChild('GeneralScript').Disabled = false
	
	game:GetService("Debris"):AddItem(Blast)
	
	Blast:SetNetworkOwner(nil)
	
end

function CreateSound(audioID,audioVolume,pitch,debris,paren)
	local link = 'rbxassetid://'
	local Audio = Instance.new('Sound')
	Audio.SoundId = link..audioID
	Audio.Volume = audioVolume
	Audio.PlaybackSpeed = pitch
	Audio.Parent = paren
	Audio.Name = math.random(1, 1000000) --//Names the Audio Randomly a Number from 1 to 1000000
	Audio.EmitterSize = 6
	game.Debris:AddItem(Audio,debris)
	
	Audio:Play()
end

remotes.FireBlast.OnServerInvoke = function(player,p)
	local character = player.Character
	if character then
		local humanoid = character:FindFirstChild("Humanoid")
			if humanoid.RigType == Enum.HumanoidRigType.R6 then
				local animationMATH = math.random(1,2)
				CreateSound(586187912,.3,1.1,0.8,character:FindFirstChild("Head"))
				CreateSound(586187912,.5,1,1,character:FindFirstChild("Head"))
				if animationMATH == 1 then
					Damage = (player.stats.Ki.Value / 500) + 10
					--r6_rightarmanimation.KeyframeReached:Wait()
					NewBlast(Damage,Blast_Speed,p,CFrame.new(character['Right Arm'].RightGripAttachment.WorldPosition.X,character['Right Arm'].RightGripAttachment.WorldPosition.Y,character['Right Arm'].RightGripAttachment.WorldPosition.Z),player.Name)
				else
					Damage = (player.stats.Ki.Value / 500) + 10
					--r6_leftarmanimation.KeyframeReached:Wait()
					NewBlast(Damage,Blast_Speed,p,CFrame.new(character['Left Arm'].LeftGripAttachment.WorldPosition.X,character['Left Arm'].LeftGripAttachment.WorldPosition.Y,character['Left Arm'].LeftGripAttachment.WorldPosition.Z),player.Name)
				end
			else
				local animationMATH = math.random(1,2)
				CreateSound(586187912,.3,1.1,0.8,character:FindFirstChild("Head"))
				CreateSound(586187912,.5,1,1,character:FindFirstChild("Head"))
				if animationMATH == 1 then
					Damage = (player.stats.Ki.Value / 500) + 10
					--r15_rightarmanimation.KeyframeReached:Wait()
					NewBlast(Damage,Blast_Speed,p,CFrame.new(character['RightHand'].RightGripAttachment.WorldPosition.X,character['RightHand'].RightGripAttachment.WorldPosition.Y,character['RightHand'].RightGripAttachment.WorldPosition.Z),player.Name)
				else
					Damage = (player.stats.Ki.Value / 500) + 10
					--r15_leftarmanimation.KeyframeReached:Wait()
					NewBlast(Damage,Blast_Speed,p,CFrame.new(character['LeftHand'].LeftGripAttachment.WorldPosition.X,character['LeftHand'].LeftGripAttachment.WorldPosition.Y,character['LeftHand'].LeftGripAttachment.WorldPosition.Z),player.Name)
			end
		end
	end
end





