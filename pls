

config = getgenv().Configs or {}

print("ez")
print("loe")

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Namoqp1/dump/refs/heads/main/them"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/barlossxi/barlossxi/main/ZAZA.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/barlossxi/barlossxi/main/InterfaceManager.lua.txt"))()

local ScreenGui1 = Instance.new("ScreenGui")
local ImageButton1 = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui1.Name = "ImageButton"
ScreenGui1.Parent = game.CoreGui
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton1.Parent = ScreenGui1
ImageButton1.BackgroundTransparency = 1
ImageButton1.BorderSizePixel = 0
ImageButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton1.Size = UDim2.new(0, 50, 0, 50)
ImageButton1.Draggable = true
ImageButton1.Image = "rbxassetid://10723396107"
ImageButton1.MouseButton1Down:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
	game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
UICorner.Parent = ImageButton1

local Window = Fluent:CreateWindow({
	Title = "Rock Fruit",
	SubTitle = "Silver Hub",
	TabWidth = 130,
	Size = UDim2.fromOffset(480, 400),
	Acrylic = false, 
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
	Setting = Window:AddTab({ Title = "Setting", Icon = "settings" }),
	General = Window:AddTab({ Title = "General", Icon = "cookie" }),
	Trading = Window:AddTab({ Title = "Trading/Party", Icon = "bomb" }),
	Teleport = Window:AddTab({ Title = "Teleport", Icon = "locate" }),
	Misc = Window:AddTab({ Title = "Misc", Icon = "apple" })
}



local Set = Tabs.Setting:AddSection("Setting") 


Set:AddInput("Input", {
	Title = "Distance Farm",
	Default = (config and config["Distance Farm"]) or 0,
	Placeholder = " ",
	Numeric = true,
	Finished = false,
	Callback = function(gay)
		_G.DistanceMob = gay
	end
})

Set:AddDropdown("Select Method", {
	Title = "Select Method",
	Values = {"Upper","Behind","Below"},
	Multi = false,
	Default = (config and config["Select Method"]) or false,
	Callback = function(v)
		_G.Method = v
	end
})

local MethodFarm = nil

spawn(function()
	while wait() do 
		pcall(function()
			if config and config["Distance Farm"] then
				if _G.Method == "Behind" then
					MethodFarm = CFrame.new(0,0,config["Distance Farm"])
				elseif _G.Method == "Below" then
					MethodFarm = CFrame.new(0,-config["Distance Farm"],0) * CFrame.Angles(math.rad(90),0,0)
				elseif _G.Method == "Upper" then
					MethodFarm = CFrame.new(0,config["Distance Farm"],0)  * CFrame.Angles(math.rad(-90),0,0)
				else
					MethodFarm = CFrame.new(0,config["Distance Farm"],0)  * CFrame.Angles(math.rad(-90),0,0)
				end
			else
				if _G.Method == "Behind" then
					MethodFarm = CFrame.new(0,0,_G.DistanceMob)
				elseif _G.Method == "Below" then
					MethodFarm = CFrame.new(0,-_G.DistanceMob,0) * CFrame.Angles(math.rad(90),0,0)
				elseif _G.Method == "Upper" then
					MethodFarm = CFrame.new(0,_G.DistanceMob,0)  * CFrame.Angles(math.rad(-90),0,0)
				else
					MethodFarm = CFrame.new(0,_G.DistanceMob,0)  * CFrame.Angles(math.rad(-90),0,0)
				end
			end
		end)
	end
end)

function Attack()
	local VirtualUser = game:GetService('VirtualUser')
	VirtualUser:CaptureController()
	VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end

_G.Weapon = {}

local MultiDropdown = Set:AddDropdown("Select Weapon", {
	Title = "Select Weapon",
	Values = {"Melee", "Sword", "DevilFruit", "Special"},
	Multi = true,
	Default = (config and config["Select Weapon"]) or {},
	Callback = function(vd)
		_G.Weapon = vd
		end
})


local ez = Set:AddDropdown("Select Accessory", {
	Title = "Select Accessory",
	Values = {"StandingHere", "Hutcherson", "PanPaka", "Head", "WhySoSerious", "Gorilla", "oioioi", "OHHHHYOUSEE", "Freddy", "Sans", "BabySukuna", "Ojisan", "NUANG"},
	Multi = false,
	Default = (config and config["Select Accessory"]) or false,
	Callback = function(ha)
		_G.Accessory = ha
	end})

spawn(function()
	while task.wait(1) do
		if true then
			pcall(function()
				if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Accessory) then
					local args = {
						[1] = _G.Accessory
					}

					game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Inventory"):FireServer(unpack(args))
				end
			end)
		end
	end
end)

spawn(function()
	while task.wait() do
		if true then
			pcall(function()
				if config and config["Select Weapon"] then
					for e,z in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
						if config and config["Select Weapon"][z:GetAttribute("Type")] then
							if z.Parent ~= game.Players.LocalPlayer.Character then
								z.Parent = game.Players.LocalPlayer.Character
							end
						end
					end
				else
					for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
						if _G.Weapon[v:GetAttribute("Type")] then
							if v.Parent ~= game.Players.LocalPlayer.Character then
								v.Parent = game.Players.LocalPlayer.Character
							end
						end
					end
				end
			end)
		end
	end
end)


