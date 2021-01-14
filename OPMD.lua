
repeat wait() until game:IsLoaded()
--antiafk
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
--variables
local players = game:GetService("Players")
local player = players.LocalPlayer
local phumanoid = player.Character.Humanoid
local remote = game.ReplicatedStorage.RemoteEvent
local questsM = game.ReplicatedStorage.Modules.Quests
local spawns = workspace.Spawns
local questParts = workspace.QuestParts
local class = player.Stats.Class
local spin = player.Stats.Spins
local str = player.Stats.Strength
local agi = player.Stats.Agility
local yen = player.Stats.Yen
local maxhp = phumanoid.MaxHealth
local hp = phumanoid.health
local relic = player.Stats.Artifact
local HttpService, TPService = game:GetService("HttpService"), game:GetService("TeleportService")
local ServersToTP = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/5483517179/servers/Public?sortOrder=Asc&limit=100"))

local bosses = {}
for i,v in pairs(spawns:GetChildren())do
    if v.Name == "Saitama" or v.Name == "Psykos" then
        if not table.find(bosses,v.Name) then	
            table.insert(bosses,v.Name)
        end
	end
end
for i,v in pairs(spawns:GetChildren())do	
	v.ChildAdded:Connect(function(a)
		if not table.find(bosses,a.Name) then	
	    	if a:FindFirstChild("Stats") and a.Stats:FindFirstChild("Relic") or a.Name == "Saitama" or a.Name == "Psykos" then
			    table.insert(bosses,a.Name)
		    end
		end
	end)
end

local function serverhop()
    for _, s in pairs(ServersToTP.data) do
        if s.playing ~= s.maxPlayers then
            TPService:TeleportToPlaceInstance(game.PlaceId, s.id)
        end
     end
end

local abr = ""
local abr2 = 0

local function round(number, decimalPlaces)
    if number > 1E+9 and number < 1E+12 then
        abr2 = number / 1E+9
        abr = "B"
        elseif number>1E+12 and number<1E+15 then
            abr2 = number / 1E+12
            abr = "T"
            elseif number>1E+15 and number<1e+18 then
                abr2 = number / 1E+15
                abr = "Q"
                elseif number>1e+18 then
                    abr2 = number/1E+18
                    abr = "Qu"
                        elseif number<1e+9 then
                            abr2 = number
        end
    return math.floor(abr2 * (10 ^ decimalPlaces) + 0.5) / (10 ^ decimalPlaces)
end

--Class Change
class.Changed:Connect(function()
    if class.Value == "Puri Puri" then
        class.Value = "PuriPuri"
    end
    if class.Value == "Dark Esper" then
        class.Value = "DarkEsper"
    end
    if class.Value == "Metal Bat" then
        class.Value = "MetalBat"
    end
end)
    
if class.Value == "Puri Puri" then
    class.Value = "PuriPuri"
end
if class.Value == "Dark Esper" then
    class.Value = "DarkEsper"
end
if class.Value == "Metal Bat" then
    class.Value = "MetalBat"
end
--Destroy Lava
for i,v in pairs(workspace.Map.Volcano:GetChildren()) do
    if v.Name == "Part" and v:FindFirstChild("TouchInterest") then
        v:Destroy()
    end
end
--loading wally ui revamped By Aika
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua", true))()
local w = library:CreateWindow("OPM Destiny")

local c = w:CreateFolder("Farm Bosses")

ALL = false
c:Toggle("Farm ALL",function(bool)
    ALL = bool
end)

local mobMeter = "0"

local mobdmg = c:Label("Mob Dmg: "..tostring(mobMeter),{
    TextSize = 14;
    TextColor = Color3.fromRGB(0,204,0);
    BgColor = Color3.fromRGB(0,55,55);
    
}) 

local d = w:CreateFolder("Player's stats")

