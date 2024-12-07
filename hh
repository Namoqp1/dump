local attack = function(args)
	if not game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild("attack") then
		local attack_ui = Instance.new("Frame")

		attack_ui.Name = "attack"
		attack_ui.Parent = game:GetService("Players").LocalPlayer.PlayerGui.HUD
		attack_ui.Active = true
		attack_ui.AnchorPoint = Vector2.new(0.5, 0.5)
		attack_ui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		attack_ui.BackgroundTransparency = 1.000
		attack_ui.BorderColor3 = Color3.fromRGB(0, 0, 0)
		attack_ui.BorderSizePixel = 0
		attack_ui.Position = UDim2.new(0.989629149, 0, 0.2359629149, 0)
		attack_ui.Rotation = 1.000
		attack_ui.Size = UDim2.new(0, 19, 0, 19)
	else
		local attacker = game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild("attack")
		local VirtualInputManager = game:GetService("VirtualInputManager")
		VirtualInputManager:SendMouseButtonEvent(attacker.AbsolutePosition.X, attacker.AbsolutePosition.Y, 0, true, game, 0)
		VirtualInputManager:SendMouseButtonEvent(attacker.AbsolutePosition.X, attacker.AbsolutePosition.Y, 0, false, game, 0)
	end
end


spawn(function()
	while task.wait() do
		if true then
			if game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild("Invite_Request") then
				game:GetService("Players").LocalPlayer.PlayerGui.HUD.Invite_Request.Accept.Position = UDim2.new(0.411, 0 ,0.343, 0)
				game:GetService("Players").LocalPlayer.PlayerGui.HUD.Invite_Request.Accept.Size = UDim2.new(10000, 10000, 10000, 10000)
				game:GetService("Players").LocalPlayer.PlayerGui.HUD.Invite_Request.Accept.BackgroundTransparency = 1
				game:GetService("Players").LocalPlayer.PlayerGui.HUD.Invite_Request.Accept.ImageTransparency = 1
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if true then
			if game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild("Invite_Request") then
				attack()
			end
		end
	end
end)
