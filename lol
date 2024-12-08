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
			-- รีเซ็ต count ในแต่ละรอบ
			count = 0 
			for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v.Name == "Seeds Bag" then
					count = count + 1
				end
			end

			print("จำนวน Seeds Bag:", count)

			if count == 0 then
				repeat
					task.wait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1116.566162109375, 23.651195526123047, 2996.72265625)
					task.wait(0.5)
					game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
					task.wait(0.5)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1119.5181884765625, 23.651195526123047, 3001.90625)
					count = 0
					for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v.Name == "Seeds Bag" then
							count = count + 1
						end
					end
				until count == 5
			elseif count > 0 then
				for i,v in pairs(CF) do
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Watering vegetables") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Watering vegetables") then
						if game:GetService("Players").LocalPlayer.Backpack["Watering vegetables"].Parent ~= game.Players.LocalPlayer.Character then
							game:GetService("Players").LocalPlayer.Backpack["Watering vegetables"].Parent = game.Players.LocalPlayer.Character
						else
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
							wait(.5)
						end
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-924.9575805664062, 23.651203155517578, 3025.1083984375)
						game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-932.2442016601562, 24.223411560058594, 3022.3515625)
						game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
					end
				end
			end
		end
	end
end)