local Skill = Tabs.Setting:AddSection("Automatic Skill") 


Skill:AddToggle("Auto Skill All", {
	Title = "Auto Skill All",
	Default = (config and config["Auto Skill All"]) or false,
	Callback = function(skill)
		_G.skill= skill
	end
})


spawn(function()
	while task.wait() do
		if config and config["Auto Skill All"] then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if config and config["Select Weapon"][v:GetAttribute("Type")] then
					local args = {
						[1] = v.Name,
						[2] = "z"
					}
					game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Action"):FireServer(unpack(args))
				end
			end
		else
			if _G.skill then
				for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if _G.Weapon[v:GetAttribute("Type")] then
						local args = {
							[1] = v.Name,
							[2] = "z"
						}
						game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Action"):FireServer(unpack(args))
					end
				end
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if config and config["Auto Skill All"] then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if config and config["Select Weapon"][v:GetAttribute("Type")] then
					local args = {
						[1] = v.Name,
						[2] = "x"
					}
					game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Action"):FireServer(unpack(args))
				end
			end
		else
			if _G.skill then
				for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if _G.Weapon[v:GetAttribute("Type")] then
						local args = {
							[1] = v.Name,
							[2] = "x"
						}
						game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Action"):FireServer(unpack(args))
					end
				end
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if config and config["Auto Skill All"] then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if config and config["Select Weapon"][v:GetAttribute("Type")] then
					local args = {
						[1] = v.Name,
						[2] = "c"
					}
					game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Action"):FireServer(unpack(args))
				end
			end
		else
			if _G.skill then
				for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if _G.Weapon[v:GetAttribute("Type")] then
						local args = {
							[1] = v.Name,
							[2] = "c"
						}
						game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Action"):FireServer(unpack(args))
					end
				end
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if config and config["Auto Skill All"] then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if config and config["Select Weapon"][v:GetAttribute("Type")] then
					local args = {
						[1] = v.Name,
						[2] = "v"
					}
					game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Action"):FireServer(unpack(args))
				end
			end
		else
			if _G.skill then
				for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if _G.Weapon[v:GetAttribute("Type")] then
						local args = {
							[1] = v.Name,
							[2] = "v"
						}
						game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Action"):FireServer(unpack(args))
					end
				end
			end
		end
	end
end)


local event = Tabs.General:AddSection("Event") 

event:AddToggle("Auto Farm Speed Grandma [Fully]", {
	Title = "Auto Farm Speed Grandma [Fully]",
	Default = (config and config["Auto Farm Speed Grandma [Fully]"]) or false,
	Callback = function(AutoBoss)
		_G.AutoBoss = AutoBoss
		
	end
})

spawn(function()
	while task.wait(0.3) do
		if _G.AutoBoss then
			xpcall(function()
				if workspace.Mob:FindFirstChild("Turbo Granny") then 
					local target = workspace.Mob:FindFirstChild("Turbo Granny")
					if target and target:FindFirstChild("HumanoidRootPart") and target:FindFirstChild("Humanoid") and target:FindFirstChild("Humanoid").Health > 0 then 
						target.Humanoid.WalkSpeed = 0
						target.Humanoid.JumpPower = 0
						repeat task.wait()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target:FindFirstChild("HumanoidRootPart").CFrame*MethodFarm
							Attack()
						until not target.Parent or not target:FindFirstChild("HumanoidRootPart") or not target:FindFirstChild("Humanoid") or target:FindFirstChild("Humanoid").Health <= 0 or not _G.AutoBoss
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1949.558349609375, 15.95364761352539, -423.34527587890625)
					end
				elseif workspace.NpcSpawnBoss:FindFirstChild("Turbo Granny") and workspace.NpcSpawnBoss:FindFirstChild("Turbo Granny"):FindFirstChild("Torso") and workspace.NpcSpawnBoss:FindFirstChild("Turbo Granny"):FindFirstChild("Torso"):FindFirstChild("ProximityPrompt") then 
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Curse") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Curse") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1949.558349609375, 15.95364761352539, -423.34527587890625)
						task.wait(0.3)
						local prompt = workspace.NpcSpawnBoss:FindFirstChild("Turbo Granny").Torso
						fireproximityprompt(prompt.ProximityPrompt)
						task.wait(0.3)
					elseif game:GetService("Players").LocalPlayer.PlayerGui.HUD.Inventory.ScrollingFrameList:FindFirstChild("Spirit Curse") and not (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Curse") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Curse")) then
						game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Inventory"):FireServer("Spirit Curse")         
						task.wait(1)
					else
						local target = workspace.Mob:FindFirstChild("Serpo Alien")
						if target and target:FindFirstChild("HumanoidRootPart") and target:FindFirstChild("Humanoid") and target:FindFirstChild("Humanoid").Health > 0 then 
							target.Humanoid.WalkSpeed = 0
							target.Humanoid.JumpPower = 0
							repeat task.wait()
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target:FindFirstChild("HumanoidRootPart").CFrame*MethodFarm
								Attack()
							until not target.Parent or not target:FindFirstChild("HumanoidRootPart") or not target:FindFirstChild("Humanoid") or target:FindFirstChild("Humanoid").Health <= 0 or not _G.AutoBoss
						else
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2, 20, 2322)
						end
					end

				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1949.558349609375, 15.95364761352539, -423.34527587890625)
					task.wait(0.1)     
				end
			end,print)
		end
	end
