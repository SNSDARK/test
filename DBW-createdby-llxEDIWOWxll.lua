--local
local plr = game:GetService("Players").LocalPlayer
local A_1 = "KiBlast"
local A_2 = plr.Status
local A_3 = plr.Statics
local A_4 = plr.Character.HumanoidRootPart
local A_5 = plr.Character.RightHand
local A_6 = plr.Character
local A_7 = "quehaces"
local A_8 = {Humanoid = plr.Character.Humanoid}
local A_9 = plr.Character.Humanoid
local Event_1 = game:GetService("ReplicatedStorage").Events.DOKAMEHAME
local Event_2 = game:GetService("ReplicatedStorage").Events.Transformatico
local Event_3 = game:GetService("ReplicatedStorage").Events.IDURODEEEE
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
     Title = "Dragon Ball Warriors",
     Style = 3,
     SizeX = 400,
     SizeY = 300,
     Theme = "Jester"
})

local Page = UI.New({
    Title = "Main"
})
Page.Toggle({
    Text = "Auto train Ki",
    Callback = function(value1)
        if value1 then
            game:GetService("RunService").RenderStepped:Connect(function()
                for i = 1,5 do
                    Event_1:InvokeServer(A_1, A_2, A_3, A_4, A_5, A_6, A_7)
                end
            end)
        end
    end,
    Enabled = false
})
Page.Toggle({
    Text = "Auto train Attack",
    Callback = function(value2)
        if value2 then
            game:GetService("RunService").RenderStepped:Connect(function()
                for i = 1,5 do
                    Event_2:InvokeServer(A_3, A_8)
                end
            end)
        end
    end,
    Enabled = false
})
Page.Toggle({
    Text = "Auto train Defense",
    Callback = function(value3)
        if value3 then
            game:GetService("RunService").RenderStepped:Connect(function()
                for i = 1,5 do
                    Event_3:InvokeServer(A_3, A_2, A_9, A_5, A_7)
                end
            end)
        end
    end,
    Enabled = false
})
Page.Toggle({
    Text = "Auto train all",
    Callback = function(value4)
        if value4 then
            game:GetService("RunService").RenderStepped:Connect(function()
                while value4 do wait(0.25)
                    Event_1:InvokeServer(A_1, A_2, A_3, A_4, A_5, A_6, A_7)
                    Event_2:InvokeServer(A_3, A_8)
                    Event_3:InvokeServer(A_3, A_2, A_9, A_5, A_7)
                end
            end)
        end
    end
})
