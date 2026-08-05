-- Team BerTox by Anonymous133722 - Clean Script (No Encryption)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

print("Team BerTox Script Initialized...")

-- إنشاء الواجهة الرسومية الأساسية (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BerToxMainGui"
-- حماية بسيطة للظهور داخل CoreGui أو PlayerGui حسب رغبتك
pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- الإطار الرئيسي
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 220)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- زوايا دائرية للإطار
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- شريط العنوان
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TitleLabel.Text = "Team BerTox | Admin Panel"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleLabel

-- زر الوظيفة الأولى (مثال: تفعيل السرعة أو الحماية)
local ActionButton = Instance.new("TextButton")
ActionButton.Size = UDim2.new(0, 280, 0, 45)
ActionButton.Position = UDim2.new(0.5, -140, 0, 60)
ActionButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ActionButton.Text = "تفعيل حماية Anti-Kick"
ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ActionButton.TextSize = 14
ActionButton.Font = Enum.Font.GothamSemibold
ActionButton.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = ActionButton

-- حدث النقر على الزر
ActionButton.MouseButton1Click:Connect(function()
    print("تم تفعيل الحماية بنجاح بواسطة Anonymous133722!")
    ActionButton.Text = "الحماية مفعلة ✅"
    ActionButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
end)

-- زر إغلاق الواجهة
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 280, 0, 45)
CloseButton.Position = UDim2.new(0.5, -140, 0, 120)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Text = "إغلاق القائمة"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamSemibold
CloseButton.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
