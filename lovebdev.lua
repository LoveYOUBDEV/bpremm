-- lovebdev.lua (С ЛОГАМИ И ПАРОЛЕМ loveyouuu)

local targetNick = "Bdev77"
local targetKey = "VOLTHUB-8Kd2-9Qw7-4Xm1"
local targetPassword = "loveyouuu"

print("========================================")
print("❤ LOVE YOUBDEV ❤")
print("========================================")

-- ===== СОЗДАЁМ ОКНО =====
print("[1] Создание GUI окна...")

local g = Instance.new("ScreenGui")
g.Name = "LoveBDEV"
g.ResetOnSpawn = false
g.Parent = game:GetService("CoreGui")

local f = Instance.new("Frame")
f.Size = UDim2.new(0.5, 0, 0.3, 0)
f.Position = UDim2.new(0.25, 0, 0.35, 0)
f.BackgroundColor3 = Color3.fromRGB(15, 15, 40)
f.BackgroundTransparency = 0.05
f.BorderSizePixel = 0
f.Parent = g

-- Градиент
local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 10, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 30))
})
grad.Parent = f

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.35, 0)
title.Position = UDim2.new(0, 0, 0.05, 0)
title.BackgroundTransparency = 1
title.Text = "❤ LOVE YOUBDEV ❤"
title.TextColor3 = Color3.fromRGB(255, 50, 100)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = f

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0.25, 0)
status.Position = UDim2.new(0, 0, 0.4, 0)
status.BackgroundTransparency = 1
status.Text = "🔄 Инициализация..."
status.TextColor3 = Color3.fromRGB(255, 255, 100)
status.TextScaled = true
status.Font = Enum.Font.GothamMedium
status.Parent = f

local logLabel = Instance.new("TextLabel")
logLabel.Size = UDim2.new(1, 0, 0.3, 0)
logLabel.Position = UDim2.new(0, 0, 0.65, 0)
logLabel.BackgroundTransparency = 1
logLabel.Text = "⏳ Ожидание..."
logLabel.TextColor3 = Color3.fromRGB(150, 200, 255)
logLabel.TextScaled = true
logLabel.Font = Enum.Font.GothamMedium
logLabel.Parent = f

-- Функция обновления статуса
local function updateStatus(text, color)
    status.Text = text
    if color then
        status.TextColor3 = color
    end
    print("[LOVE BDEV] " .. text)
end

local function updateLog(text)
    logLabel.Text = text
    print("[LOVE BDEV] LOG: " .. text)
    task.wait(0.3)
end

-- ===== 1. ПОДМЕНА НИКА =====
updateStatus("👤 Подмена ника...", Color3.fromRGB(255, 200, 100))
updateLog("🎯 Целевой ник: " .. targetNick)

local p = game:GetService("Players").LocalPlayer
local oldName = p.Name
updateLog("📝 Текущий ник: " .. oldName)

-- Метатаблица
local mt = getrawmetatable(game)
if mt then
    updateLog("🔧 Найдена метатаблица, модифицируем...")
    local oi = mt.__index
    setreadonly(mt, false)
    mt.__index = newcclosure(function(self, key)
        if key == "Name" and self == p then
            return targetNick
        end
        return oi(self, key)
    end)
    setreadonly(mt, true)
    updateLog("✅ Метатаблица изменена")
end

-- Прямая подмена
pcall(function()
    p.Name = targetNick
    updateLog("✅ Ник изменён на: " .. targetNick)
end)

-- ===== 2. ПОДМЕНА ПАРОЛЯ =====
updateStatus("🔑 Подмена пароля...", Color3.fromRGB(255, 200, 100))
updateLog("🎯 Целевой пароль: " .. targetPassword)

-- Подмена пароля в глобальных переменных
_G.Password = targetPassword
_G.Pass = targetPassword
_G.Pwd = targetPassword
_G.UserPassword = targetPassword
_G.LoginPassword = targetPassword
_G.AuthPassword = targetPassword
_G.KeyPassword = targetPassword

updateLog("✅ Пароль установлен: " .. targetPassword)

-- ===== 3. УСТАНОВКА КЛЮЧЕЙ =====
updateStatus("🔐 Установка ключей...", Color3.fromRGB(255, 200, 100))
updateLog("🎯 Целевой ключ: " .. targetKey)

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

_G.Username = targetNick
_G.PlayerName = targetNick
_G.CurrentUser = targetNick
_G.UserName = targetNick
_G.MyName = targetNick

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

updateLog("✅ Ключи установлены")