end)


event:AddToggle("Auto Farm Event", {
	Title = "Auto Farm Event",
	Default = (config and config["Auto Farm Event"]) or false,
	Callback = function(AutoEvent)
		_G.AutoEvent = AutoEvent
		
	end
})

spawn(function()
	while task.wait() do
		if _G.AutoEvent then
			pcall(function()
				local target = workspace.Mob:FindFirstChild("Serpo Alien")
				if target and target:FindFirstChild("HumanoidRootPart") and target:FindFirstChild("Humanoid") and target:FindFirstChild("Humanoid").Health > 0 then 
					target.Humanoid.WalkSpeed = 0
					target.Humanoid.JumpPower = 0
					repeat task.wait()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target:FindFirstChild("HumanoidRootPart").CFrame*MethodFarm
						Attack()
					until not target.Parent or not target:FindFirstChild("HumanoidRootPart") or not target:FindFirstChild("Humanoid") or target:FindFirstChild("Humanoid").Health <= 0 or not _G.AutoEvent
				else
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2, 20, 2322)
				end
			end)
		end
	end
end)









local main = Tabs.General:AddSection("Main") 

local interact = function(v2)
	local events = {"Activated","MouseButton1Down","MouseButton1Click","MouseButton1Up","MouseButton1Down"}
	for i,v in pairs(events) do
		for i,v in pairs(getconnections(v2[v])) do
			v.Function()
		end
	end
end


local checknuang = false

main:AddToggle("Automatic Dungeon", {
	Title = "Automatic Dungeon", 
	Default = (config and config["Automatic Dungeon"]) or false, 
	Callback = function(Dungeon) 
		_G.Dungeon = Dungeon
		if _G.Dungeon then
			checknuang = true
		else
			checknuang = false
		end
		
	end})


event:AddToggle("Auto Farm P'Nuang", {
	Title = "Auto Farm P'Nuang",
	Default = (config and config["Auto Farm P'Nuang"]) or false,
	Callback = function(AutoNuang)
		_G.AutoNuang = AutoNuang
		
	end
})


spawn(function()
	while task.wait() do
		if _G.AutoNuang then
			pcall(function()
				if _G.Dungeon then
					_G.Dungeon = false
				else
					local target = workspace.Mob:FindFirstChild("BOSS NUANG")
					if target and target:FindFirstChild("HumanoidRootPart") and target:FindFirstChild("Humanoid") and target:FindFirstChild("Humanoid").Health > 0 then 
						if not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("WaveUI") then
							target.Humanoid.WalkSpeed = 0
							target.Humanoid.JumpPower = 0
							repeat task.wait()
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target:FindFirstChild("HumanoidRootPart").CFrame*MethodFarm
								Attack()
							until not target.Parent or not target:FindFirstChild("HumanoidRootPart") or not target:FindFirstChild("Humanoid") or target:FindFirstChild("Humanoid").Health <= 0 or not _G.AutoNuang
						else
							game.Players.LocalPlayer.Character.Humanoid.Health = 0
						end
					else
						if checknuang then
							_G.Dungeon = true
							repeat task.wait() until target
							return
						else
							return
						end
					end
				end
			end)
		end
	end
end)





