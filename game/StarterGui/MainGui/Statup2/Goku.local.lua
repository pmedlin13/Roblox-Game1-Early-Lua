local part = workspace.NPC.Goku.increase -- the location of the "part" in workspace
local localPlayer = game.Players.LocalPlayer 
local strength = localPlayer.stats.Strength
local strengthR = localPlayer.training.StrengthRate.Value
local incrStrenth = strengthR * 10000

part.Touched:connect(function(hit) -- hit being what touched the "part" so a part or whatever
    if hit.Parent:FindFirstChild("Humanoid") then -- making sure the thing that touched the "part" has a Humanoid (e.g player, npc or whatever)
       local player = game.Players:GetPlayerFromCharacter(hit.Parent) -- getting the player from its character. If not a player in the server, it’ll be nil. For example if its a npc or something that isn’t a player in the server 
       if player then -- making sure the thing that touched the "part" is a legit player in the server so not a npc or something that has a Humanoid
          if player == localPlayer then -- making sure the player is the LocalPlayer (you) that touched the "part"
			  script.Parent.ImageLabel1.Visible = true
			  script.Parent.TextLabel1.Text = "+" ..incrStrenth.. ""
			  script.Parent.TextLabel1.Visible = true
			  wait(2) -- changed localPlayer.PlayerGui.processed.TextLabel text property to "You have touched the part" which will be visible to the LocalPlayer (you)
         	  script.Parent.ImageLabel1.Visible = false
			  script.Parent.TextLabel1.Visible = false
		  end
       end
    end
end)