--Made by Stickmasterluke
--What is Dragon Ball?


sp=script.Parent
plr=game.Players.localPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local increaseKi = ReplicatedStorage.Events:WaitForChild("IncreaseKi")
--Bomb--
damage={0,0}
firerate=3
bombvelocity=60
chargetime=20
extrasize=3
--------

--Flying--
speed=2
topspeed=30
----------

rate=1/30
debris=game:GetService("Debris")
equipped=false
check=true


inertia=1-(speed/topspeed)
flying=false
controls={forward=0,backward=0,left=0,right=0}
momentum=Vector3.new(0,0,0)
lastmomentum=Vector3.new(0,0,0)
totalmomentum=0
lastflap=0
tilt=0
lasttilt=0


function waitfor(a,b)
	while a:FindFirstChild(b)==nil do
		a.ChildAdded:wait()
	end
	return a:FindFirstChild(b)
end


local anim=waitfor(sp,"FlyAnimation")
local anim2=waitfor(sp,"ChargeEnergyBall")


function RemoveFlyStuff()
	local plr=game.Players.LocalPlayer
	if plr then
		local chr=plr.Character
		if chr then
			local torso=chr:FindFirstChild("Torso")
			if torso~=nil then
				for i,v in ipairs(torso:GetChildren()) do
					if v and (v.Name=="FlightGyro" or v.Name=="FlightVelocity") then
						v:remove()
					end
				end
			end
		end
	end
end

function fly()		--(de)activate fly mode
	if not equipped then
		flying=false
	else
		flying=not flying
	end
	RemoveFlyStuff()
	if flying then
		local torso=sp.Parent:FindFirstChild("Torso")
		local humanoid=sp.Parent:FindFirstChild("Humanoid")
		if torso and humanoid and humanoid.Health>0 then
			momentum=torso.Velocity+(torso.CFrame.lookVector*3)+Vector3.new(0,10,0)

			local gyro=Instance.new("BodyGyro")
			gyro.Name="FlightGyro"
			gyro.P=10^6
			gyro.maxTorque=Vector3.new(gyro.P,gyro.P,gyro.P)
			gyro.cframe=torso.CFrame
			gyro.Parent=torso

			velocity=Instance.new("BodyVelocity")
			velocity.Name="FlightVelocity"
			velocity.velocity=Vector3.new(0,0,0)
			velocity.P=10^4
			velocity.maxForce=Vector3.new(1,1,1)*(10^6)
			velocity.Parent=torso

			if flyanim~=nil then
				flyanim:Stop()
			end
			flyanim=humanoid:LoadAnimation(anim)
			if flyanim then
				flyanim:Play()
			end

			while flying and torso and humanoid and humanoid.Health>0 and equipped do
				local movement=game.Workspace.CurrentCamera.CoordinateFrame:vectorToWorldSpace(Vector3.new(controls.left+controls.right,math.abs(controls.forward)*.2,controls.forward+controls.backward))*speed

				momentum=(momentum*inertia)+movement
				totalmomentum=momentum.magnitude
				if totalmomentum>topspeed then
					totalmomentum=topspeed
				end

				local tilt=((momentum*Vector3.new(1,0,1)).unit:Cross(((lastmomentum*Vector3.new(1,0,1)).unit))).y
				-- Need to exhaustively check that tilt hasn't gotten into some weird value, these checks aren't exhaustive
				if tostring(tilt)=="-1.#IND" or tostring(tilt)=="1.#IND" or tilt==math.huge or tilt==-math.huge or tostring(0/0) == tostring(tilt) then
					tilt=0
				end
				local abstilt=math.abs(tilt)
				if abstilt>.06 or abstilt<.0001 then
					if math.abs(lasttilt)>.0001 then
						tilt=lasttilt*.9
					else
						tilt=0
					end
				else
					tilt=(lasttilt*.77)+(tilt*.25)			--weighted average
				end
				lasttilt=tilt

				if totalmomentum<.5 then
					momentum=Vector3.new(0,0,0)
					totalmomentum=0
					gyro.cframe=game.Workspace.CurrentCamera.CoordinateFrame
				else
					--[[print("Momentum:" , momentum , "tilt:" , tilt , "totalmomentum:" , totalmomentum , "topspeed:" , topspeed)
					print(CFrame.new(Vector3.new(0,0,0),momentum) *
							CFrame.Angles(0,0,tilt*(-20)) *
							CFrame.Angles(math.pi*(-.5) * (totalmomentum/topspeed), 0, 0))
					--]]
					gyro.cframe=CFrame.new(Vector3.new(0,0,0),momentum)*CFrame.Angles(0,0,tilt*(-20))*CFrame.Angles(math.pi*(-.5)*(totalmomentum/topspeed),0,0)
				end
				velocity.velocity=momentum
				lastmomentum=momentum
				wait(rate)
			end
			RemoveFlyStuff()
			if flyanim~=nil then
				flyanim:Stop()
			end
			flying=false
		end
	end
