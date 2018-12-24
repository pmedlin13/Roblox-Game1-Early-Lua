-- This code should be within a 'LocalScript' object
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
 
local gamePassID = 5347441  -- Change this to your game pass ID
 
-- Function to prompt purchase of the game pass
local function promptPurchase()
 
	local player = Players.LocalPlayer
	local hasPass = false
 
	local success, message = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamePassID)
	end)
 
	if not success then
		warn("Error while checking if player has pass: " .. tostring(message))
		return
	end
 
	if hasPass == true then
		-- Player already owns the game pass; tell them somehow
	else
		-- Player does NOT own the game pass; prompt them to purchase
		MarketplaceService:PromptGamePassPurchase(player, gamePassID)
	end
end
----
wait()
local ShopM = require(game.ReplicatedStorage.Shop)
local Shop = script.Parent.Shop


local rem = game.ReplicatedStorage.Remotes
local ZeniN = 0

local UIS = game:GetService("UserInputService")
local GUIS = game:GetService("GuiService")

--UDim2.new(0,712,1,-40)
local size, size2, itemSize
local ZeniSize = UDim2.new(0,500,0,380)
size = UDim2.new(0,650,1,-40)
size2 = UDim2.new(0,662,1,-40)
itemSize = UDim2.new(0,440,0,440)

local plr = game.Players.LocalPlayer

local MPS = game:GetService("MarketplaceService")


local function getIndex(tab, item)
	for i, v in pairs(tab) do
		if v == item then
			return i
		end
	end
	return -1
end

local function debounce(func)
    local isRunning = false
    return function(...)       
        if not isRunning then
            isRunning = true
            func(...) 
            isRunning = false
        end
    end
end

local function lerpShopColors(stay)
	local bs = {Shop.TopBar.ZeniB, Shop.TopBar.VIPB}
	for i, v in pairs(bs) do
		if v ~= stay then
        	v.TextColor3 =	Color3.new(141/255, 141/255, 141/255)
			v.Frame.BackgroundColor3 = Color3.new(141/255, 141/255, 141/255)	
		else
        	v.TextColor3 =	Color3.new(0/255, 255/255, 247/255)
			v.Frame.BackgroundColor3 = Color3.new(0/255, 255/255, 247/255)
		end
	end
end

local itemPage = Shop.ItemPage
local currShopPage = "Zeni"

local function showVIPPage()
	itemPage.Visible = false
	Shop.Hold.Visible = false
	Shop.VIPPage.Visible = true
	Shop.Size = itemSize
end

showVIPPage()

local function ZeniDevProducts()
	for i, v in pairs(Shop.Hold.ItemParent:GetChildren()) do
		if v.Name == "tok200" then
			v.MouseButton1Click:connect(function()
				MPS:PromptProductPurchase(plr, 416334370)
			end)
			
		elseif v.Name == "tok425" then
			v.MouseButton1Click:connect(function()
				MPS:PromptProductPurchase(plr, 416335093)
			end)
		elseif v.Name == "tok950" then
			v.MouseButton1Click:connect(function()
				MPS:PromptProductPurchase(plr, 416335333)
			end)
		elseif v.Name == "tok2000" then
			v.MouseButton1Click:connect(function()
				MPS:PromptProductPurchase(plr, 416335629)
			end)
		elseif v.Name == "tok2500" then
			v.MouseButton1Click:connect(function()
				MPS:PromptProductPurchase(plr, 416336090)
			end)
		elseif v.Name == "tok30000" then
			v.MouseButton1Click:connect(function()
				MPS:PromptProductPurchase(plr, 416336607)
			end)
		end
	end
end

Shop.VIPPage.BuyB.MouseButton1Click:connect(function()
	promptPurchase()
end)

MPS.PromptPurchaseFinished:connect(function(plr, assetId, isPurchased)
	if isPurchased then
	end
end)

local function showItemPage(iType, iName)
	Shop.Hold.ScrollMirror.Visible = true
	itemPage.ItemConfig.Visible = true
	itemPage.ItemConfig.Img.Image = "rbxgameasset://"..iName
	itemPage.ItemConfig.Img.Item.Text = iName
		
	itemPage.ItemConfig.Img.Item.Text = iName
	itemPage.ItemConfig.Img.Type.Text = iType
	itemPage.ItemConfig.Cost.Text = ShopM.ItemGetInfo(iType, iName, 2)
	itemPage.ItemConfig.Desc.Text = ShopM.ItemGetInfo(iType, iName, 4)
	if itemPage.ItemConfig:FindFirstChild("BuyB") then
		itemPage.ItemConfig:FindFirstChild("BuyB"):Destroy()
	end
	itemPage.ItemConfig.Visible = true
	Shop.TopBar.Visible = false
	Shop.Hold.ItemParent.Visible = false
	Shop.ItemPage.Visible = true
	Shop.Size = itemSize
	
	Shop.TopBar.Visible = false
	Shop.Hold.ItemParent.Visible = false
	Shop.ItemPage.Visible = true
	
end


rem.UpdZeniDisplay.OnClientEvent:connect(function(num)
	ZeniN = num
	Shop.UtilBar.ZeniCount.Text = num
end)

rem.GoToZeni.OnClientEvent:connect(function()
	Shop.ItemPage.Visible = true
	Shop.Hold.ItemParent.Visible = true
	Shop.TopBar.Visible = true
	lerpShopColors(Shop.TopBar.ZeniB)
	ShopM.DrawZenis(Shop, Shop.Hold.ItemParent, ZeniSize)
	ZeniDevProducts()
end)

Shop.TopBar.VIPB.MouseButton1Click:connect(debounce(function()
	
	showVIPPage()
	lerpShopColors(Shop.TopBar.VIPB)
end))


Shop.TopBar.ZeniB.MouseButton1Click:connect(debounce(function()
	currShopPage = "Zeni"
	Shop.Hold.Visible = true
	Shop.VIPPage.Visible = false
	ShopM.DrawZeni(Shop, Shop.Hold.ItemParent, ZeniSize)
	ZeniDevProducts()
	lerpShopColors(Shop.TopBar.ZeniB)
end))

