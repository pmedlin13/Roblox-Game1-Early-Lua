script.Parent.MouseButton1Click:connect(function()
local ShopGui = script.Parent.Parent.Parent.Parent.Shop
if ShopGui.Visible == false then
	ShopGui.Visible = true
else
	ShopGui.Visible = false
end
end)