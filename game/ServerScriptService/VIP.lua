-- This code should be in a 'Script' object within 'ServerScriptService'
local MarketplaceService = game:GetService("MarketplaceService")
 
local gamePassID = 5347441  -- Change this to your game pass ID
 
-- Function to handle a completed prompt and purchase
local function onPromptGamePassPurchaseFinished(player, purchasedPassID, purchaseSuccess)
 
	if purchaseSuccess == true and purchasedPassID == gamePassID then
		print(player.Name .. " purchased the game pass with ID " .. gamePassID)
		game.ServerStorage.VIP:Clone().Parent = player
		game.ServerStorage.VIPItems.EvilKnightSword:Clone().Parent = player.Backpack
		game.ServerStorage.VIPItems.RainbowSword:Clone().Parent = player.Backpack
		player.stats.VIP.Value = true
		
		-- Assign this player the ability or bonus related to the game pass
		--
	end
end
 
-- Connect 'PromptGamePassPurchaseFinished' events to the 'onPromptGamePassPurchaseFinished()' function
MarketplaceService.PromptGamePassPurchaseFinished:Connect(onPromptGamePassPurchaseFinished)