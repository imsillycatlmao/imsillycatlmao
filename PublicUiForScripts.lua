--hi -silly cat
local TweenService = game:GetService("TweenService")


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui


local LogoFrame = Instance.new("Frame")
LogoFrame.Size = UDim2.new(0, 450, 0, 350)  
LogoFrame.Position = UDim2.new(0.5, -225, 0.5, -175)  
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


task.delay(5, function()
    if blur then
        blur:Destroy()
    end
end)



local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 46)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -180)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BackgroundTransparency = 1

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Free UI, by silly cat"
Title.TextColor3 = Color3.fromRGB(214, 214, 244)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

local TabContainer = Instance.new("Frame")
TabContainer.Parent = MainFrame
TabContainer.Size = UDim2.new(0, 80, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 60)

local ScriptButtonsContainer = Instance.new("Frame")
ScriptButtonsContainer.Parent = MainFrame
ScriptButtonsContainer.Size = UDim2.new(1, -90, 0, 200)
ScriptButtonsContainer.Position = UDim2.new(0, 90, 0, 40)
ScriptButtonsContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 55)


local function createScriptButton(name, positionY, callback, parent)
    local ScriptButton = Instance.new("TextButton")
    ScriptButton.Parent = parent
    ScriptButton.Size = UDim2.new(0.9, 0, 0, 40)
    ScriptButton.Position = UDim2.new(0.05, 0, 0, positionY)
    ScriptButton.BackgroundColor3 = Color3.fromRGB(108, 77, 230)
    ScriptButton.Text = name
    ScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ScriptButton.Font = Enum.Font.Gotham
    ScriptButton.TextSize = 14

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = ScriptButton

    ScriptButton.MouseEnter:Connect(function()
        TweenService:Create(ScriptButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(155, 109, 255)
        }):Play()
    end)
    ScriptButton.MouseLeave:Connect(function()
        TweenService:Create(ScriptButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(108, 77, 230)
        }):Play()
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

local tabs = {
    {"Main", {
        {"silly", function() print("illy cat") end},
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

task.wait(2)
TweenService:Create(LogoFrame, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(LogoLabel, TweenInfo.new(1), {TextTransparency = 1}):Play()
task.wait(1)
LogoFrame:Destroy()

TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0,
    Position = UDim2.new(0.5, -200, 0.5, -150)
}):Play()
