
print("ez")

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
	SubTitle = "Savage Hub",
	TabWidth = 130,
	Size = UDim2.fromOffset(480, 400),
	Acrylic = false, 
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
	Setting = Window:AddTab({ Title = "Setting", Icon = "settings" }),
	General = Window:AddTab({ Title = "General", Icon = "cookie" })
}




local Set = Tabs.Setting:AddSection("|Setting") 

local Slider = Set:AddSlider("Distance Farm", {
	Title = "Distance Farm",
	Description = "Monster Farming Distance Let you choose to adjust the distance.",
	Default = 0,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Callback = function(Value)
		_G.DistanceMob = Value
	end
})

Set:AddDropdown("Select Method", {
	Title = "Select Method",
	Values = {"Upper","Behind","Below"},
	Multi = false,
	Default = 1,
	Callback = function(v)
		_G.Method = v
	end
})

local MethodFarm = nil

spawn(function()
	while wait() do 
		pcall(function()
			if _G.Method == "Behind" then
				MethodFarm = CFrame.new(0,0,_G.DistanceMob)
			elseif _G.Method == "Below" then
				MethodFarm = CFrame.new(0,-_G.DistanceMob,0) * CFrame.Angles(math.rad(90),0,0)
			elseif _G.Method == "Upper" then
				MethodFarm = CFrame.new(0,_G.DistanceMob,0)  * CFrame.Angles(math.rad(-90),0,0)
			else
				MethodFarm = CFrame.new(0,_G.DistanceMob,0)  * CFrame.Angles(math.rad(-90),0,0)
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
	Default = {},
	Callback = function(vd)
		_G.Weapon = vd
		end
})



Set:AddToggle("Automatic Equip", {
	Title = "Automatic Equip", 
	Default = false, 
	Callback = function(equip) 
		_G.equipez = equip
	end})


spawn(function()
	while task.wait() do
		if _G.equipez then
			pcall(function()
				for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
					if _G.Weapon[v:GetAttribute("Type")] then
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
					end
				end
			end)
		end
	end
end)


local Skill = Tabs.Setting:AddSection("|Automatic Skill") 


Skill:AddToggle("Auto Skill All", {
	Title = "Auto Skill All",
	Default = false,
	Callback = function(skill)
		_G.skill= skill
	end
})


spawn(function()
	while task.wait() do
		if _G.skill then
			for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
				local args = {
					[1] = v.Name,
					[2] = "z"
				}
				game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Action"):FireServer(unpack(args))
			end
		end
	end
end)



local event = Tabs.General:AddSection("|Event") 

event:AddToggle("Auto Farm Speed Grandma [Fully]", {
	Title = "Auto Farm Speed Grandma [Fully]",
	Default = false,
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












local main = Tabs.General:AddSection("|Main") 

local interact = function(v2)
	local events = {"Activated","MouseButton1Down","MouseButton1Click","MouseButton1Up","MouseButton1Down"}
	for i,v in pairs(events) do
		for i,v in pairs(getconnections(v2[v])) do
			v.Function()
		end
	end
end


main:AddToggle("Automatic Dungeon", {
	Title = "Automatic Dungeon", 
	Default = false, 
	Callback = function(Dungeon) 
		_G.Dungeon = Dungeon
	end})


spawn(function()
	while task.wait() do
		if _G.Dungeon then
			xpcall(function()
				if workspace.Portal.Mid:GetChildren()[6].Enabled == false then
					if game:GetService("Players").LocalPlayer.PlayerGui.HUD.DungeonReward.Visible == false then
						if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Orb Dungeon") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Orb Dungeon") then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-122.17112731933594, 34.3508415222168, -1161.41015625)
						else
							wait(1)
							game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Inventory"):FireServer("Orb Dungeon")
							wait(3.5)
							print("out orb")
						end
					else
						game.Players.LocalPlayer.CharacterRemoving:Wait()
						game.Players.LocalPlayer.CharacterAdded:Wait()
						interact(game:GetService("Players").LocalPlayer.PlayerGui.HUD.DungeonReward.CloseFrame.CloseButton)
						game:GetService("Players").LocalPlayer.PlayerGui.HUD.DungeonReward.Visible = false
					end
				else
					if not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("WaveUI") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-125.230751, 34.3508415, -1133.29834, -0.796580017, -9.39225586e-10, 0.604533076, -1.5428554e-09, 1, -4.79348838e-10, -0.604533076, -1.3145468e-09, -0.796580017)
					else
						for i, v in pairs(workspace.DunMob:GetChildren()) do
							if v and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
								repeat task.wait()
									game.Player.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-29,0) * CFrame.Angles(math.rad(90),0,0)
								until not v or v.Humanoid.Health <= 0
							else
								repeat task.wait() until v and v:IsA("Model")
							end
						end
					end
				end
			end)
		end
	end
end)


local generas = Tabs.General:AddSection("|General")

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




