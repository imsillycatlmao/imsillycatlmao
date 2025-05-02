local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SillyCatUI"
ScreenGui.Parent = game.CoreGui


local LogoFrame = Instance.new("Frame")
LogoFrame.Size = UDim2.new(0, 500, 0, 400)  
LogoFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
LogoFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
LogoFrame.BackgroundTransparency = 0
LogoFrame.ZIndex = 10
LogoFrame.Parent = ScreenGui


local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16) 
UICorner.Parent = LogoFrame

local LogoLabel = Instance.new("TextLabel")
LogoLabel.Text = "🌌 Public UI by Silly Cat 🌌"
LogoLabel.Font = Enum.Font.GothamBold
LogoLabel.TextColor3 = Color3.fromRGB(170, 140, 255)
LogoLabel.TextSize = 28
LogoLabel.Size = UDim2.new(1, 0, 1, 0)
LogoLabel.Position = UDim2.new(0, 0, 0, 0)
LogoLabel.BackgroundTransparency = 1
LogoLabel.ZIndex = 11
LogoLabel.Parent = LogoFrame


local blur = Instance.new("BlurEffect")
blur.Size = 12
blur.Parent = game:GetService("Lighting")


task.delay(2.5, function()
    
    local textTween = TweenService:Create(LogoLabel, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        TextTransparency = 1
    })

    
    local frameTween = TweenService:Create(LogoFrame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
    })

    
    textTween:Play()
    frameTween:Play()

    
    textTween.Completed:Connect(function()
        
        if frameTween.Completed then
            LogoFrame:Destroy()  
        end
    end)
end)


task.delay(5, function()
    if blur then
        blur:Destroy()
    end
end)


local Theme = {
	Background = Color3.fromRGB(28, 28, 42),
	Accent = Color3.fromRGB(108, 77, 230),
	AccentHover = Color3.fromRGB(145, 105, 255),
	Text = Color3.fromRGB(255, 255, 255),
	Tab = Color3.fromRGB(40, 40, 60),
	TabSelected = Color3.fromRGB(90, 80, 140),
	Glass = Color3.fromRGB(20, 20, 30)
}


local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 460, 0, 330)
MainFrame.Position = UDim2.new(0.5, -230, 0.5, -165)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BackgroundTransparency = 0.1
MainFrame.Active = true
MainFrame.Draggable = false

local corner = Instance.new("UICorner", MainFrame)
corner.CornerRadius = UDim.new(0, 12)


local dragging, dragInput, dragStart, startPos
local offset = Vector2.new()

MainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
	end
end)

MainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		offset = input.Position - dragStart
		local goalPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + offset.X, startPos.Y.Scale, startPos.Y.Offset + offset.Y)
		TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { --btw you can change "0.25" to diffrent numbers to see what you like :D
			Position = goalPos
		}):Play()
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)


local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, -40, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.Text = "🌌 Silly Cat UI 🌌"
Title.BackgroundTransparency = 1
Title.TextColor3 = Theme.Text
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold


local Close = Instance.new("TextButton", MainFrame)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.Position = UDim2.new(1, -30, 0, 5)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextColor3 = Theme.Text
Close.BackgroundColor3 = Theme.Accent
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 6)
Close.MouseButton1Click:Connect(function()
	MainFrame:Destroy()
end)


local TabContainer = Instance.new("Frame", MainFrame)
TabContainer.Size = UDim2.new(0, 90, 1, -50)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Theme.Tab
Instance.new("UICorner", TabContainer).CornerRadius = UDim.new(0, 8)


local Selector = Instance.new("Frame", TabContainer)
Selector.Size = UDim2.new(0, 5, 0, 40)
Selector.Position = UDim2.new(1, -5, 0, 0)
Selector.BackgroundColor3 = Theme.Accent
Selector.Visible = false


local ContentArea = Instance.new("Frame", MainFrame)
ContentArea.Size = UDim2.new(1, -100, 1, -50)
ContentArea.Position = UDim2.new(0, 100, 0, 40)
ContentArea.BackgroundColor3 = Theme.Glass
Instance.new("UICorner", ContentArea).CornerRadius = UDim.new(0, 8)


local function fadeChildren(fadeOut)
	for _, child in ipairs(ContentArea:GetChildren()) do
		if child:IsA("GuiObject") then
			TweenService:Create(child, TweenInfo.new(0.25), {
				BackgroundTransparency = fadeOut and 1 or 0,
				TextTransparency = fadeOut and 1 or 0
			}):Play()
		end
	end
end


local function createTab(name, scripts, posY)
	local tab = Instance.new("TextButton", TabContainer)
	tab.Size = UDim2.new(1, 0, 0, 40)
	tab.Position = UDim2.new(0, 0, 0, posY)
	tab.Text = name
	tab.BackgroundColor3 = Theme.Tab
	tab.TextColor3 = Theme.Text
	tab.Font = Enum.Font.Gotham
	tab.TextSize = 14
	Instance.new("UICorner", tab).CornerRadius = UDim.new(0, 6)

	tab.MouseButton1Click:Connect(function()
		Selector.Visible = true
		TweenService:Create(Selector, TweenInfo.new(0.2), {
			Position = UDim2.new(1, -5, 0, posY)
		}):Play()

		fadeChildren(true)
		task.wait(0.25)
		for _, c in pairs(ContentArea:GetChildren()) do
			if c:IsA("GuiObject") then c:Destroy() end
		end

		for i, data in pairs(scripts) do
			local btn = Instance.new("TextButton", ContentArea)
			btn.Size = UDim2.new(0.9, 0, 0, 35)
			btn.Position = UDim2.new(0.05, 0, 0, (i-1) * 45)
			btn.Text = data[1]
			btn.Font = Enum.Font.Gotham
			btn.TextSize = 14
			btn.TextColor3 = Theme.Text
			btn.BackgroundColor3 = Theme.Accent
			btn.AutoButtonColor = false
			Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

			btn.MouseEnter:Connect(function()
				TweenService:Create(btn, TweenInfo.new(0.2), {
					BackgroundColor3 = Theme.AccentHover
				}):Play()
			end)
			btn.MouseLeave:Connect(function()
				TweenService:Create(btn, TweenInfo.new(0.2), {
					BackgroundColor3 = Theme.Accent
				}):Play()
			end)

			btn.MouseButton1Click:Connect(data[2])
		end
		fadeChildren(false)
	end)
end


local tabs = {
	{"Main", {
		{"Silly Action", function() print("Magw") end},
		{"Cool Thing", function() print("Wow") end},
		{"hjegri", function() print("pohf") end},
		{"Abc", function() print("abc") end}
	}},
	{"Extra", {
		{"Extra 1", function() print("Extra script 1") end},
		{"Extra 2", function() print("Extra script 2") end},
	}},
	{"Advanced", {
		{"Hack 1", function() print("Advanced 1") end},
		{"Hack 2", function() print("Advanced 2") end},
	}},
	{"Misc", {
		{"Fun 1", function() print("Fun script 1") end},
		{"Fun 2", function() print("Fun script 2") end},
	}}
}


for i, tabData in ipairs(tabs) do
	createTab(tabData[1], tabData[2], (i - 1) * 45)
end
