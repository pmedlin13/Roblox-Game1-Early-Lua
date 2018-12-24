local bloxyColaId = 5347441 
local player = game.Players.LocalPlayer

script.Parent.MouseButton1Click:connect(function()
	game:GetService("MarketplaceService"):PromptPurchase(player, bloxyColaId)
end)