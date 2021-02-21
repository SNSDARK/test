if game.PlaceId == 5765666934 then
  local function scrollesp()
    for __,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "Part" and v:FindFirstChild("TouchInterest") and v:FindFirstAncestor("Part") then
      local a = Instance.new("BillboardGui",v)
                a.Size = UDim2.new(1,0, 1,0)
                a.Name = "A"
                a.AlwaysOnTop = true
      local b = Instance.new("Frame",a)
                b.Size = UDim2.new(1,0, 1,0)
                b.BackgroundTransparency = 1
                b.BorderSizePixel = 0
      local c = Instance.new("TextLabel",b)
                c.Text = "Scroll"
                c.Size = UDim2.new(1,0, 1,0)
                c.TextColor3 = Color3.fromRGB(255, 255, 5)
                c.BackgroundTransparency = 1
                c.BorderSizePixel = 0
    end
  end
  end
  pcall(function()
  workspace.ChildAdded:Connect(function()
    scrollesp()
  end)
  end)
end