end

function onEquipped(mouse)
	sp.Handle.Transparency=1
	equipped=true
	if chargeanim~=nil then
		chargeanim:Stop()
	end
	if mouse~=nil then
		mouse.Icon="rbxasset://textures\\GunCursor.png"
		mouse.Button1Down:connect(function()
			down=true
			local he=sp.Parent:FindFirstChild("Head")
			local hu=sp.Parent:FindFirstChild("Humanoid")
			if check and he and hu and hu.Health>0 then
				check=false
				mouse.Icon="rbxasset://textures\\GunWaitCursor.png"
				starttime=tick()
				lv=he.CFrame.lookVector
				local mesh=sp.Handle:FindFirstChild("Mesh")
				if mesh~=nil then
					mesh.Scale=Vector3.new(1,1,1)
				end
				local fire=sp.Handle:FindFirstChild("Fire")
				if fire~=nil then
					fire.Size=0
					fire.Enabled=true
				end
				if chargeanim~=nil then
					chargeanim:Stop()
				end
				chargeanim=hu:LoadAnimation(anim2)
				if chargeanim then
					chargeanim:Play()
				end
				local lastchargesound=0
				while down and equipped and tick()-starttime<chargetime and hu~=nil and hu.Health>0 do
					local percent=(tick()-starttime)/chargetime
					script.Parent.ChargeTime.Value = percent
					sp.Handle.Transparency=.3+(math.random()*.3)
					sp.GripPos=Vector3.new(0,0,.5+(extrasize*.5*percent))
					local mesh=sp.Handle:FindFirstChild("Mesh")
					if mesh~=nil then
						mesh.Scale=Vector3.new(1,1,1)+(Vector3.new(1,1,1)*extrasize*percent)
					end
					local fire=sp.Handle:FindFirstChild("Fire")
					if fire~=nil then
						fire.Size=percent*extrasize*2
					end
					local lightning1=sp.Handle:FindFirstChild("Lightning1")
					lightning1.Enabled = true
					local lightning2=sp.Handle:FindFirstChild("Lightning2")
					lightning2.Enabled = true
	
					if tick()-lastchargesound>5 then
						lastchargesound=tick()
						local sound=sp.Handle:FindFirstChild("ChargeSound")
						if sound~=nil then
							sound:Play()
						end
					end
					wait()
				end
				sp.GripPos=Vector3.new(0,0,0)
				sp.Handle.Transparency=1
				local sound=sp.Handle:FindFirstChild("ChargeSound")
				if sound~=nil then
					sound:Stop()
				end
				local sound=sp.Handle:FindFirstChild("FireSound")
				if sound~=nil then
					sound:Play()
					
				end
				local fire=sp.Handle:FindFirstChild("Fire")
				local Particlez=sp.Handle:FindFirstChild("ParticleEmitter")
				if fire~=nil and Particlez~=nil then
					fire.Enabled=false
					Particlez.Enabled=false
				end
				local shot=sp.Handle:clone()
				if chargeanim~=nil then
					chargeanim:Stop()
					local lightning1=sp.Handle:FindFirstChild("Lightning1")
					lightning1.Enabled = false
					local lightning2=sp.Handle:FindFirstChild("Lightning2")
					lightning2.Enabled = false
				end
				local fire=shot:FindFirstChild("Fire")
				local Particlez=shot:FindFirstChild("ParticleEmitter")
				if fire~=nil and Particlez~=nil then
					fire.Enabled=true
					Particlez.Enabled=true
				end
				local percent=math.min(math.max((tick()-starttime)/chargetime,0),1)
				local size=(1+(extrasize*percent))
				shot.Size=Vector3.new(1,1,1)*size
				shot.Mesh.Scale=Vector3.new(1,1,1)*(size/shot.Size.Y)
				shot.Name="Effect"
				shot.CanCollide=false
				shot.Transparency=.4
				if mouse~=nil then
					shot.Velocity=((mouse.Hit.p-shot.Position).unit)*bombvelocity
					increaseKi:FireServer()
					OnFire()
				else
					shot.Velocity=lv*bombvelocity
					OnFire()
				end
				local bf=Instance.new("BodyForce")
				bf.force=Vector3.new(0,shot:GetMass()*196.2,0)
				bf.Parent=shot							
				
				shot.Touched:connect(function(hit)
					if shot~=nil and shot.Transparency~=1 and hit~=nil and string.lower(string.sub(hit.Name,1,6))~="effect" and hit.Name~="Handle" and hit.Name~= plr then
						shot.Transparency=1
						shot.Anchored=true
						local fire=shot:FindFirstChild("Fire")
						local Particlez=shot:FindFirstChild("ParticleEmitter")
							if fire~=nil then
								fire.Enabled=false
							if Particlez~=nil then
								Particlez.Enabled=false
							end
						end
					wait(3)
					if shot~=nil then
						shot:remove()
							end
						end
			end)
				debris:AddItem(shot,14)
				shot.Parent=game.Workspace
				wait(firerate)
				mouse.Icon="rbxasset://textures\\GunCursor.png"
				check=true
			end
		end)
		mouse.Button1Up:connect(function()
			down=false
		end)
		mouse.KeyDown:connect(function(key2)
			local key=string.byte(key2)
			if key==32 then					--Space bar
				fly()
				local torso=sp.Parent:FindFirstChild("Torso")
				if torso~=nil then
					torso.Velocity=momentum
				end
			elseif key==string.byte("w") or key==17 then
				controls.forward=-1
			elseif key==string.byte("a") or key==20 then
				controls.left=-1
			elseif key==string.byte("s") or key==18 then
				controls.backward=1
			elseif key==string.byte("d") or key==19 then
				controls.right=1
			end
		end)
		mouse.KeyUp:connect(function(key2)
			local key=string.byte(key2)
			if key==string.byte("w") or key==17 then
				controls.forward=0
			elseif key==string.byte("a") or key==20 then
				controls.left=0
			elseif key==string.byte("s") or key==18 then
				controls.backward=0
			elseif key==string.byte("d") or key==19 then
				controls.right=0
			end
		end)
	end
