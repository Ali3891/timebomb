-- Team BerTox by Anonymous133722 - Legendary Cyber UI with External Get Key Link
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

print("Team BerTox Cyber Script Initialized")

-- 1. مفتاحك الأساسي الثابت (خاص بك كصاحب السكريبت)
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

-- واجهة المستخدم الأسطورية (Cyber/Neon UI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BerToxLegendaryGui"
pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- الإطار الرئيسي
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 360, 0, 240)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -120)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- تأثير حدود النيون (الليزر المتحرك)
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 255, 128)
UIStroke.Parent = MainFrame

-- تأثير ألوان الليزر يتغير تدريجياً بشكل فخم
task.spawn(function()
    while MainFrame and MainFrame.Parent do
        TweenService:Create(UIStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(0, 200, 255)}):Play()
        task.wait(2)
        TweenService:Create(UIStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(0, 255, 128)}):Play()
        task.wait(2)
    end
end)

-- العنوان والشعار
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "⚡ TEAM BERTOX • SECURITY ⚡"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Subtitle / وصف بسيط
local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, 0, 0, 20)
SubTitle.Position = UDim2.new(0, 0, 0, 40)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Enter your key to unlock the script"
SubTitle.TextColor3 = Color3.fromRGB(150, 150, 170)
SubTitle.TextSize = 12
SubTitle.Font = Enum.Font.Gotham
SubTitle.Parent = MainFrame

local function startMainScript()
    print("Legendary Script Loaded Successfully!")
    local StarterGui = game:GetService("StarterGui")
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Team BerTox";
            Text = "Access Granted! Script is running.";
            Duration = 5;
        })
    end)
end

if isKeyValid() then
    Title.Text = "✨ ACCESS GRANTED ✨"
    task.wait(1)
    ScreenGui:Destroy()
    startMainScript()
    return
end

-- خانة كتابة المفتاح
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.85, 0, 0, 42)
TextBox.Position = UDim2.new(0.075, 0, 0, 75)
TextBox.PlaceholderText = "Paste your key here..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TextBox.TextSize = 13
TextBox.Font = Enum.Font.Gotham
TextBox.Parent = MainFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 8)
BoxCorner.Parent = TextBox

local BoxStroke = Instance.new("UIStroke")
BoxStroke.Thickness = 1
BoxStroke.Color = Color3.fromRGB(50, 50, 70)
BoxStroke.Parent = TextBox

-- زر التحقق (Verify Button)
local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.85, 0, 0, 38)
SubmitBtn.Position = UDim2.new(0.075, 0, 0, 130)
SubmitBtn.Text = "VERIFY KEY"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
SubmitBtn.TextSize = 14
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = SubmitBtn

-- زر جلب المفتاح الخارجي (Get Key Button) - ينسخ أو يوجه لمدونة/رابط خارجي
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.85, 0, 0, 32)
GetKeyBtn.Position = UDim2.new(0.075, 0, 0, 180)
GetKeyBtn.Text = "🔗 GET KEY (External Link)"
GetKeyBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
GetKeyBtn.TextSize = 12
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.Parent = MainFrame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKeyBtn

-- رابط موقعك الخارجي أو صفحة جلب المفتاح (يمكنك تعديل الرابط أدناه بالرابط الذي تريده)
local externalKeyLink = "https://github.com/Ali3891/timebomb" 

GetKeyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if setclipboard then
            setclipboard(externalKeyLink)
            GetKeyBtn.Text = "Copied Link to Clipboard!"
        else
            GetKeyBtn.Text = "Check Console for Link!"
            print("Get Key Link: " .. externalKeyLink)
        end
    end)
    task.wait(2)
    GetKeyBtn.Text = "🔗 GET KEY (External Link)"
end)

SubmitBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == adminKey or TextBox.Text == userKey then
        saveKeyTime()
        SubmitBtn.Text = "SUCCESS!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 128)
        task.wait(1)
        ScreenGui:Destroy()
        startMainScript()
    else
        SubmitBtn.Text = "INVALID OR EXPIRED KEY!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        task.wait(1.5)
        SubmitBtn.Text = "VERIFY KEY"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
    end
end)
