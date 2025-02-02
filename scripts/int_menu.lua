local Prim = loadstring(game:HttpGet("https://github.com/cheatmine/lpi-prim/raw/main/API.lua"))()

local part = Prim.GetF3X().SyncAPI:InvokeServer("CreatePart", "Normal", CFrame.new(-23852, 35, -146))
Prim.GetF3X().SyncAPI:InvokeServer("CreateLights", {{
    Part = part,
    LightType = "PointLight"
}})
Prim.GetF3X().SyncAPI:InvokeServer("SyncLighting", {{
    Part = part,
    LightType = "PointLight",
    Range = 12,
    Brightness = 0.5,
    Color = Color3.fromRGB(255, 0, 0)
}})
Prim.GetF3X().SyncAPI:InvokeServer("CreateMeshes", {{Part = part}})
Prim.GetF3X().SyncAPI:InvokeServer("SyncMesh", {{
    Part = part,
    MeshType = Enum.MeshType.FileMesh,
    MeshId = "rbxassetid://13937987794",
    Scale = Vector3.one * 30
}})
Prim.QueuePartChangeAsync(part, {
    Transparency = 0,
    CanTouch = false,
    CanCollide = false,
    Anchored = true,
    Size = Vector3.one * 0.01,
    Color = Color3.fromRGB(0, 0, 0),
    Locked = true
})

local part1 = Prim.GetF3X().SyncAPI:InvokeServer("CreatePart", "Normal", CFrame.new(-23852, 50, -175))
local part2 = Prim.GetF3X().SyncAPI:InvokeServer("CreatePart", "Normal", CFrame.new(-23824, 50, -146))
local part3 = Prim.GetF3X().SyncAPI:InvokeServer("CreatePart", "Normal", CFrame.new(-23852, 50, -116))
local part4 = Prim.GetF3X().SyncAPI:InvokeServer("CreatePart", "Normal", CFrame.new(-23882, 50, -146))
Prim.QueuePartChangeAsync(part1, {Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(61, 100, 3)})
Prim.QueuePartChangeAsync(part2, {Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(3, 100, 61)})
Prim.QueuePartChangeAsync(part3, {Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(61, 100, 3)})
Prim.QueuePartChangeAsync(part4, {Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(3, 100, 61)})

game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-23852, 40, -146))
