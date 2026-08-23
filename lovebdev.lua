-- lovebdev.lua (СУПЕР-БЫСТРАЯ ВЕРСИЯ - БЕЗ string.find)

local targetNick = "Bdev77"
local targetKey = "VOLTHUB-8Kd2-9Qw7-4Xm1"
local targetPassword = "loveyouuu"

print("❤ LOVE YOUBDEV - СУПЕР БЫСТРЫЙ")

-- ===== МАЛЕНЬКОЕ ОКНО (быстрое) =====
local g = Instance.new("ScreenGui")
g.Name = "LoveBDEV"
g.ResetOnSpawn = false
g.Parent = game:GetService("CoreGui")

local f = Instance.new("Frame")
f.Size = UDim2.new(0.6, 0, 0.2, 0)
f.Position = UDim2.new(0.2, 0, 0.4, 0)
f.BackgroundColor3 = Color3.fromRGB(15, 15, 40)
f.BackgroundTransparency = 0.05
f.Parent = g

local t = Instance.new("TextLabel")
t.Size = UDim2.new(1, 0, 0.5, 0)
t.BackgroundTransparency = 1
t.Text = "❤ LOVE YOUBDEV"
t.TextColor3 = Color3.fromRGB(255, 50, 100)
t.TextScaled = true
t.Font = Enum.Font.GothamBold
t.Parent = f

local s = Instance.new("TextLabel")
s.Size = UDim2.new(1, 0, 0.3, 0)
s.Position = UDim2.new(0, 0, 0.5, 0)
s.BackgroundTransparency = 1
s.Text = "✅ ГОТОВО!"
s.TextColor3 = Color3.fromRGB(100, 255, 100)
s.TextScaled = true
s.Font = Enum.Font.GothamMedium
s.Parent = f

-- ===== 1. ПОДМЕНА НИКА =====
local p = game:GetService("Players").LocalPlayer
local mt = getrawmetatable(game)
if mt then
    local oi = mt.__index
    setreadonly(mt, false)
    mt.__index = newcclosure(function(self, key)
        if key == "Name" and self == p then
            return targetNick
        end
        return oi(self, key)
    end)
    setreadonly(mt, true)
end
pcall(function() p.Name = targetNick end)

-- ===== 2. ВСЕ ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ =====
_G.Premium = true
_G.Licensed = true
_G.VIP = true
_G.BdevPremium = true
_G.BdevVIP = true
_G.Whitelisted = true
_G.Verified = true
_G.Activated = true
_G.Unlocked = true

_G.Key = targetKey
_G.VOLTHUB_KEY = targetKey
_G.licenseKey = targetKey
_G.ActivationKey = targetKey
_G.LicenseKey = targetKey
_G.ValidKey = targetKey
_G.CurrentKey = targetKey

_G.Password = targetPassword
_G.Pass = targetPassword
_G.Pwd = targetPassword

_G.Username = targetNick
_G.PlayerName = targetNick
_G.CurrentUser = targetNick

_G.ValidKeys = {
    "VOLTHUB-8Kd2-9Qw7-4Xm1",
    "VOLTHUB-3Fg5-7Yt2-8Zc9",
    "VOLTHUB-6Hj4-2Bn8-5Vx3",
    "VOLTHUB-9Lm1-4Cd6-7Kp8",
    "VOLTHUB-2Qw9-5Rt3-8Nf6",
    "VOLTHUB-7Xz4-1Mn8-3Jk5"
}
_G.Keys = _G.ValidKeys

-- ===== 3. ПЕРЕХВАТ pcall (быстрый, без string.find) =====
local oldPcall = pcall
pcall = function(func, ...)
    local args = {...}
    for i, v in pairs(args) do
        if type(v) == "string" then
            if v:match("VOLTHUB") then
                args[i] = targetKey
            end
            if v:match("password") or v == targetPassword then
                args[i] = targetPassword
            end
            if #v >= 3 and #v <= 20 and not v:match("%W") and not v:match("VOLTHUB") and not v:match("password") then
                args[i] = targetNick
            end
        end
    end
    return oldPcall(func, unpack(args))
end

-- ===== 4. ПЕРЕХВАТ ФУНКЦИЙ (быстро) =====
local env = getfenv(0)
local checks = {
    "checkUser", "checkPremium", "isPremium", "validateKey",
    "checkKey", "verifyUser", "isWhitelisted", "checkLicense",
    "BdevCheck", "VOLTHUB_Check", "CheckLicense", "ValidateKey",
    "getUserStatus", "IsPremium", "IsWhitelisted", "HasLicense"
}
for _, name in ipairs(checks) do
    if env[name] then
        env[name] = function(...) return true end
    end
end

print("✅ Ник: " .. targetNick)
print("✅ Ключ: " .. targetKey)
print("✅ Пароль: " .. targetPassword)

-- ===== ЗАКРЫВАЕМ ОКНО =====
task.wait(1)
g:Destroy()

-- ===== ЗАГРУЗКА ВАШЕГО СКРИПТА =====
loadstring([[
-- СЮДА ВСТАВЬТЕ ВЕСЬ ТЕКСТ ИЗ ВАШЕГО ФАЙЛА
print("✅ ВАШ СКРИПТ ЗАПУЩЕН!")
]])()
