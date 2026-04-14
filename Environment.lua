local Environment = {}

-- Funzioni exploit globali
function Environment.GetGlobals()
    return {
        save = saveinstance or syn_saveinstance or function() warn("SaveInstance non supportato") end,
        request = http_request or request or syn.request or function() warn("HTTP Request non supportata") end,
        getgenv = getgenv
    }
end

-- Scanner per il mondo di gioco
function Environment.ScanRemotes()
    local remotes = {}
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            table.insert(remotes, v:GetFullName())
        end
    end
    return remotes
end

return Environment
