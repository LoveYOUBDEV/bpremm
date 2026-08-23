-- lovebdev.lua
-- Полная версия с GUI-экраном и автоматической подменой

local function lovebdev()
    -- ========== НАСТРОЙКИ ==========
    local targetNick = "Bdev77"
    local targetKey = "VOLTHUB-8Kd2-9Qw7-4Xm1"
    local scriptUrl = "https://raw.githubusercontent.com/Bdev77/Scripts/main/KeyWindow.lua"  -- Ссылка на скрипт
    
    -- ========== СОЗДАНИЕ GUI ЭКРАНА ==========
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LoveBDEV_Gui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("CoreGui")
    
    -- Фоновый Frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
    frame.BackgroundTransparency = 0.1
    frame.Parent = screenGui
    
    -- Градиентный фон
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 10, 50)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10, 20, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 30))
    })
    gradient.Parent = frame
    
    -- Главный текст LOVE YOUBDEV
    local mainLabel = Instance.new("TextLabel")
    mainLabel.Size = UDim2.new(0.8, 0, 0.3, 0)
    mainLabel.Position = UDim2.new(0.1, 0, 0.25, 0)
    mainLabel.BackgroundTransparency = 1
    mainLabel.Text = "❤ LOVE YOUBDEV ❤"
    mainLabel.TextColor3 = Color3.fromRGB(255, 50, 100)
    mainLabel.TextScaled = true
    mainLabel.Font = Enum.Font.GothamBold
    mainLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    mainLabel.TextStrokeTransparency = 0.3
    mainLabel.Parent = frame
    
    -- Анимация пульсации для текста
    local pulse = Instance.new("BoolValue")
    pulse.Name = "Pulse"
    pulse.Parent = mainLabel
    game:GetService("RunService").Heartbeat:Connect(function()
        local size = 1 + math.sin(tick() * 2) * 0.05
        mainLabel.TextScaled = true
        mainLabel.Size = UDim2.new(0.8 * size, 0, 0.3 * size, 0)
    end)
    
    -- Подзаголовок
    local subLabel = Instance.new("TextLabel")
    subLabel.Size = UDim2.new(0.6, 0, 0.1, 0)
    subLabel.Position = UDim2.new(0.2, 0, 0.55, 0)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = "✨ Premium Activated ✨"
    subLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    subLabel.TextScaled = true
    subLabel.Font = Enum.Font.GothamMedium
    subLabel.Parent = frame
    
    -- Статус загрузки
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(0.4, 0, 0.08, 0)
    statusLabel.Position = UDim2.new(0.3, 0, 0.7, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "Loading..."
    statusLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
    statusLabel.TextScaled = true
    statusLabel.Font = Enum.Font.GothamMedium
    statusLabel.Parent = frame
    
    -- Статусная строка
    local progressBarBg = Instance.new("Frame")
    progressBarBg.Size = UDim2.new(0.6, 0, 0.04, 0)
    progressBarBg.Position = UDim2.new(0.2, 0, 0.8, 0)
    progressBarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    progressBarBg.BackgroundTransparency = 0.3
    progressBarBg.BorderSizePixel = 0
    progressBarBg.Parent = frame
    
    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(0, 0, 1, 0)
    progressBar.BackgroundColor3 = Color3.fromRGB(255, 50, 100)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = progressBarBg
    
    -- ========== ОСНОВНАЯ ЛОГИКА ==========
    local function updateStatus(text, progress)
        statusLabel.Text = text
        progressBar.Size = UDim2.new(progress or 0.3, 0, 1, 0)
        task.wait(0.1)
    end
    
    updateStatus("🔐 Подмена ника...", 0.2)
    
    -- 1. Подмена имени игрока
    local player = game:GetService("Players").LocalPlayer
    if player then
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
        pcall(function() player.Name = targetNick end)
    end
    
    updateStatus("📝 Установка ключей...", 0.4)
    
    -- 2. Подмена ключей и переменных
    _G.PlayerName = targetNick
    _G.Username = targetNick
    _G.Premium = true
    _G.Licensed = true
    _G.VIP = true
    _G.Key = targetKey
    _G.VOLTHUB_KEY = targetKey
    
    -- 3. Перехват проверок
    local env = getfenv(0)
    local checkFuncs = {
        "checkUser", "checkPremium", "isPremium",
        "validateKey", "checkKey", "verifyUser",
        "isWhitelisted", "checkLicense", "BdevCheck"
    }
    
    for _, name in ipairs(checkFuncs) do
        if env[name] then
            env[name] = function(...) return true end
        end
    end
    
    updateStatus("⚡ Обход проверок...", 0.6)
    
    -- 4. Дополнительные перехваты
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
    
    updateStatus("📥 Загрузка скрипта...", 0.8)
    
    -- 5. Загрузка основного скрипта
    pcall(function()
        local scriptContent = game:HttpGet(scriptUrl)
        updateStatus("🚀 Запуск...", 1.0)
        task.wait(0.2)
        
        -- Скрываем GUI перед запуском
        screenGui.Enabled = false
        
        -- Запускаем скрипт
        loadstring(scriptContent)()
        
        -- Показываем сообщение об успехе
        task.wait(0.5)
        screenGui.Enabled = true
        statusLabel.Text = "✅ LOVE YOUBDEV ACTIVATED!"
        statusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
        mainLabel.Text = "❤ LOVE YOUBDEV ❤"
        mainLabel.TextColor3 = Color3.fromRGB(255, 50, 100)
        
        task.wait(3)
        screenGui:Destroy()
    end)
    
    print("[LOVE BDEV] ❤ Активен! Ник: " .. targetNick)
end

-- Запускаем
lovebdev()
