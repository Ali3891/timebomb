-- Team BerTox by Anonymous133722 - Universal Script (Works in Any Game)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

print("Team BerTox Universal Script Initialized")

-- 1. مفتاحك الأساسي الثابت (خاص بك ولا يتغير)
local adminKey = "BerTox-Owner-2026-Admin"

-- 2. المفتاح المتجدد للمستخدمين (يتغير تلقائياً كل 3 أيام)
local function getDynamicUserKey()
    local dateTable = os.date("*t")
    local weekNumber = math.ceil(dateTable.yday / 3)
    return "BerTox-User-" .. (weekNumber * 1337) + 2026
end

local userKey = tostring(getDynamicUserKey())
local keyDuration = 3 * 24 * 60 * 60 -- صلاحية المفتاح (3 أيام)

print("Current User Key is: " .. userKey)

local function isKeyValid()
    local success, savedTime = pcall(function()
        return readfile and readfile("BerTox_KeyTime.txt")
    end)
    
    local currentTime = os.time()
    
    if success and savedTime then
        local activationTime = tonumber(savedTime)
        if activationTime and (currentTime - activationTime < keyDuration) then
            return true 
        else
            return false 
        end
    end
    return false
end

local function saveKeyTime()
    pcall(function()
        if writefile then
            writefile("BerTox_KeyTime.txt", tostring(os.time()))
        end
    end)
end

-- واجهة إدخال المفتاح (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BerToxUniversalGui"
pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 180)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "Team BerTox - Universal"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold
Title.Parent = MainFrame

local function startMainScript()
    -- هنا تضع الأكواد والوظائف العامة التي تريدها أن تعمل في أي ماب (مثل: Speed, Fly, ESP أو أي أدوات عامة)
    print("Universal Script Loaded Successfully in this Game!")
    
    -- مثال على ميزة عامة بسيطة (تنويه بأن السكريبت اشتغل):
    local StarterGui = game:GetService("StarterGui")
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Team BerTox";
            Text = "Script is active in this game!";
            Duration = 5;
        })
    end)
end

if isKeyValid() then
    Title.Text = "Key Active! Loading..."
    task.wait(1)
    ScreenGui:Destroy()
    startMainScript()
    return
end

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0, 40)
TextBox.Position = UDim2.new(0.1, 0, 0, 55)
TextBox.PlaceholderText = "Enter Key..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextBox.TextSize = 14
TextBox.Font = Enum.Font.SourceSans
TextBox.Parent = MainFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = TextBox

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.8, 0, 0, 40)
SubmitBtn.Position = UDim2.new(0.1, 0, 0, 115)
SubmitBtn.Text = "Verify Key"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
SubmitBtn.TextSize = 14
SubmitBtn.Font = Enum.Font.SourceSansBold
SubmitBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = SubmitBtn

SubmitBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == adminKey or TextBox.Text == userKey then
        saveKeyTime()
        SubmitBtn.Text = "Success! Loading..."
        task.wait(1)
        ScreenGui:Destroy()
        startMainScript()
    else
        SubmitBtn.Text = "Wrong or Expired Key!"
        task.wait(1)
        SubmitBtn.Text = "Verify Key"
    end
end)
