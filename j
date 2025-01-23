if not game:IsLoaded() then game.Loaded:Wait() end

repeat task.wait() until game:GetService("Players")
repeat task.wait() until game:GetService("Players").LocalPlayer
repeat task.wait() until game:GetService("ReplicatedStorage")
repeat task.wait() until game:GetService("ReplicatedFirst")
repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui

local interact = function(v2)
	local events = {"Activated","MouseButton1Down","MouseButton1Click","MouseButton1Up"}
	for _,v in pairs(events) do
		for _,connection in pairs(getconnections(v2[v])) do
			connection.Function()
		end
	end
end


local function checkLine(s)
	local a = 0
	for i in string.gmatch(s, "[^\n]+") do  
		a = a+1
	end
	return a
end
local start = 1
local function addspace(a)
	local st = ""
	for i = 0,a*2 do
		st = st.." "
	end
	return st
end
local function usd(v,i)
	local turn

	if typeof(v) == "Axes" then
		turn = "Axes.new("..tostring(v)..")"
	elseif typeof(v) == "BrickColor" then
		turn = "BrickColor.new("..tostring(v)..")"
	elseif typeof(v) == "CFrame" then
		turn = "CFrame.new("..tostring(v)..")"
	elseif typeof(v) == "Vector3" then
		turn = "Vector3.new("..tostring(v)..")"
	elseif typeof(v) == "Color3" then
		if v.r<=1 and v.g<= 1 and v.b<= 1 and v.r >= 0 and v.g >= 0 and v.b >= 0 then
			local R = v.r * 255
			local G = v.g * 255
			local B = v.b * 255
			turn = 'Color3.fromRGB('..R..", "..G..", "..B..")"..'    --Color3.new('..tostring(v)..")"
		else
			turn = "Color Error"
		end
	elseif typeof(v) == "Instance" then
		turn = "game."..tostring(v:GetFullName())
	elseif typeof(v) == "Enum" then
		turn = tostring(v).."   -- Enum"
	else
		turn = tostring(typeof(v))..".new("..tostring(v)..")"
	end
	if i then
		if type(i) == "number" then 
			return '['..tostring(i)..']'.. " = "..tostring(turn)
		end
		return '["'..tostring(i)..'"]'.. " = "..tostring(turn)
	end
	return tostring(turn)
end

local convert
local startSpace = 1
function convert(v,i,a)
	if not a then
		a = startSpace    
	end
	if type(v) == "string" then
		if checkLine(v) >= 2 then
			if type(i) == "number" then 
				return '['..tostring(i)..']'.. " = "..'[['..tostring(v)..']]'
			end
			return '["'..tostring(i)..'"]'.. " = "..'[['..tostring(v)..']]'
		else
			if type(i) == "number" then 
				return '['..tostring(i)..']'.. " = "..'"'..tostring(v)..'"'
			end
			return '["'..tostring(i)..'"]'.. " = "..'"'..tostring(v)..'"'
		end
	elseif type(v) == "number" then
		if type(i) == "number" then 
			return '['..tostring(i)..']'.. " = "..tostring(v)
		end
		return '["'..tostring(i)..'"]'.. " = "..tostring(v)
	elseif type(v) == "boolean" then
		if type(i) == "number" then 
			return '['..tostring(i)..']'.. " = "..tostring(v)
		end
		return '["'..tostring(i)..'"]'.. " = "..tostring(v)
	elseif type(v) == "nil" then
		if type(i) == "number" then 
			return '['..tostring(i)..']'.. " = "..tostring(v)
		end
		return '["'..tostring(i)..'"]'.. " = nil"
	elseif type(v) == "function" then
		local Name = ""
		if debug.getinfo(v).name == "" then
			Name = tostring(v)
		else
			Name = debug.getinfo(v).name
		end
		if type(i) == "number" then 
			return '['..tostring(i)..']'.. " = "..'function()end  '..'--'.."[["..tostring(Name).."]]"
		end
		return '["'..tostring(i)..'"]'.. " = "..'function()end  '..'--'.."[["..tostring(Name).."]]"
	elseif type(v) == "userdata" or type(v) == "vector" then
		return usd(v,i)
	elseif type(v) == "table" then
		if i~= nil then
			if type(i) == "number" then
				stt = '['..tostring(i)..']'.." = "..'{'
			else
				stt = '["'..tostring(i)..'"]'.." = "..'{'
			end

		else
			stt = '{'
		end
		local count_table = 0
		for i,v in pairs(v) do
			count_table = count_table+1
			if count_table == 1 then
				stt = stt .. "\n" .. tostring(addspace(a)) .. tostring(convert(v, i, a + 1))
			else    
				stt = stt .. ",\n" .. tostring(addspace(a)) .. tostring(convert(v, i, a + 1))
			end
		end
		return stt.."\n}"
	elseif type(v) == "thread" then
		if type(i) == "number" then 
			return '['..tostring(i)..']'.. " = "..tostring(v)
		end
		return '["'..tostring(i)..'"]'.. " = "..tostring(v)
	end