spawn(function()
	while task.wait() do
		if _G.Dungeon then
			pcall(function()
				if #workspace.DunMob:GetChildren() > 0 then
					for i, v in pairs(workspace.DunMob:GetChildren()) do
						if v and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
							if v.Name ~= "Mahito" then
								repeat task.wait()
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,36.5)
									Attack()
								until not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Humanoid").Health <= 0 or not _G.Dungeon
							else
								repeat task.wait()
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,35,0)  * CFrame.Angles(math.rad(-90),0,0)
									Attack()
								until not v or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Humanoid").Health <= 0 or not _G.Dungeon
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(18704.322265625, 98.0782470703125, -873.9330444335938)
							end
						end
					end
				elseif #workspace.DunMob:GetChildren() == 0 then
					if not game.workspace:FindFirstChild("DungeonRing") then
						if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Orb Dungeon") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Orb Dungeon") then
							if not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("WaveUI") then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-125.37633514404297, 34.35084533691406, -1178.88818359375)
								wait(1)
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
							else
								return
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.HUD.Inventory.ScrollingFrameList:FindFirstChild("Orb Dungeon") and not (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Orb Dungeon") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Orb Dungeon")) then
							if not workspace:FindFirstChild("Wait for the dungeon to end to enter.") and not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("WaveUI") and #workspace.DunMob:GetChildren() == 0 and not game.workspace:FindFirstChild("DungeonRing") then
								local pos = Vector3.new(49.03801727294922, 37.85084915161133, -932.9153442382812)
								local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - pos).Magnitude
								if distance < 12000 then
									game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Inventory"):FireServer("Orb Dungeon")         
									task.wait(1)
								end
							else
								return
							end
						else
							if not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("WaveUI") then
								if workspace.Mob:FindFirstChild("Turbo Granny") then 
									local target = workspace.Mob:FindFirstChild("Turbo Granny")
									if target and target:FindFirstChild("HumanoidRootPart") and target:FindFirstChild("Humanoid") and target:FindFirstChild("Humanoid").Health > 0 then 
										target.Humanoid.WalkSpeed = 0
										target.Humanoid.JumpPower = 0
										repeat task.wait()
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target:FindFirstChild("HumanoidRootPart").CFrame  * CFrame.new(0,30,0)  * CFrame.Angles(math.rad(-90),0,0)
											Attack()
										until not target.Parent or not target:FindFirstChild("HumanoidRootPart") or not target:FindFirstChild("Humanoid") or target:FindFirstChild("Humanoid").Health <= 0 or not _G.Dungeon
									else
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1949.558349609375, 15.95364761352539, -423.34527587890625)
									end
								elseif workspace.NpcSpawnBoss:FindFirstChild("Turbo Granny") and workspace.NpcSpawnBoss:FindFirstChild("Turbo Granny"):FindFirstChild("Torso") and workspace.NpcSpawnBoss:FindFirstChild("Turbo Granny"):FindFirstChild("Torso"):FindFirstChild("ProximityPrompt") then 
									if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Curse") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Curse") then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1949.558349609375, 15.95364761352539, -423.34527587890625)
										task.wait(0.3)
										local prompt = workspace.NpcSpawnBoss:FindFirstChild("Turbo Granny").Torso
										fireproximityprompt(prompt.ProximityPrompt)
										task.wait(0.3)
									elseif game:GetService("Players").LocalPlayer.PlayerGui.HUD.Inventory.ScrollingFrameList:FindFirstChild("Spirit Curse") and not (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Curse") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Curse")) then
										game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Inventory"):FireServer("Spirit Curse")         
										task.wait(1)
									else
										local target = workspace.Mob:FindFirstChild("Serpo Alien")
										if target and target:FindFirstChild("HumanoidRootPart") and target:FindFirstChild("Humanoid") and target:FindFirstChild("Humanoid").Health > 0 then 
											target.Humanoid.WalkSpeed = 0
											target.Humanoid.JumpPower = 0
											repeat task.wait()
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target:FindFirstChild("HumanoidRootPart").CFrame  * CFrame.new(0,30,0)  * CFrame.Angles(math.rad(-90),0,0)
												Attack()
											until not target.Parent or not target:FindFirstChild("HumanoidRootPart") or not target:FindFirstChild("Humanoid") or target:FindFirstChild("Humanoid").Health <= 0 or not _G.Dungeon
										else
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2, 20, 2322)
										end
									end

								else
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1949.558349609375, 15.95364761352539, -423.34527587890625)
									task.wait(0.1)     
								end
							else
								return
							end
						end	
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-123.26849365234375, 34.35084533691406, -1136.7694091796875)
					end
				end
			end)
		end
	end
end)


event:AddToggle("Auto Grow Vegetables", {
	Title = "Auto Grow Vegetables",
	Default = (config and config["Auto Grow Vegetables"]) or false,
	Callback = function(Vegetables)
		_G.Vegetables = Vegetables
		
	end
})





local count = 0


local CF = {
	CFrame.new(-898.44140625, 25.210580825805664, 3033.38427734375),
	CFrame.new(-892.5354614257812, 25.610580444335938, 3008.369873046875),
	CFrame.new(-882.0440673828125, 25.210580825805664, 2983.48388671875),
	CFrame.new(-875.1864624023438, 25.210580825805664, 2960.007080078125),
	CFrame.new(-868.6435546875, 25.210580825805664, 2936.291748046875),
	CFrame.new(-840.460693359375, 25.091772079467773, 2919.197021484375),
	CFrame.new(-845.8807373046875, 25.091772079467773, 2941.836181640625),
	CFrame.new(-852.7385864257812, 25.091772079467773, 2965.153564453125),
	CFrame.new(-861.6492309570312, 25.091772079467773, 2987.676025390625),
	CFrame.new(-868.8522338867188, 25.091772079467773, 3013.59423828125),
	CFrame.new(-877.7238159179688, 25.091772079467773, 3040.390869140625),
	CFrame.new(-857.6080322265625, 25.091772079467773, 3046.6884765625),
	CFrame.new(-849.0603637695312, 25.091772079467773, 3022.952392578125),
	CFrame.new(-840.3482055664062, 24.247865676879883, 2998.813720703125),
	CFrame.new(-833.74560546875, 25.091772079467773, 2974.5087890625),
	CFrame.new(-826.5520629882812, 25.091772079467773, 2949.965576171875),
	CFrame.new(-818.8967895507812, 25.091772079467773, 2927.21630859375),
	CFrame.new(-799.9794311523438, 25.091772079467773, 2931.618408203125),
	CFrame.new(-807.1898193359375, 25.091772079467773, 2954.24072265625),
	CFrame.new(-814.8495483398438, 25.091772079467773, 2978.302978515625),
	CFrame.new(-822.2654418945312, 25.091772079467773, 3001.75390625),
	CFrame.new(-828.7405395507812, 25.091772079467773, 3025.784423828125),
	CFrame.new(-836.478759765625, 25.091772079467773, 3051.261962890625),
	CFrame.new(-816.4376831054688, 25.091772079467773, 3057.70654296875),
	CFrame.new(-807.6306762695312, 24.922990798950195, 3033.133544921875),
	CFrame.new(-800.8670043945312, 25.091772079467773, 3010.0390625),
	CFrame.new(-794.464111328125, 25.091772079467773, 2985.78369140625),
	CFrame.new(-786.3164672851562, 25.09177017211914, 2961.560791015625),
	CFrame.new(-778.7188110351562, 25.09177017211914, 2938.975341796875),
	CFrame.new(-758.0132446289062, 25.091772079467773, 2943.29638671875),
	CFrame.new(-765.5614624023438, 25.091772079467773, 2966.873291015625),
	CFrame.new(-771.3308715820312, 25.091772079467773, 2991.83349609375),
	CFrame.new(-779.394775390625, 25.091772079467773, 3017.6083984375),
	CFrame.new(-786.4102172851562, 25.091772079467773, 3040.031982421875),
	CFrame.new(-793.9926147460938, 25.091772079467773, 3064.28271484375)
}

