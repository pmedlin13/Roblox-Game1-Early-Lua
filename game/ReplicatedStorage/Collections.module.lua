
local Collections = {}

function Collections.shuffle(tab)
	for i=1, #tab do
		local n = math.random(#tab)
		tab[i], tab[n] = tab[n], tab[i]
	end
end


return Collections
