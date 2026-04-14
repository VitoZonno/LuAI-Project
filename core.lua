local Core = {}

function Core.Init(LuAIGenerator, Env)
    local player = game.Players.LocalPlayer
    local ui = LuAIGenerator.CreateUI(player.PlayerGui)
    
    local Main = ui.Main
    local TextBox = Main.UserMessage.MessageTextBox
    local SendBtn = Main.UserMessage.ImageButton
    local Scroll = ui.ChatFrame.ScrollingFrame
    
    -- Template
    local AI_Template = Scroll.AIRESPONSE
    local User_Template = Scroll.YOURESPONSE
    AI_Template.Visible = false
    User_Template.Visible = false

    local function AddChat(text, isAI)
        local frame = isAI and AI_Template:Clone() or User_Template:Clone()
        frame.MessageHere.Text = text
        frame.Visible = true
        frame.Parent = Scroll
        Scroll.CanvasPosition = Vector2.new(0, 99999)
    end

    local function Execute(code)
        local func, err = loadstring(code)
        if func then
            task.spawn(func)
        else
            AddChat("Errore: " .. tostring(err), true)
        end
    end

    -- Gestore dei messaggi
    local function OnMessage(msg)
        if msg == "" or msg == "Message Here!" then return end
        AddChat(msg, false)
        TextBox.Text = ""
        task.wait(0.3)

        local cmd = msg:lower()

        -- Logica assistente (Qui puoi espandere all'infinito)
        if cmd:find("save") then
            AddChat("Tentativo di salvataggio istanza in corso...", true)
            Env.GetGlobals().save()
        elseif cmd:find("remote") then
            local list = Env.ScanRemotes()
            AddChat("Ho trovato " .. #list .. " remotes. Controlla la console (F9).", true)
            for _, r in pairs(list) do print("Remote trovato: " .. r) end
        elseif cmd:find("kill") then
            AddChat("Analizzando script di kill-all per questo gioco...", true)
        else
            AddChat("Ricevuto. Sto elaborando il codice per: " .. msg, true)
            -- Esempio: esegue un comando base se non trova match
            Execute("print('LuAI: " .. msg .. "')")
        end
    end

    SendBtn.MouseButton1Click:Connect(function() OnMessage(TextBox.Text) end)
    TextBox.FocusLost:Connect(function(enter) if enter then OnMessage(TextBox.Text) end end)
end

return Core
