-- lovebdev.lua (АВТО-ПОДБОР КЛЮЧА ИЗ СКРИПТА)

print("❤ LOVE YOUBDEV - АВТО-ПОДБОР")

-- ===== 1. ПОДМЕНА НИКА =====
local targetNick = "Bdev77"
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

-- ===== 2. ЗАГРУЖАЕМ СКРИПТ И ИЩЕМ КЛЮЧИ =====
local scriptContent = [[
-- СЮДА ВСТАВЬТЕ ВЕСЬ ТЕКСТ ИЗ ВАШЕГО ФАЙЛА
-- (весь обфусцированный код)
]]

-- Ищем ВСЕ ключи в скрипте (формат VOLTHUB-XXXX-XXXX-XXXX)
local foundKeys = {}
for key in scriptContent:gmatch("VOLTHUB%-%w+%-%w+%-%w+") do
    if not foundKeys[key] then
        table.insert(foundKeys, key)
        foundKeys[key] = true
    end
end

-- Ищем имена пользователей (Bdev77, Golumpio и т.д.)
local foundUsers = {}
for user in scriptContent:gmatch("([%w_]+):VOLTHUB") do
    if not foundUsers[user] then
        table.insert(foundUsers, user)
        foundUsers[user] = true
    end
end

print("🔍 Найдено ключей: " .. #foundKeys)
print("🔍 Найдено пользователей: " .. #foundUsers)

-- ===== 3. УСТАНАВЛИВАЕМ ПЕРВЫЙ НАЙДЕННЫЙ КЛЮЧ =====
local targetKey = foundKeys[1] or "VOLTHUB-8Kd2-9Qw7-4Xm1"
local targetUser = foundUsers[1] or "Bdev77"

print("✅ Используем ключ: " .. targetKey)
print("✅ Используем пользователя: " .. targetUser)

-- ===== 4. ПОДМЕНЯЕМ ВСЁ =====
_G.Premium = true
_G.Licensed = true
_G.VIP = true
_G.BdevPremium = true
_G.Whitelisted = true

_G.Key = targetKey
_G.VOLTHUB_KEY = targetKey
_G.licenseKey = targetKey
_G.ActivationKey = targetKey
_G.Username = targetUser
_G.PlayerName = targetUser
_G.CurrentUser = targetUser

_G.ValidKeys = foundKeys
_G.Keys = foundKeys

-- ===== 5. ПЕРЕХВАТ =====
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

local oldPcall = pcall
pcall = function(func, ...)
    local args = {...}
    for i, v in pairs(args) do
        if type(v) == "string" then
            if v:match("VOLTHUB") then
                args[i] = targetKey
            end
            if #v >= 3 and #v <= 20 and not v:match("%W") and not v:match("VOLTHUB") then
                args[i] = targetUser
            end
        end
    end
    return oldPcall(func, unpack(args))
end

print("✅ ГОТОВО! Запускаем скрипт...")

-- ===== 6. ЗАПУСКАЕМ СКРИПТ =====
loadstring(scriptContent)()
