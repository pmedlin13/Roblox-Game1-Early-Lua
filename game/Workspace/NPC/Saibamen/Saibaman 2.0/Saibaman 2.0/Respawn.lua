
local t = 15
local humanoid = script.Parent:FindFirstChildOfClass("Humanoid") --Finds a humanoid
local clone = script.Parent:Clone() --our clone, for respawning
humanoid.Died:wait() --waits until the humanoid dies

wait(t)
clone.Parent = workspace.NPC.Saibamen
clone:MakeJoints()

script.Parent:Destroy()