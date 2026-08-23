-- lovebdev.lua (МАКСИМАЛЬНО АГРЕССИВНАЯ ВЕРСИЯ)

local targetNick = "Bdev77"

-- ОКНО
local g = Instance.new("ScreenGui")
g.Name = "LoveBDEV"
g.Parent = game:GetService("CoreGui")

local f = Instance.new("Frame")
f.Size = UDim2.new(0.5, 0, 0.25, 0)
f.Position = UDim2.new(0.25, 0, 0.375, 0)
f.BackgroundColor3 = Color3.fromRGB(15, 15, 40)
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
s.Text = "🔄 Bypassing..."
s.TextColor3 = Color3.fromRGB(100, 255, 150)
s.TextScaled = true
s.Font = Enum.Font.GothamMedium
s.Parent = f

-- ===== 1. ПОДМЕНА НИКА =====
local p = game:GetService("Players").LocalPlayer

-- Метатаблица
local mt = getrawmetatable(game)
if mt then
    local oi = mt.__index
    setreadonly(mt, false)
    mt.__index = newcclosure(function(self, key)
        if key == "Name" and self == p then return targetNick end
        return oi(self, key)
    end)
    setreadonly(mt, true)
end

-- Свойство Name
pcall(function() p.Name = targetNick end)

-- GetFullName
pcall(function()
    local old = p.GetFullName
    p.GetFullName = function(self)
        if self == p then return targetNick end
        return old(self)
    end
end)

-- ===== 2. ВСЕ ВОЗМОЖНЫЕ КЛЮЧИ =====
local allKeys = {
    "VOLTHUB-8Kd2-9Qw7-4Xm1",
    "VOLTHUB-3Fg5-7Yt2-8Zc9",
    "VOLTHUB-6Hj4-2Bn8-5Vx3",
    "VOLTHUB-9Lm1-4Cd6-7Kp8",
    "VOLTHUB-2Qw9-5Rt3-8Nf6",
    "VOLTHUB-7Xz4-1Mn8-3Jk5",
    "VOLTHUB-AAAA-AAAA-AAAA",
    "VOLTHUB-BBBB-BBBB-BBBB",
    "VOLTHUB-CCCC-CCCC-CCCC",
    "VOLTHUB-1111-2222-3333",
    "VOLTHUB-9999-8888-7777"
}

-- ===== 3. ЗАЛИВАЕМ ВСЕ ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ =====
_G.Premium = true
_G.Licensed = true
_G.VIP = true
_G.BdevPremium = true
_G.BdevVIP = true
_G.Whitelisted = true
_G.Verified = true
_G.Activated = true
_G.Unlocked = true
_G.HasAccess = true
_G.IsPremium = true
_G.PremiumUser = true
_G.LicenseValid = true

-- КЛЮЧИ
for i, key in ipairs(allKeys) do
    _G["Key" .. i] = key
    _G["License" .. i] = key
    _G["VOLTHUB_KEY_" .. i] = key
end

_G.Key = allKeys[1]
_G.VOLTHUB_KEY = allKeys[1]
_G.licenseKey = allKeys[1]
_G.ActivationKey = allKeys[1]
_G.LicenseKey = allKeys[1]
_G.ValidKey = allKeys[1]
_G.CurrentKey = allKeys[1]

-- НИКИ
_G.Username = targetNick
_G.PlayerName = targetNick
_G.CurrentUser = targetNick
_G.UserName = targetNick
_G.MyName = targetNick
_G.Player = targetNick
_G.User = targetNick

-- СПИСКИ КЛЮЧЕЙ
_G.ValidKeys = allKeys
_G.Keys = allKeys
_G.KeyList = allKeys
_G.LicenseList = allKeys
_G.ValidKeysList = allKeys

-- ===== 4. ПЕРЕХВАТ ВСЕХ ФУНКЦИЙ =====
local env = getfenv(0)

-- Функции проверки
local funcsToHook = {
    "checkUser", "checkPremium", "isPremium", "validateKey",
    "checkKey", "verifyUser", "isWhitelisted", "checkLicense",
    "BdevCheck", "VOLTHUB_Check", "getUserStatus",
    "CheckLicense", "ValidateKey", "VerifyUser",
    "IsPremium", "IsWhitelisted", "HasLicense",
    "check", "validate", "verify", "isValid",
    "checkKeyValid", "isKeyValid", "keyIsValid"
}

