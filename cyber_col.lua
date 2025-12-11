if getgenv().UI_Loaded_ then 
	print('Script already Executed')
	game.Players.LocalPlayer:Kick('Script already Executed')
	return
end

getgenv().UI_Loaded = true

local library = {}
local Library_Function = {}

local Heartbeat = game:GetService("RunService").Heartbeat;
local UIS = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");

library.WindowCount = 0


--Button Effect
function Library_Function.ButtonEffect()
	local mouse = game:GetService("Players").LocalPlayer:GetMouse();
	local buttoneffect = Drawing.new("Circle")
	buttoneffect.Visible = true
	buttoneffect.Radius = 10
	buttoneffect.Filled = true
	buttoneffect.Color = Color3.fromRGB(255,255,255)
	buttoneffect.Position = Vector2.new(mouse.X, mouse.Y + 35)


	local BuoiFolder = Instance.new('Folder')
	BuoiFolder.Parent = Library_Function.gui
	BuoiFolder.Name = 'Game nhu buoi'

	local a = Instance.new('NumberValue')
	a.Value = 10
	a.Parent = BuoiFolder
	a.Name = 'Rac tvk'

	local b = Instance.new('NumberValue')
	b.Value = 1
	b.Parent = BuoiFolder
	b.Name = 'Rac tvk 2'

	TweenService:Create(a,TweenInfo.new(.25),{Value = 25}):Play()
	TweenService:Create(b,TweenInfo.new(.25),{Value = 0}):Play()


	a:GetPropertyChangedSignal('Value'):Connect(function()
		buttoneffect.Radius = a.Value
	end)


	b:GetPropertyChangedSignal('Value'):Connect(function()
		buttoneffect.Transparency = b.Value
	end)

	wait(.5)
	BuoiFolder:Destroy()
end

local djtmemay = false
cac = false

local function makeDraggable(topBarObject, object)
	local dragging = nil
	local dragInput = nil
	local dragStart = nil
	local startPosition = nil
	topBarObject.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPosition = object.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	topBarObject.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			if not djtmemay and cac then
				TweenService:Create(object, TweenInfo.new(0.35,Enum.EasingStyle.Linear,Enum.EasingDirection.Out), {
					Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
				}):Play()
			elseif not djtmemay and not cac then
				object.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
			end
		end
	end)
end

library.gui = Instance.new("ScreenGui")
library.gui.Parent = game:WaitForChild('CoreGui')
library.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
library.gui.Name = game:GetService("HttpService"):GenerateGUID(false):lower():sub(1, 50);
library.toggled = true

function library:buttoneffect(bucac0em)
	spawn(function()
		local mouse = game:GetService("Players").LocalPlayer:GetMouse();
		local buttonbucackoem = Instance.new("ImageLabel", bucac0em);
		local buttonbucackoemInner = Instance.new("ImageLabel", buttonbucackoem);
		buttonbucackoem.Name = "buttonbucackoem";
		buttonbucackoem.BackgroundTransparency = 1;
		buttonbucackoem.BorderSizePixel = 0;
		buttonbucackoem.Image = "rbxassetid://2708891598"
		buttonbucackoem.ImageColor3 = Color3.fromRGB(244, 244, 244);
		buttonbucackoem.ImageTransparency = 0.7;
		buttonbucackoem.ScaleType = Enum.ScaleType.Fit;
		buttonbucackoemInner.Name = "buttonbucackoem";
		buttonbucackoemInner.AnchorPoint = Vector2.new(0.5, 0.5);
		buttonbucackoemInner.BackgroundTransparency = 1;
		buttonbucackoemInner.BorderSizePixel = 0;
		buttonbucackoemInner.Position = UDim2.new(0.5, 0, 0.5, 0);
		buttonbucackoemInner.Size = UDim2.new(1, 0, 1, 0);
		buttonbucackoemInner.Image = "rbxassetid://2708891598"
		buttonbucackoemInner.ImageColor3 = Color3.fromRGB(255,255,255);
		buttonbucackoemInner.ImageTransparency = 0.7;
		buttonbucackoemInner.ScaleType = Enum.ScaleType.Fit;
		buttonbucackoem.Position = UDim2.new((mouse.X - buttonbucackoem.AbsolutePosition.X) / bucac0em.AbsoluteSize.X, 0, (mouse.Y - buttonbucackoem.AbsolutePosition.Y) / bucac0em.AbsoluteSize.Y, 0);
		local Animation = TweenService:Create(buttonbucackoem, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(-4.5, 0, -4.5, 0);
			Size = UDim2.new(10, 0, 10, 0);
			ImageTransparency = 1;
		})
		Animation:Play();

		Animation.Completed:Connect(function()
			buttonbucackoem:Destroy();
		end);
	end)
end

local function toggleduiaa()
	library.toggled = not library.toggled;
	library.gui.Enabled = library.toggled;
end

local gettime = os.date('*t')


local halloweenColor = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 72, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 132, 24))}
local defaultColor = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(26, 75, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(37, 131, 255))}
local hollidayColor = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 48, 48))}

local colorui = gettime['month'] == 10 and halloweenColor or gettime['month'] == 12 and hollidayColor or defaultColor


local Frame = Instance.new("Frame")
Frame.Parent = library.gui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(1, -10, 1, -10)

local Detect = Instance.new('IntValue', Frame)
Detect.Name = 'Dot'

