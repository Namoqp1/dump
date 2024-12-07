spawn(function()
	while task.wait() do
		if true then
			if game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild("Invite_Request") then
				local Accept = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Invite_Request.Accept
				Accept.Position = UDim2.new(0.5, -100, 0.5, -50)
				Accept.Size = UDim2.new(500, 500, 500, 500)
			end
		end
	end
end)
