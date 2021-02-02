pcall(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			local f1 = require(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Weapon1"))
		if f1.StoredAmmo <= 1000 then
            f1.MagSize = math.huge
			f1.StoredAmmo = math.huge
			f1.Semi = false
			f1.Spread = {Min = 0, Max = 0}
			f1.ViewKick = {Pitch = {Min = 0, Max = 0}, Yaw = {Min = 0, Max = 0}}
		end
		end)
		pcall(function()
			local f2 = require(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Weapon2"))
		if f2.StoredAmmo <= 1000 then
            f2.MagSize = math.huge
			f2.StoredAmmo = math.huge
			f2.Semi = false
			f2.Spread = {Min = 0, Max = 0}
			f2.ViewKick = {Pitch = {Min = 0, Max = 0}, Yaw = {Min = 0, Max = 0}}
		end
		end)
		pcall(function()
			local f3 = require(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Weapon3"))
		if f3.StoredAmmo <= 1000 then
            f3.MagSize = math.huge
			f3.StoredAmmo = math.huge
			f3.Semi = false
			f3.Spread = {Min = 0, Max = 0}
			f3.ViewKick = {Pitch = {Min = 0, Max = 0}, Yaw = {Min = 0, Max = 0}}
		end
		end)
	end)
end)
tpzh = 0
pcall(function()
	game:GetService("UserInputService").InputBegan:Connect(function(inputObject, gameProcessedEvent)
		if inputObject.KeyCode == Enum.KeyCode.T then
			if tpzh == 1 then
				print("Auto Teleport Zombie Head is off")
				tpzh = 0
			elseif tpzh == 0 then
				print("Auto Teleport Zombie Head is on")
				tpzh = 1
			end	
		end
	end)
end)
spawn(function()
	while true do wait()
		if tpzh == 1 then
			for i,v in pairs(game:GetService("Workspace").Baddies:GetChildren()) do
				if v.Name == "Zombie" then
					v.HeadBox.Transparency = 0
					v.HeadBox.Material = "Neon"
					v.HeadBox.CanCollide = false
					v.HeadBox.Anchored = true
					v.HeadBox.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,0.5,0)+game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*5
				end
			end
		end
	end
end)
