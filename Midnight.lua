-- Load Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Create the main window
local Window = OrionLib:MakeWindow({Name = "God Tycoon GUI", HidePremium = false, SaveConfig = true, ConfigFolder = "GodTycoon"})

-- Teleports Tab
local TeleportTab = Window:MakeTab({
    Name = "Teleports",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Teleport Buttons
TeleportTab:AddButton({
    Name = "Teleport to Center",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) -- Replace with the actual coordinates
    end
})

TeleportTab:AddButton({
    Name = "Teleport to Lightning Base",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 10, 0) -- Replace with the actual coordinates
    end
})

TeleportTab:AddButton({
    Name = "Teleport to Death Base",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(200, 10, 0) -- Replace with the actual coordinates
    end
})

TeleportTab:AddButton({
    Name = "Teleport to Poison Base",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(300, 10, 0) -- Replace with the actual coordinates
    end
})

-- Morphs Tab
local MorphTab = Window:MakeTab({
    Name = "Morphs",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MorphTab:AddButton({
    Name = "Lightning Morph",
    Callback = function()
        -- Add lightning morph functionality
    end
})

MorphTab:AddButton({
    Name = "Death Morph",
    Callback = function()
        -- Add death morph functionality
    end
})

MorphTab:AddButton({
    Name = "Poison Morph",
    Callback = function()
        -- Add poison morph functionality
    end
})

-- Music Tab
local MusicTab = Window:MakeTab({
    Name = "Music",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MusicTab:AddButton({
    Name = "Play Music 1",
    Callback = function()
        local sound = Instance.new("Sound", game.Players.LocalPlayer.PlayerGui)
        sound.SoundId = "rbxassetid://12345678" -- Replace with the asset ID for Music 1
        sound:Play()
    end
})

MusicTab:AddButton({
    Name = "Play Music 2",
    Callback = function()
        local sound = Instance.new("Sound", game.Players.LocalPlayer.PlayerGui)
        sound.SoundId = "rbxassetid://87654321" -- Replace with the asset ID for Music 2
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

SettingsTab:AddTextbox({
    Name = "Set Speed",
    Default = "16",
    TextDisappear = true,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(value)
    end
})

SettingsTab:AddButton({
    Name = "Toggle Noclip",
    Callback = function()
        local noclip = false
        game:GetService("RunService").Stepped:Connect(function()
            if noclip then
                for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
        noclip = not noclip
    end
})

-- Credits Tab
local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

CreditsTab:AddLabel("Script by RiotScripter & mikee_str")
CreditsTab:AddLabel("Modified using Orion Library")

-- Initialize Orion Library
OrionLib:Init()
