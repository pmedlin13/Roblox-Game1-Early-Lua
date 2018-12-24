local Humanoid = script.Parent.Zombie 
function PwntX_X() 
local tag = Humanoid:findFirstChild("creator") 
if tag ~= nil then 
if tag.Value ~= nil then 
local stats = tag.Value:findFirstChild("stats") 
if stats ~= nil then 
stats.Zeni.Value = stats.Zeni.Value + 2 --Change Money to the stat that is increased. 
if stats.VIP.Value == true then
	stats.Zeni.Value = stats.Zeni.Value + 4
end
wait(0.1) 
script:remove() 
end 
end 
end 
end 
Humanoid.Died:connect(PwntX_X) 