--/ Dependencies
local Prim = Prim
if not Prim then
	Prim = loadstring(game:HttpGet("https://github.com/cheatmine/lpi-prim/raw/main/API.lua"))()
end

if Prim.GetF3X().Handle then
	Prim.DestroyF3XHandle()
end

--/ Limb controllers
local character = game:GetService("Players").LocalPlayer.Character
character.Humanoid.RequiresNeck = false
local fakecharacter = Instance.new("Model", workspace)
fakecharacter.Name = "LimbHolder"
character.Humanoid:Clone().Parent = fakecharacter
if character:FindFirstChild("Shirt") then character.Shirt:Clone().Parent = fakecharacter end
if character:FindFirstChild("Pants") then character.Pants:Clone().Parent = fakecharacter end

for i, v in character:GetChildren() do
	if v:IsA("BaseScript") then
		v.Enabled = false
	end
end

local proto = Prim.CreatePart(CFrame.new(0/0, 0/0, 0/0), 1)
local limbs = Prim.CloneParts(table.create(5, proto))
limbs = {
	["Right Arm"] = limbs[1],
	["Right Leg"] = limbs[2],
	["Left Arm"] = limbs[3],
	["Left Leg"] = limbs[4],
	["Torso"] = limbs[5]
}
-- Freeze to prevent real limbs desyncing from fake
character.Humanoid.PlatformStand = true
for i, v in limbs do
	character[i].Anchored = true
	character[i].AssemblyLinearVelocity = Vector3.zero
	character[i].AssemblyAngularVelocity = Vector3.zero
end
task.wait(0.1)
for i, v in limbs do
	local real = character[i]
	local fake = Instance.fromExisting(real)
	fake.Parent = character
	fake.Name = "fake:".. character[i].Name
	fake.Transparency = 1
	real.CanCollide = false
end
for i, v in limbs do
	Prim.QueuePartChangeAsync(v, {
		CanCollide = false,
		CanTouch = false,
		Anchored = true,
		Transparency = 1,
		Size = Vector3.one * 0.001,
		CFrame = character[i].CFrame
	})
end
Prim.WaitForQueueFinish()

-- Use our own limbs
for i, v in limbs do
	Prim.Weld(character[i], v)
end

local w
w = character.HumanoidRootPart.RootJoint:Clone()
w.Part0 = character.HumanoidRootPart
w.Part1 = character["fake:".. w.Part1.Name]
w.Name = "FakeRootJoint"
w.Parent = character.HumanoidRootPart
w = character.Torso["Left Hip"]:Clone()
w.Part0 = character["fake:Torso"]
w.Part1 = character["fake:".. w.Part1.Name]
w.Name = w.Name
w.Parent = character["fake:Torso"]
w = character.Torso["Right Hip"]:Clone()
w.Part0 = character["fake:Torso"]
w.Part1 = character["fake:".. w.Part1.Name]
w.Name = w.Name
w.Parent = character["fake:Torso"]
w = character.Torso["Left Shoulder"]:Clone()
w.Part0 = character["fake:Torso"]
w.Part1 = character["fake:".. w.Part1.Name]
w.Name = w.Name
w.Parent = character["fake:Torso"]
w = character.Torso["Right Shoulder"]:Clone()
w.Part0 = character["fake:Torso"]
w.Part1 = character["fake:".. w.Part1.Name]
w.Name = w.Name
w.Parent = character["fake:Torso"]
w = character.Torso.Neck:Clone()

-- Destroy default welds
Prim.DestroyInstances({
	character.HumanoidRootPart.RootJoint, -- make humanoidrootpart independent
	character.Torso["Left Hip"],
	character.Torso["Right Hip"],
	character.Torso["Left Shoulder"],
	character.Torso["Right Shoulder"]
})
-- Safe to unfreeze now
character.Humanoid.PlatformStand = false
for i, v in limbs do
	local real = character[i]
	local fake = character["fake:"..i]
	real.Anchored = false
	real.CanCollide = false
	real.Parent = fakecharacter
	fake.Name = real.Name
	fake.CanCollide = false
	fake.Anchored = false
end
w.Parent = character.Torso

local connection
local function finish()
	connection:Disconnect()
	local t = {proto}
	for i, v in limbs do
		table.insert(t, v)
		table.insert(t, fakecharacter[i])
	end
	Prim.DestroyInstances(t)
	fakecharacter:Destroy()
end

connection = game:GetService("RunService").Heartbeat:Connect(function()
	if not character:FindFirstChild("HumanoidRootPart") then
		finish()
		return
	end
	for i, v in limbs do
		fakecharacter[i].CanCollide = false
		character[i].CanCollide = i == "Torso"
		Prim.QueuePartChangeAsync(v, {
			CFrame = character[i].CFrame
		})
	end
end)

character.HumanoidRootPart.Destroying:Connect(finish)
character.Humanoid.Died:Connect(finish)

-- Set back to reality
character.Torso.CanCollide = true
local nh = character.Humanoid:Clone()
character.Humanoid:Destroy()
nh.Parent = character

for i, v in character:GetChildren() do
	if v:IsA("BaseScript") then
		v.Enabled = true
	end
end

-- though character is still original, we need to fire CharacterAdded locally!
game:GetService("Players").LocalPlayer.Character = character
workspace.CurrentCamera.CameraSubject = nh