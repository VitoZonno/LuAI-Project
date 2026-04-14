--[[
██╗     ██╗   ██╗ █████╗ ██╗
██║     ██║   ██║██╔══██╗██║
██║     ██║   ██║███████║██║
██║     ██║   ██║██╔══██║██║
███████╗╚██████╔╝██║  ██║██║
╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝
                🚀 LuAI ASSISTANT - LOADER 🚀
----------------------------------------------------------------------------
  REPOSITORY: https://github.com/VitoZonno/LuAI-Project
----------------------------------------------------------------------------
]]

if not game:IsLoaded() then game.Loaded:Wait() end

-- [ CONFIGURAZIONE ]
local RepoURL = "https://raw.githubusercontent.com/VitoZonno/LuAI-Project/main/"

-- Funzione per scaricare i file con bypass della cache
local function GetFile(name)
    local success, content = pcall(function()
        -- Il parametro ?v= forza GitHub a darti l'ultima versione caricata
        return game:HttpGet(RepoURL .. name .. ".lua?v=" .. tostring(math.random(1, 100000)), true)
    end)
    if success and content ~= "" and not string.find(content, "404: Not Found") then
        return content
    end
    return nil
end

-- [ NOTIFICHE ]
local function notify(title, text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
    end)
end

-- [ MAIN LOADER ]
task.spawn(function()
    print("[LuAI] Inizializzazione in corso...")
    notify("LuAI Assistant", "Connessione ai server GitHub...")

    -- 1. Caricamento UI
    local UISource = GetFile("LuAIGenerator")
    if not UISource then warn("[LuAI Error] Fallito scaricamento LuAIGenerator.lua") return end
    local LuAIGenerator = loadstring(UISource)()
    if type(LuAIGenerator) ~= "table" then 
        warn("[LuAI Error] Il modulo UI non ha restituito una tabella! Metti 'return LuAIGenerator' alla fine del file.")
        return 
    end

    -- 2. Caricamento Environment (Exploit Lib)
    local EnvSource = GetFile("Environment")
    if not EnvSource then warn("[LuAI Error] Fallito scaricamento Environment.lua") return end
    local Environment = loadstring(EnvSource)()
    if type(Environment) ~= "table" then Environment = {} end

    -- 3. Caricamento Core (Logica)
    local CoreSource = GetFile("Core")
    if not CoreSource then warn("[LuAI Error] Fallito scaricamento Core.lua") return end
    local Core = loadstring(CoreSource)()
    if type(Core) ~= "table" then 
        warn("[LuAI Error] Il modulo Core non ha restituito una tabella! Metti 'return Core' alla fine del file.")
        return 
    end

    -- 4. Esecuzione Finale
    print("[LuAI] Moduli verificati. Iniezione interfaccia...")
    
    local success, err = pcall(function()
        Core.Init(LuAIGenerator, Environment)
    end)

    if success then
        notify("LuAI Injected", "Sistema pronto! Usa l'interfaccia a schermo.")
        print("[LuAI] Iniezione completata con successo.")
    else
        warn("[LuAI Error] Errore critico durante Core.Init: " .. tostring(err))
        notify("LuAI Error", "Errore durante l'inizializzazione dei componenti.")
    end
end)