for _, name in ipairs(funcsToHook) do
    if env[name] then
        env[name] = function(...) return true end
    end
    -- Также в _G
    if _G[name] then
        _G[name] = function(...) return true end
    end
end

-- ===== 5. ПЕРЕХВАТ СТРОКОВЫХ ФУНКЦИЙ =====
local oldFind = string.find
string.find = function(str, pattern, ...)
    if type(str) == "string" and type(pattern) == "string" then
        -- Любое упоминание VOLTHUB = true
        if str:match("VOLTHUB") or pattern:match("VOLTHUB") then
            return true, 1
        end
        -- Любое совпадение с ником
        if str == targetNick or pattern == targetNick then
            return true, 1
        end
        -- Любой ключ из списка
        for _, key in ipairs(allKeys) do
            if str == key or pattern == key then
                return true, 1
            end
        end
    end
    return oldFind(str, pattern, ...)
end

local oldMatch = string.match
string.match = function(str, pattern)
    if type(str) == "string" and type(pattern) == "string" then
        if str:match("VOLTHUB") then
            for _, key in ipairs(allKeys) do
                local res = key:match(pattern)
                if res then return res end
            end
            return oldMatch(str, pattern)
        end
        if str == targetNick then
            return targetNick:match(pattern) or oldMatch(str, pattern)
        end
    end
    return oldMatch(str, pattern)
end

local oldGsub = string.gsub
string.gsub = function(str, pattern, repl, ...)
    if type(str) == "string" and type(pattern) == "string" then
        if str:match("VOLTHUB") then
            return allKeys[1], 1
        end
        if str == targetNick then
            return targetNick, 1
        end
    end
    return oldGsub(str, pattern, repl, ...)
end

-- ===== 6. ПЕРЕХВАТ pcall =====
local oldPcall = pcall
pcall = function(func, ...)
    local args = {...}
    for i, v in pairs(args) do
        if type(v) == "string" then
            if v:match("VOLTHUB") or v:match("volthub") then
                args[i] = allKeys[1]
            end
            if #v >= 3 and #v <= 20 and not v:match("%W") and not v:match("VOLTHUB") then
                args[i] = targetNick
            end
        end
    end
    return oldPcall(func, unpack(args))
end

-- ===== 7. ПЕРЕХВАТ ТАБЛИЦ =====
-- Если скрипт хранит ключи в таблице
local oldNewIndex = nil
if mt then
    oldNewIndex = mt.__newindex
    setreadonly(mt, false)
    mt.__newindex = newcclosure(function(self, key, value)
        if key == "Name" and self == p then
            return
        end
        if type(key) == "string" and key:match("Key") and type(value) == "string" then
            if value:match("VOLTHUB") then
                return
            end
        end
        if oldNewIndex then
            return oldNewIndex(self, key, value)
        end
    end)
    setreadonly(mt, true)
end

-- ===== 8. ПЕРЕХВАТ СРАВНЕНИЙ =====
local oldEq = nil
if mt then
    oldEq = mt.__eq
    setreadonly(mt, false)
    mt.__eq = newcclosure(function(a, b)
        if type(a) == "string" and type(b) == "string" then
            if a:match("VOLTHUB") or b:match("VOLTHUB") then
                return true
            end
            if a == targetNick or b == targetNick then
                return true
            end
        end
        if oldEq then
            return oldEq(a, b)
        end
        return false
    end)
    setreadonly(mt, true)
end

s.Text = "✅ Bypass Complete!"
task.wait(0.5)

-- ===== 9. ЗАГРУЗКА ВАШЕГО СКРИПТА =====
-- ВСТАВЬТЕ ВЕСЬ ТЕКСТ ИЗ ВАШЕГО ФАЙЛА МЕЖДУ [[ И ]] НИЖЕ:
loadstring([[
-- СЮДА ВСТАВЬТЕ ВЕСЬ ТЕКСТ ИЗ ВАШЕГО ФАЙЛА
print("✅ Скрипт запущен!")
print("👤 Ник: " .. tostring(_G.Username or game.Players.LocalPlayer.Name))
print("🔑 Ключей доступно: " .. #_G.ValidKeys)
]])()

task.wait(2)
g:Destroy()

print("[LOVE BDEV] ❤ Активен!")
print("[LOVE BDEV] 👤 Ник: " .. targetNick)
print("[LOVE BDEV] 🔑 Ключей: " .. #allKeys)
