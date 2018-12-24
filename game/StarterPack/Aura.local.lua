local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local enableAura = ReplicatedStorage.Events:WaitForChild("EnableAura")
local disableAura = ReplicatedStorage.Events:WaitForChild("DisableAura")

game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
  if inputObject.KeyCode == Enum.KeyCode.Z then
    enableAura:FireServer()
	wait(5)
  end
end)

game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
  if inputObject.KeyCode == Enum.KeyCode.X then
    disableAura:FireServer()
	wait(5)
  end
end)

