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

local targetHighlight = Drawing.new("Square")
targetHighlight.Visible = false
targetHighlight.Thickness = 2
targetHighlight.Color = Color3.fromRGB(255, 85, 255) 
targetHighlight.Transparency = 1


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
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

            if humanoid and humanoid.Health > 1 then 
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

            
            local screenPos, onScreen = camera:WorldToViewportPoint(nearestPlayer.Position)
            if onScreen then
                targetHighlight.Position = Vector2.new(screenPos.X - 15, screenPos.Y - 15)
                targetHighlight.Size = Vector2.new(30, 30)
                targetHighlight.Visible = true
            else
                targetHighlight.Visible = false
            end
        else
            targetHighlight.Visible = false
        end
    else
        targetHighlight.Visible = false
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
    if input.KeyCode == Enum.KeyCode.B then
        aimTrackingEnabled = not aimTrackingEnabled
        ToggleButton.Text = "Aimbot:" .. (aimTrackingEnabled and "ON" or "OFF")
        ToggleButton.BackgroundColor3 = aimTrackingEnabled and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(0, 170, 255)
        circle.Visible = aimTrackingEnabled
    end
end)
