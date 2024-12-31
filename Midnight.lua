-- Create the ScreenGui
local midnightHub = Instance.new("ScreenGui")
midnightHub.Name = "MidnightHub"
midnightHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
midnightHub.ResetOnSpawn = false -- Keep the GUI after respawn

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = midnightHub
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200) -- Centered
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Parent = mainFrame
titleLabel.Text = "Midnight Hub"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.TextSize = 24

-- Buttons Section
local buttonTemplate = Instance.new("TextButton")
buttonTemplate.Size = UDim2.new(0.8, 0, 0, 30)
buttonTemplate.Position = UDim2.new(0.1, 0, 0, 60)
buttonTemplate.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
buttonTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonTemplate.Font = Enum.Font.SourceSans
buttonTemplate.TextSize = 18
buttonTemplate.Text = "Button"
buttonTemplate.Visible = false -- Template button

-- Function to create buttons dynamically
local function createButton(parent, name, text, position, callback)
    local button = buttonTemplate:Clone()
    button.Name = name
    button.Text = text
    button.Position = UDim2.new(0.1, 0, 0, position)
    button.Visible = true
    button.Parent = parent

    button.MouseButton1Click:Connect(callback)
    return button
end

-- Teleport Button
createButton(mainFrame, "TeleportButton", "Teleport to Spawn", 60, function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) -- Change to your desired teleport coordinates
    end
end)

-- Speed Boost Button
createButton(mainFrame, "SpeedButton", "Speed Boost", 100, function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 50 -- Adjust speed as needed
    end
end)

-- Reset Speed Button
createButton(mainFrame, "ResetSpeedButton", "Reset Speed", 140, function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 16 -- Default speed
    end
end)

-- Noclip Button
local noclipActive = false
createButton(mainFrame, "NoclipButton", "Toggle Noclip", 180, function()
    noclipActive = not noclipActive
    local player = game.Players.LocalPlayer
    local character = player.Character

    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = not noclipActive
            end
        end
    end
end)

-- Music Button
local musicId = "rbxassetid://1234567890" -- Replace with a valid music ID
local musicPlaying = false
local sound = Instance.new("Sound", game.Workspace)
sound.SoundId = musicId
createButton(mainFrame, "MusicButton", "Play/Pause Music", 220, function()
    if musicPlaying then
        sound:Pause()
    else
        sound:Play()
    end
    musicPlaying = not musicPlaying
end)

-- Credits
local creditsLabel = Instance.new("TextLabel")
creditsLabel.Name = "CreditsLabel"
creditsLabel.Parent = mainFrame
creditsLabel.Text = "Created by [YourName]"
creditsLabel.Font = Enum.Font.SourceSans
creditsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
creditsLabel.Size = UDim2.new(1, 0, 0, 30)
creditsLabel.Position = UDim2.new(0, 0, 1, -30) -- Bottom of the frame
creditsLabel.TextSize = 14

-- UI Corners (optional for rounded corners)
local function applyUICorner(object)
    local corner = Instance.new("UICorner")
    corner.Parent = object
end

applyUICorner(mainFrame)
applyUICorner(buttonTemplate)
applyUICorner(titleLabel)
applyUICorner(creditsLabel)