spawn(function()
	while task.wait() do
		if _G.Vegetables then
			pcall(function()
				count = 0 
				for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.Name == "Seeds Bag" then
						count = count + 1
					end
				end


				if count == 0 then
					repeat
						task.wait()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1116.566162109375, 23.651195526123047, 2996.72265625)
						fireproximityprompt(workspace.npcClick["10 Diamond For Seeds Bag"].HumanoidRootPart.Prompt)
						count = 0
						for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
							if v.Name == "Seeds Bag" then
								count = count + 1
							end
						end
					until count >= 36 or not _G.Vegetables
				elseif count > 0 then
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Watering vegetables") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Watering vegetables") then
						for i, v in ipairs(CF) do
							local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
							wait(.5)
							character:SetPrimaryPartCFrame(v)
							wait(.5)
							for _, farmModel in ipairs(workspace.Interactable.Farm:GetChildren()) do
								if farmModel:IsA("Model") and farmModel:FindFirstChild("Handle") then
									local prompt = farmModel.Handle:FindFirstChild("ProximityPrompt")
									if prompt and prompt.Enabled then
										local distance = (character.HumanoidRootPart.Position - farmModel.Handle.Position).Magnitude
										if distance <= prompt.MaxActivationDistance then
											fireproximityprompt(prompt)
											wait(.3)
											break
										end
									end
								end
							end
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


spawn(function()
	while task.wait() do
		pcall(function()
			if _G.Vegetables then
				for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
					if v.Name == "Watering vegetables" then
						repeat task.wait(1)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
						until not v or not _G.Vegetables
					end
				end
			end
		end)
	end
end)



local generas = Tabs.General:AddSection("General")

local Mon = {}
local MonSet = {}
for i, v in pairs(game:GetService("Workspace").Mob:GetChildren()) do
	if not MonSet[v.Name] then
		table.insert(Mon, v.Name)
		MonSet[v.Name] = true
	end
end

_G.SelectedStands = {}

local MultiDropdown = generas:AddDropdown("Select Mon", {
	Title = "Select Mon",
	Description = "",
	Values = Mon,
	Multi = true,
	Default = {},
	Callback = function(selected)
		_G.SelectedStands = selected
		
	end
})

MultiDropdown:OnChanged(function(selected)
	_G.SelectedStands = {}
	for stand, isSelected in pairs(selected) do
		if isSelected then
			table.insert(_G.SelectedStands, stand)
		end
	end
end)

generas:AddToggle("Auto Farm Mon", {
	Title = "Auto Farm Mon",
	Default = false,
	Callback = function(AutoFarm1)
		_G.AutoFarm1 = AutoFarm1
		
	end
})

