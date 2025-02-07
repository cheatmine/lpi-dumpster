-- Dependencies
local md5 = loadstring(game:HttpGet("https://github.com/Egor-Skriptunoff/pure_lua_SHA/raw/master/sha2.lua"))().md5
local Prim = Prim or loadstring(game:HttpGet("https://github.com/cheatmine/lpi-prim/raw/main/API.lua"))()

-- UI
if game:GetService("CoreGui"):FindFirstChild("MV2Chat") then
	game:GetService("CoreGui").MV2Chat:Destroy()
end

local MV2Chat = Instance.new("ScreenGui")
local Chat = Instance.new("Frame")
local UIPadding = Instance.new("UIPadding")
local Messages = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding_2 = Instance.new("UIPadding")
local ChatBox = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local UIPadding_3 = Instance.new("UIPadding")
local ChatMessage = Instance.new("TextLabel")

MV2Chat.Name = "MV2Chat"
MV2Chat.Parent = game:GetService("CoreGui")
MV2Chat.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Chat.Name = "Chat"
Chat.Parent = MV2Chat
Chat.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Chat.BackgroundTransparency = 0.500
Chat.BorderColor3 = Color3.fromRGB(0, 0, 0)
Chat.BorderSizePixel = 0
Chat.Size = UDim2.new(0, 400, 0, 280)
Chat.Position = UDim2.new(0.5, 0, 0.5, 0)
Chat.Selectable = false
Chat.Active = true
Chat.Draggable = true

UIPadding.Parent = Chat
UIPadding.PaddingBottom = UDim.new(0, 5)
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingRight = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)

Messages.Name = "Messages"
Messages.Parent = Chat
Messages.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Messages.BackgroundTransparency = 0.700
Messages.BorderColor3 = Color3.fromRGB(0, 0, 0)
Messages.BorderSizePixel = 0
Messages.Size = UDim2.new(1, 0, 1, -45)

ScrollingFrame.Parent = Messages
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

UIPadding_2.Parent = ScrollingFrame
UIPadding_2.PaddingBottom = UDim.new(0, 5)
UIPadding_2.PaddingLeft = UDim.new(0, 5)
UIPadding_2.PaddingRight = UDim.new(0, 5)
UIPadding_2.PaddingTop = UDim.new(0, 5)

ChatBox.Name = "ChatBox"
ChatBox.Parent = Chat
ChatBox.AnchorPoint = Vector2.new(0, 1)
ChatBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ChatBox.BackgroundTransparency = 0.700
ChatBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatBox.BorderSizePixel = 0
ChatBox.Position = UDim2.new(0, 0, 1, 0)
ChatBox.Size = UDim2.new(1, 0, 0, 40)

TextBox.Parent = ChatBox
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Size = UDim2.new(1, 0, 1, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Tap to chat"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 26.000
TextBox.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_3.Parent = ChatBox
UIPadding_3.PaddingBottom = UDim.new(0, 5)
UIPadding_3.PaddingLeft = UDim.new(0, 5)
UIPadding_3.PaddingRight = UDim.new(0, 5)
UIPadding_3.PaddingTop = UDim.new(0, 5)

ChatMessage.Name = "ChatMessage"
ChatMessage.Parent = Chat
ChatMessage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ChatMessage.BackgroundTransparency = 1.000
ChatMessage.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatMessage.BorderSizePixel = 0
ChatMessage.Size = UDim2.new(1, 0, 0, 20)
ChatMessage.Visible = false
ChatMessage.Font = Enum.Font.SourceSans
ChatMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatMessage.TextSize = 20.000
ChatMessage.TextXAlignment = Enum.TextXAlignment.Left
ChatMessage.RichText = true

local colors = {
	[1] = Color3.new(1, 0.3, 0.3),
	[2] = Color3.new(1, 0.7, 0.3),
	[3] = Color3.new(1, 0.9, 0.3),
	[4] = Color3.new(0.3, 1, 0.3),
	[5] = Color3.new(0.7, 1, 0.3),
	[6] = Color3.new(0.3, 1, 0.8),
	[7] = Color3.new(0.3, 1, 1),
	[8] = Color3.new(0.3, 0.7, 1),
	[9] = Color3.new(0.3, 0.3, 1),
	[10] = Color3.new(0.7, 0.3, 1),
	[11] = Color3.new(0.8, 0.3, 1),
	[12] = Color3.new(1, 0.3, 1),
	[13] = Color3.new(0.8, 0.8, 0.8),
	[14] = Color3.new(0.7, 0.7, 0.7),
	[15] = Color3.new(0.6, 0.6, 0.6),
	[16] = Color3.new(1, 1, 1)
}

local function sanitize(str)
	return str:gsub("&", "&amp;")
		:gsub("\r", "")
		:gsub("\n", "")
		:gsub("<", "&lt;")
		:gsub(">", "&gt;")
		:gsub("\"", "&quot;")
		:gsub("'", "&apos;")
end

local function onMessage(plr, msg)
	local pcolor = colors[tonumber(md5(plr):sub(1, 1), 16) + 1]
	local text = `<font color="#{pcolor:ToHex()}">[{plr}]:</font> {sanitize(msg)}`
	local obj = ChatMessage:Clone()
	obj.Text = text
	obj.Parent = ScrollingFrame
	obj.Visible = true
end

-- Messaging
local function message(msg)
	local part = Prim.CreatePart(CFrame.new(0, 199990, 0), 1)
	Prim.QueuePartChange(part, {
		Name = game.Players.LocalPlayer.Name .. "\1".. msg
	})
	Prim.QueuePartChangeAsync(part, {
		Parent = game.Chat
	})
	task.delay(10, function()
		Prim.DestroyInstance(part)
	end)
end

game.Chat.ChildAdded:Connect(function(c)
	if not c:IsA("BasePart") then return print(c, "not BasePart") end
	local cm = c.Name:split("\1")
	if #cm < 2 then return print(c, "invalid name", #cm) end
	local plr, msg = cm[1], select(2, unpack(cm))
	onMessage(plr, msg)
end)

TextBox.FocusLost:Connect(function(enter)
	if enter then
		message(TextBox.Text)
		TextBox.Text = ""
	end
end)

ScrollingFrame.ChildAdded:Connect(function(child)
	task.wait()
	ScrollingFrame.CanvasPosition = Vector2.new(0, ScrollingFrame.AbsoluteCanvasSize.Y - ScrollingFrame.AbsoluteWindowSize.Y)
end)