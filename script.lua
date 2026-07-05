-- سكريبت واجهة التفعيل والميزات (Roblox Luau)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 1. إنشاء الواجهة الرئيسية
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PremiumHub"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 220)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true -- السماح بتحريك النافذة بالماوس
mainFrame.Parent = screenGui

-- إضافة حواف دائرية للنافذة
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- العنوان
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "✨ PREMIUM HUB v1.0 ✨"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = mainFrame

-- 2. نظام التحقق من المفتاح (Key System)
local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0, 280, 0, 40)
keyInput.Position = UDim2.new(0.5, -140, 0.4, 0)
keyInput.PlaceholderText = "أدخل مفتاح التفعيل هنا..."
keyInput.Text = ""
keyInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 14
keyInput.Parent = mainFrame

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 280, 0, 40)
submitButton.Position = UDim2.new(0.5, -140, 0.65, 5)
submitButton.Text = "تفعيل السكريبت"
submitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.Font = Enum.Font.GothamBold
submitButton.TextSize = 14
submitButton.Parent = mainFrame

-- 3. برمجة زر التفعيل والميزات
local correctKey = "AHMED_KING_2026" -- المفتاح السرّي الذي تضعه في موقعك

submitButton.MouseButton1Click:Connect(function()
    if keyInput.Text == correctKey then
        title.Text = "✅ تم التفعيل بنجاح!"
        keyInput:Destroy()
        submitButton:Destroy()
        
        -- هنا تضع الميزة التي تفتح للاعب بعد التفعيل (مثال: زيادة السرعة)
        local speedButton = Instance.new("TextButton")
        speedButton.Size = UDim2.new(0, 280, 0, 50)
        speedButton.Position = UDim2.new(0.5, -140, 0.5, -25)
        speedButton.Text = "تفعيل السرعة الفائقة (WalkSpeed 100)"
        speedButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        speedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        speedButton.Font = Enum.Font.GothamBold
        speedButton.TextSize = 14
        speedButton.Parent = mainFrame
        
        speedButton.MouseButton1Click:Connect(function()
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.WalkSpeed = 100
            speedButton.Text = "⚡ تم زيادة السرعة!"
        end)
    else
        title.Text = "❌ المفتاح خاطئ! حاول مجدداً"
        wait(2)
        title.Text = "✨ PREMIUM HUB v1.0 ✨"
    end
end)