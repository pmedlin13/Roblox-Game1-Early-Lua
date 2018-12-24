local Collections = require(game.ReplicatedStorage.Collections)

local Shop = {}
	
	-- when adding a case, add the Swords here and add an if statement to the GetSwordPool()
	-- also add a rarity scheme
	
	local function getIndex(tab, item)
		for i, v in pairs(tab) do
			if v == item then
				return i
			end
		end
		return -1
	end
	
	

	function Shop.DrawZeni(shop, frame, size)
		frame.Size = size
		frame.Parent.ScrollMirror.Visible = false
		for i, v in pairs(frame:GetChildren()) do
			v:Destroy()
		end
		local tiers = {200, 425, 950, 2000, 2500, 30000}
		local costs = {100, 200, 400, 800, 1000, 10000}
		local y = 0
		local x = 0
		local ySize = 0
		for i, v in pairs(tiers) do
			local fab = script.ZeniItem:Clone()
			fab.Img.Image = "rbxgameasset://".."tokens"..i
			fab.Item.Text = tiers[i]
			fab.Cost.Text = costs[i] .. "R$"
			fab.Parent = frame
			fab.Name = "tok"..tiers[i]
			ySize = fab.AbsoluteSize.Y
			if i % 4 == 0 then
				y = y + 1
				x = 0
			end
			fab.Position = UDim2.new(0, ySize*x, 0, y * ySize)
			x = x + 1
		end
		
		frame.CanvasSize = UDim2.new(0,0,0,0)
		frame.CanvasPosition = Vector2.new(0,0)
		shop:TweenSize(UDim2.new(0, ySize * 3, 0, ySize * (y+1) + 40), "Out", "Linear", 0.1)
		
		frame.Size = UDim2.new(0, ySize * 3, 0, ySize * (y+1))
	end	
	--[[
		if y < 3 then
			shop:TweenSize(UDim2.new(0, ySize * 4 + 12, 0, ySize * (y+1) + 40), "Out", "Linear", 0.1)
			frame.Size = UDim2.new(0, ySize * 4 + 12, 0, ySize * (y+1))
			frame.Parent.ScrollMirror.Size =  UDim2.new(0, ySize * 4 + 12, 0, ySize * (y+1))
		else
			shop:TweenSize(UDim2.new(0, ySize * 4 + 12, 0, ySize * 3 + 40), "Out", "Linear", 0.1)
			frame.Size = UDim2.new(0, ySize * 4 + 12, 0, ySize * 3)
			frame.Parent.ScrollMirror.Size =  UDim2.new(0, ySize * 4 + 12, 0, ySize * 3)
		end
	--]]
	
	

return Shop
