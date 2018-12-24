wait()

local rem = game.ReplicatedStorage.Remotes

local Shop = script.Parent.Shop

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


for i,v in pairs(script.Parent.Sidebar:GetChildren()) do
	v.MouseButton1Click:connect(function()
		if script.Parent:FindFirstChild(v.Name).Visible then
			script.Parent:FindFirstChild(v.Name).Visible = false
		else
			script.Parent:FindFirstChild(v.Name).Visible = true
		end
	end)
end
