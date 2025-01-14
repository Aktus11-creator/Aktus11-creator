-- Define the Highlight color
local highlightColor = Color3.fromRGB(255, 255, 0)  -- Yellow highlight

-- Function to add highlight to a player's character
local function addHighlightToPlayer(player)
    local character = player.Character
    if character then
        -- Create a new Highlight object
        local highlight = Instance.new("Highlight")
        highlight.Adornee = character
        highlight.FillColor = highlightColor
        highlight.FillTransparency = 0.5
        highlight.OutlineColor = highlightColor
        highlight.OutlineTransparency = 0.5
        highlight.Parent = character
    end
end

-- Function to remove highlight from a player's character
local function removeHighlightFromPlayer(player)
    local character = player.Character
    if character then
        -- Find and remove any existing Highlight object
        local existingHighlight = character:FindFirstChildOfClass("Highlight")
        if existingHighlight then
            existingHighlight:Destroy()
        end
    end
end

-- When a new player joins, add the highlight
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        addHighlightToPlayer(player)
    end)
end)

-- When a player leaves, remove the highlight
game.Players.PlayerRemoving:Connect(function(player)
    removeHighlightFromPlayer(player)
end)

-- Highlight all players currently in the game
for _, player in ipairs(game.Players:GetPlayers()) do
    if player.Character then
        addHighlightToPlayer(player)
    end
end
