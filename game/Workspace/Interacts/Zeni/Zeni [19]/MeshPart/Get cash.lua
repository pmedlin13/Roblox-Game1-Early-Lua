amnt = 1 --how much you get for it
function onTouched(part)
	local h = part.Parent:findFirstChild("Humanoid")
	if (h~=nil) then
		local thisplr = game.Players:findFirstChild(h.Parent.Name)
		if (thisplr~=nil) then
			local stats = thisplr:findFirstChild("stats")
			if (stats~=nil) then
				local score = stats:findFirstChild("Zeni")
				local VIP = stats:findFirstChild("VIP")
				if (score~=nil) then
					score.Value = score.Value + amnt
					if VIP.Value == true then
						score.Value = score.Value + amnt
					end
				end
			end
		end
		script.Parent:remove()
	end
end

script.Parent.Touched:connect(onTouched)