end

function onUnequipped()
	equipped=false
end

sp.Equipped:connect(onEquipped)
sp.Unequipped:connect(onUnequipped)

-- Variables for services
local render = game:GetService("RunService").RenderStepped
local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local Tool = script.Parent

-- Variables for Module Scripts
local screenSpace = require(Tool:WaitForChild("ScreenSpace"))

local connection

local neck, shoulder, oldNeckC0, oldShoulderC0

local mobileShouldTrack = true

-- Thourough check to see if a character is sitting
local function amISitting(character)
	return character.Humanoid.SeatPart ~= nil
end

-- Function to call on renderstepped. Orients the character so it is facing towards
-- the player mouse's position in world space. If character is sitting then the torso
-- should not track
local function frame(mousePosition)
	-- Special mobile consideration. We don't want to track if the user was touching a ui
	-- element such as the movement controls. Just return out of function if so to make sure
	-- character doesn't track
	if not mobileShouldTrack then return end
	
	--This math is completely wrong with R15. We're better off just not doing it at all
	if player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
		return
	end
	
	-- Make sure character isn't swiming. If the character is swimming the following code will
	-- not work well; the character will not swim correctly. Besides, who shoots underwater?
	if player.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Swimming then
		local torso = player.Character.HumanoidRootPart
		local head = player.Character.Head
		
		local toMouse = (mousePosition - head.Position).unit
		local angle = math.acos(toMouse:Dot(Vector3.new(0,1,0)))
		
		local neckAngle = angle
	
		-- Limit how much the head can tilt down. Too far and the head looks unnatural
		if math.deg(neckAngle) > 110 then
			neckAngle = math.rad(110)
		end
		neck.C0 = CFrame.new(0,1,0) * CFrame.Angles(math.pi - neckAngle,math.pi,0)
		
		-- Calculate horizontal rotation
		local arm do
			arm = player.Character:FindFirstChild("Right Arm") or
				  player.Character:FindFirstChild("RightUpperArm")
		end
		local fromArmPos = torso.Position + torso.CFrame:vectorToWorldSpace(Vector3.new(
			torso.Size.X/2 + arm.Size.X/2, torso.Size.Y/2 - arm.Size.Z/2, 0))
		local toMouseArm = ((mousePosition - fromArmPos) * Vector3.new(1,0,1)).unit
		local look = (torso.CFrame.lookVector * Vector3.new(1,0,1)).unit
		local lateralAngle = math.acos(toMouseArm:Dot(look))		
		
		-- Check for rogue math
		if tostring(lateralAngle) == "-1.#IND" then
			lateralAngle = 0
		end		
		
		-- Handle case where character is sitting down
		if player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then			
			
			local cross = torso.CFrame.lookVector:Cross(toMouseArm)
			if lateralAngle > math.pi/2 then
				lateralAngle = math.pi/2
			end
			if cross.Y < 0 then
				lateralAngle = -lateralAngle
			end
		end	
		
		-- Turn shoulder to point to mouse
		shoulder.C0 = CFrame.new(1,0.5,0) * CFrame.Angles(math.pi/2 - angle,math.pi/2 + lateralAngle,0)	
		
		-- If not sitting then aim torso laterally towards mouse
		if not amISitting(player.Character) then
			torso.CFrame = CFrame.new(torso.Position, torso.Position + (Vector3.new(
				mousePosition.X, torso.Position.Y, mousePosition.Z)-torso.Position).unit)
		end	
	end
