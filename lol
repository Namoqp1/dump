local count = 0


local CF = {
	CFrame.new(-898.44140625, 25.210580825805664, 3033.38427734375),
	CFrame.new(-892.5354614257812, 25.610580444335938, 3008.369873046875),
	CFrame.new(-882.0440673828125, 25.210580825805664, 2983.48388671875),
	CFrame.new(-875.1864624023438, 25.210580825805664, 2960.007080078125),
	CFrame.new(-868.6435546875, 25.210580825805664, 2936.291748046875)
}

spawn(function()
	while task.wait() do
		if true then
			pcall(function()
				-- รีเซ็ต count ในแต่ละรอบ
				count = 0 
				for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.Name == "Seeds Bag" then
						count = count + 1
					end
				end


				if count == 0 then
					repeat
						task.wait()
						print("Attempting to collect Seeds Bag...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1116.566162109375, 23.651195526123047, 2996.72265625)
						fireproximityprompt(workspace.npcClick["10 Diamond For Seeds Bag"].HumanoidRootPart.Prompt)
						count = 0
						for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
							if v.Name == "Seeds Bag" then
								count = count + 1
							end
						end
					until count >= 5
				elseif count > 0 then
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Watering vegetables") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Watering vegetables") then
						for i,v in pairs(CF) do
							game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Watering vegetables").Parent = game:GetService("Players").LocalPlayer.Character
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v
							print(v)
							wait(1)
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
							wait(1)
						end
					else
						repeat task.wait()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-924.9575805664062, 23.651203155517578, 3025.1083984375)
							fireproximityprompt(workspace.npcClick["Get Watering vegetables"].HumanoidRootPart.Prompt)
							task.wait(0.5)
						until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Watering vegetables") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Watering vegetables")
					end
				end
			end)
		end
	end
end)

