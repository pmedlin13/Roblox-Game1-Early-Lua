local ods = game:GetService("DataStoreService"):GetOrderedDataStore("PowerLevel")

function updateBoard(board, data)
	for k,v in pairs(data) do
		local pos = k
		local name = v.key
		local score = v.value
		local nametextbox = board.SurfaceGui:FindFirstChild("Name" .. pos)
		nametextbox.Text = name
		local scoretextbox = board.SurfaceGui:FindFirstChild("Score" .. pos)
		scoretextbox.Text = score
	end	
end

while true do
	-- wrap logic in pcall in case datastore request fails
	local success, message = pcall(function()
		local pages = ods:GetSortedAsync(false, 5)
		
		-- get data for first board
		local data = pages:GetCurrentPage()	
		updateBoard(game.Workspace.Leaderboard.Top5ScoreBoard, data)
		
		-- check if another page of data exists
		if not pages.IsFinished then			
			
			-- if so then get data for second board
			pages:AdvanceToNextPageAsync()			
			data = pages:GetCurrentPage()
			updateBoard(game.Workspace.Leaderboard.Next5ScoreBoard, data)
		end
	end)
	
	if not success then
		print(message)
	end
	
	wait(60)
end