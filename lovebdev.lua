-- lovebdev.lua (ДЛЯ ТЕЛЕФОНА - ВСЕ В ОКНЕ)

local targetNick = "Bdev77"
local targetKey = "VOLTHUB-8Kd2-9Qw7-4Xm1"
local targetPassword = "loveyouuu"

-- ===== СОЗДАЁМ БОЛЬШОЕ ОКНО =====
local g = Instance.new("ScreenGui")
g.Name = "LoveBDEV"
g.ResetOnSpawn = false
g.Parent = game:GetService("CoreGui")

local f = Instance.new("Frame")
f.Size = UDim2.new(0.9, 0, 0.7, 0)
f.Position = UDim2.new(0.05, 0, 0.15, 0)
f.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
f.BackgroundTransparency = 0.05
f.BorderSizePixel = 0
f.Parent = g

-- Градиент
local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 10, 80)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 5, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 30))
})
grad.Parent = f

-- ЗАГОЛОВОК
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.15, 0)
title.Position = UDim2.new(0, 0, 0.02, 0)
title.BackgroundTransparency = 1
title.Text = "❤ LOVE YOUBDEV ❤"
title.TextColor3 = Color3.fromRGB(255, 50, 100)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
title.TextStrokeTransparency = 0.3
title.Parent = f

-- СТАТУС (крупный)
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0.12, 0)
status.Position = UDim2.new(0, 0, 0.18, 0)
status.BackgroundTransparency = 1
status.Text = "🔄 ЗАПУСК..."
status.TextColor3 = Color3.fromRGB(255, 255, 100)
status.TextScaled = true
status.Font = Enum.Font.GothamBold
status.Parent = f

-- ЛОГ 1
local log1 = Instance.new("TextLabel")
log1.Size = UDim2.new(1, 0, 0.08, 0)
log1.Position = UDim2.new(0, 0, 0.31, 0)
log1.BackgroundTransparency = 1
log1.Text = "⏳ Ожидание..."
log1.TextColor3 = Color3.fromRGB(200, 200, 255)
log1.TextScaled = true
log1.Font = Enum.Font.GothamMedium
log1.Parent = f

-- ЛОГ 2
local log2 = Instance.new("TextLabel")
log2.Size = UDim2.new(1, 0, 0.08, 0)
log2.Position = UDim2.new(0, 0, 0.40, 0)
log2.BackgroundTransparency = 1
log2.Text = ""
log2.TextColor3 = Color3.fromRGB(200, 200, 255)
log2.TextScaled = true
log2.Font = Enum.Font.GothamMedium
log2.Parent = f

-- ЛОГ 3
local log3 = Instance.new("TextLabel")
log3.Size = UDim2.new(1, 0, 0.08, 0)
log3.Position = UDim2.new(0, 0, 0.49, 0)
log3.BackgroundTransparency = 1
log3.Text = ""
log3.TextColor3 = Color3.fromRGB(200, 200, 255)
log3.TextScaled = true
log3.Font = Enum.Font.GothamMedium
log3.Parent = f

-- ЛОГ 4
local log4 = Instance.new("TextLabel")
log4.Size = UDim2.new(1, 0, 0.08, 0)
log4.Position = UDim2.new(0, 0, 0.58, 0)
log4.BackgroundTransparency = 1
log4.Text = ""
log4.TextColor3 = Color3.fromRGB(200, 200, 255)
log4.TextScaled = true
log4.Font = Enum.Font.GothamMedium
log4.Parent = f

-- ЛОГ 5
local log5 = Instance.new("TextLabel")
log5.Size = UDim2.new(1, 0, 0.08, 0)
log5.Position = UDim2.new(0, 0, 0.67, 0)
log5.BackgroundTransparency = 1
log5.Text = ""
log5.TextColor3 = Color3.fromRGB(200, 200, 255)
log5.TextScaled = true
log5.Font = Enum.Font.GothamMedium
log5.Parent = f

-- ФИНАЛЬНЫЙ СТАТУС
local finalStatus = Instance.new("TextLabel")
finalStatus.Size = UDim2.new(1, 0, 0.1, 0)
finalStatus.Position = UDim2.new(0, 0, 0.78, 0)
finalStatus.BackgroundTransparency = 1
finalStatus.Text = ""
finalStatus.TextColor3 = Color3.fromRGB(100, 255, 100)
finalStatus.TextScaled = true
finalStatus.Font = Enum.Font.GothamBold
finalStatus.Parent = f

-- Функция обновления
local function update(text, color)
    status.Text = text
    if color then
        status.TextColor3 = color
    end
    task.wait(0.15)
end

local function addLog(text, color)
    log1.Text = log2.Text
    log2.Text = log3.Text
    log3.Text = log4.Text
    log4.Text = log5.Text
    log5.Text = text
    if color then
        log5.TextColor3 = color
    end
    task.wait(0.15)
end

-- ===== НАЧАЛО =====
update("🔄 ЗАПУСК...", Color3.fromRGB(255, 255, 100))
addLog("⏳ Инициализация...", Color3.fromRGB(200, 200, 255))
task.wait(0.5)

-- ===== 1. ПОДМЕНА НИКА =====
update("👤 ПОДМЕНА НИКА", Color3.fromRGB(255, 200, 100))
addLog("🎯 Ник: " .. targetNick, Color3.fromRGB(255, 200, 100))

local p = game:GetService("Players").LocalPlayer
addLog("📝 Старый ник: " .. p.Name, Color3.fromRGB(200, 200, 255))

