-- ==========================================================
-- Project: Team BerTox | Key System & Admin v2.0
-- Author: Anonymous133722
-- ==========================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- المفتاح المطلوب لتشغيل السكريبت
local CORRECT_KEY = "BerTox2026"

pcall(function()
    if CoreGui:FindFirstChild("BerToxKeyGui") then CoreGui.BerToxKeyGui:Destroy() end
    if CoreGui:FindFirstChild("BerToxMainGui") then CoreGui.BerToxMainGui:Destroy() end
    if LocalPlayer.PlayerGui:FindFirstChild("BerToxKeyGui") then LocalPlayer.PlayerGui.BerToxKeyGui:Destroy() end
    if LocalPlayer.PlayerGui:FindFirstChild("BerToxMainGui") then LocalPlayer.PlayerGui.BerToxMainGui:Destroy() end
end)

-- نافذة إدخال المفتاح أولاً
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "BerToxKeyGui"
pcall(function() KeyGui.Parent = CoreGui end)
if not KeyGui.Parent then KeyGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 300, 0, 160)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -80)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = KeyGui

Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 8)
local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(0, 170, 255)
KeyStroke.Thickness = 1.5
KeyStroke.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 35)
KeyTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
KeyTitle.Text = "Team BerTox | Enter Key"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 14
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Parent = KeyFrame
Instance.new("UICorner", KeyTitle).CornerRadius = UDim.new(0, 8)

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0, 260, 0, 40)
KeyBox.Position = UDim2.new(0.5, -130, 0, 50)
KeyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
KeyBox.PlaceholderText = "اكتب المفتاح هنا..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextSize = 14
KeyBox.Font = Enum.Font.Gotham
KeyBox.Parent = KeyFrame
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 6)

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0, 260, 0, 35)
SubmitBtn.Position = UDim2.new(0.5, -130, 0, 105)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SubmitBtn.Text = "تحقق من المفتاح"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 14
SubmitBtn.Font = Enum.Font.GothamSemibold
SubmitBtn.Parent = KeyFrame
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 6)

-- دالة فتح القائمة الرئيسية بعد صحة المفتاح
local function OpenMainHub()
    KeyGui:Destroy()

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "BerToxMainGui"
    pcall(function() ScreenGui.Parent = CoreGui end)
    if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 320, 0, 325)
    MainFrame.Position = UDim2.new(0.5, -160, 0.5, -162)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 40)
    TitleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TitleLabel.Text = "Team BerTox | Admin v2.0"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 16
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Parent = MainFrame
    Instance.new("UICorner", TitleLabel).CornerRadius = UDim.new(0, 8)

    -- زر حماية Anti-Kick
    local ActionButton = Instance.new("TextButton")
    ActionButton.Size = UDim2.new(0, 280, 0, 45)
    ActionButton.Position = UDim2.new(0.5, -140, 0, 55)
    ActionButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    ActionButton.Text = "تفعيل حماية Anti-Kick"
    ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ActionButton.TextSize = 14
    ActionButton.Font = Enum.Font.GothamSemibold
    ActionButton.Parent = MainFrame
    Instance.new("UICorner", ActionButton).CornerRadius = UDim.new(0, 6)

    local antiActive = false
    ActionButton.MouseButton1Click:Connect(function()
        antiActive = not antiActive
        if antiActive then
            ActionButton.Text = "الحماية مفعلة ✅"
            ActionButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        else
            ActionButton.Text = "تفعيل حماية Anti-Kick"
            ActionButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        end
    end)

    RunService.Heartbeat:Connect(function()
        if antiActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        end
    end)

    -- زر السرعة الخارقة
    local SpeedButton = Instance.new("TextButton")
    SpeedButton.Size = UDim2.new(0, 280, 0, 45)
    SpeedButton.Position = UDim2.new(0.5, -140, 0, 110)
    SpeedButton.BackgroundColor3 = Color3.fromRGB(150, 50, 200)
    SpeedButton.Text = "تفعيل السرعة الخارقة ⚡"
    SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedButton.TextSize = 14
    SpeedButton.Font = Enum.Font.GothamSemibold
    SpeedButton.Parent = MainFrame
    Instance.new("UICorner", SpeedButton).CornerRadius = UDim.new(0, 6)

    local speedActive = false
    SpeedButton.MouseButton1Click:Connect(function()
        speedActive = not speedActive
        if speedActive then
            SpeedButton.Text = "السرعة مفعلة (60) ⚡"
            SpeedButton.BackgroundColor3 = Color3.fromRGB(180, 80, 230)
        else
            SpeedButton.Text = "تفعيل السرعة الخارقة ⚡"
            SpeedButton.BackgroundColor3 = Color3.fromRGB(150, 50, 200)
        end
    end)

    RunService.RenderStepped:Connect(function()
        if speedActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 60
        end
    end)

    -- زر Respawn
    local ResetButton = Instance.new("TextButton")
    ResetButton.Size = UDim2.new(0, 280, 0, 45)
    ResetButton.Position = UDim2.new(0.5, -140, 0, 165)
    ResetButton.BackgroundColor3 = Color3.fromRGB(230, 140, 0)
    ResetButton.Text = "إعادة توليد الشخصية (Respawn)"
    ResetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ResetButton.TextSize = 14
    ResetButton.Font = Enum.Font.GothamSemibold
    ResetButton.Parent = MainFrame
    Instance.new("UICorner", ResetButton).CornerRadius = UDim.new(0, 6)

    ResetButton.MouseButton1Click:Connect(function()
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
            end
        end)
    end)

    -- زر إغلاق القائمة
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 280, 0, 45)
    CloseButton.Position = UDim2.new(0.5, -140, 0, 245)
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseButton.Text = "إغلاق القائمة"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 14
    CloseButton.Font = Enum.Font.GothamSemibold
    CloseButton.Parent = MainFrame
    Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 6)

    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end

-- التحقق من المفتاح عند الضغط على زر التحقق
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == CORRECT_KEY then
        OpenMainHub()
    else
        SubmitBtn.Text = "المفتاح خطأ! ❌"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1.5)
        SubmitBtn.Text = "تحقق من المفتاح"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    end
end)