spawn(function()
	while task.wait() do
		if _G.AutoFarm1 then
			pcall(function()
				for _, v in pairs(game:GetService("Workspace").Mob:GetChildren()) do
					if table.find(_G.SelectedStands, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 1 then
						v.Humanoid.WalkSpeed = 0
						v.Humanoid.JumpPower = 0
						repeat
							task.wait()
							Attack()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*MethodFarm
						until not _G.AutoFarm1 or v.Humanoid.Health <= 0
					end
				end
			end)
		end
	end
end)








local poin = Tabs.General:AddSlider("Poin", {
	Title = "Poin",
	Description = "The points used to upgrade can be used as much as you want.",
	Default = 0,
	Min = 0,
	Max = 2000,
	Rounding = 0,
	Callback = function(Value)
		_G.Poin = Value
		
	end
})


Tabs.General:AddDropdown("Select Stats", {
	Title = "Select Stats",
	Values = {"Melee","Sword","DevilFruit","Special"},
	Multi = false,
	Default = _G.Stats,
	Callback = function(bool)
		_G.Stats = bool
		
	end
})

Tabs.General:AddToggle("Automatic Up Stats", {
	Title = "Automatic Up Stats", 
	Default = _G.Autostats, 
	Callback = function(Autoup) 
		_G.Autostats = Autoup
		
	end})


spawn(function()
	while task.wait() do
		if _G.Autostats then
			local args = {
				[1] = "UpStats",
				[2] = _G.Stats,
				[3] = _G.Poin
			}

			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("System"):FireServer(unpack(args))
		end
	end
end)


local trade = Tabs.Trading:AddSection("Trading")

trade:AddToggle("Auto Trading All", {
	Title = "Auto Trading All", 
	Default = false, 
	Callback = function(AutoTradingAll) 
		_G.AutoTradingAll = AutoTradingAll
		
	end})

spawn(function()
	while task.wait() do
		if _G.AutoTradingAll then
			pcall(function()
				for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Inventory.ScrollingFrameList:GetChildren()) do
					if v.Name ~= "UIGridLayout" then
						task.wait(0.1)
						local args = {
							[1] = "Add",
							[2] = v.Name,
							[3] = 1
						}

						game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Trade"):FireServer(unpack(args))
					end
				end
			end)
		end
	end
end)


local party = Tabs.Trading:AddSection("Party")


party:AddToggle("Auto Create Party (10s)", {
	Title = "Auto Create Party (10s)", 
	Default = (config and config["Auto Create Party (10s)"]) or false, 
	Callback = function(create) 
		_G.create = create
		
	end})

spawn(function()
	while task.wait() do
		if _G.create then
			pcall(function()
				if game:GetService("Players").LocalPlayer.PlayerGui.HUD.Party.PlayerList.Visible == false then
					wait(10)
					local args = {
						[1] = "Create"
					}

					game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Ally"):FireServer(unpack(args))
				else
					for i,v in pairs(game.Players:GetChildren()) do
						if v.Name ~= game.Players.LocalPlayer then
							local args = {
								[1] = "Invite",
								[2] = game:GetService("Players"):WaitForChild(v.Name)
							}

							game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Ally"):FireServer(unpack(args))
							wait(0.5)
						end
					end
				end
			end)
		end
	end
end)



local attackccd = function(args)
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
		attack_ui.Position = UDim2.new(0.489629149, 0, 0.499387294, 0)
		attack_ui.Rotation = 1.000
		attack_ui.Size = UDim2.new(0, 19, 0, 19)
	else
		local attacker = game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild("attack")
		local VirtualInputManager = game:GetService("VirtualInputManager")
		VirtualInputManager:SendMouseButtonEvent(attacker.AbsolutePosition.X, attacker.AbsolutePosition.Y, 0, true, game, 0)
		VirtualInputManager:SendMouseButtonEvent(attacker.AbsolutePosition.X, attacker.AbsolutePosition.Y, 0, false, game, 0)
	end
end


party:AddToggle("Auto Accept Party", {
	Title = "Auto Accept Party", 
	Default = (config and config["Auto Accept Party"]) or false, 
	Callback = function(Accept) 
		_G.Accept = Accept
		
	end})

spawn(function()
	while task.wait() do
		if _G.Accept then
			if game:GetService("Players").LocalPlayer.PlayerGui.HUD:FindFirstChild("Invite_Request") then
				local Accept = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Invite_Request.Accept
				Accept.Position = UDim2.new(-5, 0, -2, 0)
				Accept.Size = UDim2.new(0, 5000, 0, 5000)
				attackccd()
			end
		end
	end
end)







local tp = Tabs.Teleport:AddSection("Weapon")

local abc = nil