end



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
ImageButton1.Image = "rbxassetid://72591373485246"
ImageButton1.MouseButton1Down:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
	game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
UICorner.Parent = ImageButton1

local Window = Fluent:CreateWindow({
	Title = "SpongeBob TD",
	SubTitle = "Silver Hub",
	TabWidth = 130,
	Size = UDim2.fromOffset(480, 400),
	Acrylic = false, 
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
	Setting = Window:AddTab({ Title = "Setting", Icon = "settings" }),
	Games = Window:AddTab({ Title = "Game", Icon = "home" }),
	Macro = Window:AddTab({ Title = "Macro", Icon = "cloud-moon" }),
	Play = Window:AddTab({ Title = "Auto Play", Icon = "cloud-cog" }),
	Misc = Window:AddTab({ Title = "Misc", Icon = "lock" })
}

local Player = game:GetService("Players")
local Loc = Player.LocalPlayer
local Char = Loc.Character
local HumanRot = Char.HumanoidRootPart

local aza = "Silver Hub"
local bza = "Config"

if isfolder(aza) then
	print("have file")
else
	makefolder(aza)
end

function saveSettings()
	local cza = game:GetService("HttpService")
	local dza = cza:JSONEncode(_G)
	if writefile then
		if isfolder(aza) then
			writefile(aza .. "/" .. bza, dza)
		end
	end
end

function loadSettings()
	local cza = game:GetService("HttpService")
	if isfile(aza .. "/" .. bza) then
		_G = cza:JSONDecode(readfile(aza .. "/" .. bza))
	end
end
loadSettings()


function getqueue()
	
	local a = require(game:GetService("Players").LocalPlayer.PlayerScripts.Knit.Controllers.UIController.GuiModules.QueueScreen)
	for i,v in pairs(a.queueReplica) do
		if type(v) == "number" then
			return v
		end
	end
end



function tp()
	for i, v in pairs(workspace.Matchmakers:GetChildren()) do
		if not v:GetAttribute("Challenge") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WorldPivot
		end
	end
end




local Main = Tabs.Setting:AddSection("[🎮] Main") 

local Select_Stage = Main:AddDropdown("Select Stage", {
	Title = "Select Stage",
	Values = {"ConchStreet" ,"JellyfishFields" ,"KrustyKrab" ,"ChumBucket"},
	Multi = false,
	Default = _G.selectedjoin,
	Callback = function(selected)
		_G.selectedjoin = selected
		saveSettings()
	end
})

local Select_Act = Main:AddDropdown("Select Act", {
	Title = "Select Act",
	Values = {"1","2","3","4","5","6","7","8","9","10"},
	Multi = false,
	Default = _G.selectedAct,
	Callback = function(selected)
		_G.selectedAct = selected
		saveSettings()
	end
})


local Select_Difficulty = Main:AddDropdown("Select Difficulty", {
	Title = "Select Difficulty",
	Values = {"Normal" ,"Hard" ,"NightMare"},
	Multi = false,
	Default = _G.selectedDifficulty,
	Callback = function(selected)
		_G.selectedDifficulty = selected
		saveSettings()
	end
})

function getDifficulty()
	if tostring(_G.selectedDifficulty) == "Normal" then
		return tonumber(1)
	elseif tostring(_G.selectedDifficulty) == "Hard" then
		return tonumber(2)
	elseif tostring(_G.selectedDifficulty) == "NightMare" then
		return tonumber(3)
	end
end




local togglejoin = Main:AddToggle("togglejoin", {Title = "Auto Join", Default = _G.join })
togglejoin:OnChanged(function(bool)
	_G.join = bool
	saveSettings()
	task.spawn(function()
		while task.wait() do
			if _G.join then
				if game.PlaceId == 123662243100680 then
					tp()
					if Loc.PlayerGui.QueueScreen.Main.SelectionScreen.Visible == true and Loc.PlayerGui.QueueScreen.Main.StartScreen.Visible == false then
						local args = {
							[1] = getqueue(),
							[2] = "ConfirmMap",
							[3] = {
								["Difficulty"] = getDifficulty(),
								["Chapter"] = tonumber(_G.selectedAct),
								["Endless"] = false,
								["World"] = _G.selectedjoin
							}
						}

						game:GetService("ReplicatedStorage"):WaitForChild("ReplicaRemoteEvents"):WaitForChild("Replica_ReplicaSignal"):FireServer(unpack(args))
					end
				end
			end
		end
	end)
end)





local toggleStart = Main:AddToggle("toggleStart", {Title = "Auto Start", Default = _G.Start })
toggleStart:OnChanged(function(bool)
	_G.Start = bool
	saveSettings()
	task.spawn(function()
		while task.wait() do
			if _G.Start then
				if game.PlaceId == 123662243100680 then
					if Loc.PlayerGui.QueueScreen.Main.SelectionScreen.Visible == false and Loc.PlayerGui.QueueScreen.Main.StartScreen.Visible == true then
						interact(Loc.PlayerGui.QueueScreen.Main.StartScreen.Main.Options.Start)
					end
				end
			end
		end
	end)
end)




local Setting = Tabs.Setting:AddSection("[⚙️] Setting")


local Select_Speed = Setting:AddDropdown("Select Speed", {
	Title = "Select Speed",
	Values = {"1" ,"2" ,"3"},
	Multi = false,
	Default = _G.selectedSpeed,
	Callback = function(selected)
		_G.selectedSpeed = selected
		saveSettings()
	end
})



local togglespeed = Setting:AddToggle("togglespeed", {Title = "Auto Speed", Default = _G.speed })
togglespeed:OnChanged(function(bool)
	_G.speed = bool
	saveSettings()
	task.spawn(function()
		while task.wait() do
			if _G.speed then
				if game.PlaceId ~= 123662243100680 then
					local args = {
						[1] = tonumber(_G.selectedSpeed)
					}

					game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("GameService"):WaitForChild("RF"):WaitForChild("ChangeGameSpeed"):InvokeServer(unpack(args))
				end
			end
		end
	end)
end)


local toggleReplay = Setting:AddToggle("toggleReplay", {Title = "Auto Replay", Default = _G.Replay })
toggleReplay:OnChanged(function(bool)
	_G.Replay = bool
	saveSettings()
	task.spawn(function()
		while task.wait() do
			if _G.Replay then
				if game.PlaceId ~= 123662243100680 then
					if Loc.PlayerGui.RoundSummary.Enabled == true then
						interact(Loc.PlayerGui.RoundSummary.Main.Content.Actions.Replay)
					end
				end
			end
		end
	end)
end)

local toggleNext = Setting:AddToggle("toggleNext", {Title = "Auto Next", Default = _G.Next })
toggleNext:OnChanged(function(bool)
	_G.Next = bool
	saveSettings()
	task.spawn(function()
		while task.wait() do
			if _G.Next then
				if game.PlaceId ~= 123662243100680 then
					if Loc.PlayerGui.RoundSummary.Enabled == true then
						interact(Loc.PlayerGui.RoundSummary.Main.Content.Actions.Next)
					end
				end
			end
		end
	end)
end)


local toggleReady = Setting:AddToggle("toggleReady", {Title = "Auto Ready", Default = _G.Ready })
toggleReady:OnChanged(function(bool)
	_G.Ready = bool
	saveSettings()
	task.spawn(function()
		while task.wait() do
			if _G.Ready then
				if game.PlaceId ~= 123662243100680 then
					if Loc.PlayerGui.GameUI.VoteStart.Main:FindFirstChild("Button") and Loc.PlayerGui.GameUI.VoteStart.Main.Button.Visible then
						interact(Loc.PlayerGui.GameUI.VoteStart.Main.Button)
					end
				end
			end
		end
	end)
end)

-- misc -------------------------------------------------------------------------------------------

Tabs.Misc:AddToggle("Anti AFK", {
	Title = "Anti AFK", 
	Default = true, 
	Callback = function(cbx) 
		saveSettings()
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



Tabs.Misc:AddToggle("White Screen", {
	Title = "White Screen", 
	Default = false, 
	Callback = function(cbx) 
		_G.WhiteScreen = cbx
		saveSettings()
		task.spawn(function()
			while task.wait() do
				if _G.WhiteScreen then
					game:GetService("RunService"):Set3dRenderingEnabled(false)
					repeat
						wait()
					until not _G.WhiteScreen
					game:GetService("RunService"):Set3dRenderingEnabled(true)
				end
			end
		end)
	end})


Tabs.Misc:AddToggle("Fps Booster", {
	Title = "Fps Booster", 
	Default = false, 
	Callback = function(cbx) 
		saveSettings()
		_G.FpsBooster = cbx
		if _G.FpsBooster then
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("SpotLight") or v:IsA("PointLight") or v:IsA("SurfaceLight") or v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sound") or v:IsA("SpecialMesh") or v:IsA("MeshPart") or v:IsA("Beam") or v:IsA("Trail") or v:IsA("Decal") or v:IsA("Lighting") or v:IsA("AmbientLight") or v:IsA("DirectionalLight") or v:IsA("Attachment") or v:IsA("BodyVelocity") or v:IsA("Trail") or v:IsA("ForceField") or v:IsA("Explosion") or v:IsA("SurfaceLight") or v:IsA("VectorForce") or v:IsA("Shockwave") or v:IsA("MeshPart") or v:IsA("SpringConstraint") or v:IsA("RodConstraint") or v:IsA("GravityForce") then
					v:Destroy()
				end
			end
		end
	end})

-- auto play -------------------------------------------------------------------------------------------

local Auto_Play = Tabs.Play:AddSection("[🤖] Auto Play (AP)")

function lol()
	-- กำหนด Path และ Nodes สำหรับ Node0 ถึง Node1
	local path = workspace.Map.Paths["1"]
	local node0 = path:FindFirstChild("Node0")
	local node1 = path:FindFirstChild("Node1")
	local node2 = path:FindFirstChild("Node2")-- เพิ่ม Node2
	local node3 = path:FindFirstChild("Node3")
	local node4 = path:FindFirstChild("Node4")
	local node5 = path:FindFirstChild("Node5")
	local node6 = path:FindFirstChild("Node6")
	local node7 = path:FindFirstChild("Node7")
	local node8 = path:FindFirstChild("Node8")
	local node9 = path:FindFirstChild("Node9")
	local node10 = path:FindFirstChild("Node10")

	-- ตรวจสอบว่า Node0, Node1 และ Node2 มีอยู่จริง
	if node0 and node1 and node2 then
		-- ฟังก์ชันสร้าง miniPart และ smallPart
		local partIndex = 1 -- ตัวแปรสำหรับนับเลข

		local function createMiniParts(nodeStart, nodeEnd)
			local totalDistance = (nodeEnd.Position - nodeStart.Position).Magnitude
			local segmentDistance = totalDistance / 10 -- แบ่งเป็น 10 ส่วน
			local direction = (nodeEnd.Position - nodeStart.Position).Unit
			local perpendicular = Vector3.new(-direction.Z, 0, direction.X) -- คำนวณเวกเตอร์ตั้งฉากในระนาบ XZ
			local offset = 0 -- ระยะห่างจากเส้นทางหลัก

			-- สร้าง "minipath" จำนวน 10 ก้อน
			for i = 0, 9 do
				local positionOnPath = nodeStart.Position + direction * (segmentDistance * i)
				local miniPathPosition = positionOnPath + perpendicular * offset

				-- สร้าง minipart หลัก
				local miniPart = Instance.new("Part")
				miniPart.Size = Vector3.new(0.5, 0.5, 0.5) -- ขนาดของก้อนเล็ก ๆ
				miniPart.Anchored = true
				miniPart.Position = miniPathPosition
				miniPart.BrickColor = BrickColor.new("Bright red") -- สีเพื่อให้มองเห็นง่าย
				miniPart.Name = tostring(partIndex) -- ใช้ตัวแปร partIndex เป็นชื่อ miniPart
				miniPart.Transparency = 1 -- มองไม่เห็น
				miniPart.CanCollide = false -- สามารถทะลุได้
				miniPart.Parent = path

				-- คำนวณจำนวน smallPart ที่ต้องการในวงกลม (โดยให้ระยะห่าง 5 หน่วยจาก miniPart)
				local radius = 5 -- ระยะห่างจาก miniPart เพิ่มเป็น 5 หน่วย
				local numParts = math.floor(360 / (math.deg(2 / radius))) -- คำนวณจำนวน smallParts ตามระยะห่าง 5 หน่วย

				-- สร้าง small part รอบๆ miniPart โดยห่างกัน 5 หน่วย
				for j = 0, numParts - 1 do
					local angle = (360 / numParts) * j -- คำนวณมุมแต่ละตัว

					local offsetX = math.cos(math.rad(angle)) * radius -- คำนวณตำแหน่ง X
					local offsetZ = math.sin(math.rad(angle)) * radius -- คำนวณตำแหน่ง Z

					local smallPart = Instance.new("Part")
					smallPart.Size = Vector3.new(0.25, 0.25, 0.25) -- ขนาดของ small part
					smallPart.Anchored = true
					smallPart.Position = miniPathPosition + Vector3.new(offsetX, 0, offsetZ)
					smallPart.BrickColor = BrickColor.new("Bright blue") -- สีของ small part
					smallPart.Transparency = 1 -- มองไม่เห็น
					smallPart.CanCollide = false -- สามารถทะลุได้
					smallPart.Parent = miniPart -- ตั้งค่า miniPart เป็น parent ของ smallPart
				end

				-- เพิ่มค่า partIndex สำหรับ miniPart ถัดไป
				partIndex = partIndex + 1
			end
		end

		createMiniParts(node0, node1)
		createMiniParts(node1, node2)
		createMiniParts(node2, node3)
		createMiniParts(node3, node4)
		createMiniParts(node4, node5)
		createMiniParts(node5, node6)
		createMiniParts(node6, node7)
		createMiniParts(node7, node8)
		createMiniParts(node8, node9)
		createMiniParts(node9, node10)

	else
		warn("Node0, Node1 หรือ Node2 ไม่พบใน path นี้")
	end
end


local Slider = Auto_Play:AddSlider("Distance", {
	Title = "Distance",
	Description = "Select Distance For PlaceTower",
	Default = 0,
	Min = 0,
	Max = 90,
	Rounding = 0,
	Callback = function(Value)
		_G.Distance = Value
	end
})


local mamung = Auto_Play:AddDropdown("Select Slot", {
	Title = "Select Slot",
	Description = "",
	Values = {1,2,3,4,5},
	Multi = true,
	Default = {},
	Callback = function(ezs)
		_G.Selectslot = ezs
		saveSettings()
	end
})

local list = {1,2,3,4,5}



Auto_Play:AddToggle("Auto Play", {
	Title = "Auto Play",
	Default = false,
	Callback = function(bool)
		_G.autoplay = bool
		saveSettings()
		if _G.autoplay then
			if game.PlaceId ~= 123662243100680 then
				lol()
				spawn(function()
					while task.wait() do
						if _G.autoplay then
							pcall(function()
								local enemy = workspace.Enemies:FindFirstChildOfClass("Model").RootPart.Position
								for i, v in pairs(workspace.Map.Paths["1"]:FindFirstChild(tostring(_G.Distance)):GetChildren()) do
									for _,slot in pairs(list) do
										if _G.Selectslot[slot] then
											local args = {
												[1] = CFrame.new(v.Position.X, enemy.Y+0.55, v.Position.Z),
												[2] = slot
											}

											game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("TowerService"):WaitForChild("RF"):WaitForChild("PlaceTower"):InvokeServer(unpack(args))
										end
									end
								end

								for _,unit in pairs(workspace.Friendlies:GetChildren()) do
									local args = {
										[1] = unit:GetAttribute("Id")
									}

									game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("GameService"):WaitForChild("RF"):WaitForChild("UpgradeTower"):InvokeServer(unpack(args))
								end
							end)
						end
					end
				end)
			end
		end
	end
})


local Full_Play = Tabs.Play:AddSection("[🕹️] Full Auto Play (FAP)")


local kuyuyy = Full_Play:AddDropdown("Select Slot", {
	Title = "Select Slot",
	Description = "",
	Values = {1,2,3,4,5},
	Multi = true,
	Default = {},
	Callback = function(ezs)
		_G.kuyslot = ezs
		saveSettings()
	end
})

local list = {1,2,3,4,5}


Full_Play:AddToggle("Full Auto Play", {
	Title = "Full Auto Play",
	Default = false,
	Callback = function(bool)
		_G.Fullez = bool
		saveSettings()
		task.spawn(function()
			while task.wait() do
				if _G.Fullez then
					pcall(function()
						if game.PlaceId ~= 123662243100680 then
							for _,slot in pairs(list) do
								if _G.kuyslot[slot] then
									local enemy = workspace.Enemies:FindFirstChildOfClass("Model").RootPart.Position

									if not enemy then return {} end 

									local x,y,z = enemy.X,enemy.Y,enemy.Z
									local gay = 0.55

									game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("TowerService"):WaitForChild("RF"):WaitForChild("PlaceTower"):InvokeServer(CFrame.new(x, y+gay, z+gay),slot)
								end
							end

							for _,unit in pairs(workspace.Friendlies:GetChildren()) do
								game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("GameService"):WaitForChild("RF"):WaitForChild("UpgradeTower"):InvokeServer(unit:GetAttribute("Id"))
								task.wait(.5)
							end
						end
					end)
				end
			end
		end)
	end
})


-- game -------------------------------------------------------------------------------------------

local Summon = Tabs.Games:AddSection("[✨] Summon")


local Select_Summon = Summon:AddDropdown("Select Summon", {
	Title = "Select Summon",
	Values = {"1","10"},
	Multi = false,
	Default = _G.selectedSummon,
	Callback = function(selected)
		_G.selectedSummon = selected
		saveSettings()
	end
})



local togglesumsum = Summon:AddToggle("togglesumsum", {Title = "Auto Summon", Default = _G.sumsum })
togglesumsum:OnChanged(function(bool)
	_G.sumsum = bool
	saveSettings()
	task.spawn(function()
		while task.wait() do
			if _G.sumsum then
				if game.PlaceId == 123662243100680 then
					HumanRot.CFrame = CFrame.new(279.039917, 10.9567471, -584.661987, 0.873446703, -7.61135599e-09, -0.486919761, 5.3980691e-09, 1, -5.94847638e-09, 0.486919761, 2.56725041e-09, 0.873446703)
					local args = {
						[1] = "Standard",
						[2] = tonumber(_G.selectedSummon)
					}

					game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("UnitService"):WaitForChild("RF"):WaitForChild("SummonUnits"):InvokeServer(unpack(args))
				end
			end
		end
	end)
end)


local Pass = Tabs.Games:AddSection("[🏅] Season Pass")


local togglecaimpass = Pass:AddToggle("togglecaimpass", {Title = "Auto Caim Season Pass", Default = _G.caimpass })
togglecaimpass:OnChanged(function(bool)
	_G.caimpass = bool
	saveSettings()
	task.spawn(function()
		while task.wait() do
			if _G.caimpass then
				if game.PlaceId == 123662243100680 then
					game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("SeasonPassService"):WaitForChild("RF"):WaitForChild("ClaimAll"):InvokeServer()
					task.wait(0.25)
				end
			end
		end
	end)
end)

local Quest = Tabs.Games:AddSection("[🏆] Quest")

local ez = Quest:AddDropdown("Select Category", {
	Title = "Select Category",
	Values = {"Daily" ,"Infinite" ,"Multiplayer" ,"Weekly"},
	Multi = true,
	Default = {},
	Callback = function(selected)
		_G.selectedCategory = selected
		saveSettings()
	end
})


local togglecaimquest = Quest:AddToggle("togglecaimquest", {Title = "Auto Caim Quest", Default = _G.caimquest })
togglecaimquest:OnChanged(function(bool)
	_G.caimquest = bool
	saveSettings()
	task.spawn(function()
		while task.wait() do
			if _G.caimquest then
				for i,v in pairs(game:GetService("ReplicatedStorage").Shared.Data.Quests:GetChildren()) do
					if _G.selectedCategory[v.Name] then
						local a = require(game:GetService("ReplicatedStorage").Shared.Data.Quests:FindFirstChild(v.Name))
						for _,z in pairs(a) do
							local args = {
								[1] = "Quests",
								[2] = {
									["Name"] = z.Name,
									["Category"] = v.Name
								}
							}

							game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ProgressionService"):WaitForChild("RF"):WaitForChild("Claim"):InvokeServer(unpack(args))
						end
					end
				end
			end
		end
	end)
end)


local Achievements = Tabs.Games:AddSection("[🎖️] Achievements")


local kuy = Achievements:AddDropdown("Select Achievements", {
	Title = "Select Achievements",
	Values = {"Units","Worlds"},
	Multi = true,
	Default = {},
	Callback = function(selected)
		_G.selectedAchievements = selected
		saveSettings()
	end
})



local togglecaimAchievements = Achievements:AddToggle("togglecaimAchievements", {Title = "Auto Caim Achievements", Default = _G.caimAchievements })
togglecaimAchievements:OnChanged(function(bool)
	_G.caimAchievements = bool
	saveSettings()
	task.spawn(function()
		while task.wait() do
			if _G.caimAchievements then
				for i,v in pairs(game:GetService("ReplicatedStorage").Shared.Data.Achievements:GetChildren()) do
					if _G.selectedAchievements[v.Name] then
						for _,z in pairs(v:GetChildren()) do
							local b = require(game:GetService("ReplicatedStorage").Shared.Data.Achievements:FindFirstChild(v.Name):FindFirstChild(z.Name))
							for _,lol in pairs(b) do
								if type(lol) ~= "number" then
									local args = {
										[1] = "Achievements",
										[2] = {
											["SubCategory"] = z.Name,
											["Name"] = lol.Name,
											["Category"] = v.Name
										}
									}

									game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ProgressionService"):WaitForChild("RF"):WaitForChild("Claim"):InvokeServer(unpack(args))
								end
							end
						end
					end
				end
			end
		end
	end)
end)

-- macro -------------------------------------------------------------------------------------------

local Macro = Tabs.Macro:AddSection("[🖱️] Macro")

local Record_Macro = Tabs.Macro:AddSection("[🎥] Record Macro")

local RecordMacroTable = {}

local path = "Silver Hub/STD/Macro/"

makefolder(path)

local ye = {}

for i,v in pairs(listfiles("Silver Hub/STD/Macro/")) do 
	table.insert(ye,({v:gsub("Silver Hub/STD/Macro/","")})[1])
end

local nameconfig = nil

local Input = Macro:AddInput("Input", {
	Title = "Create Macro",
	Default = nameconfig,
	Placeholder = "Name Macro",
	Numeric = false,
	Finished = true,
	Callback = function(text)
		nameconfig = text
		writefile(path..nameconfig ..".txt","")
	end
})

local Select_Macro = Macro:AddDropdown("Select Macro", {
	Title = "Select Macro",
	Values = ye,
	Multi = false,
	Default = _G.selectconfig,
	Callback = function(tab)
		_G.selectconfig = tab
		saveSettings()
	end
})

local function Refresh()
	ye = {}
	for i,v in pairs(listfiles("Silver Hub/STD/Macro/")) do 
		table.insert(ye,({v:gsub("Silver Hub/STD/Macro/","")})[1])
		Select_Macro:SetValues(ye)
	end
end

Macro:AddButton({
	Title = "Refresh Macro",
	Description = "",
	Callback = Refresh
})

Refresh()

Macro:AddButton({
	Title = "Delete file",
	Description = "",
	Callback = function(ez)
		_G.Delete = ez
		delfile(path.._G.selectconfig)
	end})


local basetime = 0
task.spawn(function()
	while true do 
		local realtime_wait = wait()
		if Loc.PlayerGui.RoundSummary.Enabled == false then 
			basetime = basetime + realtime_wait
		else
			basetime = 0
		end
	end
end)

local xd = nil

local toggleRecord = Record_Macro:AddToggle("toggleRecord", {Title = "Start Record", Default = xd })
toggleRecord:OnChanged(function(record)
	xd = record
	if xd then 
		RecordMacroTable = {}
	end
end)


workspace.Friendlies.ChildAdded:Connect(function (Unit)
	if not xd then return end
	table.insert(RecordMacroTable,{
		["Type"] = "Place",
		["Time"] = basetime,
		["Data"] = {
			["Name"] = Unit.Name,
			["CFrame"] = Unit.RootPart.CFrame
		}
	})
	writefile(path .. _G.selectconfig, convert(RecordMacroTable))

	Unit:GetAttributeChangedSignal("Upgrade"):Connect(function()
		if not xd then return end

		table.insert(RecordMacroTable,{
			["Type"] = "Upgrade",
			["Time"] = basetime,
			["Data"] = {
				["CFrame"] = Unit.WorldPivot
			}
		})
		writefile(path .. _G.selectconfig, convert(RecordMacroTable))
	end)
end)

workspace.Friendlies.ChildRemoved:Connect(function (Unit)
	if not xd then return end

	table.insert(RecordMacroTable,{
		["Type"] = "Sell",
		["Time"] = basetime,
		["Data"] = {
			["CFrame"] = Unit.WorldPivot
		}
	})
	writefile(path .. _G.selectconfig, convert(RecordMacroTable))
end)



local Play_Macro = Tabs.Macro:AddSection("[▶] Play Macro") 

local togglePlay = Play_Macro:AddToggle("togglePlay", {Title = "Play Macro", Default = _G.Play })
togglePlay:OnChanged(function(play)
	_G.Play = play
	saveSettings()
	repeat task.wait()
		if _G.Play then 
			local datamacro = readfile(path.._G.selectconfig)
			local real = loadstring("return "..datamacro)()
			if #real > 0 and real[#real].Time > basetime then
				for i,v in pairs(real) do 
					if _G.Play then
						repeat wait() until basetime >= v.Time
						if v["Type"] == "Place" then
							for e,z in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Hotbar:GetChildren()) do
								if not z:IsA("UIGridLayout") then
									local viewport = z.Content.TowerInfo:FindFirstChildOfClass("ViewportFrame")
									if viewport then
										local worldMoyel = viewport:FindFirstChildOfClass("WorldModel")
										local kuy = worldMoyel:FindFirstChildOfClass("Model").Name
										if kuy == v.Data.Name then
											local args = {
												[1] = v.Data.CFrame,
												[2] = tonumber(z.Name)
											}

											game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("TowerService"):WaitForChild("RF"):WaitForChild("PlaceTower"):InvokeServer(unpack(args))
										end
									end
								end
							end
						elseif v["Type"] == "Upgrade" then
							local num = 0

							for _,unit in pairs(workspace.Friendlies:GetChildren()) do
								if unit.RootPart.CFrame == v.Data.CFrame then
									if num < 1 then
										local args = {
											[1] = unit:GetAttribute("Id")
										}

										game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("GameService"):WaitForChild("RF"):WaitForChild("UpgradeTower"):InvokeServer(unpack(args))
										num = num + 1
									end
								end
							end
						elseif v["Type"] == "Sell" then

							local num = 0
							
							for _,unit in pairs(workspace.Friendlies:GetChildren()) do
								if unit.RootPart.CFrame == v.Data.CFrame then
									if num < 1 then
										local args = {
											[1] = unit:GetAttribute("Id")
										}

										game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("TowerService"):WaitForChild("RF"):WaitForChild("SellTower"):InvokeServer(unpack(args))
										num = num + 1
									end
								end
							end
						end
					end
				end
			end
		end
	until not _G.Play
end)


