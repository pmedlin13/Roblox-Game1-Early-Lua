script.Parent.MouseButton1Click:connect(function(Close)
	script.Parent.Parent:TweenPosition(UDim2.new(0, -300,0, 150))
	script.Parent.Sound:Play()
end)