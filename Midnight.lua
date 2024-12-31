-- Load Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Create the main window
local Window = OrionLib:MakeWindow({Name = "God Tycoon GUI", HidePremium = false, SaveConfig = true, ConfigFolder = "GodTycoon"})

-- Helper function for teleportation
local function teleportTo(position)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = position
    end
end

-- Helper function for auto-buy
local autoBuyEnabled = false
local function autoBuyItems()
    while autoBuyEnabled do
        for _, button in pairs(workspace.TycoonObjects:GetChildren()) do
            if button:IsA("Model") and button:FindFirstChild("Owner") and button.Owner.Value == game.Players.LocalPlayer.Name then
                for _, item in pairs(button:GetChildren()) do
                    if item:IsA("ClickDetector") then
                        fireclickdetector(item)
                    end
                end
            end
        end
        wait(1) -- Adjust delay as needed
    end
end

-- Helper function for auto-collect
local autoCollectEnabled = false
local function autoCollectMoney()
    while autoCollectEnabled do
        for _, collector in pairs(workspace.TycoonObjects:GetChildren()) do
            if collector:IsA("Model") and collector:FindFirstChild("Owner") and collector.Owner.Value == game.Players.LocalPlayer.Name then
                if collector:FindFirstChild("CashCollector") and collector.CashCollector:FindFirstChild("ClickDetector") then
                    fireclickdetector(collector.CashCollector.ClickDetector)
                end
            end
        end
        wait(1) -- Adjust delay as needed
    end
end

-- Teleports Tab
local TeleportTab = Window:MakeTab({
    Name = "Teleports",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

TeleportTab:AddButton({
    Name = "Teleport to Center",
    Callback = function()
        teleportTo(CFrame.new(0, 10, 0)) -- Replace with actual center coordinates
    end
})

TeleportTab:AddButton({
    Name = "Teleport to Lightning Base",
    Callback = function()
        teleportTo(CFrame.new(100, 10, 0)) -- Replace with lightning base coordinates
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

-- Automation Tab
local AutomationTab = Window:MakeTab({
    Name = "Automation",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

AutomationTab:AddToggle({
    Name = "Auto-Buy Items",
    Default = false,
    Callback = function(state)
        autoBuyEnabled = state
        if state then
            autoBuyItems()
        end
    end
})

AutomationTab:AddToggle({
    Name = "Auto-Collect Money",
    Default = false,
    Callback = function(state)
        autoCollectEnabled = state
        if state then
            autoCollectMoney()
        end
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
