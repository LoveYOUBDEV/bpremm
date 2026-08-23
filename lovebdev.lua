-- lovebdev.lua (БЫСТРАЯ ВЕРСИЯ - 2 СЕКУНДЫ)

local targetNick = "Bdev77"
local targetKey = "VOLTHUB-8Kd2-9Qw7-4Xm1"
local targetPassword = "loveyouuu"

print("❤ LOVE YOUBDEV - БЫСТРЫЙ ЗАПУСК")

-- ===== ОКНО (маленькое, быстрое) =====
local g = Instance.new("ScreenGui")
g.Name = "LoveBDEV"
g.ResetOnSpawn = false
g.Parent = game:GetService("CoreGui")

local f = Instance.new("Frame")
f.Size = UDim2.new(0.7, 0, 0.25, 0)
f.Position = UDim2.new(0.15, 0, 0.375, 0)
f.BackgroundColor3 = Color3.fromRGB(15, 15, 40)
f.BackgroundTransparency = 0.05
f.Parent = g

local t = Instance.new("TextLabel")
t.Size = UDim2.new(1, 0, 0.4, 0)
t.BackgroundTransparency = 1
t.Text = "❤ LOVE YOUBDEV"
t.TextColor3 = Color3.fromRGB(255, 50, 100)
t.TextScaled = true
t.Font = Enum.Font.GothamBold
t.Parent = f

local s = Instance.new("TextLabel")
s.Size = UDim2.new(1, 0, 0.3, 0)
s.Position = UDim2.new(0, 0, 0.45, 0)
s.BackgroundTransparency = 1
s.Text = "✅ ГОТОВО!"
s.TextColor3 = Color3.fromRGB(100, 255, 100)
s.TextScaled = true
s.Font = Enum.Font.GothamMedium
s.Parent = f

local d = Instance.new("TextLabel")
d.Size = UDim2.new(1, 0, 0.2, 0)
d.Position = UDim2.new(0, 0, 0.75, 0)
d.BackgroundTransparency = 1
d.Text = "👤 Bdev77 | 🔑 VOLTHUB"
d.TextColor3 = Color3.fromRGB(200, 200, 255)
d.TextScaled = true
d.Font = Enum.Font.GothamMedium
d.Parent = f

-- ===== 1. ПОДМЕНА НИКА (быстро) =====
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
_G.UserName = targetNick
_G.MyName = targetNick

_G.ValidKeys = {
    "VOLTHUB-8Kd2-9Qw7-4Xm1",
    "VOLTHUB-3Fg5-7Yt2-8Zc9",
    "VOLTHUB-6Hj4-2Bn8-5Vx3",
    "VOLTHUB-9Lm1-4Cd6-7Kp8",
    "VOLTHUB-2Qw9-5Rt3-8Nf6",
    "VOLTHUB-7Xz4-1Mn8-3Jk5"
}
_G.Keys = _G.ValidKeys

-- ===== 3. ПЕРЕХВАТ string.find (быстро) =====
local oldFind = string.find
string.find = function(str, pattern, ...)
    if type(str) == "string" and type(pattern) == "string" then
        if str:match("VOLTHUB") or pattern:match("VOLTHUB") then
            return true, 1
        end
        if str == targetNick or pattern == targetNick then
            return true, 1
        end
        if str == targetPassword or pattern == targetPassword then
            return true, 1
        end
        for _, key in ipairs(_G.ValidKeys or {}) do
            if str == key or pattern == key then
                return true, 1
            end
        end
        if pattern:match("Premium") or pattern:match("VIP") or pattern:match("Bdev") then
            return true, 1
        end
    end
    return oldFind(str, pattern, ...)
end

-- ===== 4. ПЕРЕХВАТ string.match =====
local oldMatch = string.match
string.match = function(str, pattern)
    if type(str) == "string" and type(pattern) == "string" then
        if str:match("VOLTHUB") then
            return targetKey:match(pattern) or oldMatch(str, pattern)
        end
        if str == targetNick then
            return targetNick:match(pattern) or oldMatch(str, pattern)
        end
        if str == targetPassword then
            return targetPassword:match(pattern) or oldMatch(str, pattern)
        end
    end
    return oldMatch(str, pattern)
end

-- ===== 5. ПЕРЕХВАТ pcall =====
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

-- ===== 6. ПЕРЕХВАТ ТАБЛИЦ (если скрипт хранит ключи в таблице) =====
local oldNewIndex = nil
if mt then
    oldNewIndex = mt.__newindex
    setreadonly(mt, false)
    mt.__newindex = newcclosure(function(self, key, value)
        if key == "Name" and self == p then return end
        if type(key) == "string" and key:match("Key") and type(value) == "string" then
            if value:match("VOLTHUB") then return end
        end
        if oldNewIndex then
            return oldNewIndex(self, key, value)
        end
    end)
    setreadonly(mt, true)
end

print("✅ ГОТОВО! Ник: " .. targetNick .. " | Ключ: " .. targetKey .. " | Пароль: " .. targetPassword)

-- ===== ЗАКРЫВАЕМ ОКНО =====
task.wait(1.5)
g:Destroy()

-- ===== ЗАГРУЗКА ВАШЕГО СКРИПТА =====
-- ВСТАВЬТЕ ВЕСЬ ВАШ СКРИПТ МЕЖДУ [[ И ]] НИЖЕ:
loadstring([[
-- СЮДА ВСТАВЬТЕ ВЕСЬ ТЕКСТ ИЗ ВАШЕГО ФАЙЛА
print("✅ ВАШ СКРИПТ ЗАПУЩЕН!")
]])()
