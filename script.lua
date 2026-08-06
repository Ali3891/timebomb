-- Team BerTox by Anonymous133722 - Legendary Cyber UI with Random Dynamic Key
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

print("Team BerTox Cyber Script Initialized")

-- 1. Admin Fixed Key (Owner Key that never changes)
local adminKey = "BerTox-Owner-2026-Admin"

-- 2. Random Dynamic User Key (Changes daily for security)
local function generateRandomUserKey()
    math.randomseed(os.date("*t").day + os.date("*t").month)
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local key = "BerTox-"
    for i = 1, 6 do
        local randIndex = math.random(1, #chars)
        key = key .. string.sub(chars, randIndex, randIndex)
    end
    return key
end

local userKey = generateRandomUserKey()
print("Current Random User Key is: " .. userKey) -- Check F9 console to see the key

local keyDuration = 24 * 60 * 60 -- Key valid for 24 hours

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

-- Cyber/Neon Legendary GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BerToxLegendaryGui"
pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 360, 0, 240)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -120)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 255, 128)
UIStroke.Parent = MainFrame

-- Neon Laser Animation Loop
task.spawn(function()
    while MainFrame and MainFrame.Parent do
        TweenService:Create(UIStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(0, 200, 255)}):Play()
        task.wait(2)
        TweenService:Create(UIStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(0, 255, 128)}):Play()
        task.wait(2)
    end
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1
Title.Text = "⚡ TEAM BERTOX • SECURITY ⚡"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

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
    -- Put your universal script features/functions here
end

if isKeyValid() then
    Title.Text = "✨ ACCESS GRANTED ✨"
    task.wait(1)
    ScreenGui:Destroy()
    startMainScript()
    return
end

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.85, 0, 0, 42)
TextBox.Position = UDim2.new(0.075, 0, 0, 60)
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

-- Verify Button
local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.85, 0, 0, 38)
SubmitBtn.Position = UDim2.new(0.075, 0, 0, 115)
SubmitBtn.Text = "VERIFY KEY"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
SubmitBtn.TextSize = 14
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = SubmitBtn

-- Get Key Button (Work.ink Link)
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.85, 0, 0, 38)
GetKeyBtn.Position = UDim2.new(0.075, 0, 0, 165)
GetKeyBtn.Text = "🔗 GET KEY (Work.ink Link)"
GetKeyBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
GetKeyBtn.TextSize = 13
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.Parent = MainFrame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKeyBtn

-- Put your Work.ink link here inside the quotes
local externalKeyLink = "https://work.ink/YOUR_LINK_HERE" 

GetKeyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if setclipboard then
            setclipboard(externalKeyLink)
            GetKeyBtn.Text = "Link Copied to Clipboard!"
        else
            print("Get Key Link: " .. externalKeyLink)
            GetKeyBtn.Text = "Check Console for Link!"
        end
    end)
    task.wait(2)
    GetKeyBtn.Text = "🔗 GET KEY (Work.ink Link)"
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
