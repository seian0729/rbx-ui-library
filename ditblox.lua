local a = Instance.new("ScreenGui")
getgenv().SCGUI = a
local mainFrame = Instance.new("Frame")
local textLabel = Instance.new("TextLabel")
local labelGradient = Instance.new("UIGradient")
local mainCorner = Instance.new("UICorner")
local image = Instance.new("ImageLabel")
local mainSizeConstraint = Instance.new("UISizeConstraint")
local mainStroke = Instance.new('UIStroke')
local strokeGradient = Instance.new('UIGradient')

local SequenceColor = not PremiumAccess and ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(131, 181, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(198, 159, 255))} or ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255,103,103)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 252, 158))}

a.Name = "RobloxGuiService"
a.Parent = game:GetService('CoreGui')
a.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

mainFrame.Name = "mainFrame"
mainFrame.Parent = a
mainFrame.AnchorPoint = Vector2.new(0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.250
mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0.5, 0, 0, 10)

textLabel.Name = "textLabel"
textLabel.Parent = mainFrame
textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel.BackgroundTransparency = 1.000
textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel.BorderSizePixel = 0
textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
textLabel.Size = UDim2.new(0, 0, 1, 0)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.Text = ""
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 20.000
textLabel.TextTransparency = 1
textLabel.AutomaticSize = Enum.AutomaticSize.X
textLabel.RichText = true

labelGradient.Color = SequenceColor
labelGradient.Rotation = 45
labelGradient.Name = "labelGradient"
labelGradient.Parent = textLabel

mainCorner.CornerRadius = UDim.new(0, 4)
mainCorner.Name = "mainCorner"
mainCorner.Parent = mainFrame

image.Parent = mainFrame
image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
image.BackgroundTransparency = 1.000
image.BorderColor3 = Color3.fromRGB(0, 0, 0)
image.BorderSizePixel = 0
image.AnchorPoint = Vector2.new(.5,0)
image.Position = UDim2.new(.5, 0, 0, -17)
image.Rotation = 30.000
image.Size = UDim2.new(0, 30, 0, 30)
local AssetImage = not PremiumAccess and "rbxassetid://6248942117" or "rbxassetid://14519243190"
image.Image = AssetImage
image.ImageTransparency = 1.000

mainSizeConstraint.Name = "mainSizeConstraint"
mainSizeConstraint.Parent = mainFrame
if game:GetService("UserInputService").TouchEnabled and game:GetService("UserInputService").KeyboardEnabled == false then
	mainSizeConstraint.MaxSize = Vector2.new(700, 9999)
else
	mainSizeConstraint.MaxSize = Vector2.new(965, 9999)
end

mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
mainStroke.Color = Color3.fromRGB(255,255,255)
mainStroke.LineJoinMode = Enum.LineJoinMode.Round
mainStroke.Thickness = 2
mainStroke.Transparency = 1
mainStroke.Parent = mainFrame

strokeGradient.Color = SequenceColor
strokeGradient.Rotation = 45
strokeGradient.Name = "labelGradient"
strokeGradient.Parent = mainStroke

textLabel:GetPropertyChangedSignal("Text"):Connect(function()
	if textLabel.TextBounds.X + 10 >= mainSizeConstraint.MaxSize.X or textLabel.AbsoluteSize.X == mainSizeConstraint.MaxSize.X then
		textLabel.TextWrapped = true
		textLabel.Size = UDim2.new(0, mainSizeConstraint.MaxSize.X, 0, 0)
		textLabel.AutomaticSize = Enum.AutomaticSize.Y
		game:GetService('TweenService'):Create(mainFrame,TweenInfo.new(.175),{Size = UDim2.fromOffset(mainSizeConstraint.MaxSize.X + 10 ,textLabel.AbsoluteSize.Y + 20)}):Play()
	else
		textLabel.TextWrapped = false
		textLabel.Size = UDim2.new(0, 0, 1, 0)
		textLabel.AutomaticSize = Enum.AutomaticSize.X
		game:GetService('TweenService'):Create(mainFrame,TweenInfo.new(.175),{Size = UDim2.fromOffset(textLabel.AbsoluteSize.X + 10,60)}):Play()
	end
end)

function typeWrite(guiObject, text, delayBetweenChars)
	guiObject.Visible = true
	guiObject.AutoLocalize = false
	local displayText = text

	-- Replace line break tags so grapheme loop will not miss those characters
	displayText = displayText:gsub("<br%s*/>", "\n")
	displayText:gsub("<[^<>]->", "")

	-- Set translated/modified text on parent
	guiObject.Text = displayText

	local index = 0
	for first, last in utf8.graphemes(displayText) do
		index = index + 1
		guiObject.MaxVisibleGraphemes = index
		wait(delayBetweenChars)
	end
end

function changeText(text)
	textLabel.MaxVisibleGraphemes = utf8.len(text),
	game:GetService('TweenService'):Create(textLabel, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
	wait(.25)
	game:GetService('TweenService'):Create(textLabel, TweenInfo.new(0.25), {TextTransparency = 0}):Play()
	textLabel.Text = text
end

loadSize = game:GetService('TweenService'):Create(mainFrame,TweenInfo.new(.25),{Size = UDim2.fromOffset(textLabel.AbsoluteSize.X + 10,80)})
loadSize:Play()
loadSize.Completed:Connect(function()
	game:GetService('TweenService'):Create(mainStroke,TweenInfo.new(.25),{Transparency = 0 }):Play()
	game:GetService('TweenService'):Create(image,TweenInfo.new(.25),{ImageTransparency = 0 }):Play()
	game:GetService('TweenService'):Create(textLabel,TweenInfo.new(.25),{TextTransparency = 0 }):Play()
end)
changeText("Dit Blox Fruits - Make life easier\nAn re-design version of Sea Hub's Cuttay")