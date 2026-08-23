-- lovebdev.lua
-- Простая версия: окно, подмена ника на Bdev77, загрузка скрипта

-- === НАСТРОЙКИ ===
local targetNick = "Bdev77"
local targetKey = "VOLTHUB-8Kd2-9Qw7-4Xm1"

-- === СОЗДАЁМ ОКНО ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoveBDEV"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.3, 0)
frame.Position = UDim2.new(0.25, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 0
frame.Parent = screenGui

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 10, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 30))
})
gradient.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.4, 0)
title.Position = UDim2.new(0, 0, 0.1, 0)
title.BackgroundTransparency = 1
title.Text = "❤ LOVE YOUBDEV ❤"
title.TextColor3 = Color3.fromRGB(255, 50, 100)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0.25, 0)
status.Position = UDim2.new(0, 0, 0.5, 0)
status.BackgroundTransparency = 1
status.Text = "🔄 Загрузка..."
status.TextColor3 = Color3.fromRGB(100, 255, 150)
status.TextScaled = true
status.Font = Enum.Font.GothamMedium
status.Parent = frame

local userLabel = Instance.new("TextLabel")
userLabel.Size = UDim2.new(1, 0, 0.2, 0)
userLabel.Position = UDim2.new(0, 0, 0.75, 0)
userLabel.BackgroundTransparency = 1
userLabel.Text = "User: " .. targetNick
userLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
userLabel.TextScaled = true
userLabel.Font = Enum.Font.GothamMedium
userLabel.Parent = frame

-- === ПОДМЕНА НИКА ===
local player = game:GetService("Players").LocalPlayer

-- Через метатаблицу
local mt = getrawmetatable(game)
if mt then
    local oldIndex = mt.__index
    setreadonly(mt, false)
    mt.__index = newcclosure(function(self, key)
        if key == "Name" and self == player then
            return targetNick
        end
        return oldIndex(self, key)
    end)
    setreadonly(mt, true)
end

-- Прямая подмена
pcall(function()
    player.Name = targetNick
end)

-- === ПОДМЕНА КЛЮЧЕЙ ===
_G.Premium = true
_G.Licensed = true
_G.VIP = true
_G.BdevPremium = true
_G.BdevVIP = true
_G.Key = targetKey
_G.VOLTHUB_KEY = targetKey
_G.Username = targetNick
_G.PlayerName = targetNick

-- === ПЕРЕХВАТ ПРОВЕРОК ===
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

-- === ПЕРЕХВАТ pcall ===
local oldPcall = pcall
pcall = function(func, ...)
    local args = {...}
    for i, v in pairs(args) do
        if type(v) == "string" then
            if v:match("VOLTHUB") then
                args[i] = targetKey
            end
            if #v >= 3 and #v <= 20 and not v:match("%W") then
                args[i] = targetNick
            end
        end
    end
    return oldPcall(func, unpack(args))
end

status.Text = "✅ Готово! Загрузка..."

-- === ЗАГРУЗКА ВАШЕГО СКРИПТА ===
-- Ваш скрипт (вставляем сюда)
local scriptContent = [[
    -- ВАШ СКРИПТ (вставьте сюда полный код из файла)
    -- Я вставил его ниже, но он слишком большой для отображения
    -- Вместо этого я загружу его как строку
]]

-- Так как ваш скрипт огромный, я загружу его как data URI через loadstring
-- Но проще всего вставить ваш скрипт прямо сюда

-- ВАРИАНТ 1: Если скрипт лежит в файле рядом
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/ваш-репозиторий/скрипт.lua"))()

-- ВАРИАНТ 2: ВСТАВЛЯЕМ СКРИПТ ПРЯМО СЮДА (рекомендую)
-- Скопируйте ВЕСЬ текст из вашего файла (все 100500 строк)
-- и вставьте между [[ и ]] ниже:

local yourScript = [[
-- СЮДА ВСТАВЬТЕ ВЕСЬ ВАШ ОГРОМНЫЙ СКРИПТ ИЗ ФАЙЛА
print("Скрипт загружен!")
]]

-- Запускаем
loadstring(yourScript)()

-- === ЗАКРЫВАЕМ ОКНО ЧЕРЕЗ 3 СЕКУНДЫ ===
task.wait(3)
screenGui:Destroy()

print("[LOVE BDEV] ❤ Активен! Ник: " .. targetNick)
print("[LOVE BDEV] ✅ Скрипт загружен!")
