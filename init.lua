--[[
██╗     ██╗   ██╗ █████╗ ██╗
██║     ██║   ██║██╔══██╗██║
██║     ██║   ██║███████║██║
██║     ██║   ██║██╔══██║██║
███████╗╚██████╔╝██║  ██║██║
╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝
                🚀 LuAI ASSISTANT - LOADER 🚀
----------------------------------------------------------------------------
]]

if not game:IsLoaded() then game.Loaded:Wait() end

-- [ CONFIGURAZIONE REPO ]
local RepoURL = "https://raw.githubusercontent.com/VitoZonno/LuAI-Project/main/"

-- Funzione di download sicura
local function GetFile(name)
    local success, content = pcall(function()
        -- Il parametro ?v= forza l'aggiornamento (niente cache vecchia)
        return game:HttpGet(RepoURL .. name .. ".lua?v=" .. tostring(math.random(1, 100000)), true)
    end)
    if success and content ~= "" and not string.find(content, "404") then
        return content
    end
    return nil
end

-- [ NOTIFICA ]
local function notify(title, text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
    end)
end

-- [ LOGICA DI CARICAMENTO ]
task.spawn(function()
    print("[LuAI] Connessione a GitHub: " .. RepoURL)
    
    -- Scaricamento sorgenti
    local UI_Src = GetFile("LuAIGenerator")
    local Env_Src = GetFile("Environment")
    local Core_Src = GetFile("Core")

    -- Verifica se i file esistono
    if not UI_Src then warn("[LuAI Error] File LuAIGenerator.lua mancante su GitHub!") return end
    if not Env_Src then warn("[LuAI Error] File Environment.lua mancante su GitHub!") return end
    if not Core_Src then warn("[LuAI Error] File Core.lua mancante su GitHub!") return end

    -- Compilazione ed Esecuzione Moduli
    local LuAIGenerator = loadstring(UI_Src)()
    local Environment = loadstring(Env_Src)()
    local Core = loadstring(Core_Src)()

    -- CONTROLLO DEI RETURN (Se questi falliscono, hai dimenticato il "return" nel file)
    if type(LuAIGenerator) ~= "table" then 
        warn("[LuAI] ERRORE: LuAIGenerator non ritorna una tabella. Aggiungi 'return LuAIGenerator' a fine file.") 
        return 
    end
    if type(Core) ~= "table" then 
        warn("[LuAI] ERRORE: Core non ritorna una tabella. Aggiungi 'return Core' a fine file.") 
        return 
    end

    -- AVVIO FINALE
    local success, err = pcall(function()
        Core.Init(LuAIGenerator, Environment)
    end)

    if success then
        notify("LuAI Caricato", "Sistema iniettato con successo!")
        print("[LuAI] Framework pronto.")
    else
        warn("[LuAI Error] Fallimento durante Init: " .. tostring(err))
        notify("LuAI Errore", "Controlla la console F9")
    end
end)
