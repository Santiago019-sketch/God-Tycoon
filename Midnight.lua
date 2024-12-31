-- made by Riot And Midnight Hub --
 
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("GT", "BloodTheme")
local Tab1 = Window:NewTab("Misc")
local Tab2 = Window:NewTab("Tools")
local Tab3 = Window:NewTab("Teleports")
local Section4 = Tab1:NewSection("Misc")
local Section5 = Tab2:NewSection("Tools")
local Section6 = Tab3:NewSection("Teleports")
 
Section4:NewToggle("Auto Collect", "Automatically collects cash", function(state)
    if state then
        enabled = true
 
        local tycoons = workspace.Tycoons.Tycoons
local plrName = game.Players.LocalPlayer.Name
 
for i,tycoon in pairs(tycoons:GetChildren()) do
    if tostring(tycoon.Owner.Value) == plrName then
        local playerTycoon = tycoons[tycoon.Name]
 
        local giver = playerTycoon.Essentials.Giver
        local currencyToCollect = playerTycoon.CurrencyToCollect
 
        currencyToCollect.Changed:Connect(function()
            if enabled == true then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, giver, 0)
            wait(0.1)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, giver, 1)
            end
            end)
    end
    end
        else
            enabled = false
end
end)
 
Section4:NewToggle("Laser Removal", "Removes lasers from owner only door", function(state)
    if state then
        local tycoons = workspace.Tycoons.Tycoons
local plrName = game.Players.LocalPlayer.Name
 
for i,tycoon in pairs(tycoons:GetChildren()) do
    if tostring(tycoon.Owner.Value) ~= plrName then
        if tycoon.PurchasedObjects:FindFirstChild("OwnerOnlyDoor") then
            local owner = Instance.new("StringValue")
            owner.Name = "Owner"
            owner.Parent = tycoon.PurchasedObjects.OwnerOnlyDoor
            owner.Value = tostring(tycoon.Name)
            tycoon.PurchasedObjects:FindFirstChild("OwnerOnlyDoor").Parent = game.ReplicatedStorage
        end
    end
    end
        else
            for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                if v.Name == "OwnerOnlyDoor" then
                    local tycoon = game.Workspace.Tycoons.Tycoons:FindFirstChild(v.Owner.Value)
                    v.Parent = tycoon.PurchasedObjects
                end
                end
            end
end)
 
Section4:NewToggle("Auto Buy", "Automatically purchases objects you can afford", function(state)
    if state then
        enabled1 = true
        local cash = game.Players.LocalPlayer.leaderstats.Cash
 
cash.Changed:Connect(function()
    local tycoons = workspace.Tycoons.Tycoons
    local plrName = game.Players.LocalPlayer.Name
 
    for i,tycoon in pairs(tycoons:GetChildren()) do
        if tostring(tycoon.Owner.Value) == plrName then
            local playerTycoon = tycoons[tycoon.Name]
 
            print(playerTycoon)
 
            local buttons = playerTycoon:FindFirstChild("Buttons")
 
            for i,button in pairs(buttons:GetChildren()) do
                if enabled1 == true then
                    if button:FindFirstChild("Gamepass") then
                        -- button is a gamepass, not purchasable via cash --
                        else
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, button.Head, 0)
                            wait(0.1)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, button.Head, 1)
                            end
                    end
                    end
            end
        end
end)
        else
            enabled1 = false
            end
end)

Section4:NewToggle("Auto Click", "Automatically clicks button", function(state)
    if state then
        
        _G.autoClick = true
        
        local tycoons = workspace.Tycoons.Tycoons
        local plrName = game.Players.LocalPlayer.Name
        
        for i,tycoon in pairs(tycoons:GetChildren()) do
        if tostring(tycoon.Owner.Value) == plrName then
            local playerTycoon = tycoons[tycoon.Name]
            
            while _G.autoClick == true do
                wait()
                fireclickdetector(playerTycoon.PurchasedObjects.Mine.Model.Clicker.ClickDetector)
                end
        end
        end
        else
            _G.autoClick = false
        end
    end)
 
Section5:NewButton("Poison Tools", "Gives the tools of the poison tycoon", function()
    local tycoons = workspace.Tycoons.Tycoons
    local plrName = game.Players.LocalPlayer.Name
 
    for i,tycoon in pairs(tycoons:GetChildren()) do
        if tycoon.Name == "Poison" then
            local poisonPurchases = tycoon.PurchasedObjects
 
            if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver1") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                else
                    print("Tycoon has no tools")
            end
        end
    end
end)
 
