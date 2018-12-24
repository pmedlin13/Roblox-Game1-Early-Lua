local part = workspace.Interacts.LavaTub.increase -- the location of the "part" in workspace
local localPlayer = game.Players.LocalPlayer 

dist = 1

part.Touched:connect(function(hit) -- hit being what touched the "part" so a part or whatever
    if hit.Parent:FindFirstChild("Humanoid") then -- making sure the thing that touched the "part" has a Humanoid (e.g player, npc or whatever)
       local player = game.Players:GetPlayerFromCharacter(hit.Parent) -- getting the player from its character. If not a player in the server, it’ll be nil. For example if its a npc or something that isn’t a player in the server 
       if player then -- making sure the thing that touched the "part" is a legit player in the server so not a npc or something that has a Humanoid
          if player == localPlayer then -- making sure the player is the LocalPlayer (you) that touched the "part"
			  local Torso = player.Character.Humanoid.RigType == "R6" and player.Character.Torso or player.Character.UpperTorso
			  local kiR = localPlayer.training.KiRate.Value
              local incrKi = kiR * 10000
			  local playerpos = Torso.Position
			    while wait(2) do
				 script.Parent.ImageLabel2.Visible = true
			  	 script.Parent.TextLabel2.Text = "+" ..incrKi.. ""
			 	 script.Parent.TextLabel2.Visible = true
			 	 wait(2) -- changed localPlayer.PlayerGui.processed.TextLabel text property to "You have touched the part" which will be visible to the LocalPlayer (you)
         	  	 script.Parent.ImageLabel2.Visible = false
			  	 script.Parent.TextLabel2.Visible = false
			     
				 local mag = (Torso.Position - playerpos).magnitude
				 if mag > dist then
					break 
			     end 
				end 
			end
       	end
    end
end)