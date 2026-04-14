--[[
██╗     ██╗   ██╗ █████╗ ██╗
██║     ██║   ██║██╔══██╗██║
██║     ██║   ██║███████║██║
██║     ██║   ██║██╔══██║██║
███████╗╚██████╔╝██║  ██║██║
╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝

                🚀 LuAI ASSISTANT — THE EXPLOIT COPILOT 🚀
----------------------------------------------------------------------------
  REPO: https://github.com/VitoZonno/LuAI-Project
  STATUS: Beta v1.0
----------------------------------------------------------------------------
]]

if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

-- [ CONFIGURAZIONE REPO ]
local RepoURL = "https://raw.githubusercontent.com/VitoZonno/LuAI-Project/main/"
local CheatEngineMode = false

-- [ COMPATIBILITÀ EXECUTOR ]
if (not getgenv) or (getgenv and type(getgenv) ~= "function") then
	CheatEngineMode = true
end

if getgenv and not getgenv().shared then
	getgenv().shared = {}
end

local function checkExecutor()
    if identifyexecutor ~= nil then
        local res = tostring(identifyexecutor()):lower()
        local blacklist = {'solara', 'xeno', 'cryptic', 'ember'}
        for _, v in pairs(blacklist) do
            if string.find(res, v) then 
                CheatEngineMode = true 
            end
        end
    end
end
pcall(checkExecutor)
shared.CheatEngineMode = CheatEngineMode

-- [ FUNZIONI DI SUPPORTO ]
local function notify(title, text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
    end)
end

local function GetFile(file)
    local success, content = pcall(function()
        -- Aggiungiamo un parametro random per evitare la cache di GitHub
        return game:HttpGet(RepoURL .. file .. ".lua?nocache=" .. tostring(math.random(1,100000)), true)
    end)
    if success and content and content ~= "" then
        return content
    end
    return nil
end

-- [ AVVIO DEL FRAMEWORK ]
task.spawn(function()
    print("[LuAI] Initializing from VitoZonno/LuAI-Project...")
    
    -- Notifica iniziale
    notify("LuAI Loading", "Scaricamento moduli core in corso...")
    
    -- Scaricamento Moduli
    local UI_Source = GetFile("LuAIGenerator")
    local Env_Source = GetFile("Environment")
    local Core_Source = GetFile("Core")
    
    -- Verifica integrità
    if UI_Source and Env_Source and Core_Source then
        -- Caricamento dinamico
        local LuAIGenerator = loadstring(UI_Source)()
        local Environment = loadstring(Env_Source)()
        local Core = loadstring(Core_Source)()
        
        -- Controllo che i moduli ritornino correttamente le tabelle
        if type(LuAIGenerator) == "table" and type(Core) == "table" then
            task.wait(0.5)
            Core.Init(LuAIGenerator, Environment)
            
            notify("LuAI Ready", "Benvenuto, " .. game.Players.LocalPlayer.Name .. "!")
            print("[LuAI] Sistema caricato con successo.")
        else
            warn("[LuAI] Errore: Uno dei moduli non ha restituito una tabella. Controlla i 'return' nei file.")
            notify("LuAI Error", "Errore strutturale nei file Lua.")
        end
    else
        warn("[LuAI] Errore di connessione GitHub.")
        notify("LuAI Error", "Impossibile scaricare i file. Controlla la tua connessione o il link della Repo.")
    end
end)
