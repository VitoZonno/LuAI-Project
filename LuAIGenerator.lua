local LuAIGenerator = {}

function LuAIGenerator.CreateUI(parent)
	-- ScreenGui: LuAI
	local LuAI = Instance.new("ScreenGui")
	LuAI.Name = "LuAI"
	LuAI.ResetOnSpawn = true
	LuAI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	LuAI.Enabled = true
	LuAI.Sandboxed = false
	LuAI.ClipToDeviceSafeArea = true
	LuAI.AutoLocalize = true
	LuAI.SafeAreaCompatibility = Enum.SafeAreaCompatibility.FullscreenExtension
	LuAI.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
	LuAI.SelectionBehaviorUp = Enum.SelectionBehavior.Escape
	LuAI.SelectionBehaviorDown = Enum.SelectionBehavior.Escape
	LuAI.SelectionBehaviorLeft = Enum.SelectionBehavior.Escape
	LuAI.SelectionBehaviorRight = Enum.SelectionBehavior.Escape
	LuAI.Parent = parent

	-- UIDragDetector
	local UIDragDetector = Instance.new("UIDragDetector")
	UIDragDetector.Name = "UIDragDetector"
	UIDragDetector.DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane
	UIDragDetector.DragSpace = Enum.UIDragDetectorDragSpace.Parent
	UIDragDetector.Enabled = true
	UIDragDetector.BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.Automatic
	UIDragDetector.ResponseStyle = Enum.UIDragDetectorResponseStyle.Offset
	UIDragDetector.UIDragSpeedAxisMapping = Enum.UIDragSpeedAxisMapping.XY
	UIDragDetector.SelectionModeDragSpeed = UDim2.new(0, 300, 0, 300)
	UIDragDetector.SelectionModeRotateSpeed = 90
	UIDragDetector.DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute
	UIDragDetector.Parent = LuAI

	-- Frame: Main
	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.Size = UDim2.new(0, 312, 0, 670)
	Main.Position = UDim2.new(0.728337228, 0, 0.0340479203, 0)
	Main.BackgroundColor3 = Color3.new(1, 1, 1)
	Main.BackgroundTransparency = 0
	Main.BorderSizePixel = 0
	Main.ZIndex = 1
	Main.Visible = true
	Main.Active = false
	Main.ClipsDescendants = false
	Main.Parent = LuAI

	-- UICorner (Main)
	local MainUICorner = Instance.new("UICorner")
	MainUICorner.Name = "UICorner"
	MainUICorner.CornerRadius = UDim.new(0, 8)
	MainUICorner.Parent = Main

	-- ImageLabel (Main)
	local MainImageLabel = Instance.new("ImageLabel")
	MainImageLabel.Name = "ImageLabel"
	MainImageLabel.Size = UDim2.new(0, 312, 0, 670)
	MainImageLabel.Position = UDim2.new(0, 0, 0, 0)
	MainImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	MainImageLabel.BackgroundTransparency = 0
	MainImageLabel.BorderSizePixel = 0
	MainImageLabel.Image = "rbxassetid://90114090815464"
	MainImageLabel.ImageColor3 = Color3.new(1, 1, 1)
	MainImageLabel.ImageTransparency = 0
	MainImageLabel.ScaleType = Enum.ScaleType.Stretch
	MainImageLabel.Visible = true
	MainImageLabel.Parent = Main

	-- UICorner (Main.ImageLabel)
	local MainImageLabelUICorner = Instance.new("UICorner")
	MainImageLabelUICorner.Name = "UICorner"
	MainImageLabelUICorner.CornerRadius = UDim.new(0, 8)
	MainImageLabelUICorner.Parent = MainImageLabel

	-- Frame: UserMessage
	local UserMessage = Instance.new("Frame")
	UserMessage.Name = "UserMessage"
	UserMessage.Size = UDim2.new(0, 262, 0, 47)
	UserMessage.Position = UDim2.new(0.160256416, 0, 0.929850757, 0)
	UserMessage.BackgroundColor3 = Color3.new(0.3529411852359772, 0.3529411852359772, 0.3529411852359772)
	UserMessage.BackgroundTransparency = 0
	UserMessage.BorderSizePixel = 0
	UserMessage.ZIndex = 1
	UserMessage.Visible = true
	UserMessage.Active = false
	UserMessage.ClipsDescendants = false
	UserMessage.Parent = Main

	-- UIDragDetector (UserMessage)
	local UserMessageUIDragDetector = Instance.new("UIDragDetector")
	UserMessageUIDragDetector.Name = "UIDragDetector"
	UserMessageUIDragDetector.DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane
	UserMessageUIDragDetector.DragSpace = Enum.UIDragDetectorDragSpace.Parent
	UserMessageUIDragDetector.Enabled = true
	UserMessageUIDragDetector.BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.Automatic
	UserMessageUIDragDetector.ResponseStyle = Enum.UIDragDetectorResponseStyle.Offset
	UserMessageUIDragDetector.UIDragSpeedAxisMapping = Enum.UIDragSpeedAxisMapping.XY
	UserMessageUIDragDetector.SelectionModeDragSpeed = UDim2.new(0, 300, 0, 300)
	UserMessageUIDragDetector.SelectionModeRotateSpeed = 90
	UserMessageUIDragDetector.DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute
	UserMessageUIDragDetector.Parent = UserMessage

	-- UICorner (UserMessage)
	local UserMessageUICorner = Instance.new("UICorner")
	UserMessageUICorner.Name = "UICorner"
	UserMessageUICorner.CornerRadius = UDim.new(0, 8)
	UserMessageUICorner.Parent = UserMessage

	-- TextBox: MessageTextBox
	local MessageTextBox = Instance.new("TextBox")
	MessageTextBox.Name = "MessageTextBox"
	MessageTextBox.Size = UDim2.new(0, 200, 0, 50)
	MessageTextBox.Position = UDim2.new(0, 0, 0, 0)
	MessageTextBox.BackgroundColor3 = Color3.new(1, 1, 1)
	MessageTextBox.BackgroundTransparency = 1
	MessageTextBox.BorderSizePixel = 0
	MessageTextBox.Text = "Message Here!"
	MessageTextBox.TextColor3 = Color3.new(0, 0, 0)
	MessageTextBox.TextSize = 14
	MessageTextBox.Font = Enum.Font.SourceSans
	MessageTextBox.TextXAlignment = Enum.TextXAlignment.Center
	MessageTextBox.TextYAlignment = Enum.TextYAlignment.Center
	MessageTextBox.PlaceholderText = ""
	MessageTextBox.PlaceholderColor3 = Color3.new(0.5, 0.5, 0.5)
	MessageTextBox.TextWrapped = false
	MessageTextBox.TextScaled = false
	MessageTextBox.TextEditable = true
	MessageTextBox.MultiLine = false
	MessageTextBox.ClearTextOnFocus = true
	MessageTextBox.Active = true
	MessageTextBox.Visible = true
	MessageTextBox.Parent = UserMessage

	-- UICorner (MessageTextBox)
	local MessageTextBoxUICorner = Instance.new("UICorner")
	MessageTextBoxUICorner.Name = "UICorner"
	MessageTextBoxUICorner.CornerRadius = UDim.new(0, 8)
	MessageTextBoxUICorner.Parent = MessageTextBox

	-- ImageButton: ImageButton
	local ImageButton = Instance.new("ImageButton")
	ImageButton.Name = "ImageButton"
	ImageButton.Size = UDim2.new(0, 57, 0, 58)
	ImageButton.Position = UDim2.new(-0.217557251, 0, 0, 0)
	ImageButton.BackgroundColor3 = Color3.new(1, 1, 1)
	ImageButton.BackgroundTransparency = 1
	ImageButton.BorderSizePixel = 0
	ImageButton.Image = "rbxassetid://18517619049"
	ImageButton.ImageColor3 = Color3.new(1, 1, 1)
	ImageButton.ImageTransparency = 0
	ImageButton.ScaleType = Enum.ScaleType.Stretch
	ImageButton.Active = true
	ImageButton.Visible = true
	ImageButton.AutoButtonColor = true
	ImageButton.Parent = UserMessage

	-- UICorner (ImageButton)
	local ImageButtonUICorner = Instance.new("UICorner")
	ImageButtonUICorner.Name = "UICorner"
	ImageButtonUICorner.CornerRadius = UDim.new(0, 8)
	ImageButtonUICorner.Parent = ImageButton

	-- Frame: Drag
	local Drag = Instance.new("Frame")
	Drag.Name = "Drag"
	Drag.Size = UDim2.new(0, 312, 0, 47)
	Drag.Position = UDim2.new(0, 0, 0, 0)
	Drag.BackgroundColor3 = Color3.new(0.5058823823928833, 0.5058823823928833, 0.5058823823928833)
	Drag.BackgroundTransparency = 0
	Drag.BorderSizePixel = 0
	Drag.ZIndex = 1
	Drag.Visible = true
	Drag.Active = false
	Drag.ClipsDescendants = false
	Drag.Parent = Main

	-- TextLabel (Drag)
	local DragTextLabel = Instance.new("TextLabel")
	DragTextLabel.Name = "TextLabel"
	DragTextLabel.Size = UDim2.new(0, 200, 0, 34)
	DragTextLabel.Position = UDim2.new(0.160256416, 0, 0, 0)
	DragTextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	DragTextLabel.BackgroundTransparency = 1
	DragTextLabel.BorderSizePixel = 0
	DragTextLabel.Text = "LuAI v.1"
	DragTextLabel.TextColor3 = Color3.new(0, 0, 0)
	DragTextLabel.TextSize = 30
	DragTextLabel.Font = Enum.Font.Bangers
	DragTextLabel.TextXAlignment = Enum.TextXAlignment.Center
	DragTextLabel.TextYAlignment = Enum.TextYAlignment.Center
	DragTextLabel.TextWrapped = false
	DragTextLabel.TextScaled = false
	DragTextLabel.Visible = true
	DragTextLabel.Parent = Drag

	-- UICorner (Drag)
	local DragUICorner = Instance.new("UICorner")
	DragUICorner.Name = "UICorner"
	DragUICorner.CornerRadius = UDim.new(0, 8)
	DragUICorner.Parent = Drag

	-- ImageLabel (Drag)
	local DragImageLabel = Instance.new("ImageLabel")
	DragImageLabel.Name = "ImageLabel"
	DragImageLabel.Size = UDim2.new(0, 50, 0, 47)
	DragImageLabel.Position = UDim2.new(0, 0, 0, 0)
	DragImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	DragImageLabel.BackgroundTransparency = 1
	DragImageLabel.BorderSizePixel = 0
	DragImageLabel.Image = "rbxassetid://131577140549158"
	DragImageLabel.ImageColor3 = Color3.new(1, 1, 1)
	DragImageLabel.ImageTransparency = 0
	DragImageLabel.ScaleType = Enum.ScaleType.Stretch
	DragImageLabel.Visible = true
	DragImageLabel.Parent = Drag

	-- UICorner (Drag.ImageLabel)
	local DragImageLabelUICorner = Instance.new("UICorner")
	DragImageLabelUICorner.Name = "UICorner"
	DragImageLabelUICorner.CornerRadius = UDim.new(0, 8)
	DragImageLabelUICorner.Parent = DragImageLabel

	-- Frame: ChatFrame
	local ChatFrame = Instance.new("Frame")
	ChatFrame.Name = "ChatFrame"
	ChatFrame.Size = UDim2.new(0, 312, 0, 543)
	ChatFrame.Position = UDim2.new(0.728337228, 0, 0.117276169, 0)
	ChatFrame.BackgroundColor3 = Color3.new(1, 1, 1)
	ChatFrame.BackgroundTransparency = 1
	ChatFrame.BorderSizePixel = 0
	ChatFrame.ZIndex = 1
	ChatFrame.Visible = true
	ChatFrame.Active = false
	ChatFrame.ClipsDescendants = false
	ChatFrame.Parent = LuAI

	-- UICorner (ChatFrame)
	local ChatFrameUICorner = Instance.new("UICorner")
	ChatFrameUICorner.Name = "UICorner"
	ChatFrameUICorner.CornerRadius = UDim.new(0, 8)
	ChatFrameUICorner.Parent = ChatFrame

	-- ScrollingFrame
	local ScrollingFrame = Instance.new("ScrollingFrame")
	ScrollingFrame.Name = "ScrollingFrame"
	ScrollingFrame.Size = UDim2.new(0, 312, 0, 543)
	ScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
	ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
	ScrollingFrame.BackgroundTransparency = 1
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
	ScrollingFrame.ScrollBarThickness = 12
	ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.XY
	ScrollingFrame.ScrollingEnabled = true
	ScrollingFrame.ScrollBarImageColor3 = Color3.new(0, 0, 0)
	ScrollingFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
	ScrollingFrame.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
	ScrollingFrame.Active = true
	ScrollingFrame.Visible = true
	ScrollingFrame.ClipsDescendants = true
	ScrollingFrame.Parent = ChatFrame

	-- UICorner (ScrollingFrame)
	local ScrollingFrameUICorner = Instance.new("UICorner")
	ScrollingFrameUICorner.Name = "UICorner"
	ScrollingFrameUICorner.CornerRadius = UDim.new(0, 8)
	ScrollingFrameUICorner.Parent = ScrollingFrame

	-- Frame: AIRESPONSE
	local AIRESPONSE = Instance.new("Frame")
	AIRESPONSE.Name = "AIRESPONSE"
	AIRESPONSE.Size = UDim2.new(0, 312, 0, 121)
	AIRESPONSE.Position = UDim2.new(0, 0, 0, 0)
	AIRESPONSE.BackgroundColor3 = Color3.new(1, 1, 1)
	AIRESPONSE.BackgroundTransparency = 1
	AIRESPONSE.BorderSizePixel = 0
	AIRESPONSE.ZIndex = 1
	AIRESPONSE.Visible = true
	AIRESPONSE.Active = false
	AIRESPONSE.ClipsDescendants = false
	AIRESPONSE.Parent = ScrollingFrame

	-- TextLabel: Name (AIRESPONSE)
	local AIName = Instance.new("TextLabel")
	AIName.Name = "Name"
	AIName.Size = UDim2.new(0, 200, 0, 50)
	AIName.Position = UDim2.new(-0.022435898, 0, 0.00460405136, 0)
	AIName.BackgroundColor3 = Color3.new(1, 1, 1)
	AIName.BackgroundTransparency = 1
	AIName.BorderSizePixel = 0
	AIName.Text = "AI's Response"
	AIName.TextColor3 = Color3.new(0, 0, 0)
	AIName.TextSize = 14
	AIName.Font = Enum.Font.Creepster
	AIName.TextXAlignment = Enum.TextXAlignment.Center
	AIName.TextYAlignment = Enum.TextYAlignment.Center
	AIName.TextWrapped = false
	AIName.TextScaled = false
	AIName.Visible = true
	AIName.Parent = AIRESPONSE

	-- ImageLabel (AIRESPONSE.Name)
	local AINameImageLabel = Instance.new("ImageLabel")
	AINameImageLabel.Name = "ImageLabel"
	AINameImageLabel.Size = UDim2.new(0, 42, 0, 43)
	AINameImageLabel.Position = UDim2.new(0.075000003, 0, 0.0599999987, 0)
	AINameImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	AINameImageLabel.BackgroundTransparency = 1
	AINameImageLabel.BorderSizePixel = 0
	AINameImageLabel.Image = "rbxassetid://122881914244490"
	AINameImageLabel.ImageColor3 = Color3.new(1, 1, 1)
	AINameImageLabel.ImageTransparency = 0
	AINameImageLabel.ScaleType = Enum.ScaleType.Stretch
	AINameImageLabel.Visible = true
	AINameImageLabel.Parent = AIName

	-- TextLabel: MessageHere (AIRESPONSE)
	local AIMessageHere = Instance.new("TextLabel")
	AIMessageHere.Name = "MessageHere"
	AIMessageHere.Size = UDim2.new(0, 312, 0, 72)
	AIMessageHere.Position = UDim2.new(0, 0, 0.415017247, 0)
	AIMessageHere.BackgroundColor3 = Color3.new(1, 1, 1)
	AIMessageHere.BackgroundTransparency = 1
	AIMessageHere.BorderSizePixel = 0
	AIMessageHere.Text = "Lorem iptum test message"
	AIMessageHere.TextColor3 = Color3.new(0, 0, 0)
	AIMessageHere.TextSize = 14
	AIMessageHere.Font = Enum.Font.Arial
	AIMessageHere.TextXAlignment = Enum.TextXAlignment.Center
	AIMessageHere.TextYAlignment = Enum.TextYAlignment.Center
	AIMessageHere.TextWrapped = false
	AIMessageHere.TextScaled = false
	AIMessageHere.Visible = true
	AIMessageHere.Parent = AIRESPONSE

	-- Frame: YOURESPONSE
	local YOURESPONSE = Instance.new("Frame")
	YOURESPONSE.Name = "YOURESPONSE"
	YOURESPONSE.Size = UDim2.new(0, 312, 0, 135)
	YOURESPONSE.Position = UDim2.new(0, 0, 0.108655617, 0)
	YOURESPONSE.BackgroundColor3 = Color3.new(1, 1, 1)
	YOURESPONSE.BackgroundTransparency = 1
	YOURESPONSE.BorderSizePixel = 0
	YOURESPONSE.ZIndex = 1
	YOURESPONSE.Visible = true
	YOURESPONSE.Active = false
	YOURESPONSE.ClipsDescendants = false
	YOURESPONSE.Parent = ScrollingFrame

	-- TextLabel: Name (YOURESPONSE)
	local YourName = Instance.new("TextLabel")
	YourName.Name = "Name"
	YourName.Size = UDim2.new(0, 200, 0, 50)
	YourName.Position = UDim2.new(0.358974367, 0, 0.115715198, 0)
	YourName.BackgroundColor3 = Color3.new(1, 1, 1)
	YourName.BackgroundTransparency = 1
	YourName.BorderSizePixel = 0
	YourName.Text = "YOU"
	YourName.TextColor3 = Color3.new(0, 0, 0)
	YourName.TextSize = 14
	YourName.Font = Enum.Font.Creepster
	YourName.TextXAlignment = Enum.TextXAlignment.Center
	YourName.TextYAlignment = Enum.TextYAlignment.Center
	YourName.TextWrapped = false
	YourName.TextScaled = false
	YourName.Visible = true
	YourName.Parent = YOURESPONSE

	-- TextLabel: MessageHere (YOURESPONSE)
	local YourMessageHere = Instance.new("TextLabel")
	YourMessageHere.Name = "MessageHere"
	YourMessageHere.Size = UDim2.new(0, 312, 0, 72)
	YourMessageHere.Position = UDim2.new(0, 0, 0.393863261, 0)
	YourMessageHere.BackgroundColor3 = Color3.new(1, 1, 1)
	YourMessageHere.BackgroundTransparency = 1
	YourMessageHere.BorderSizePixel = 0
	YourMessageHere.Text = "Lorem iptum test message"
	YourMessageHere.TextColor3 = Color3.new(0, 0, 0)
	YourMessageHere.TextSize = 14
	YourMessageHere.Font = Enum.Font.Arial
	YourMessageHere.TextXAlignment = Enum.TextXAlignment.Center
	YourMessageHere.TextYAlignment = Enum.TextYAlignment.Center
	YourMessageHere.TextWrapped = false
	YourMessageHere.TextScaled = false
	YourMessageHere.Visible = true
	YourMessageHere.Parent = YOURESPONSE

	-- ImageLabel (YOURESPONSE.MessageHere)
	local YourMessageImageLabel = Instance.new("ImageLabel")
	YourMessageImageLabel.Name = "ImageLabel"
	YourMessageImageLabel.Size = UDim2.new(0, 42, 0, 43)
	YourMessageImageLabel.Position = UDim2.new(0.77717942, 0, -0.523333251, 0)
	YourMessageImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	YourMessageImageLabel.BackgroundTransparency = 1
	YourMessageImageLabel.BorderSizePixel = 0
	YourMessageImageLabel.Image = "rbxassetid://134776320008048"
	YourMessageImageLabel.ImageColor3 = Color3.new(1, 1, 1)
	YourMessageImageLabel.ImageTransparency = 0
	YourMessageImageLabel.ScaleType = Enum.ScaleType.Stretch
	YourMessageImageLabel.Visible = true
	YourMessageImageLabel.Parent = YourMessageHere

	return LuAI
end

return LuAIGenerator
