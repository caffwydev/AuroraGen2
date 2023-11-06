local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Barcos Rápidos xD", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})

_G.Fast = false
_G.Speed = 300
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Main"
})


Tab:AddToggle({
	Name = "Barcos Rápidos",
	Default = false,
	Callback = function(Value)
		_G.Fast = Value
	end    
})


Tab:AddSlider({
	Name = "Velocidade",
	Min = 0,
	Max = 2500,
	Default = 300,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "velocidade",
	Callback = function(Value)
		_G.Speed = Value
	end    
})



task.spawn(function()
        while task.wait() do
            if _G.Fast then
                for _, v in ipairs(game:GetService("Workspace"):FindFirstChild("Boats"):GetChildren()) do
                    task.wait()
                    if v and v:FindFirstChild("VehicleSeat") and (v.VehicleSeat.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
                        v:FindFirstChild("VehicleSeat").MaxSpeed = _G.Speed
                        v:FindFirstChild("VehicleSeat").TurnSpeed = 0.025
                    end
                end
            end
        end
end)
