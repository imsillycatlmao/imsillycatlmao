
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local TabContainer = Instance.new("Frame")
local ScriptButtonsContainer = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")

ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 0, 90)
MainFrame.Size = UDim2.new(0, 400, 0, 300) -- Wider
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame


UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 0, 160)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 0, 90))
}
UIGradient.Parent = MainFrame


Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "UIlibraria, by silly cat"
Title.TextColor3 = Color3.fromRGB(200, 200, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16


TabContainer.Parent = MainFrame
TabContainer.Size = UDim2.new(0, 80, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 60)

ScriptButtonsContainer.Parent = MainFrame
ScriptButtonsContainer.Size = UDim2.new(1, -90, 0, 200)
ScriptButtonsContainer.Position = UDim2.new(0, 90, 0, 40)
ScriptButtonsContainer.BackgroundColor3 = Color3.fromRGB(20, 30, 60)


local function createScriptButton(name, positionY, callback, parent)
    local ScriptButton = Instance.new("TextButton")
    ScriptButton.Parent = parent
    ScriptButton.Size = UDim2.new(0.9, 0, 0, 40)
    ScriptButton.Position = UDim2.new(0.05, 0, 0, positionY)
    ScriptButton.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
    ScriptButton.Text = name
    ScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ScriptButton.Font = Enum.Font.Gotham
    ScriptButton.TextSize = 14

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = ScriptButton
    

    local ButtonGradient = Instance.new("UIGradient")
    ButtonGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 0, 240)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 200))
    }
    ButtonGradient.Parent = ScriptButton
    

    ScriptButton.MouseEnter:Connect(function()
        ButtonGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 30, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 10, 220))
        }
    end)
    ScriptButton.MouseLeave:Connect(function()
        ButtonGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 0, 240)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 200))
        }
    end)

    ScriptButton.MouseButton1Click:Connect(callback)
    return ScriptButton
end

local function createTab(name, positionY, scripts)
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = TabContainer
    TabButton.Size = UDim2.new(1, 0, 0, 40)
    TabButton.Position = UDim2.new(0, 0, 0, positionY)
    TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
    TabButton.Text = name
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Font = Enum.Font.Gotham
    TabButton.TextSize = 14
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = TabButton

    TabButton.MouseButton1Click:Connect(function()
        for _, child in pairs(ScriptButtonsContainer:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        for i, scriptData in pairs(scripts) do
            createScriptButton(scriptData[1], (i - 1) * 50, scriptData[2], ScriptButtonsContainer)
        end
    end)

    return TabButton
end

tabs = {
    {"Main", {
        {"silly", function() print("Please help me i am going insane -Silly cat") end},
        {"something", function() print("idk") end},
        {"poop1", function() print("Pooping...") end},
        {"okay!", function() print("Abc") end}
    }},
    {"Extra", {
        {"extra1", function() print("Extra script 1") end},
        {"extra2", function() print("Extra script 2") end}
    }},
    {"Advanced", {
        {"hack1", function() print("Advanced hack 1") end},
        {"hack2", function() print("Advanced hack 2") end}
    }},
    {"Misc", {
        {"fun1", function() print("Fun script 1") end},
        {"fun2", function() print("Fun script 2") end}
    }}
}


for i, tabData in pairs(tabs) do
    createTab(tabData[1], (i - 1) * 50, tabData[2])
end