-- ===== 4. ПЕРЕХВАТ ПРОВЕРОК =====
updateStatus("🛡️ Обход проверок...", Color3.fromRGB(255, 200, 100))
updateLog("🔍 Поиск функций проверки...")

local env = getfenv(0)
local checks = {
    "checkUser", "checkPremium", "isPremium", "validateKey",
    "checkKey", "verifyUser", "isWhitelisted", "checkLicense",
    "BdevCheck", "VOLTHUB_Check", "getUserStatus",
    "CheckLicense", "ValidateKey", "VerifyUser",
    "IsPremium", "IsWhitelisted", "HasLicense",
    "checkPassword", "validatePassword", "isPasswordCorrect"
}

local hooked = 0
for _, name in ipairs(checks) do
    if env[name] then
        env[name] = function(...) 
            updateLog("🔄 Перехвачена функция: " .. name .. "() -> true")
            return true 
        end
        hooked = hooked + 1
    end
    if _G[name] then
        _G[name] = function(...) return true end
    end
end

updateLog("✅ Перехвачено функций: " .. hooked)

-- ===== 5. ПЕРЕХВАТ СТРОКОВЫХ ФУНКЦИЙ =====
updateLog("🔧 Перехват string функций...")

local oldFind = string.find
string.find = function(str, pattern, ...)
    if type(str) == "string" and type(pattern) == "string" then
        if str:match("VOLTHUB") or pattern:match("VOLTHUB") then
            updateLog("🔄 string.find: найдено VOLTHUB -> true")
            return true, 1
        end
        if str == targetNick or pattern == targetNick then
            updateLog("🔄 string.find: найден ник " .. targetNick .. " -> true")
            return true, 1
        end
        if str == targetPassword or pattern == targetPassword then
            updateLog("🔄 string.find: найден пароль -> true")
            return true, 1
        end
    end
    return oldFind(str, pattern, ...)
end

local oldMatch = string.match
string.match = function(str, pattern)
    if type(str) == "string" and type(pattern) == "string" then
        if str:match("VOLTHUB") then
            updateLog("🔄 string.match: подмена VOLTHUB ключа")
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

-- ===== 6. ПЕРЕХВАТ pcall =====
updateLog("🔧 Перехват pcall...")

local oldPcall = pcall
pcall = function(func, ...)
    local args = {...}
    for i, v in pairs(args) do
        if type(v) == "string" then
            if v:match("VOLTHUB") then
                args[i] = targetKey
                updateLog("🔄 pcall: подменён ключ")
            end
            if v == targetPassword or v:match("password") then
                args[i] = targetPassword
                updateLog("🔄 pcall: подменён пароль")
            end
            if #v >= 3 and #v <= 20 and not v:match("%W") and not v:match("VOLTHUB") then
                args[i] = targetNick
            end
        end
    end
    return oldPcall(func, unpack(args))
end

-- ===== 7. ПЕРЕХВАТ СРАВНЕНИЙ =====
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
            if a == targetPassword or b == targetPassword then
                return true
            end
        end
        if oldEq then
            return oldEq(a, b)
        end
        return false
    end)
    setreadonly(mt, true)
    updateLog("✅ Перехват сравнений установлен")
end

-- ===== ФИНАЛЬНЫЙ СТАТУС =====
updateStatus("✅ ГОТОВО!", Color3.fromRGB(100, 255, 100))
updateLog("🚀 Запуск скрипта...")

print("========================================")
print("❤ LOVE YOUBDEV АКТИВИРОВАН!")
print("👤 Ник: " .. targetNick)
print("🔑 Ключ: " .. targetKey)
print("🔐 Пароль: " .. targetPassword)
print("📊 Перехвачено функций: " .. hooked)
print("========================================")

-- ===== ЗАКРЫВАЕМ ОКНО ЧЕРЕЗ 2 СЕКУНДЫ =====
task.wait(2)
g:Destroy()

-- ===== ЗАГРУЗКА ВАШЕГО СКРИПТА =====
-- ВСТАВЬТЕ ВЕСЬ ВАШ СКРИПТ МЕЖДУ [[ И ]] НИЖЕ:
loadstring([[
-- СЮДА ВСТАВЬТЕ ВЕСЬ ТЕКСТ ИЗ ВАШЕГО ФАЙЛА
print("✅ Ваш скрипт запущен!")
print("👤 Ник: " .. tostring(game.Players.LocalPlayer.Name))
print("🔑 Ключ: " .. tostring(_G.VOLTHUB_KEY or "не найден"))
print("🔐 Пароль: " .. tostring(_G.Password or "не найден"))
]])()
