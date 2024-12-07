spawn(function()
	while task.wait() do
		if true then
			if game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild("Invite_Request") then
				game:GetService("Players").LocalPlayer.PlayerGui.HUD.Invite_Request.Accept.Position = UDim2.new(0.411, 0 ,0.343, 0)
				game:GetService("Players").LocalPlayer.PlayerGui.HUD.Invite_Request.Accept.Size = UDim2.new(100000, 100000, 100000, 100000)
				game:GetService("Players").LocalPlayer.PlayerGui.HUD.Invite_Request.Accept.BackgroundTransparency = 0
				game:GetService("Players").LocalPlayer.PlayerGui.HUD.Invite_Request.Accept.ImageTransparency = 0
			end
		end
	end
end)

