config = getgenv().Configs or {}

if config and config["Distance Farm"] then
	print("ez")
else
	print("lol")
end

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
	SubTitle = "Savage Hub",
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
				for _,v in ipairs(_G.Weapon) do
					print(v)
				end
			end)
		end
	end
end)