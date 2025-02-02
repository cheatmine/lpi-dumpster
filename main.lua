local repo = "https://github.com/cheatmine/lpi-dumpster/raw/main/"

local Dumpster = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TextButton = Instance.new("TextButton")

Dumpster.Name = "Dumpster"
Dumpster.Parent = gethui and gethui() or game:GetService("CoreGui")
Dumpster.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Dumpster
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.500
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Size = UDim2.new(0, 175, 0, 250)
Frame.Active = true
Frame.Selectable = false
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BackgroundTransparency = 0.500
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(1, 0, 0, 30)
TextLabel.ZIndex = 0
TextLabel.Font = Enum.Font.Michroma
TextLabel.Text = "LPI-Dumpster"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 24.000

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0, 0, 0, 30)
ScrollingFrame.Size = UDim2.new(1, 0, 1, -30)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 3)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BackgroundTransparency = 0.700
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(1, 0, 0, 30)
TextButton.Visible = false
TextButton.Font = Enum.Font.Michroma
TextButton.Text = "Script Name"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

local function addScript(scriptname)
	local button = TextButton:Clone()
	button.Text = scriptname
	button.Visible = true
	button.Parent = ScrollingFrame
	button.MouseButton1Down:Connect(function()
		loadstring(game:HttpGet(repo.."scripts/"..scriptname))()
	end)
end

local scripts = game:HttpGet(repo.."scripts/_index"):split("\n")
for _, name in scripts do
	addScript(name)
end
