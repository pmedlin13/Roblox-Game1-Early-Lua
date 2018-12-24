local enabled = true


function onTouched(hit)
		if hit.Parent:FindFirstChild("Humanoid") then
        local human = hit.Parent:findFirstChild("Humanoid")
        if (human ~= nil) then
            if not enabled then
				return
			end
			enabled = false
			wait(1)
			enabled = true
			local damage = human.MaxHealth * 0.02
			human:TakeDamage(damage)    
        end
	end
end

script.Parent.Touched:connect(onTouched)