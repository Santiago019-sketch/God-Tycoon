-- Load Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Create the main window
local Window = OrionLib:MakeWindow({Name = "God Tycoon GUI", HidePremium = false, SaveConfig = true, ConfigFolder = "GodTycoon"})

-- Teleport Tab
local TeleportTab = Window:MakeTab({
    Name = "Teleports",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Teleport Buttons
TeleportTab:AddButton({
    Name = "Teleport to Center",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) -- Change to your center coordinates
    end    
})

TeleportTab:AddButton({
    Name = "Teleport to Lightning Base",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 10, 0) -- Replace with the actual lightning base coordinates
    end    
})

-- Add more teleport buttons similarly

-- Morph Tab
local MorphTab = Window:MakeTab({
    Name = "Morphs",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Morph Buttons
MorphTab:AddButton({
    Name = "Lightning Morph",
    Callback = function()
        -- Add your morph script or function here
    end    
})

MorphTab:AddButton({
    Name = "Poison Morph",
    Callback = function()
        -- Add your morph script or function here
    end    
})

-- Add more morph buttons similarly

-- Music Tab
local MusicTab = Window:MakeTab({
    Name = "Music",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Music Buttons
MusicTab:AddButton({
    Name = "Play Music 1",
    Callback = function()
        local sound = Instance.new("Sound", game.Players.LocalPlayer.PlayerGui)
        sound.SoundId = "rbxassetid://12345678" -- Replace with your music asset ID
        sound:Play()
    end    
})

MusicTab:AddButton({
    Name = "Play Music 2",
    Callback = function()
        local sound = Instance.new("Sound", game.Players.LocalPlayer.PlayerGui)
        sound.SoundId = "rbxassetid://87654321" -- Replace with your music asset ID
        sound:Play()
    end    
})

MusicTab:AddButton({
    Name = "Stop Music",
    Callback = function()
        for _, sound in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
            if sound:IsA("Sound") then
                sound:Stop()
                sound:Destroy()
            end
        end
    end    
})

-- Settings Tab
local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Speed Button and Textbox
SettingsTab:AddTextbox({
    Name = "Set Speed",
    Default = "16",
    TextDisappear = true,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(value)
    end    
})

-- Noclip Button
SettingsTab:AddButton({
    Name = "Toggle Noclip",
    Callback = function()
        local noclip = not noclip
        game:GetService("RunService").Stepped:Connect(function()
            if noclip then
                for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end    
})

-- Credits Tab
local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

CreditsTab:AddLabel("Script by JUKjacker")
CreditsTab:AddLabel("Modified with Orion Library")

-- Initialize Orion Library
OrionLib:Init()
