-- lovebdev.lua - ИСПРАВЛЕННАЯ ВЕРСИЯ (без ошибок)
local targetNick = "Bdev77"
local targetKey = "VOLTHUB-8Kd2-9Qw7-4Xm1"

print("❤ LOVE YOUBDEV")
print("👤 Ник: " .. targetNick)
print("🔑 Ключ: " .. targetKey)

local p = game:GetService("Players").LocalPlayer
local mt = getrawmetatable(game)
if mt then
    local oldIndex = mt.__index
    setreadonly(mt, false)
    mt.__index = function(self, key)
        if key == "Name" and self == p then
            return targetNick
        end
        return oldIndex(self, key)
    end
    setreadonly(mt, true)
end

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

local function hookModule(module)
    if type(module) ~= "table" then return end
    for key, val in pairs(module) do
        if type(key) == "string" and type(val) == "function" then
            local lowerKey = key:lower()
            if lowerKey:match("check") or lowerKey:match("verify") or lowerKey:match("validate") or lowerKey:match("premium") then
                local old = val
                module[key] = function(...)
                    local args = {...}
                    for i, v in pairs(args) do
                        if type(v) == "string" then
                            if v:match("VOLTHUB") then
                                args[i] = targetKey
                            elseif #v >= 3 and #v <= 20 and not v:match("%W") then
                                args[i] = targetNick
                            end
                        end
                    end
                    return old(unpack(args))
                end
            end
        end
    end
end

-- Проверяем все глобальные объекты
for _, module in pairs(getgc(true)) do
    hookModule(module)
end

-- Перехватываем require
local oldRequire = require
require = function(path)
    local module = oldRequire(path)
    hookModule(module)
    return module
end

-- Перехватываем все функции проверки в глобальной таблице
for key, val in pairs(_G) do
    if type(key) == "string" and type(val) == "function" then
        local lowerKey = key:lower()
        if lowerKey:match("check") or lowerKey:match("verify") or lowerKey:match("validate") or lowerKey:match("premium") then
            local old = val
            _G[key] = function(...)
                local args = {...}
                for i, v in pairs(args) do
                    if type(v) == "string" then
                        if v:match("VOLTHUB") then
                            args[i] = targetKey
                        elseif #v >= 3 and #v <= 20 and not v:match("%W") then
                            args[i] = targetNick
                        end
                    end
                end
                return old(unpack(args))
            end
        end
    end
end

print("✅ ГОТОВО! Запускаю скрипт...")

-- ЗАПУСК ТВОЕГО СКРИПТА
loadstring([[
    print("✅ СКРИПТ ЗАПУЩЕН!")
]])()
