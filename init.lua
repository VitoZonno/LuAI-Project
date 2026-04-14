-- LuAI Loader
local Repo = "https://raw.githubusercontent.com/VitoZonno/LuAI-Project/main/"

local function GetFile(name)
    local success, content = pcall(function()
        return game:HttpGet(Repo .. name .. ".lua")
    end)
    if success then return content end
    warn("Errore nel caricamento del file: " .. name)
end

-- Caricamento dei moduli
local UI_Module = loadstring(GetFile("LuAIGenerator"))()
local Env_Module = loadstring(GetFile("Environment"))()
local Core_Module = loadstring(GetFile("Core"))()

-- Inizializzazione
if UI_Module and Env_Module and Core_Module then
    Core_Module.Init(UI_Module, Env_Module)
else
    warn("LuAI: Caricamento fallito. Controlla la connessione o l'URL di GitHub.")
end
