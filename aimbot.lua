local aimTrackingEnabled = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "AimTrackingGui"

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 200, 0, 50)
ToggleButton.Position = UDim2.new(0.5, -100, 0, 10)
ToggleButton.Text = "Toggle Aim Tracking: OFF"
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 20
ToggleButton.BorderSizePixel = 2
ToggleButton.BorderColor3 = Color3.new(0, 0, 0)

local circle = Drawing.new("Circle")
circle.Visible = false
circle.Radius = 175 
circle.Color = Color3.new(1, 0, 0) 
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
    ToggleButton.Text = "aimbotON/OFF: " .. (aimTrackingEnabled and "ON" or "OFF")
    ToggleButton.BackgroundColor3 = aimTrackingEnabled and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(0, 170, 255)
    circle.Visible = aimTrackingEnabled
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, isProcessed)
    if isProcessed then return end
    if input.KeyCode == Enum.KeyCode.L then
        aimTrackingEnabled = not aimTrackingEnabled
        ToggleButton.Text = "aimbotON/OFF: " .. (aimTrackingEnabled and "ON" or "OFF")
        ToggleButton.BackgroundColor3 = aimTrackingEnabled and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(0, 170, 255)
        circle.Visible = aimTrackingEnabled
    end
end)