function library:CreateWindows(Name)

	local Container = Instance.new("ImageLabel")
	local TopContainer = Instance.new("ImageLabel")
	local UIGradient = Instance.new("UIGradient")
	local Topbutton = Instance.new("TextButton")
	local topicon = Instance.new("ImageLabel")
	local TitleLabel = Instance.new("TextLabel")
	local UIListLayout = Instance.new("UIListLayout")


	Container.Name = "Container"
	Container.Parent = Frame
	Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container.BackgroundTransparency = 1.000
	Container.Size = UDim2.new(0, 200, 0, 25)
	Container.Position = UDim2.new(0,self.WindowCount * 205,0,0)
	Container.Image = "rbxassetid://4550094458"
	Container.ImageColor3 = Color3.fromRGB(61, 61, 61)
	Container.ScaleType = Enum.ScaleType.Slice
	Container.SliceCenter = Rect.new(4, 4, 296, 296)
	Container.ClipsDescendants = true

	TopContainer.Name = "TopContainer"
	TopContainer.Parent = Container
	TopContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopContainer.BackgroundTransparency = 1.000
	TopContainer.Size = UDim2.new(0, 200, 0, 25)
	TopContainer.Image = "rbxassetid://4550094255"
	TopContainer.ScaleType = Enum.ScaleType.Slice
	TopContainer.SliceCenter = Rect.new(4, 4, 296, 296)

	UIGradient.Color = colorui
	UIGradient.Parent = TopContainer

	Topbutton.Name = "Topbutton"
	Topbutton.Parent = TopContainer
	Topbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Topbutton.BackgroundTransparency = 1.000
	Topbutton.Position = UDim2.new(1, -30, 0, 0)
	Topbutton.Size = UDim2.new(0, 25, 0, 25)
	Topbutton.ZIndex = 2
	Topbutton.Font = Enum.Font.SourceSans
	Topbutton.Text = ""
	Topbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
	Topbutton.TextSize = 14.000

	topicon.Name = "topicon"
	topicon.Parent = Topbutton
	topicon.AnchorPoint = Vector2.new(0.5, 0.5)
	topicon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	topicon.BackgroundTransparency = 1.000
	topicon.Position = UDim2.new(0.5, 0, 0.5, 0)
	topicon.Rotation = 90.000
	topicon.Size = UDim2.new(1, -4, 1, -4)
	topicon.ZIndex = 2
	topicon.Image = "http://www.roblox.com/asset/?id=4765412721"

	TitleLabel.Name = "TitleLabel"
	TitleLabel.Parent = TopContainer
	TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleLabel.BackgroundTransparency = 1.000
	TitleLabel.Position = UDim2.new(0, 5, 0, 0)
	TitleLabel.Size = UDim2.new(1, -35, 1, 0)
	TitleLabel.Font = Enum.Font.GothamBold
	TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TitleLabel.TextSize = 14.000
	TitleLabel.Text = Name

	UIListLayout.Parent = Container
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	makeDraggable(TopContainer,Container)

	local function onContentSizeChanged()
		local absoluteSize = UIListLayout.AbsoluteContentSize
		Container.Size = UDim2.new(0,200,0,5 + absoluteSize.Y)
	end

	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(onContentSizeChanged)

	local topactive = false

	Topbutton.MouseButton1Click:Connect(function()
		topactive = not topactive 
		local IconRotation = topactive and 0 or 90
		local UIStyle = topactive and "Out" or 'In'
		local UISize = topactive and UDim2.new(0,200,0,25) or UDim2.new(0,200,0,5 + UIListLayout.AbsoluteContentSize.Y)
		TweenService:Create(topicon,TweenInfo.new(0.3),{Rotation=IconRotation}):Play()
		TweenService:Create(Container,TweenInfo.new(0.3),{Size=UISize}):Play()
	end)

	Topbutton.MouseButton1Click:Connect(function() Library_Function.ButtonEffect() end)

	self.WindowCount = self.WindowCount + 1

	local windows = {}

	function windows:NewSection(Name)

		local section = {}

		local Sectioncontainer = Instance.new("Frame")
		local Topsectioncontainer = Instance.new("Frame")
		local Topsectionbutton = Instance.new("TextButton")
		local topsectionicon = Instance.new("ImageLabel")
		local topsectionlabel = Instance.new("TextLabel")
		local UIListLayout = Instance.new("UIListLayout")


		Sectioncontainer.Name = "Sectioncontainer"
		Sectioncontainer.Parent = Container
		Sectioncontainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Sectioncontainer.BorderSizePixel = 0
		Sectioncontainer.Size = UDim2.new(0, 200, 0, 20)
		Sectioncontainer.ClipsDescendants = true

		Topsectioncontainer.Name = "Topsectioncontainer"
		Topsectioncontainer.Parent = Sectioncontainer
		Topsectioncontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Topsectioncontainer.BackgroundTransparency = 1.000
		Topsectioncontainer.BorderSizePixel = 0
		Topsectioncontainer.Size = UDim2.new(0, 200, 0, 20)

		Topsectionbutton.Name = "Topsectionbutton"
		Topsectionbutton.Parent = Topsectioncontainer
		Topsectionbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Topsectionbutton.BackgroundTransparency = 1.000
		Topsectionbutton.Position = UDim2.new(1, -25, 0, 0)
		Topsectionbutton.Size = UDim2.new(0, 20, 0, 20)
		Topsectionbutton.ZIndex = 2
		Topsectionbutton.Font = Enum.Font.SourceSans
		Topsectionbutton.Text = ""
		Topsectionbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
		Topsectionbutton.TextSize = 14.000

		topsectionicon.Name = "topsectionicon"
		topsectionicon.Parent = Topsectionbutton
		topsectionicon.AnchorPoint = Vector2.new(0.5, 0.5)
		topsectionicon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		topsectionicon.BackgroundTransparency = 1.000
		topsectionicon.Position = UDim2.new(0.5, 0, 0.5, 0)
		topsectionicon.Rotation = 90.000
		topsectionicon.Size = UDim2.new(1, -4, 1, -4)
		topsectionicon.ZIndex = 2
		topsectionicon.Image = "http://www.roblox.com/asset/?id=4765412721"

		topsectionlabel.Name = "topsectionlabel"
		topsectionlabel.Parent = Topsectioncontainer
		topsectionlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		topsectionlabel.BackgroundTransparency = 1.000
		topsectionlabel.Position = UDim2.new(0, 5, 0, 0)
		topsectionlabel.Size = UDim2.new(1, -35, 1, 0)
		topsectionlabel.Font = Enum.Font.GothamBold
		topsectionlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		topsectionlabel.TextSize = 14.000
		topsectionlabel.Text = Name

		UIListLayout.Parent = Sectioncontainer
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)

		local function onContentSizeChanged()
			local absoluteSize = UIListLayout.AbsoluteContentSize
			Sectioncontainer.Size = UDim2.new(0,200,0,5 + absoluteSize.Y)
		end

		UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(onContentSizeChanged)
		local sectionactive = false
		Topsectionbutton.MouseButton1Click:Connect(function()
			sectionactive = not sectionactive
			local IconRotation = sectionactive and 0 or 90
			local UIStyle = sectionactive and "Out" or 'In'
			local UISize = sectionactive and UDim2.new(0,200,0,20) or UDim2.new(0,200,0,5 + UIListLayout.AbsoluteContentSize.Y)
			TweenService:Create(topsectionicon,TweenInfo.new(0.3),{Rotation=IconRotation}):Play()
			TweenService:Create(Sectioncontainer,TweenInfo.new(0.3),{Size=UISize}):Play()
		end)

		Topsectionbutton.MouseButton1Click:Connect(function() Library_Function.ButtonEffect() end)

		function section:NewToggle(Name,Callback)
			Callback = Callback or function() end
			local ToggleFrame = Instance.new("Frame")
			local ToggleButton = Instance.new("TextButton")
			local checkbox = Instance.new("ImageLabel")
			local UIGradient = Instance.new("UIGradient")
			local fill = Instance.new("ImageLabel")
			local check = Instance.new("ImageLabel")
			local UIGradient_2 = Instance.new("UIGradient")
			local ToggleLabel = Instance.new("TextLabel")


			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.Parent = Sectioncontainer
			ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleFrame.BackgroundTransparency = 1.000
			ToggleFrame.Size = UDim2.new(1, 0, 0, 25)

			ToggleButton.Name = "ToggleButton"
			ToggleButton.Parent = ToggleFrame
			ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleButton.BackgroundTransparency = 1.000
			ToggleButton.Size = UDim2.new(1, 0, 1, 0)
			ToggleButton.Font = Enum.Font.SourceSans
			ToggleButton.Text = ""
			ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleButton.TextSize = 14.000

			checkbox.Name = "checkbox"
			checkbox.Parent = ToggleButton
			checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			checkbox.BackgroundTransparency = 1.000
			checkbox.Position = UDim2.new(1, -30, 0, 0)
			checkbox.Size = UDim2.new(0, 25, 0, 25)
			checkbox.Image = "rbxassetid://4552505888"

			UIGradient.Color = colorui
			UIGradient.Parent = checkbox

			fill.Name = "fill"
			fill.AnchorPoint = Vector2.new(.5,.5)
			fill.Parent = checkbox
			fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			fill.BackgroundTransparency = 1.000
			fill.Size = UDim2.new(1, 0, 1, 0)
			fill.Position = UDim2.new(.5,0,.5,0)
			fill.ZIndex = 0
			fill.Image = "rbxassetid://4555402813"
			fill.ImageTransparency = 1.000

			check.Name = "check"
			check.Parent = fill
			check.AnchorPoint = Vector2.new(0.5, 0.5)
			check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			check.BackgroundTransparency = 1.000
			check.Position = UDim2.new(0.5, 0, 0.5, 0)
			check.Size = UDim2.new(1, -4, 1, -4)
			check.Image = "rbxassetid://4555411759"
			check.ImageTransparency = 1.000

			UIGradient_2.Color = colorui
			UIGradient_2.Parent = fill

			ToggleLabel.Name = "ToggleLabel"
			ToggleLabel.Parent = ToggleFrame
			ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleLabel.BackgroundTransparency = 1.000
			ToggleLabel.Position = UDim2.new(0, 5, 0, 0)
			ToggleLabel.Size = UDim2.new(1, -35, 1, 0)
			ToggleLabel.Font = Enum.Font.GothamBold
			ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleLabel.TextSize = 14.000
			ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
			ToggleLabel.Text = Name 

			ToggleButton.MouseButton1Click:Connect(function() Library_Function:ButtonEffect() end)

			local Val = false 

			local function changestage(Stage)

				Stage = not Stage
				local imagetran = Stage and 0 or 1 
				local imagesize = Stage and UDim2.new(1,0,1,0) or UDim2.new(0,0,0,0)
				TweenService:Create(fill,TweenInfo.new(.25),{Size = imagesize,ImageTransparency = imagetran}):Play()
				TweenService:Create(check,TweenInfo.new(.25),{ImageTransparency = imagetran}):Play()
				Callback(Stage)
				
			end

			ToggleButton.MouseButton1Click:Connect(function()
				Val = not Val
				changestage(Val)
			end)

			local tog_func = {}

				function tog_func.SetStage(value)
					changestage(value)
				end

			return tog_func

		end

		function section:NewButton(Name,Callback)


			local ButtonFrame = Instance.new("Frame")
			local Button = Instance.new("TextButton")
			local Buttonicon = Instance.new("ImageLabel")
			local UIGradient = Instance.new("UIGradient")


			ButtonFrame.Name = "ButtonFrame"
			ButtonFrame.Parent = Sectioncontainer
			ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonFrame.BackgroundTransparency = 1.000
			ButtonFrame.Size = UDim2.new(1, 0, 0, 25)

			Button.Name = "Button"
			Button.Parent = ButtonFrame
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(1, 0, 1, 0)
			Button.Font = Enum.Font.GothamBold
			Button.Text = Name
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 14.000

			Buttonicon.Name = "Buttonicon"
			Buttonicon.Parent = ButtonFrame
			Buttonicon.Active = true
			Buttonicon.AnchorPoint = Vector2.new(0.5, 0.5)
			Buttonicon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Buttonicon.BackgroundTransparency = 1.000
			Buttonicon.Position = UDim2.new(0.5, 0, 0.5, 0)
			Buttonicon.Selectable = true
			Buttonicon.Size = UDim2.new(1,-10,1,0)
			Buttonicon.ZIndex = 0
			Buttonicon.Image = "rbxassetid://3570695787"
			Buttonicon.ScaleType = Enum.ScaleType.Slice
			Buttonicon.SliceCenter = Rect.new(100, 100, 100, 100)
			Buttonicon.SliceScale = 0.020
			Buttonicon.ClipsDescendants = true

			UIGradient.Parent = Buttonicon
			UIGradient.Color = colorui

			Button.MouseButton1Click:Connect(function() library:buttoneffect(Buttonicon) end)
			Button.MouseButton1Click:Connect(function()
				Callback()
			end)

		end

		function section:NewSlider(Name,Setting,Callback)

			local Min = Setting.Min or Setting.min or 0 
			local Max  = Setting.Max or Setting.max or 100 
			local Precise = Setting.Precise or Setting.precise or false

			local Callback = Callback or function() end

			local drag = false

			local SliderFrame = Instance.new("Frame")
			local Valueicon = Instance.new("ImageLabel")
			local ValueLabel = Instance.new("TextLabel")
			local TitleLabel = Instance.new("TextLabel")
			local SliderBar = Instance.new("ImageLabel")
			local Bar = Instance.new("ImageLabel")
			local UIGradient = Instance.new("UIGradient")
			local SliderButton = Instance.new("TextButton")
			local ButtonIcon = Instance.new("ImageLabel")

			SliderFrame.Name = "SliderFrame"
			SliderFrame.Parent = Sectioncontainer
			SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderFrame.BackgroundTransparency = 1.000
			SliderFrame.Size = UDim2.new(1, 0, 0, 45)

			Valueicon.Name = "Valueicon"
			Valueicon.Parent = SliderFrame
			Valueicon.Active = true
			Valueicon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Valueicon.BackgroundTransparency = 1.000
			Valueicon.Position = UDim2.new(0, 130, 0, 0)
			Valueicon.Selectable = true
			Valueicon.Size = UDim2.new(0, 65, 0, 25)
			Valueicon.ZIndex = 0
			Valueicon.Image = "rbxassetid://3570695787"
			Valueicon.ImageColor3 = Color3.fromRGB(25,25,25)
			Valueicon.ScaleType = Enum.ScaleType.Slice
			Valueicon.SliceCenter = Rect.new(100, 100, 100, 100)
			Valueicon.SliceScale = 0.020

			ValueLabel.Name = "ValueLabel"
			ValueLabel.Parent = SliderFrame
			ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ValueLabel.BackgroundTransparency = 1.000
			ValueLabel.Position = UDim2.new(0, 130, 0, 0)
			ValueLabel.Size = UDim2.new(0, 65, 0, 25)
			ValueLabel.Font = Enum.Font.GothamBold
			ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			ValueLabel.TextSize = 14.000
			ValueLabel.Text = Min

			TitleLabel.Name = "TitleLabel"
			TitleLabel.Parent = SliderFrame
			TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.BackgroundTransparency = 1.000
			TitleLabel.Position = UDim2.new(0, 5, 0, 0)
			TitleLabel.Size = UDim2.new(0, 120, 0, 25)
			TitleLabel.Font = Enum.Font.GothamBold
			TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.TextSize = 14.000
			TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
			TitleLabel.Text = Name

			SliderBar.Name = "SliderBar"
			SliderBar.Parent = SliderFrame
			SliderBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderBar.BackgroundTransparency = 1.000
			SliderBar.Position = UDim2.new(0, 11, 0, 35)
			SliderBar.Size = UDim2.new(0, 175, 0, 6)
			SliderBar.Image = "rbxassetid://3570695787"
			SliderBar.ScaleType = Enum.ScaleType.Slice
			SliderBar.SliceCenter = Rect.new(100, 100, 100, 100)
			SliderBar.SliceScale = 0.050

			Bar.Name = "Bar"
			Bar.Parent = SliderBar
			Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Bar.BackgroundTransparency = 1.000
			Bar.Size = UDim2.new(0, 0, 1, 0)
			Bar.Image = "rbxassetid://3570695787"
			Bar.ScaleType = Enum.ScaleType.Slice
			Bar.SliceCenter = Rect.new(100, 100, 100, 100)
			Bar.SliceScale = 0.050

			UIGradient.Color = colorui
			UIGradient.Parent = Bar

			SliderButton.Name = "SliderButton"
			SliderButton.Parent = Bar
			SliderButton.AnchorPoint = Vector2.new(0, 0.5)
			SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderButton.BackgroundTransparency = 1.000
			SliderButton.BorderSizePixel = 0
			SliderButton.Position = UDim2.new(1, -5, 0.5, 0)
			SliderButton.Size = UDim2.new(0, 12, 0, 12)
			SliderButton.ZIndex = 2
			SliderButton.Font = Enum.Font.SourceSans
			SliderButton.Text = ""
			SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			SliderButton.TextSize = 14.000

			ButtonIcon.Name = "ButtonIcon"
			ButtonIcon.Parent = SliderButton
			ButtonIcon.Active = true
			ButtonIcon.AnchorPoint = Vector2.new(0.5, 0.5)
			ButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonIcon.BackgroundTransparency = 1.000
			ButtonIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
			ButtonIcon.Selectable = true
			ButtonIcon.Size = UDim2.new(1, 0, 1, 0)
			ButtonIcon.ZIndex = 2
			ButtonIcon.Image = "rbxassetid://3570695787"
			ButtonIcon.ScaleType = Enum.ScaleType.Slice
			ButtonIcon.SliceCenter = Rect.new(100, 100, 100, 100)

			local function slide(input)
				local pos = UDim2.new(math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1), 0, 1, 0);
				Bar:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
				local value = Precise and tonumber(string.format("%.2f",(pos.X.Scale * Max) / Max) * (Max - Min) + Min) or  math.floor(((pos.X.Scale * Max) / Max) * (Max - Min) + Min);
				ValueLabel.Text = tostring(value);
				Callback(value);
			end;

			SliderBar.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					drag = true;
				end;
			end);

			SliderBar.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					drag = false;
				end;
			end);

			SliderBar.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slide(input);
				end;
			end);

			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
					slide(input);
				end;
			end);

		end

		function section:NewDropdown(Name,Setting,Callback)

			local List = Setting.List or Setting.list
			local SearchSetting = Setting.search or Setting.Search or false
			local Toggled = Setting.Toggled or false

			local Callback = Callback or function() end



			local DropdownFrame = Instance.new("Frame")
			local Dropdownicon = Instance.new("ImageLabel")
			local TitleLabel = Instance.new("TextLabel")
			local Dropdownlist = Instance.new("ImageLabel")
			local InDropdownlist = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")

			local Dropdownbutton = Instance.new("TextButton")

			local Dropdownbox = Instance.new("TextBox")

			DropdownFrame.Name = "DropdownFrame"
			DropdownFrame.Parent = Sectioncontainer
			DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownFrame.BackgroundTransparency = 1.000
			DropdownFrame.Position = UDim2.new(0, 0, 6.75, 0)
			DropdownFrame.Size = UDim2.new(1, 0, 0, 25)

			Dropdownicon.Name = "Dropdownicon"
			Dropdownicon.Parent = DropdownFrame
			Dropdownicon.Active = true
			Dropdownicon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Dropdownicon.BackgroundTransparency = 1.000
			Dropdownicon.Position = UDim2.new(0, 130, 0, 0)
			Dropdownicon.Selectable = true
			Dropdownicon.Size = UDim2.new(0, 65, 0, 25)
			Dropdownicon.ZIndex = 0
			Dropdownicon.Image = "rbxassetid://3570695787"
			Dropdownicon.ImageColor3 = Color3.fromRGB(20, 20, 20)
			Dropdownicon.ScaleType = Enum.ScaleType.Slice
			Dropdownicon.SliceCenter = Rect.new(100, 100, 100, 100)
			Dropdownicon.SliceScale = 0.020

			TitleLabel.Name = "TitleLabel"
			TitleLabel.Parent = DropdownFrame
			TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.BackgroundTransparency = 1.000
			TitleLabel.Position = UDim2.new(0, 5, 0, 0)
			TitleLabel.Size = UDim2.new(0, 120, 0, 25)
			TitleLabel.Font = Enum.Font.GothamBold
			TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.TextSize = 14.000
			TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
			TitleLabel.Text = Name
			if string.len(Name) > 15 then 
				TitleLabel.TextScaled = true
			end

			if SearchSetting then

				Dropdownbox.Name = "Dropdownbox"
				Dropdownbox.Parent = DropdownFrame
				Dropdownbox.Active = false
				Dropdownbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdownbox.BackgroundTransparency = 1.000
				Dropdownbox.Position = UDim2.new(0, 130, 0, 0)
				Dropdownbox.Selectable = false
				Dropdownbox.Size = UDim2.new(0, 65, 0, 25)
				Dropdownbox.Font = Enum.Font.GothamBold
				if string.len(Name) > 5 then 
					Dropdownbox.Text = ''
					Dropdownbox.PlaceholderText = string.match(Name,'.....').."..."
				else 
					Dropdownbox.Text = ''
					Dropdownbox.PlaceholderText = Name
				end
				Dropdownbox.TextColor3 = Color3.fromRGB(255, 255, 255)
				Dropdownbox.TextSize = 14.000

			else 
				Dropdownbutton.Name = "Dropdownbutton"
				Dropdownbutton.Parent = DropdownFrame
				Dropdownbutton.Active = false
				Dropdownbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdownbutton.BackgroundTransparency = 1.000
				Dropdownbutton.Position = UDim2.new(0, 130, 0, 0)
				Dropdownbutton.Selectable = false
				Dropdownbutton.Size = UDim2.new(0, 65, 0, 25)
				Dropdownbutton.Font = Enum.Font.GothamBold
				if string.len(Name) > 5 then 
					Dropdownbutton.Text = string.match(Name,'.....').."..."
				else 
					Dropdownbutton.Text = Name
				end 
				Dropdownbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
				Dropdownbutton.TextSize = 14.000
			end

			Dropdownlist.Name = "Dropdownlist"
			Dropdownlist.Parent = DropdownFrame
			Dropdownlist.AnchorPoint = Vector2.new(0.5, 0)
			Dropdownlist.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			Dropdownlist.BackgroundTransparency = 1.000
			Dropdownlist.Position = UDim2.new(0.5, 0, 0, 30)
			Dropdownlist.Size = UDim2.new(1, -10, 0, 0)
			Dropdownlist.Image = "rbxassetid://3570695787"
			Dropdownlist.ImageColor3 = Color3.fromRGB(20, 20, 20)
			Dropdownlist.ScaleType = Enum.ScaleType.Slice
			Dropdownlist.SliceCenter = Rect.new(100, 100, 100, 100)
			Dropdownlist.SliceScale = 0.020


			InDropdownlist.Name = 'InDropdownlist'
			InDropdownlist.Parent = Dropdownlist
			InDropdownlist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			InDropdownlist.BackgroundTransparency = 1.000
			InDropdownlist.Position = UDim2.new(0, 0, 0, 5)
			InDropdownlist.Size = UDim2.new(1, 0, 1, -5)
			InDropdownlist.CanvasSize = UDim2.new(0, 0, 0, 0)
			InDropdownlist.ScrollBarThickness = 0

			UIListLayout.Parent = InDropdownlist
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)

			local function onContentSizeChanged()
				local absoluteSize = UIListLayout.AbsoluteContentSize
				InDropdownlist.CanvasSize = UDim2.new(0, 0, 0, 5 + absoluteSize.Y)
			end

			UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(onContentSizeChanged)

			local isbusy = false

			local found = {}

			local searchtable = {}

			for i, v in pairs(List) do
				if not Toggled then 
					table.insert(searchtable, string.lower(v))
				else
					table.insert(searchtable, string.lower(i))
				end
			end

			local function edit()
				for i in pairs(found) do
					found[i] = nil
				end
				for h, l in pairs(InDropdownlist:GetChildren()) do
					if not l:IsA("UIListLayout") and not l:IsA("UIPadding") and not l:IsA('UIGridLayout') then
						l.Visible = false
					end
				end
				Dropdownbox.Text = string.lower(Dropdownbox.Text)
			end

			local function Search()
				local Results = {}
				for i, v in pairs(searchtable) do
					if string.find(v, Dropdownbox.Text) then
						table.insert(found, v)
					end
				end
				for a, b in pairs(InDropdownlist:GetChildren()) do
					for c, d in pairs(found) do
						if d == b.Name then
							b.Visible = true
						end
					end
				end
			end

			local function refreshlist()

				for i, v in pairs(List) do
					if not Toggled then 
						table.insert(searchtable, string.lower(v))
					else
						table.insert(searchtable, string.lower(i))
					end
				end

				for i,v in next, InDropdownlist:GetChildren() do 
					if v:IsA('ImageLabel') then 
						v:Destroy()
					end
				end

				if not Toggled then 
					for i,v in next, List do 
						local TextButton = Instance.new("TextButton")
						local TextButton_Roundify_2px = Instance.new("ImageLabel")
	
						local aa = Instance.new("ImageLabel")
						local TextButton = Instance.new("TextButton")
	
	
						aa.Name = string.lower(v)
						aa.Parent = InDropdownlist
						aa.Active = true
						aa.AnchorPoint = Vector2.new(0.5, 0.5)
						aa.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						aa.BackgroundTransparency = 1.000
						aa.Position = UDim2.new(0.5, 0, 0.5, 0)
						aa.Selectable = true
						aa.Size = UDim2.new(1, -10, 0, 20)
						aa.Image = "rbxassetid://3570695787"
						aa.ImageColor3 = Color3.fromRGB(47, 47, 47)
						aa.ScaleType = Enum.ScaleType.Slice
						aa.SliceCenter = Rect.new(100, 100, 100, 100)
						aa.SliceScale = 0.020
	
						TextButton.Parent = aa
						TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextButton.BackgroundTransparency = 1.000
						TextButton.BorderSizePixel = 0
						TextButton.Size = UDim2.new(1, 0, 1, 0)
						TextButton.ZIndex = 2
						TextButton.Font = Enum.Font.GothamBold
						TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextButton.TextSize = 14.000
						TextButton.Text = v
	
	
						if string.len(TextButton.Text) > 15 then 
							TextButton.TextScaled = true
						end
						
						TextButton.MouseButton1Click:Connect(function()
							Library_Function:ButtonEffect()
						end)

						TextButton.MouseButton1Click:Connect(function()
							isbusy = false
							if SearchSetting then 
								if string.len(v) > 5 then 
									Dropdownbox.PlaceholderText = string.match(v,'.....').."..."
									Dropdownbox.Text = ''
								else 
									Dropdownbox.PlaceholderText = v
									Dropdownbox.Text = ''
								end
							else 
								if string.len(v) > 5 then 
									Dropdownbutton.Text = string.match(v,'.....').."..."
								else
									Dropdownbutton.Text = v
								end
							end 
							InDropdownlist.ScrollBarThickness = 0
							refreshlist()
							if Callback then 
								Callback(v)
							end
	
						end)
	
					end 

				else

					for i,v in next, List do 
						local TextButton = Instance.new("TextButton")
						local TextButton_Roundify_2px = Instance.new("ImageLabel")
	
						local aa = Instance.new("ImageLabel")
						local TextButton = Instance.new("TextButton")

						local SelectedCor = v and Color3.fromRGB(37, 131, 255) or Color3.fromRGB(47, 47, 47)
	
	
						aa.Name = string.lower(i)
						aa.Parent = InDropdownlist
						aa.Active = true
						aa.AnchorPoint = Vector2.new(0.5, 0.5)
						aa.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						aa.BackgroundTransparency = 1.000
						aa.Position = UDim2.new(0.5, 0, 0.5, 0)
						aa.Selectable = true
						aa.Size = UDim2.new(1, -10, 0, 20)
						aa.Image = "rbxassetid://3570695787"
						aa.ImageColor3 = SelectedCor
						aa.ScaleType = Enum.ScaleType.Slice
						aa.SliceCenter = Rect.new(100, 100, 100, 100)
						aa.SliceScale = 0.020
	
						TextButton.Parent = aa
						TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextButton.BackgroundTransparency = 1.000
						TextButton.BorderSizePixel = 0
						TextButton.Size = UDim2.new(1, 0, 1, 0)
						TextButton.ZIndex = 2
						TextButton.Font = Enum.Font.GothamBold
						TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextButton.TextSize = 14.000
						TextButton.Text = i
	
	
						if string.len(TextButton.Text) > 15 then 
							TextButton.TextScaled = true
						end
						TextButton.MouseButton1Click:Connect(function() Library_Function:ButtonEffect() end)
						TextButton.MouseButton1Click:Connect(function()
							v = not v 
							local SelectedCor = v and Color3.fromRGB(37, 131, 255) or Color3.fromRGB(47, 47, 47)
							TweenService:Create(aa,TweenInfo.new(.5),{ImageColor3 = SelectedCor}):Play()
							if Callback then 
								Callback(i,v)
                                List[i] = v
							end
						end)
	
					end 


				end

			end

			Dropdownbox.Changed:Connect(function()
				edit()
				Search()
			end)

			Dropdownbox.Focused:Connect(function()
				Library_Function:ButtonEffect()
			end)


			Dropdownbox.Focused:Connect(function()
				isbusy = not isbusy 
				local listsize = isbusy and UDim2.new(1, -10,0, 130) or UDim2.new(1, -10,0, 0)
				local dropframesize = isbusy and UDim2.new(1,0 ,0, 160) or UDim2.new(1, 0,0, 25)
				refreshlist()
				TweenService:Create(Dropdownlist,TweenInfo.new(.5),{Size = listsize}):Play()
				TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropframesize}):Play()
			end)

			Dropdownbutton.MouseButton1Click:Connect(function()
				isbusy = not isbusy 
				local listsize = isbusy and UDim2.new(1, -10,0, 130) or UDim2.new(1, -10,0, 0)
				local dropframesize = isbusy and UDim2.new(1,0 ,0, 160) or UDim2.new(1, 0,0, 25)
				refreshlist()
				TweenService:Create(Dropdownlist,TweenInfo.new(.5),{Size = listsize}):Play()
				TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropframesize}):Play()
			end)

			Dropdownbutton.MouseButton1Click:Connect(function() Library_Function:ButtonEffect() end)

			local Dropdown_function = {}

			function Dropdown_function:GetList(_List)
				List = _List
				isbusy = true
				local listsize = isbusy and UDim2.new(1, -10,0, 130) or UDim2.new(1, -10,0, 0)
				local dropframesize = isbusy and UDim2.new(1,0 ,0, 160) or UDim2.new(1, 0,0, 25)
				refreshlist()
				TweenService:Create(Dropdownlist,TweenInfo.new(.5),{Size = listsize}):Play()
				TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropframesize}):Play()
			end

			return Dropdown_function

		end

		function section:NewBox(Name,Setting,Callback)
			local Callback = Callback or function() end 
			local Numberonly = Setting.Number or Setting.number or false

			local TextboxFrame = Instance.new("Frame")
			local Textboxicon = Instance.new("ImageLabel")
			local Textbox = Instance.new("TextBox")
			local Textboxtitle = Instance.new("TextLabel")


			TextboxFrame.Name = "TextboxFrame"
			TextboxFrame.Parent = Sectioncontainer
			TextboxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextboxFrame.BackgroundTransparency = 1.000
			TextboxFrame.Size = UDim2.new(1, 0, 0, 45)

			Textboxicon.Name = "Textboxicon"
			Textboxicon.Parent = TextboxFrame
			Textboxicon.Active = true
			Textboxicon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Textboxicon.BackgroundTransparency = 1.000
			Textboxicon.Position = UDim2.new(0, 5, 0, 22)
			Textboxicon.Selectable = true
			Textboxicon.Size = UDim2.new(0, 190, 0, 21)
			Textboxicon.ZIndex = 0
			Textboxicon.Image = "rbxassetid://3570695787"
			Textboxicon.ImageColor3 = Color3.fromRGB(20, 20, 20)
			Textboxicon.ScaleType = Enum.ScaleType.Slice
			Textboxicon.SliceCenter = Rect.new(100, 100, 100, 100)
			Textboxicon.SliceScale = 0.020

			Textbox.Name = "Textbox"
			Textbox.Parent = Textboxicon
			Textbox.Active = false
			Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Textbox.BackgroundTransparency = 1.000
			Textbox.Selectable = false
			Textbox.Size = UDim2.new(1, 0, 1, 0)
			Textbox.ClearTextOnFocus = false
			Textbox.Font = Enum.Font.GothamBold
			Textbox.Text = ""
			Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
			Textbox.TextSize = 14.000
			Textbox.PlaceholderText = Name

			Textboxtitle.Name = "Textboxtitle"
			Textboxtitle.Parent = TextboxFrame
			Textboxtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Textboxtitle.BackgroundTransparency = 1.000
			Textboxtitle.Position = UDim2.new(0, 5, 0, 0)
			Textboxtitle.Size = UDim2.new(0, 120, 0, 25)
			Textboxtitle.Font = Enum.Font.GothamBold
			Textboxtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			Textboxtitle.TextSize = 14.000
			Textboxtitle.TextXAlignment = Enum.TextXAlignment.Left
			Textboxtitle.Text = Name
			if string.len(Name) > 15 then 
				Textboxtitle.TextScaled = true 
			end

			Textbox.Focused:Connect(function() Library_Function:ButtonEffect() end)

			local Valuebox

			if Numberonly then 

				Textbox:GetPropertyChangedSignal("Text"):Connect(function()
					if tonumber(Textbox.Text) then 
						Textbox.FocusLost:Connect(function()
							if Textbox.Text ~= '' then
								Callback(Textbox.Text)
							end
						end)
					else 
						Textbox.PlaceholderText = 'Number only -.-'
						Valuebox = Textbox.Text
						Textbox.Text = ''
					end
				end)
			else

				Textbox.FocusLost:Connect(function()
					Callback(Textbox.Text)
				end)

			end

		end

		function section:NewBind(Name,Setting,Callback)
			local Callback = Callback or function() end
			local keycodename = Setting.KeyDefault or Setting.Key or Setting.Default
			local Default = Setting.KeyDefault or Setting.Key or Setting.Default
			local Type = tostring(Default):match("UserInputType") and "UserInputType" or "KeyCode"
			keycodename = tostring(keycodename):gsub("Enum.UserInputType.", "")
			keycodename = tostring(keycodename):gsub("Enum.KeyCode.", "")



			local BindFrame = Instance.new("Frame")
			local BindIcon = Instance.new("ImageLabel")
			local BindTitle = Instance.new("TextLabel")
			local BindButton = Instance.new("TextButton")


			BindFrame.Name = "BindFrame"
			BindFrame.Parent = Sectioncontainer
			BindFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BindFrame.BackgroundTransparency = 1.000
			BindFrame.Position = UDim2.new(0, 0, 6.75, 0)
			BindFrame.Size = UDim2.new(1, 0, 0, 25)

			BindIcon.Name = "BindIcon"
			BindIcon.Parent = BindFrame
			BindIcon.Active = true
			BindIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BindIcon.BackgroundTransparency = 1.000
			BindIcon.Position = UDim2.new(0, 130, 0, 0)
			BindIcon.Selectable = true
			BindIcon.Size = UDim2.new(0, 65, 0, 25)
			BindIcon.ZIndex = 0
			BindIcon.Image = "rbxassetid://3570695787"
			BindIcon.ImageColor3 = Color3.fromRGB(20, 20, 20)
			BindIcon.ScaleType = Enum.ScaleType.Slice
			BindIcon.SliceCenter = Rect.new(100, 100, 100, 100)
			BindIcon.SliceScale = 0.020

			BindTitle.Name = "BindTitle"
			BindTitle.Parent = BindFrame
			BindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BindTitle.BackgroundTransparency = 1.000
			BindTitle.Position = UDim2.new(0, 5, 0, 0)
			BindTitle.Size = UDim2.new(0, 120, 0, 25)
			BindTitle.Font = Enum.Font.GothamBold
			BindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			BindTitle.TextSize = 14.000
			BindTitle.TextXAlignment = Enum.TextXAlignment.Left
			BindTitle.Text = Name
			if string.len(BindTitle.Text) >= 15 then
				BindTitle.TextScaled = true
			end

			BindButton.Name = "BindButton"
			BindButton.Parent = BindFrame
			BindButton.Active = false
			BindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BindButton.BackgroundTransparency = 1.000
			BindButton.Position = UDim2.new(0, 130, 0, 0)
			BindButton.Selectable = false
			BindButton.Size = UDim2.new(0, 65, 0, 25)
			BindButton.Font = Enum.Font.GothamBold
			BindButton.Text = tostring(Default):gsub("Enum.KeyCode.", "")
			BindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			BindButton.TextSize = 14.000



			local WhitelistedType = {
				[Enum.UserInputType.MouseButton1] = "Mouse1";
				[Enum.UserInputType.MouseButton2] = "Mouse2";
				[Enum.UserInputType.MouseButton3] = "Mouse3";
			};

			BindButton.MouseButton1Click:Connect(function()
				Library_Function:ButtonEffect()
			end)

			BindButton.MouseButton1Click:Connect(function()
				local Connection;

				BindButton.Text = "...";

				Connection = UIS.InputBegan:Connect(function(i)
					if WhitelistedType[i.UserInputType] then
						BindButton.Text = WhitelistedType[i.UserInputType];
						spawn(function()
							wait(0.1)
							Default = i.UserInputType;
							Type = "UserInputType";
						end);
					elseif i.KeyCode ~= Enum.KeyCode.Unknown then
						BindButton.Text = tostring(i.KeyCode):gsub("Enum.KeyCode.", "");
						spawn(function()
							wait(0.1)
							Default = i.KeyCode;
							Type = "KeyCode";
						end);
					else
						warn("Exception: " .. i.UserInputType .. " " .. i.KeyCode);
					end;


					Connection:Disconnect();
				end);
			end);

			UIS.InputBegan:Connect(function(i)
				if (Default == i.UserInputType or Default == i.KeyCode) then
					Callback(Default);
				end;
			end);


		end

		function section:NewLabel(Name,Setting)
			local TextColor = Color3.fromRGB(255,255,255)
			local BGColor = Color3.fromRGB(20,20,20)
			if Setting then 
				TextColor = Setting.TextColor

				BGColor = Setting.BGColor
			end


			local LabelFrame = Instance.new("Frame")
			local LabelIcon = Instance.new("ImageLabel")
			local LabelText = Instance.new("TextLabel")


			LabelFrame.Name = "LabelFrame"
			LabelFrame.Parent = Sectioncontainer
			LabelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelFrame.BackgroundTransparency = 1.000
			LabelFrame.Position = UDim2.new(0, 0, 6.75, 0)
			LabelFrame.Size = UDim2.new(1, 0, 0, 25)
			LabelFrame.AutomaticSize = Enum.AutomaticSize.Y

			LabelIcon.Name = "LabelIcon"
			LabelIcon.Parent = LabelFrame
			LabelIcon.Active = true
			LabelIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelIcon.BackgroundTransparency = 1.000
			LabelIcon.Position = UDim2.new(0.0250000004, 0, 0, 0)
			LabelIcon.Selectable = true
			LabelIcon.Size = UDim2.new(1, -10, 1, 0)
			LabelIcon.ZIndex = 0
			LabelIcon.Image = "rbxassetid://3570695787"
			LabelIcon.ImageColor3 = BGColor
			LabelIcon.ScaleType = Enum.ScaleType.Slice
			LabelIcon.SliceCenter = Rect.new(100, 100, 100, 100)
			LabelIcon.SliceScale = 0.020

			LabelText.Name = "LabelText"
			LabelText.Parent = LabelIcon
			LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.BackgroundTransparency = 1.000
			LabelText.Size = UDim2.new(1, 0, 1, 0)
			LabelText.Font = Enum.Font.GothamBold
			LabelText.TextColor3 = TextColor
			LabelText.TextSize = 14.000
			LabelText.Text = Name
			LabelText.TextWrapped = true
			

			local textlabels = {}

			function textlabels:ChangeText(Text)
				LabelText.Text = Text
			end 

			function textlabels:ChangeTextColor(Color)
				LabelText.TextColor3 = Color
			end

			function textlabels:ChangeBGColor(Color)
				LabelIcon.ImageColor3 = Color
			end

			return textlabels

		end

		return section

	end

	return windows