tp:AddDropdown("Select Tp Weapon", {
	Title = "TP Weapon",
	Values = {"Cidbeta","Sandal","DarkKatana","Katana Dragon","Muhahaha","Katana Gravity","Smelly","HeavenKatana",
		"JohnSmith","Katana","Sukuna","David","Megumin","Yoru","Shikono","Puthai","Otaku","PNUANG","Turbo","Shusui"
		,"Sausage","Cid","Gryphon","HangMan","T-POSE","Thaiman","DualKatana","T-POSE2","Vergil"},
	Multi = false,
	Default = _G.Stats,
	Callback = function(bool)
		_G.Stats = bool
		if _G.Stats == "Cidbeta" then
			abc = CFrame.new(-1207.562744140625, 85.28353881835938, 167.4344940185547)
		elseif _G.Stats == "Sandal" then
			abc = CFrame.new(-145.94361877441406, 66.43119812011719, 297.87860107421875)
		elseif _G.Stats == "DarkKatana" then
			abc = CFrame.new(-835.05419921875, 71.25021362304688, -74.28899383544922)
		elseif _G.Stats == "Katana Dragon" then
			abc = CFrame.new(-1995.5528564453125, 14.833311080932617, 863.8018188476562)
		elseif _G.Stats == "Muhahaha" then
			abc = CFrame.new(-1347.514404296875, 57.43487548828125, 214.12344360351562)
		elseif _G.Stats == "Katana Gravity" then
			abc = CFrame.new(1372.66064453125, 7.915433883666992, -2033.4342041015625)
		elseif _G.Stats == "Smelly" then
			abc = CFrame.new(2229.938232421875, 11.763026237487793, -1081.869873046875)
		elseif _G.Stats == "HeavenKatana" then
			abc = CFrame.new(186.4414825439453, 28.94011688232422, 2516.81787109375)
		elseif _G.Stats == "JohnSmith" then
			abc = CFrame.new(197.93807983398438, 58.008968353271484, 300.6063537597656)
		elseif _G.Stats == "Katana" then
			abc = CFrame.new(-65.994384765625, 30.923419952392578, -977.7103271484375)
		elseif _G.Stats == "Sukuna" then
			abc = CFrame.new(-181.92959594726562, 47.37466812133789, 159.63272094726562)
		elseif _G.Stats == "David" then
			abc = CFrame.new(-233.1636505126953, 40.003692626953125, 251.2542266845703)
		elseif _G.Stats == "Megumin" then
			abc = CFrame.new(-168.1514434814453, 47.24509811401367, 205.93856811523438)
		elseif _G.Stats == "Yoru" then
			abc = CFrame.new(107.02023315429688, 45.92341995239258, -949.3845825195312)
		elseif _G.Stats == "Shikono" then
			abc = CFrame.new(-173.96847534179688, 56.503700256347656, 292.67327880859375)
		elseif _G.Stats == "Puthai" then
			abc = CFrame.new(-164.6238555908203, 20.405580520629883, 1366.0267333984375)
		elseif _G.Stats == "Otaku" then
			abc = CFrame.new(2580.8916015625, 12.187512397766113, 413.05267333984375)
		elseif _G.Stats == "PNUANG" then
			abc = CFrame.new(270.44305419921875, 19.363204956054688, 28.662914276123047)
		elseif _G.Stats == "Turbo" then
			abc = CFrame.new(-182.8213653564453, 30.99390411376953, 248.9811553955078)
		elseif _G.Stats == "Shusui" then
			abc = CFrame.new(-981.164794921875, 8.962715148925781, 1092.3748779296875)
		elseif _G.Stats == "Sausage" then
			abc = CFrame.new(-2015.0789794921875, 10.191683769226074, -3359.1005859375)
		elseif _G.Stats == "Cid" then
			abc = CFrame.new(-189.3973388671875, 47.37459182739258, 119.73187255859375)
		elseif _G.Stats == "Gryphon" then
			abc = CFrame.new(252.33670043945312, 9.580303192138672, -2017.095947265625)
		elseif _G.Stats == "HangMan" then
			abc = CFrame.new(-1422.3331298828125, 11.748342514038086, -2693.952880859375)
		elseif _G.Stats == "T-POSE" then
			abc = CFrame.new(-800.4458618164062, 72.21273040771484, 1256.1685791015625)
		elseif _G.Stats == "Thaiman" then
			abc = CFrame.new(1445.2474365234375, 14.974716186523438, -1258.6640625)
		elseif _G.Stats == "DualKatana" then
			abc = CFrame.new(-1601.296875, 12.91574478149414, 1944.04443359375)
		elseif _G.Stats == "T-POSE2" then
			abc = CFrame.new(-1119.669921875, 301.2991638183594, 170.17982482910156)
		elseif _G.Stats == "Vergil" then
			abc = CFrame.new(-228.19656372070312, 59.5738410949707, 325.9945068359375)
		end
	end
})


tp:AddToggle("Tp To Weapon", {
	Title = "Tp To Weapon", 
	Default = false, 
	Callback = function(ezz) 
		_G.Lol = ezz
		
	end})


spawn(function()
	while task.wait() do
		if _G.Lol then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = abc
		end
	end
end)



local store = Tabs.Misc:AddSection("Auto Store One") 


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





local ez = store:AddDropdown("Select Ignore Item", {
	Title = "Select Ignore Item",
	Description = "",
	Values = {"Orb Broken", "Finger Sukuna", "Orb Atomic", "Dragon Blade", "Cyber Militech",
		"Chair", "Shark", "Hat Megumin", "Straw Hat", "Smith mask", "Shadow Diary", "Shadow Manga", "Cloak Shadow",
		"Orb Shadow", "Shiny String", "Stick", "Orb Curse", "Sheath", "Rubber Band", "Cyber Chip", "Antler", "Black Glasses",
		"Orb Flame", "Scarf", "Book Heaven", "Rock", "Scrap Iron", "Crowbar", "Banana Stem", "Orb Dark", "Goku Manga",
		"Orb Dragon", "Cursed Womb", "Orb Demon", "Cat", "Train ticket", "Mask Robber", "Orb Water", "Naruto Manga",
		"Toilet", "Devil's Arm", "Tires", "Banana", "Crab", "Shiny Banana", "Orb Dungeon"},
	Multi = true,
	Default = (config and config["Select Ignore Item"]) or {},
	Callback = function(ezs)
		_G.SelectedStore = ezs
		
	end
})



store:AddToggle("Auto Store", {
	Title = "Auto Store", 
	Default = (config and config["Auto Store"]) or false, 
	Callback = function(AutoStoreFruit) 
		_G.AutoStoreFruitone = AutoStoreFruit
		
	end})


