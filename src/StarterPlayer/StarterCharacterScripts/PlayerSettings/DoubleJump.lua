local Player =  game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local Char = Player.Character or Player.CharacterAdded:Wait()
local hum = Char:WaitForChild("Humanoid")
local JumpPlayer = hum.JumpPower


local SettingsTableJumper = {
    ExtraJumps = 3, -- max jumper
    --BlackListy = {}
}

local Jump = {}

local Jumper = 0 

local function JumperPliece()
    if hum.FloorMaterial == Enum.Material.Air then
        if Jumper >= SettingsTableJumper.ExtraJumps then
            return 
        end
		Jumper += 1

        hum:ChangeState(Enum.HumanoidStateType.Jumping)

        if Jumper == SettingsTableJumper.ExtraJumps then
            print("Max Jumper")
        end

    end

end

hum.StateChanged:Connect(function(old, new)
    if new == Enum.HumanoidStateType.Landed then
        Jumper = 0
    end
end)

UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.Space then -- Maybe error
        JumperPliece()
    end
end)


-- Modile version
local JumpButton 

if UIS.TouchEnabled then
    pcall(function()
        JumpButton = Player:WaitForChild("PlayerGui"):WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton")
    end)
end

if JumpButton ~= nil then
    JumpButton.MouseButton1Down:Connect(JumpPlayer)
end

return Jump