local LStr = d:Label("Strength: "..round(str.Value, 2)..abr,{
	TextSize = 22;
	TextColor = Color3.fromRGB(204, 58, 0);
	BgColor = Color3.fromRGB(255, 255, 255);
})

local LAgi = d:Label("Agility: "..agi.Value,{
    TextSize = 18;
    TextColor = Color3.fromRGB(0, 247, 255);
    BgColor = Color3.fromRGB(255, 255, 255);
})

local LYen = d:Label("Yen: "..yen.Value,{
    TextSize = 18;
    TextColor = Color3.fromRGB(8, 247, 0);
    BgColor = Color3.fromRGB(255, 255, 255);
})

local LRelic = d:Label("Relic: "..relic.Value,{
    TextSize = 18;
    TextColor = Color3.fromRGB(247, 0, 0);
    BgColor = Color3.fromRGB(55, 55, 55);
})

local LClass = d:Label("Your Class: "..class.Value,{
    TextSize = 18;
    TextColor = Color3.fromRGB(0,204,0);
    BgColor = Color3.fromRGB(55,55,55);
    
}) 

local LSpin = d:Label("SPINS: "..spin.Value,{
    TextSize = 23;
    TextColor = Color3.fromRGB(0,204,0);
    BgColor = Color3.fromRGB(55,55,55);
    
}) 

d:Button("Purchase Spin 35k$",function()
    remote:FireServer("PurchaseSpin")
end)

d:Button("Roll for new Class",function()
    remote:FireServer("PurchaseSpin")
    game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer()
end)

autoroll = false
d:Toggle("ON/OFF",function(bool)
    autoroll = bool
end)

local classlist
d:Dropdown("Pick a class",{"Ninja", "Esper", "Dark Esper", "Cyborg", "Alien", "Superhuman", "Watchdog", "Metal Bat", "Puri Puri", "Phoenix"},true,function(b)
classlist = b
end)

local e = w:CreateFolder("Credits & misc")
e:Label("Made by iiiShiroSensei",{
    TextSize = 22;
    TextColor = Color3.fromRGB(0,204,0); 
    BgColor = Color3.fromRGB(55,55,55); 
    
}) 


clip = false
e:Toggle("Clip", function(bool)
clip = bool
end)

if class.Value == "Ninja" and player.Character then
    wait(2)
    remote:FireServer("EquipKatana")
    print("Class "..class.Value.." Found, Sword Equip Done.")
    player.CharacterAdded:Connect(function()
        wait(2)
        remote:FireServer("EquipKatana")
    end)
end
local quests = {}
for i, v in next, require(questsM) do
    quests[v.Target] = i
end

local A1 = "EquipRelic"
local A2 = "Stinger"
local A3 = "Alien Eye"
local equiprelic = game:GetService("ReplicatedStorage").RemoteEvent

pcall(function()
    class.Changed:Connect(function()
    	LClass:Refresh("Your class " .. class.Value)
    end)
    spin.Changed:Connect(function()
    	LSpin:Refresh("SPINS: " .. spin.Value)
    end)
    str.Changed:Connect(function()
        LStr:Refresh("Strength: "..round(str.Value, 2)..abr)
    end)
    agi.Changed:Connect(function()
        LAgi:Refresh("Agility: "..agi.Value)
    end)
    yen.Changed:Connect(function()
        LYen:Refresh("Yen: "..yen.Value)
    end)
    relic.Changed:Connect(function()
        LRelic:Refresh("Relic: "..relic.Value)
    end)
    phumanoid.HealthChanged:Connect(function()
        if phumanoid.Health < phumanoid.MaxHealth/4 and relic.Value == A3 then
            equiprelic:FireServer(A1, A2)
        elseif phumanoid.health > phumanoid.MaxHealth/4 and relic.Value == A2 then
            equiprelic:FireServer(A1, A3)
        end
    end)
end)

spawn(function()
    while wait() do
        if autoroll and class.Value ~= classlist then
            wait(.5)
            remote:FireServer("PurchaseSpin")
            if class.Value ~= classlist then
                game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer()
            else
                autoroll = false
            end
        end
    end
end)

spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
	    if ALL or clip then
    		pcall(function()
    			player.Character.Humanoid:ChangeState(11)
    		end)
	    end
	end)
end)

local meteorL = game:GetService("Workspace").Storage
spawn(function()
	while wait()do
		if ALL then
			    for i,v in pairs(spawns:GetChildren())do
				    if table.find(bosses,v.Name) and v:FindFirstChild(v.Name) then
				    	local mob = v:FindFirstChild(v.Name)
				    	local questId = quests[tostring(v.Name)]
				    	if questId and not player:FindFirstChild("Quest") or player:FindFirstChild("Quest") and player.Quest:FindFirstChild("Target") and player.Quest.Target.Value ~= mob.Name then
				     		pcall(function()
				     		    player.Character.HumanoidRootPart.CFrame=CFrame.new(questParts["QuestPart"..questId].Position+Vector3.new(0,-10,5)) * CFrame.Angles(math.rad(90), 0, 0)
                     		    wait(.3)
                     		    remote:FireServer("GetQuest", questId)
                            end)
                     	end
				    	if mob and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health >0 then
          		    		repeat
          		    		    pcall(function()
          		    		    for i2,v2 in pairs(mob.Attackers:GetChildren()) do
                                    if v2.Name == player.Name then
                                        mobMeter = v2.Value
                                        if v2.Value > 1E+12 and v2.Value < 1E+15 then
                                            mobMeter = v2.Value/1E+14
                                            mobdmg:Refresh("Mob Dmg: "..tostring(round(mobMeter, 2)).."T")
                                        elseif v2.Value > 1E+15 and v2.Value <1E+18 then
                                            mobMeter = v2.Value/1E+15
                                            mobdmg:Refresh("Mob Dmg: "..tostring(round(mobMeter, 2)).."Q")
                                        elseif v2.Value > 1E+18 and v2.Value <1E+19 then
                                            mobMeter = v2.Value/1E+18
                                            mobdmg:Refresh("Mob Dmg: "..tostring(round(mobMeter, 2)).."Qu")
                                            elseif v2.Value < 1E+12 then
                                            mobdmg:Refresh("Mob Dmg: "..tostring(mobMeter))
                                        end
                                    end
                                  end
                                  if mob.Name == "Psykos" then
                                    player.Character.HumanoidRootPart.CFrame=CFrame.new(mob.HumanoidRootPart.Position+Vector3.new(0,-7.5,0)) * CFrame.Angles(math.rad(90), 0, 0)
                                    remote:FireServer(class.Value.."Attack1", Vector3.new(mob.HumanoidRootPart.Position))
                                    remote:FireServer(class.Value.."Attack2", Vector3.new(mob.HumanoidRootPart.Position))
                                  else
                                    player.Character.HumanoidRootPart.CFrame=CFrame.new(mob.HumanoidRootPart.Position+Vector3.new(0,-7.5,0)) * CFrame.Angles(math.rad(90), 0, 0)
          		    				--player.Character.HumanoidRootPart.CFrame=mob.HumanoidRootPart.CFrame+CFrame.new(0,5,0)-player.Character.HumanoidRootPart.CFrame.lookVector*2
          		    				remote:FireServer(class.Value.."Attack1", Vector3.new(mob.HumanoidRootPart.Position))
                                    remote:FireServer(class.Value.."Attack2", Vector3.new(mob.HumanoidRootPart.Position))
                                    remote:FireServer(class.Value.."Attack3", Vector3.new(mob.HumanoidRootPart.Position))
                                  end
          		    			end)
          		    		wait()
          		    		until not mob or not mob:FindFirstChild("HumanoidRootPart") or not mob:FindFirstChild("Humanoid") or mob:FindFirstChild("Humanoid").Health <=0 or not ALL
          		    	end
          		    end
			    end
      	    end
       	end
end)
