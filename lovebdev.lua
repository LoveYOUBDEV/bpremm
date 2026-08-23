-- lovebdev.lua (РАБОЧАЯ ВЕРСИЯ С ТАЙМАУТОМ)

local targetNick = "Bdev77"

-- ===== СОЗДАЁМ ОКНО =====
local g = Instance.new("ScreenGui")
g.Name = "LoveBDEV"
g.ResetOnSpawn = false
g.Parent = game:GetService("CoreGui")

local f = Instance.new("Frame")
f.Size = UDim2.new(0.5, 0, 0.2, 0)
f.Position = UDim2.new(0.25, 0, 0.4, 0)
f.BackgroundColor3 = Color3.fromRGB(15, 15, 40)
f.BackgroundTransparency = 0.1
f.Parent = g

local t = Instance.new("TextLabel")
t.Size = UDim2.new(1, 0, 0.6, 0)
t.BackgroundTransparency = 1
t.Text = "❤ LOVE YOUBDEV ❤"
t.TextColor3 = Color3.fromRGB(255, 50, 100)
t.TextScaled = true
t.Font = Enum.Font.GothamBold
t.Parent = f

local s = Instance.new("TextLabel")
s.Size = UDim2.new(1, 0, 0.3, 0)
s.Position = UDim2.new(0, 0, 0.6, 0)
s.BackgroundTransparency = 1
s.Text = "✅ Готово!"
s.TextColor3 = Color3.fromRGB(100, 255, 150)
s.TextScaled = true
s.Font = Enum.Font.GothamMedium
s.Parent = f

-- ===== ПОДМЕНА НИКА =====
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

pcall(function()
    p.Name = targetNick
end)

-- ===== УСТАНОВКА КЛЮЧЕЙ =====
_G.Premium = true
_G.Licensed = true
_G.VIP = true
_G.BdevPremium = true
_G.BdevVIP = true
_G.Whitelisted = true

_G.Key = "VOLTHUB-8Kd2-9Qw7-4Xm1"
_G.VOLTHUB_KEY = "VOLTHUB-8Kd2-9Qw7-4Xm1"
_G.licenseKey = "VOLTHUB-8Kd2-9Qw7-4Xm1"

_G.Username = targetNick
_G.PlayerName = targetNick
_G.CurrentUser = targetNick

-- СПИСОК КЛЮЧЕЙ
_G.ValidKeys = {
    "VOLTHUB-8Kd2-9Qw7-4Xm1",
    "VOLTHUB-3Fg5-7Yt2-8Zc9",
    "VOLTHUB-6Hj4-2Bn8-5Vx3",
    "VOLTHUB-9Lm1-4Cd6-7Kp8",
    "VOLTHUB-2Qw9-5Rt3-8Nf6",
    "VOLTHUB-7Xz4-1Mn8-3Jk5"
}
_G.Keys = _G.ValidKeys

-- ===== ПЕРЕХВАТ ПРОВЕРОК =====
local env = getfenv(0)
local checks = {
    "checkUser", "checkPremium", "isPremium", "validateKey",
    "checkKey", "verifyUser", "isWhitelisted", "checkLicense",
    "BdevCheck", "VOLTHUB_Check"
}
for _, name in ipairs(checks) do
    if env[name] then
        env[name] = function(...) return true end
    end
end

-- ===== ПЕРЕХВАТ string.find =====
local oldFind = string.find
string.find = function(str, pattern, ...)
    if type(str) == "string" and type(pattern) == "string" then
        if str:match("VOLTHUB") or pattern:match("VOLTHUB") then
            return true, 1
        end
        if str == targetNick or pattern == targetNick then
            return true, 1
        end
    end
    return oldFind(str, pattern, ...)
end

-- ===== ПЕРЕХВАТ pcall =====
local oldPcall = pcall
pcall = function(func, ...)
    local args = {...}
    for i, v in pairs(args) do
        if type(v) == "string" then
            if v:match("VOLTHUB") then
                args[i] = "VOLTHUB-8Kd2-9Qw7-4Xm1"
            end
            if #v >= 3 and #v <= 20 and not v:match("%W") then
                args[i] = targetNick
            end
        end
    end
    return oldPcall(func, unpack(args))
end

print("[LOVE BDEV] ❤ Активирован!")
print("[LOVE BDEV] 👤 Ник: " .. targetNick)
print("[LOVE BDEV] 🔑 Ключ: VOLTHUB-8Kd2-9Qw7-4Xm1")

-- ===== ЗАКРЫВАЕМ ОКНО ЧЕРЕЗ 2 СЕКУНДЫ =====
task.wait(2)
g:Destroy()

-- ===== ЗАГРУЗКА ВАШЕГО СКРИПТА =====
-- ВСТАВЬТЕ ВЕСЬ ВАШ СКРИПТ МЕЖДУ [[ И ]] НИЖЕ:
loadstring([[
-- СЮДА ВСТАВЬТЕ ВЕСЬ ТЕКСТ ИЗ ВАШЕГО ФАЙЛА
print("✅ Ваш скрипт запущен!")
]])()
