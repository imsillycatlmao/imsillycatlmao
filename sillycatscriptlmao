print("sillyscript executed succesfully")
print("key = sillycatisthebestfrfr")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "very cool script",
    LoadingTitle = "sillycats script",
    LoadingSubtitle = "made by .tnt_clipped,jbnoob198",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "Example Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "if u don't know the key ask .tnt_clipped on discord",
        Subtitle = "Key System",
        Note = "",
        FileName = "sillyscriptkey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"sillycatisthebestfrfr","fastkey","androidmarryme","fuckthatniggaKIRA"}
    }
})

local MainTab = Window:CreateTab("🏠 Home", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
    Title = "my very cool script hehehe",
    Content = "sillycatscripyhehhehehehhee",
    Duration = 5,
    Image = 13047715178,
    Actions = {
        Ignore = {
            Name = "Okay!",
            Callback = function()
                print("The user tapped Okay!")
            end
        }
    }
})


local Button = MainTab:CreateButton({
    Name = "Infinite Jump Toggle",
    Callback = function()
        _G.infinjump = not _G.infinjump

        if _G.infinJumpStarted == nil then
            _G.infinJumpStarted = true
            game.StarterGui:SetCore("SendNotification", {Title = "sillycathub", Text = "Infinite Jump Activated!", Duration = 5})

            local plr = game:GetService('Players').LocalPlayer
            local m = plr:GetMouse()
            m.KeyDown:Connect(function(k)
                if _G.infinjump and k:byte() == 32 then
                    local humanoid = plr.Character:FindFirstChildOfClass('Humanoid')
                    if humanoid then
                        humanoid:ChangeState('Jumping')
                        wait()
                        humanoid:ChangeState('Seated')
                    end
                end
            end)
        end
    end
})


local SliderWS = MainTab:CreateSlider({
    Name = "WalkSpeed Slider",
    Range = {1, 1000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "sliderws",
    Callback = function(Value)
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end
})


local SliderJP = MainTab:CreateSlider({
    Name = "JumpPower Slider",
    Range = {1, 1000},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "sliderjp",
    Callback = function(Value)
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
        if humanoid then
            humanoid.JumpPower = Value
        end
    end
})


local Input = MainTab:CreateInput({
    Name = "WalkSpeed",
    PlaceholderText = "1-500",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
        local speed = tonumber(Text)
        if speed then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
            if humanoid then
                humanoid.WalkSpeed = speed
            end
        end
    end
})


local OtherSection = MainTab:CreateSection("BABFT")
local ButtonBuild = MainTab:CreateButton({
    Name = "maksimka autobuild",
    Callback = function()
        local success, result = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/buildaboatv2obs.txt", true)
        end)

        if success then
            print("Script fetched successfully:")
            print(result)

            local loadSuccess, loadError = pcall(function()
                loadstring(result)()
            end)

            if not loadSuccess then
                warn("Error executing the fetched script:", loadError)
            end
        else
            warn("Failed to fetch the script:", result)
        end
    end
})


local AdminSection = MainTab:CreateSection("Admin")
local ButtonAdmin = MainTab:CreateButton({
    Name = "infinite yield",
    Callback = function()
        local success, result = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end)

        if not success then
            warn("Failed to execute Infinite Yield:", result)
        end
    end
})


local OtherTab = Window:CreateTab("🌟 Other", nil)
local OtherSection = OtherTab:CreateSection("pvp games")
local CustomButton = OtherTab:CreateButton({
    Name = "invisible",
    Callback = function()
        loadstring(game:HttpGet("https://hastebin.com/share/poxikacafi.kotlin"))
        print("Invisible script executed")
    end
})


local isFloating = false
local floatSpeed = 20
local function startFloating()
    local character = game.Players.LocalPlayer.Character
    if character and not isFloating then
        isFloating = true
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
        bodyVelocity.Velocity = Vector3.new(0, floatSpeed, 0)
        bodyVelocity.Parent = humanoidRootPart
    end
end

local function stopFloating()
    isFloating = false
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            for _, child in pairs(humanoidRootPart:GetChildren()) do
                if child:IsA("BodyVelocity") then
                    child:Destroy()
                end
            end
        end
    end
end


local ButtonFloatUpward = MainTab:CreateButton({
    Name = "Float Upward",
    Callback = function()
        if isFloating then
            stopFloating()
        else
            startFloating()
        end
    end
})


local isFlying = false
local speed = 100  


local bodyVelocity = nil
local bodyGyro = nil

local function startFlying()
    if not isFlying then
        isFlying = true
        local character = game.Players.LocalPlayer.Character
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
        bodyGyro.CFrame = humanoidRootPart.CFrame
        bodyGyro.Parent = humanoidRootPart
        
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = humanoidRootPart
        
        
        game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            
            local camera = game.Workspace.CurrentCamera
            local cameraLook = camera.CFrame.LookVector
            local cameraRight = camera.CFrame.RightVector

            if input.KeyCode == Enum.KeyCode.W then
                bodyVelocity.Velocity = cameraLook * speed
            elseif input.KeyCode == Enum.KeyCode.S then
                bodyVelocity.Velocity = -cameraLook * speed
            elseif input.KeyCode == Enum.KeyCode.A then
                bodyVelocity.Velocity = -cameraRight * speed
            elseif input.KeyCode == Enum.KeyCode.D then
                bodyVelocity.Velocity = cameraRight * speed
            elseif input.KeyCode == Enum.KeyCode.E then
                bodyVelocity.Velocity = Vector3.new(0, speed, 0)
            elseif input.KeyCode == Enum.KeyCode.Q then
                bodyVelocity.Velocity = Vector3.new(0, -speed, 0)
            end
        end)
    end
end

local function stopFlying()
    if isFlying then
        isFlying = false
        if bodyVelocity then
            bodyVelocity:Destroy()
        end
        if bodyGyro then
            bodyGyro:Destroy()
        end
    end
end


local ButtonFlyCarpet = MainTab:CreateButton({
    Name = "Fly",
    Callback = function()
        if isFlying then
            stopFlying()
        else
            startFlying()
        end
    end
})




local ToggleButtonAimTracking = OtherTab:CreateButton({
    Name = "aimbot",
    Callback = function()
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

        local function findNearestPlayer()
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
            local nearestPlayer = nil
            local shortestDistance = math.huge

            for _, player in pairs(players:GetPlayers()) do
                if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = player.Character.HumanoidRootPart
                    local head = localPlayer.Character:FindFirstChild("Head")
                    local camera = workspace.CurrentCamera

                    if head then
                        local screenPoint = camera:WorldToViewportPoint(rootPart.Position)
                        local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)).Magnitude

                        -- Check for walls using raycasting
                        local ray = Ray.new(head.Position, (rootPart.Position - head.Position).Unit * 500)
                        local hitPart = workspace:FindPartOnRayWithIgnoreList(ray, {localPlayer.Character})

                        if hitPart and hitPart:IsDescendantOf(player.Character) and distance < shortestDistance then
                            shortestDistance = distance
                            nearestPlayer = rootPart
                        end
                    end
                end
            end
            return nearestPlayer
        end

        local RunService = game:GetService("RunService")

        RunService.RenderStepped:Connect(function()
            if aimTrackingEnabled then
                local nearestPlayer = findNearestPlayer()
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


    end
})

