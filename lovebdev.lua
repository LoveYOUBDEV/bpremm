-- lovebdev.lua - ИСПРАВЛЕННАЯ ВЕРСИЯ
local targetNick = "Bdev77"
local targetKey = "VOLTHUB-8Kd2-9Qw7-4Xm1"

print("❤ LOVE YOUBDEV")
print("👤 Ник: " .. targetNick)
print("🔑 Ключ: " .. targetKey)

-- ===== ПОДМЕНА НИКА (без getrawmetatable) =====
local p = game:GetService("Players").LocalPlayer
local oldName = p.Name

-- Блокируем изменение имени через событие
p.NameDisplayDistance = 0
p:SetAttribute("RealName", targetNick)

-- Перехватываем чтение свойства Name через __index
local mt = getrawmetatable(game) or {}
local oldIndex = mt.__index
setreadonly(mt, false)
mt.__index = newcclosure(function(self, key)
    if key == "Name" and self == p then
        return targetNick
    end
    return oldIndex(self, key)
end)
setreadonly(mt, true)

-- ===== ПОДМЕНА КЛЮЧА =====
_G.Premium = true
_G.Licensed = true
_G.VIP = true
_G.BdevPremium = true
_G.Whitelisted = true

_G.Key = targetKey
_G.VOLTHUB_KEY = targetKey
_G.licenseKey = targetKey
_G.ActivationKey = targetKey

_G.Username = targetNick
_G.PlayerName = targetNick
_G.CurrentUser = targetNick

-- ===== ПЕРЕХВАТ ФУНКЦИЙ (работает для большинства хабов) =====
local function hookFunction(module, funcName)
    if module and module[funcName] then
        local old = module[funcName]
        module[funcName] = function(...)
            local args = {...}
            for i, v in pairs(args) do
                if type(v) == "string" and v:match("VOLTHUB") then
                    args[i] = targetKey
                end
                if type(v) == "string" and not v:match("VOLTHUB") and #v > 2 then
                    args[i] = targetNick
                end
            end
            return old(unpack(args))
        end
    end
end

-- Обходим все загруженные модули
for _, module in pairs(getgc(true)) do
    if type(module) == "table" then
        for key, val in pairs(module) do
            if type(val) == "function" and key:match("check") then
                hookFunction(module, key)
            end
        end
    end
end

-- ===== ПЕРЕХВАТ require =====
local oldRequire = require
require = function(path)
    local module = oldRequire(path)
    if type(module) == "table" then
        for key, val in pairs(module) do
            if type(val) == "function" and key:match("check") then
                hookFunction(module, key)
            end
        end
    end
    return module
end

print("✅ ГОТОВО! Запускаю скрипт...")

-- ===== ЗАПУСК ТВОЕГО СКРИПТА =====
loadstring([[
print("✅ СКРИПТ ЗАПУЩЕН!")
]])()
