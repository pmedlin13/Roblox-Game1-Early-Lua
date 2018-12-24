-----------------
--| Constants |--
-----------------
local BLAST_RADIUS = script.Parent.Parent.Configurations.BlastRadius.Value -- Blast radius of the explosion
local BLAST_DAMAGE = script.Parent.Parent.Configurations.Damage.Value -- Amount of damage done to players
local BLAST_FORCE = script.Parent.Parent.Configurations.BlastForce.Value -- Amount of force applied to parts

local IGNORE_LIST = {rocket = 1, handle = 1, effect = 1, water = 1} -- Rocket will fly through things named these
--NOTE: Keys must be lowercase, values must evaluate to true

-----------------
--| Variables |--
-----------------

local DebrisService = game:GetService('Debris')
local PlayersService = game:GetService('Players')

local Rocket = script.Parent

local CreatorTag = Rocket:WaitForChild('creator', 60)

-----------------
--| Functions |--
-----------------

-- Removes any old creator tags and applies a new one to the target
local function ApplyTags(target)
	while target:FindFirstChild('creator') do
		target.creator:Destroy()
	end

	local creatorTagClone = CreatorTag:Clone()
	DebrisService:AddItem(creatorTagClone, 1.5)
	creatorTagClone.Parent = target
end

-- Returns the ancestor that contains a Humanoid, if it exists
local function FindCharacterAncestor(subject)
	if subject and subject ~= game.Workspace then
		local humanoid = subject:FindFirstChild('Humanoid')
		if humanoid then
			return subject, humanoid
		else
			return FindCharacterAncestor(subject.Parent)
		end
	end
	return nil
end

-- Customized explosive effect that doesn't affect teammates and only breaks joints on dead parts
local function OnExplosionHit(hitPart, hitDistance, blastCenter)	
	if hitPart and hitDistance then
		local character, humanoid = FindCharacterAncestor(hitPart.Parent)

		if character then
			local myPlayer = CreatorTag.Value
			if myPlayer and not myPlayer.Neutral then -- Ignore friendlies caught in the blast
				local player = PlayersService:GetPlayerFromCharacter(character)
				if player and player ~= myPlayer and player.TeamColor == Rocket.BrickColor then
					return
				end
			end
		end

		if humanoid and humanoid.Health > 0 then -- Humanoids are tagged and damaged
			if hitPart.Name == 'Torso' or hitPart.Name =="UpperTorso" then
				ApplyTags(humanoid)
				local myPlayer = CreatorTag.Value
				local percent = script.Parent.Parent.ChargeTime.Value
				print(percent)
				local Ki = myPlayer.stats.Ki.Value / 500
				local KiDamage10 = Ki * 10
				humanoid:TakeDamage(Ki+(percent*(KiDamage10-Ki)))
			end
		end
	end
end

local function OnTouched(otherPart)
	if Rocket and otherPart then
		-- Fly through anything in the ignore list
		if IGNORE_LIST[string.lower(otherPart.Name)] then
			return
		end

		local myPlayer = CreatorTag.Value
		if myPlayer then
			-- Fly through the creator
			if myPlayer.Character and myPlayer.Character:IsAncestorOf(otherPart) then
				return
			end

			 -- Fly through friendlies
			if not myPlayer.Neutral then
				local character = FindCharacterAncestor(otherPart.Parent)
				local player = PlayersService:GetPlayerFromCharacter(character)
				if player and player ~= myPlayer and player.TeamColor == Rocket.BrickColor then
					return
				end
			end
		end

		-- Fly through terrain water
		if otherPart == game.Workspace.Terrain then
			--NOTE: If the rocket is large, then the simplifications made here will cause it to fly through terrain in some cases
			local frontOfRocket = Rocket.Position + (Rocket.CFrame.lookVector * (Rocket.Size.Z / 2))
			local cellLocation = game.Workspace.Terrain:WorldToCellPreferSolid(frontOfRocket)
			local cellMaterial = game.Workspace.Terrain:GetCell(cellLocation.X, cellLocation.Y, cellLocation.Z)
			if cellMaterial == Enum.CellMaterial.Water or cellMaterial == Enum.CellMaterial.Empty then
				return
			end
		end

		-- Create the explosion
		local explosion = Instance.new('Explosion')
		explosion.BlastPressure = 0 -- Completely safe explosion
		explosion.BlastRadius = BLAST_RADIUS
		explosion.ExplosionType = Enum.ExplosionType.NoCraters
		explosion.Position = Rocket.Position
		explosion.Parent = game.Workspace

		-- Connect custom logic for the explosion
		explosion.Hit:connect(function(hitPart, hitDistance) OnExplosionHit(hitPart, hitDistance, explosion.Position) end)

		-- Move this script and the creator tag (so our custom logic can execute), then destroy the rocket
		script.Parent = explosion
		CreatorTag.Parent = script
		Rocket:Destroy()
	end
end

--------------------
--| Script Logic |--
--------------------


Rocket.Touched:connect(OnTouched)