-- Метатаблица
local mt = getrawmetatable(game)
if mt then
    addLog("🔧 Модификация метатаблицы...", Color3.fromRGB(200, 200, 255))
    local oi = mt.__index
    setreadonly(mt, false)
    mt.__index = newcclosure(function(self, key)
        if key == "Name" and self == p then
            return targetNick
        end
        return oi(self, key)
    end)
    setreadonly(mt, true)
    addLog("✅ Метатаблица изменена", Color3.fromRGB(100, 255, 100))
end

pcall(function()
    p.Name = targetNick
    addLog("✅ Ник изменён на: " .. targetNick, Color3.fromRGB(100, 255, 100))
end)

task.wait(0.3)

-- ===== 2. ПОДМЕНА ПАРОЛЯ =====
update("🔑 ПОДМЕНА ПАРОЛЯ", Color3.fromRGB(255, 200, 100))
addLog("🎯 Пароль: " .. targetPassword, Color3.fromRGB(255, 200, 100))

_G.Password = targetPassword
_G.Pass = targetPassword
_G.Pwd = targetPassword
_G.UserPassword = targetPassword
_G.LoginPassword = targetPassword
_G.AuthPassword = targetPassword

addLog("✅ Пароль установлен", Color3.fromRGB(100, 255, 100))
task.wait(0.3)

-- ===== 3. УСТАНОВКА КЛЮЧЕЙ =====
update("🔐 УСТАНОВКА КЛЮЧЕЙ", Color3.fromRGB(255, 200, 100))
addLog("🎯 Ключ: " .. targetKey, Color3.fromRGB(255, 200, 100))

_G.Premium = true
_G.Licensed = true
_G.VIP = true
_G.BdevPremium = true
_G.BdevVIP = true
_G.Whitelisted = true
_G.Verified = true

_G.Key = targetKey
_G.VOLTHUB_KEY = targetKey
_G.licenseKey = targetKey
_G.ActivationKey = targetKey
_G.LicenseKey = targetKey

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

addLog("✅ Ключи установлены", Color3.fromRGB(100, 255, 100))
task.wait(0.3)

-- ===== 4. ОБХОД ПРОВЕРОК =====
update("🛡️ ОБХОД ПРОВЕРОК", Color3.fromRGB(255, 200, 100))
addLog("🔍 Поиск функций...", Color3.fromRGB(200, 200, 255))

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
        env[name] = function(...) return true end
        hooked = hooked + 1
    end
    if _G[name] then
        _G[name] = function(...) return true end
    end
end

addLog("✅ Перехвачено: " .. hooked .. " функций", Color3.fromRGB(100, 255, 100))
task.wait(0.3)

-- ===== 5. ПЕРЕХВАТ СТРОК =====
update("🔧 ПЕРЕХВАТ СТРОК", Color3.fromRGB(255, 200, 100))
addLog("🔧 Перехват string.find...", Color3.fromRGB(200, 200, 255))

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
    end
    return oldFind(str, pattern, ...)
end

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

addLog("✅ Перехват строк установлен", Color3.fromRGB(100, 255, 100))
task.wait(0.3)

-- ===== 6. ПЕРЕХВАТ pcall =====
update("🔄 ПЕРЕХВАТ pcall", Color3.fromRGB(255, 200, 100))
addLog("🔧 Перехват pcall...", Color3.fromRGB(200, 200, 255))

local oldPcall = pcall
pcall = function(func, ...)
    local args = {...}
    for i, v in pairs(args) do
        if type(v) == "string" then
            if v:match("VOLTHUB") then
                args[i] = targetKey
            end
            if v == targetPassword or v:match("password") then
                args[i] = targetPassword
            end
            if #v >= 3 and #v <= 20 and not v:match("%W") and not v:match("VOLTHUB") then
                args[i] = targetNick
            end
        end
    end
    return oldPcall(func, unpack(args))
end

addLog("✅ pcall перехвачен", Color3.fromRGB(100, 255, 100))
task.wait(0.3)

-- ===== ФИНАЛ =====
update("✅ ГОТОВО!", Color3.fromRGB(100, 255, 100))
addLog("❤ LOVE YOUBDEV АКТИВИРОВАН", Color3.fromRGB(255, 50, 100))
addLog("👤 Ник: " .. targetNick, Color3.fromRGB(200, 200, 255))
addLog("🔑 Ключ: " .. targetKey, Color3.fromRGB(200, 200, 255))
addLog("🔐 Пароль: " .. targetPassword, Color3.fromRGB(200, 200, 255))

finalStatus.Text = "❤ LOVE YOUBDEV ❤"
finalStatus.TextColor3 = Color3.fromRGB(255, 50, 100)

print("❤ LOVE YOUBDEV АКТИВИРОВАН!")
print("👤 Ник: " .. targetNick)
print("🔑 Ключ: " .. targetKey)
print("🔐 Пароль: " .. targetPassword)

-- ===== ЗАКРЫВАЕМ ОКНО =====
task.wait(3)
g:Destroy()

-- ===== ЗАГРУЗКА ВАШЕГО СКРИПТА =====
-- ВСТАВЬТЕ ВЕСЬ ВАШ СКРИПТ МЕЖДУ [[ И ]] НИЖЕ:
loadstring([[
-- СЮДА ВСТАВЬТЕ ВЕСЬ ТЕКСТ ИЗ ВАШЕГО ФАЙЛА
print("✅ Ваш скрипт запущен!")
]])()
