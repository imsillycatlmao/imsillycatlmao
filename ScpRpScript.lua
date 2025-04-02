local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ExecuteButton = Instance.new("TextButton")
local UIStroke = Instance.new("UIStroke")
local ScriptButtonsContainer = Instance.new("Frame")


ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(173, 0, 230) 
MainFrame.Size = UDim2.new(0, 300, 0, 300)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(173, 0, 230)
UIStroke.Thickness = 2

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "SCP: Roleplay, by silly cat"
Title.TextColor3 = Color3.fromRGB(200, 200, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16


ScriptButtonsContainer.Parent = MainFrame
ScriptButtonsContainer.Size = UDim2.new(1, 0, 0, 200)
ScriptButtonsContainer.Position = UDim2.new(0, 0, 0, 40)
ScriptButtonsContainer.BackgroundColor3 = Color3.fromRGB(30, 40, 70) 


local function createScriptButton(name, positionY, callback)
    local ScriptButton = Instance.new("TextButton")
    ScriptButton.Parent = ScriptButtonsContainer
    ScriptButton.Size = UDim2.new(0.8, 0, 0, 40)
    ScriptButton.Position = UDim2.new(0.1, 0, 0, positionY)
    ScriptButton.BackgroundColor3 = Color3.fromRGB(125, 0, 230)
    ScriptButton.Text = name
    ScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ScriptButton.Font = Enum.Font.Gotham
    ScriptButton.TextSize = 14

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = ScriptButton

    ScriptButton.MouseButton1Click:Connect(callback)

    return ScriptButton
end


createScriptButton("Join the discord!", 0, function()
    print("Discord link: https://discord.gg/NF2Pvx4abM")
    
    
    local message = Instance.new("TextLabel")
    message.Parent = ScreenGui
    message.Size = UDim2.new(0, 300, 0, 50)
    message.Position = UDim2.new(0.5, -150, 0.5, -100)
    message.BackgroundTransparency = 1
    message.Text = "Join our Discord: .gg/NF2Pvx4abM"
    message.TextColor3 = Color3.fromRGB(255, 255, 255)
    message.Font = Enum.Font.Gotham
    message.TextSize = 18
end)


createScriptButton("Fast-Speed", 50, function()
    print("Starting walkspeed loop...")
    while true do
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 39
    wait(0.1)  
end

end)

createScriptButton("IY", 100, function()
    print("Loading infinite yield...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

createScriptButton("Aimbot", 150, function()
    print("Loading aimbot gui...")
    local aimTrackingEnabled = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "AimTrackingGui"

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 220, 0, 60)
ToggleButton.Position = UDim2.new(0.5, -110, 0, 20)
ToggleButton.Text = "Aimbot: OFF"
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 24
ToggleButton.BorderSizePixel = 0
ToggleButton.BackgroundTransparency = 0.2
ToggleButton.TextTransparency = 0
ToggleButton.AutoButtonColor = false


local gradient = Instance.new("UIGradient")
gradient.Parent = ToggleButton
gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 127))})
gradient.Rotation = 45


local buttonShadow = Instance.new("Frame")
buttonShadow.Parent = ToggleButton
buttonShadow.AnchorPoint = Vector2.new(0.5, 0.5)
buttonShadow.Position = UDim2.new(0.5, 4, 0.5, 4)
buttonShadow.Size = UDim2.new(1, 0, 1, 0)
buttonShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
buttonShadow.BackgroundTransparency = 0.6
buttonShadow.BorderSizePixel = 0
buttonShadow.ZIndex = -1


local circle = Drawing.new("Circle")
circle.Visible = false
circle.Radius = 175 
circle.Color = Color3.fromRGB(173, 0, 230) 
circle.Thickness = 5
circle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)

local function findNearestToCursor()
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local localTeam = localPlayer.Team
    local camera = workspace.CurrentCamera
    local centerScreen = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    local nearestPlayer = nil
    local shortestScreenDistance = math.huge

    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer and player.Team ~= localTeam and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            local screenPoint = camera:WorldToViewportPoint(head.Position)
            local screenPos = Vector2.new(screenPoint.X, screenPoint.Y)
            local distance = (screenPos - centerScreen).Magnitude

            local ray = Ray.new(camera.CFrame.Position, (head.Position - camera.CFrame.Position).Unit * 500)
            local hitPart = workspace:FindPartOnRayWithIgnoreList(ray, {localPlayer.Character})

            if hitPart and hitPart:IsDescendantOf(player.Character) and distance < shortestScreenDistance then
                shortestScreenDistance = distance
                nearestPlayer = head
            end
        end
    end
    return nearestPlayer
end

local RunService = game:GetService("RunService")

RunService.RenderStepped:Connect(function()
    if aimTrackingEnabled then
        local nearestPlayer = findNearestToCursor()
        if nearestPlayer then
            local camera = workspace.CurrentCamera
            local targetPosition = nearestPlayer.Position
            local cameraPosition = camera.CFrame.Position

            camera.CFrame = CFrame.new(cameraPosition, targetPosition)
        end
    end
end)


ToggleButton.MouseButton1Click:Connect(function()
    aimTrackingEnabled = not aimTrackingEnabled
    ToggleButton.Text = "Aimbot: " .. (aimTrackingEnabled and "ON" or "OFF")
    ToggleButton.BackgroundColor3 = aimTrackingEnabled and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(0, 170, 255)
    circle.Visible = aimTrackingEnabled
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, isProcessed)
    if isProcessed then return end
    if input.KeyCode == Enum.KeyCode.L then
        aimTrackingEnabled = not aimTrackingEnabled
        ToggleButton.Text = "Aimbot:" .. (aimTrackingEnabled and "ON" or "OFF")
        ToggleButton.BackgroundColor3 = aimTrackingEnabled and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(0, 170, 255)
        circle.Visible = aimTrackingEnabled
    end
end)

end)