Section5:NewButton("Nature Tools", "Gives the tools of the nature tycoon", function()
    local tycoons = workspace.Tycoons.Tycoons
    local plrName = game.Players.LocalPlayer.Name
 
    for i,tycoon in pairs(tycoons:GetChildren()) do
        if tycoon.Name == "Nature" then
            local poisonPurchases = tycoon.PurchasedObjects
 
            if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver1") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                else
                    print("Tycoon has no tools")
            end
        end
    end
end)
 
Section5:NewButton("Death Tools", "Gives the tools of the death tycoon", function()
    local tycoons = workspace.Tycoons.Tycoons
    local plrName = game.Players.LocalPlayer.Name
 
    for i,tycoon in pairs(tycoons:GetChildren()) do
        if tycoon.Name == "Death" then
            local poisonPurchases = tycoon.PurchasedObjects
 
            if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver1") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                else
                    print("Tycoon has no tools")
            end
        end
    end
end)
 
Section5:NewButton("Lightning Tools", "Gives the tools of the lightning tycoon", function()
    local tycoons = workspace.Tycoons.Tycoons
    local plrName = game.Players.LocalPlayer.Name
 
    for i,tycoon in pairs(tycoons:GetChildren()) do
        if tycoon.Name == "Lightning" then
            local poisonPurchases = tycoon.PurchasedObjects
 
            if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver1") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                else
                    print("Tycoon has no tools")
            end
        end
    end
end)
 
Section5:NewButton("Ice Tools", "Gives the tools of the death tycoon", function()
    local tycoons = workspace.Tycoons.Tycoons
    local plrName = game.Players.LocalPlayer.Name
 
    for i,tycoon in pairs(tycoons:GetChildren()) do
        if tycoon.Name == "Ice" then
            local poisonPurchases = tycoon.PurchasedObjects
 
            if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver1") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                else
                    print("Tycoon has no tools")
            end
        end
    end
end)
 
Section5:NewButton("Wind Tools", "Gives the tools of the wind tycoon", function()
    local tycoons = workspace.Tycoons.Tycoons
    local plrName = game.Players.LocalPlayer.Name
 
    for i,tycoon in pairs(tycoons:GetChildren()) do
        if tycoon.Name == "Wind" then
            local poisonPurchases = tycoon.PurchasedObjects
 
            if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver1") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                else
                    print("Tycoon has no tools")
            end
        end
    end
end)
 
Section5:NewButton("Fire Tools", "Gives the tools of the fire tycoon", function()
    local tycoons = workspace.Tycoons.Tycoons
    local plrName = game.Players.LocalPlayer.Name
 
    for i,tycoon in pairs(tycoons:GetChildren()) do
        if tycoon.Name == "Fire" then
            local poisonPurchases = tycoon.PurchasedObjects
 
            if poisonPurchases:FindFirstChild("Giver1") and poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver1") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver1.Giver, 1)
            elseif poisonPurchases:FindFirstChild("Giver2") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, poisonPurchases.Giver2.Giver, 1)
                else
                    print("Tycoon has no tools")
            end
        end
    end
end)

Section6:NewButton("Ice Tycoon", "Teleports you to the ice tycoon", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(277.608276, 140.479126, -171.713165)
end)

Section6:NewButton("Nature Tycoon", "Teleports you to the nature tycoon", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(75.3429565, 138.334717, 35.1716614)
end)

Section6:NewButton("Death Tycoon", "Teleports you to the death tycoon", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(76.4955673, 140.269302, -378.061646)
end)

Section6:NewButton("Lightning Tycoon", "Teleports you to the lightning tycoon", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215.946243, 140.478531, -312.939697)
end)

Section6:NewButton("Light Tycoon", "Teleports you to the light tycoon", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215.563568, 140.454056, -29.9981823)
end)

Section6:NewButton("Poison Tycoon", "Teleports you to the poison tycoon", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-64.9857178, 140.372375, -315.127991)
end)

Section6:NewButton("Fire Tycoon", "Teleports you to the fire tycoon", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-126.079498, 140.422226, -174.646118)
end)

Section6:NewButton("Wind Tycoon", "Teleports you to the wind tycoon", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-68.536377, 140.464355, -30.7801437)
    end)
