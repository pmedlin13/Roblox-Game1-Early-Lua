local Welds = {}
function Welds.Hair(Hair, Middle, Head)
  local Child = Hair:GetChildren()
  for Number = 1, #Child do
    if Child[Number]:IsA("Part") or Child[Number]:IsA("UnionOperation") then
      local CJ = CFrame.new(Middle.Position)
      local C0 = Middle.CFrame:inverse() * CJ
      local C1 = Child[Number].CFrame:inverse() * CJ
      local Weld = Instance.new("Weld")
      Weld.Part0 = Middle
      Weld.Part1 = Child[Number]
      Weld.C0 = C0
      Weld.C1 = C1
      Weld.Parent = Middle
      Weld.Name = Middle.Name .. "" .. Child[Number].Name .. "Weld"
      Child[Number].Anchored = false
    end
  end
  local Weld = Instance.new("Weld", Head)
  Weld.Name = "HeadMiddleWeld"
  Weld.Part0 = Head
  Weld.Part1 = Middle
  for _, Object in pairs(Head.Parent:GetChildren()) do
    if Object:IsA("Accoutrement") and Object:FindFirstChild("Handle") then
      local NumberValue = Instance.new("NumberValue", Object.Handle)
      NumberValue.Name = "HandleTransparency"
      NumberValue.Value = Object.Handle.Transparency
      Object.Handle.Transparency = 1
    end
  end
  Hair.Parent = Head.Parent
end
function Welds.Hats(HairName, Character)
  for _, Object in pairs(Character:GetChildren()) do
    if Object.Name == HairName then
      Object:Destroy()
    elseif Object:IsA("Accoutrement") and Object:FindFirstChild("Handle") then
      if Object.Handle:FindFirstChild("HandleTransparency") then
        Object.Handle.Transparency = Object.Handle.HandleTransparency.Value
      else
        Object.Handle.Transparency = 0
      end
    end
  end
end
return Welds