spawn(function()
	while task.wait() do
		pcall(function()
			if config and config["Select Ignore Item"] then
				for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
					if config and not config["Select Ignore Item"][v.Name] then
						if v:GetAttribute("Type") == "Items" then
							repeat task.wait(1)
								game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
							until not v or not config or config and not config["Select Ignore Item"]
						end
					end
				end
			else
				if _G.AutoStoreFruitone then
					for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
						if not _G.SelectedStore[v.Name] then
							if v:GetAttribute("Type") == "Items" then
								repeat task.wait(1)
									game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
								until not v or not _G.AutoStoreFruitone
							end
						end
					end
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.AutoStoreFruitone or _G.AutoStoreFruit then
				if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Dialogue") then
					for i2, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
						if string.find(v.Name, "Dialogue") then
							v.Frame["3"].Position = UDim2.new(0, -800 ,0, -700)
							v.Frame["3"].Size = UDim2.new(10000, 10000, 10000, 10000)
							v.Frame["3"].BackgroundTransparency = 1
							v.Frame["3"].ImageTransparency = 1
						end
					end
				end
			end
		end)
	end
end)





spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoStoreFruitone or _G.AutoStoreFruit then
				attack()
			end
		end)
	end
end)


local Storeall = Tabs.Misc:AddSection("Auto Store All")  

Storeall:AddToggle("Auto Store All", {
	Title = "Auto Store All", 
	Default = (config and config["Auto Store All"]) or false, 
	Callback = function(AutoStoreFruit) 
		_G.AutoStoreFruit = AutoStoreFruit
		
	end})


spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoStoreFruit then
				for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
					if v:GetAttribute("Type") == "Items" then
						repeat task.wait(1)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
						until not v or not _G.AutoStoreFruit or not _G.Dungeon
					end
				end
			end
		end)
	end
end)

local spin = Tabs.Misc:AddSection("Ramdom Chest") 


spin:AddDropdown("Select type", {
	Title = "Select type",
	Values = {1,5},
	Multi = false,
	Default = _G.Ramdom,
	Callback = function(bool)
		_G.Ramdom = bool
		
	end
})

spin:AddToggle("Auto Random Chest", {
	Title = "Auto Random Chest", 
	Default = false, 
	Callback = function(bool) 
		_G.Random = bool
	end})


spawn(function() 
	while task.wait() do
		if _G.Random then
			pcall(function()
				local args = {
					[1] = "Random",
					[2] = _G.Ramdom
				}

				game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("RandomFruit"):FireServer(unpack(args))
			end)
		end
	end
end)






local misc = Tabs.Misc:AddSection("Misc") 







misc:AddToggle("Anti AFK", {
	Title = "Anti AFK", 
	Default = (config and config["Anti AFK"]) or true, 
	Callback = function(cbx) 
		_G.AntiAFKEnabled = cbx
		local vu = game:GetService("VirtualUser")
		game.Players.LocalPlayer.Idled:connect(function()
			if _G.AntiAFKEnabled then
				vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
				wait(1)
				vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			end
		end)
	end})


misc:AddButton({
	Title = "Delete Skill Effect",
	Description = "",
	Callback = function(ez)
		for i,v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
			if v:IsA("SpotLight") or v:IsA("PointLight") or v:IsA("SurfaceLight") or v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sound") or v:IsA("SpecialMesh") or v:IsA("MeshPart") or v:IsA("Beam") or v:IsA("Trail") or v:IsA("Decal") or v:IsA("Lighting") or v:IsA("AmbientLight") or v:IsA("DirectionalLight") or v:IsA("Attachment") or v:IsA("BodyVelocity") or v:IsA("Trail") or v:IsA("ForceField") or v:IsA("ParticleAttachment") or v:IsA("Explosion") or v:IsA("SurfaceLight") or v:IsA("VectorForce") or v:IsA("Shockwave") or v:IsA("MeshPart") or v:IsA("SpringConstraint") or v:IsA("RodConstraint") or v:IsA("GravityForce") or v:IsA("Part") or v:IsA("Model") then
				v:Destroy()
			end
		end
	end
})


misc:AddButton({
	Title = "Super Fps Boost",
	Description = "",
	Callback = function(ez)
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("SpotLight") or v:IsA("PointLight") or v:IsA("SurfaceLight") or v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sound") or v:IsA("SpecialMesh") or v:IsA("MeshPart") or v:IsA("Beam") or v:IsA("Trail") or v:IsA("Decal") or v:IsA("Lighting") or v:IsA("AmbientLight") or v:IsA("DirectionalLight") or v:IsA("Attachment") or v:IsA("BodyVelocity") or v:IsA("Trail") or v:IsA("ForceField") or v:IsA("Explosion") or v:IsA("SurfaceLight") or v:IsA("VectorForce") or v:IsA("Shockwave") or v:IsA("MeshPart") or v:IsA("SpringConstraint") or v:IsA("RodConstraint") or v:IsA("GravityForce") then
				v:Destroy()
			end
		end
	end
})