end

local s1t = {
	['KIET'] = false;
	['DINH'] = true; 
	['Anh rau'] = false;
}

local w1 = library:CreateWindows('Test')
local sec1 = w1:NewSection("TestFolder")
local tog1 = sec1:NewToggle('Toggle',function(v) warn(v) end)
local b1 = sec1:NewButton('Button',function() print('abcxyz') end)
local s1 = sec1:NewSlider('Slider',{Min = 0,Max = 1,Precise = true},function(v) warn(v) end)
local s2 = sec1:NewSlider('Slider',{Min = 10,Max = 100,Precise = false},function(v) warn(v) end)
local d1 = sec1:NewDropdown('Dropdown',{List = {'bucadasdf','B','C','D','E','F','G','H'},Search = false},function(v) warn(v) end)
local d2 = sec1:NewDropdown('Dropdown (S)',{List = {'bucadasdf','B','C','D','E','F','G','H'},Search = true},function(v) warn(v) end)
local d3 = sec1:NewDropdown('Dropdown (S)',{List = s1t,Search = true,Toggled = true},function(i,v) warn(i,' = ', tostring(v)) end)
local t1 = sec1:NewBox('Number Only',{Number = true},function(v) warn(v) end)
local t2 = sec1:NewBox('TextBox',{Number = false},function(v) warn(v) end)
local bi1 = sec1:NewBind('Keybind',{Key = Enum.KeyCode.R},function() toggleduiaa() end)
local label1 = sec1:NewLabel('Cyber UI Library')