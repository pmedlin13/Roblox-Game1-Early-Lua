model = script.Parent.MeshPart --change "Regen" to the name of the model. It has to be only one model each Timed Regen. If you are going to use this more than once, use different model names for the models...


backup = model:clone()

while true do
	wait(30) --change the "180" and put in between the Model to when you want it to regen in seconds...


	model:remove()



	model = backup:clone()
	model.Parent = game.Workspace
	model:makeJoints()

end

--May not work for some models but it works for most...