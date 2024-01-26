local InteractiveFoliage = workspace.GrassMap
local Player = game:GetService('Players').LocalPlayer

local GrassEffect = {}

for _, index in next, InteractiveFoliage:GetChildren()  do
	index.Touched:Connect(function(hit)
		if hit.Parent == Player.Character then
			index.ParticleEmitter.Enabled = true
		end
		
	end)
	
	index.TouchEnded:Connect(function(hit)
		if hit.Parent == Player.Character then
			task.wait(0.5)
			index.ParticleEmitter.Enabled = false
		end
	end)
end

return GrassEffect