end

-- Function to bind to render stepped if player is on PC
local function pcFrame()
	frame(mouse.Hit.p)
end

-- Function to bind to touch moved if player is on mobile
local function mobileFrame(touch, processed)
	-- Check to see if the touch was on a UI element. If so, we don't want to update anything
	if not processed then
		-- Calculate touch position in world space. Uses Stravant's ScreenSpace Module script
		-- to create a ray from the camera.
		local test = screenSpace.ScreenToWorld(touch.Position.X, touch.Position.Y, 1)
		local nearPos = game.Workspace.CurrentCamera.CoordinateFrame:vectorToWorldSpace(screenSpace.ScreenToWorld(touch.Position.X, touch.Position.Y, 1))
		nearPos = game.Workspace.CurrentCamera.CoordinateFrame.p - nearPos
		local farPos = screenSpace.ScreenToWorld(touch.Position.X, touch.Position.Y,50) 
		farPos = game.Workspace.CurrentCamera.CoordinateFrame:vectorToWorldSpace(farPos) * -1
		if farPos.magnitude > 900 then
			farPos = farPos.unit * 900
		end
		local ray = Ray.new(nearPos, farPos)
		local part, pos = game.Workspace:FindPartOnRay(ray, player.Character)
		-- if a position was found on the ray then update the character's rotation
		if pos then
			frame(pos)
		end
	end
end

function OnFire()
	local myModel = player.Character
	if Tool.Enabled and myModel and myModel:FindFirstChild('Humanoid') and myModel.Humanoid.Health > 0 then
		Tool.Enabled = false
		game.ReplicatedStorage.ROBLOX_RocketFireEvent:FireServer(mouse.Hit.p)
	

		Tool.Enabled = true
	end
end

local oldIcon = nil
-- Function to bind to equip event
local function equip()
	local character = player.Character
	local humanoid = character.Humanoid
	
	-- Setup joint variables
	if humanoid.RigType == Enum.HumanoidRigType.R6 then
		local torso = character.Torso
		neck = torso.Neck	
		shoulder = torso["Right Shoulder"]
		
	elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
		neck = character.Head.Neck
		shoulder = character.RightUpperArm.RightShoulder
	end
	
	oldNeckC0 = neck.C0
	oldShoulderC0 = shoulder.C0
	
	-- Remember old mouse icon and update current
	oldIcon = mouse.Icon
	mouse.Icon = "http://www.roblox.com/asset/?id=79658449"
	
	-- Bind TouchMoved event if on mobile. Otherwise connect to renderstepped
	if userInputService.TouchEnabled then
		connection = userInputService.TouchMoved:connect(mobileFrame)
	else
		connection = render:connect(pcFrame)
	end
	
	-- Bind TouchStarted and TouchEnded. Used to determine if character should rotate
	-- during touch input
	userInputService.TouchStarted:connect(function(touch, processed)
		mobileShouldTrack = not processed
	end)	
	userInputService.TouchEnded:connect(function(touch, processed)
		mobileShouldTrack = false
	end)

	-- If game uses filtering enabled then need to update server while tool is
	-- held by character.
	if workspace.FilteringEnabled then
		while connection and connection.Connected do
			wait()
			game.ReplicatedStorage.ROBLOX_RocketUpdateEvent:FireServer(neck.C0, shoulder.C0)
		end
	end
end

-- Function to bind to Unequip event
local function unequip()
	if connection then connection:disconnect() end
	
	mouse.Icon = oldIcon
	
	neck.C0 = oldNeckC0
	shoulder.C0 = oldShoulderC0
end

-- Bind tool events
Tool.Equipped:connect(equip)
Tool.Unequipped:connect(unequip)



