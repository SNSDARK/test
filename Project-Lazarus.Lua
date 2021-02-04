
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
        wait()
    else
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end
end)

pcall(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
			local f1 = require(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Weapon1"))
		if f1.StoredAmmo <= 1000 then
			f1.Damage = {Max = 1500000, Min = 10000}
			f1.BulletPenetration = 1500
			f1.Spread = {Min = 0, Max = 0}
			f1.ViewKick = {Pitch = {Min = 0, Max = 0}, Yaw = {Min = 0, Max = 0}}
		end
		end)
		pcall(function()
			local f2 = require(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Weapon2"))
		if f2.StoredAmmo <= 1000 then
			f2.Damage = {Max = 1500000, Min = 10000}
			f2.BulletPenetration = 1500
			f2.Spread = {Min = 0, Max = 0}
			f2.ViewKick = {Pitch = {Min = 0, Max = 0}, Yaw = {Min = 0, Max = 0}}
		end
		end)
		pcall(function()
			local f3 = require(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Weapon3"))
		if f3.StoredAmmo <= 1000 then
            f3.MagSize = math.huge
            f3.Semi = false
            f3.FireTime = 0
            f3.StoredAmmo = math.huge
			f3.Damage = {Max = 1500000, Min = 10000}
			f3.BulletPenetration = 1500
			f3.Spread = {Min = 0, Max = 0}
			f3.ViewKick = {Pitch = {Min = 0, Max = 0}, Yaw = {Min = 0, Max = 0}}
		end
		end)
	end)
end)

tpzh = false

local InputService = game:GetService("UserInputService")

InputService.InputBegan:Connect(function(a, b)
	if a.KeyCode == Enum.KeyCode.T and not b then
		if tpzh == false then
			tpzh = true
		end
	end
end)

InputService.InputEnded:Connect(function(a, b)
	if a.KeyCode == Enum.KeyCode.T and not b then
		if tpzh == true then
			tpzh = false
		end
	end
end)

InputService.InputBegan:Connect(function(c, d)
	if c.KeyCode == Enum.KeyCode.G and not d then
		if tpzh == true then
			tpzh = false
		else
			tpzh = true
		end
	end
end)

InputService.InputEnded:Connect(function(c, d)
	if c.KeyCode == Enum.KeyCode.G and not d then
	end
end)



spawn(function()
	while true do wait()
		if tpzh then
			pcall(function()
				for i,v in pairs(game:GetService("Workspace").Baddies:GetChildren()) do
					if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid").Health ~= 0 then
						repeat
						v.HeadBox.Transparency = 0
						v.HeadBox.Material = "Neon"
						v.HeadBox.CanCollide = false
						if v.HeadBox.Anchored == false then
							v.HeadBox.Anchored = true
						elseif tpzh == false then
							v.HeadBox.Anchored = false
						end
						v.HeadBox.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,1,0)+game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*5
					until not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid").Health ~= 0 or not tpzh
					end
				end
			end)
		end
	end
end)

--loadstring(game:HttpGet("https://raw.githubusercontent.com/SNSDARK/test/main/Project-Lazarus.Lua", true))()
