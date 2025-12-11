if getgenv().UI_Loaded then 
	print('Script already Executed')
	return
end

getgenv().UI_Loaded = true

local Library = {}
local TweenService = game:GetService('TweenService')

local function tweentran(obj,style,tran_value)
	if string.lower(style) == 'bg' then
		TweenService:Create(obj,TweenInfo.new(.25),{BackgroundTransparency = tran_value}):Play()
	elseif string.lower(style) == 'img' then 
		TweenService:Create(obj,TweenInfo.new(.25),{ImageTransparency = tran_value}):Play()
	elseif string.lower(style) == 'text' then 
		TweenService:Create(obj,TweenInfo.new(.25),{TextTransparency = tran_value}):Play()
	end
end

Library.NotiUI = Instance.new("ScreenGui")
Library.NotiUI.Name = 'SeaHub[Noti]'

Library.NotiUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if is_synapse_function then
	syn.protect_gui(Library.NotiUI)
	Library.NotiUI.Parent = game:GetService('CoreGui')
else 
	Library.NotiUI.Parent = game:GetService('CoreGui')
end

--Button Effect
function Library.addbuttoneffect()
	local mouse = game:GetService("Players").LocalPlayer:GetMouse();
	local buoi = Drawing.new("Circle")
	buoi.Visible = true
	buoi.Radius = 10
	buoi.Filled = true
	buoi.Color = getgenv().CustomUI and getgenv().CustomUI.Misc.ClickEffect or Color3.fromRGB(255, 255, 255)
	buoi.Position = Vector2.new(mouse.X, mouse.Y + 35)


	local BuoiFolder = Instance.new('Folder')
	BuoiFolder.Parent = Library.gui
	BuoiFolder.Name = 'Game nhu buoi'

	local a = Instance.new('NumberValue')
	a.Value = 10
	a.Parent = BuoiFolder
	a.Name = 'Rua nhu buoi'

	local b = Instance.new('NumberValue')
	b.Value = 1
	b.Parent = BuoiFolder
	b.Name = 'Rua nhu buoi 2'

	TweenService:Create(a,TweenInfo.new(.25),{Value = 30}):Play()
	TweenService:Create(b,TweenInfo.new(.25),{Value = 0}):Play()


	a:GetPropertyChangedSignal('Value'):Connect(function()
		buoi.Radius = a.Value
	end)


	b:GetPropertyChangedSignal('Value'):Connect(function()
		buoi.Transparency = b.Value
	end)

	wait(.5)
	BuoiFolder:Destroy()
end

Library.Stroke = {}

local CacFolder = Instance.new('Folder',Library.gui)
CacFolder.Name = 'Cac Folder'
local ColorVal = Instance.new('Color3Value',CacFolder)
ColorVal.Name = 'Clmm'

coroutine.wrap(function()
	while true do
		for i = 0, 359 do
			ColorVal.Value = Color3.fromHSV(i / 359, 1, 1);
			wait();
		end;
	end;
end)();



ColorVal.Changed:Connect(function(colur)
	for i,v in next, Library.Stroke do 
		v.Color = colur
	end
end)


function Library.DestroyUI()
	getgenv().UI_Loaded = false
	Library.gui:Destroy()
end

local NotiContainer = Instance.new("Frame")
local NotiContainerListLayout = Instance.new("UIListLayout")

NotiContainer.Name = "Container"
NotiContainer.Parent = Library.NotiUI
NotiContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotiContainer.BackgroundTransparency = 1.000
NotiContainer.Size = UDim2.new(1, -10, 1, -10)

NotiContainerListLayout.Parent = NotiContainer
NotiContainerListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
NotiContainerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotiContainerListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotiContainerListLayout.Padding = UDim.new(0, 7)

function Library.AddNoti(Setting)

	local TitleText = Setting.Title or 'Sea Hub Premium'
	local Text = Setting.Text or 'None'
	local Time = Setting.Time or 1


	local connn = Instance.new("Frame")
	local con = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local UICorner = Instance.new("UICorner")
	local line = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local label = Instance.new("TextLabel")
	local Icon = Instance.new("ImageLabel")


	connn.Name = "connn"
	connn.Parent = NotiContainer
	connn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	connn.BackgroundTransparency = 1.000
	connn.Size = UDim2.new(0, 400, 0, 70)


	con.Name = "con"
	con.Parent = connn
	con.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Notification.Background or Color3.fromRGB(67, 67, 67)
	con.BackgroundTransparency = 1.000
	con.BorderSizePixel = 0
	con.Size = UDim2.new(0, 400, 1, -4)

	local Top = Instance.new("ImageLabel")
	Top.Name = "Top"
	Top.Parent = con
	Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Top.BackgroundTransparency = 1.000
	Top.Position = UDim2.new(0, 0, 0, 0)
	Top.Size = UDim2.new(1, 0, 0, 30)
	Top.Image = "rbxassetid://4550094255"
	Top.ScaleType = Enum.ScaleType.Slice
	Top.ImageColor3 = getgenv().CustomUI and getgenv().CustomUI.Notification.TopBackground or Color3.fromRGB(42, 42, 42)
	Top.SliceCenter = Rect.new(4, 4, 296, 296)

	UICorner.Parent = con

	line.Name = "line"
	line.Parent = con
	line.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Notification.CooldownLine or Color3.fromRGB(108, 167, 255)
	line.BackgroundTransparency = 1.000
	line.BorderSizePixel = 0
	line.Position = UDim2.new(0, 2, 1, -6)
	line.Size = UDim2.new(1, -4, 0, 6)

	UICorner_2.Parent = line

	label.Name = "label"
	label.Parent = con
	label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label.BackgroundTransparency = 1.000
	label.Position = UDim2.new(0, 5, 0, 38)
	label.Size = UDim2.new(1, -5, 1, -41)
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Notification.BackgroundText or Color3.fromRGB(255, 255, 255)
	label.TextSize = 14.000
	label.TextTransparency = 1.000
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Top
	label.RichText = true

	Icon.Name = "Icon"
	Icon.Parent = con
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.Position = UDim2.new(0, 5, 0, 0)
	Icon.Size = UDim2.new(0, 25, 0, 25)
	Icon.Image = getgenv().CustomUI and getgenv().CustomUI.Notification.Logo or "rbxassetid://6248942117"
	Icon.ImageTransparency = 1.000

	Title.Name = "Title"
	Title.Parent = con
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0, 35, 0, 4)
	Title.Size = UDim2.new(0, 200, 0, 25)
	Title.Font = Enum.Font.GothamBold
	Title.Text = TitleText
	Title.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Notification.TopBackgroundText or Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextTransparency = 1.000
	Title.TextXAlignment = Enum.TextXAlignment.Left
	
	
		label.Text = tostring(Text)

		tweentran(con,'bg',0)
		tweentran(Icon,'img',0)
		tweentran(Title,'text',0)
		tweentran(line,'bg',0)
		tweentran(label,'text',0)

		local close = TweenService:Create(line,TweenInfo.new(Time),{Size = UDim2.new(0, 0,0, 6)})

		close:Play()

		close.Completed:Connect(function()
		TweenService:Create(con,TweenInfo.new(0.5),{Position = UDim2.new(0, 0,0, NotiContainer.AbsoluteSize.Y)}):Play()
			wait(0.5)
			connn:Destroy()
		end)
end

function Library.AddNotiQuestion(Setting,Callback)

	local TitleText = Setting.Title or 'Sea Hub Premium'
	local Text = Setting.Text or 'None'
	local Time = Setting.Time or 120

	local YesText = Setting.Yes or 'Yes'
	local NoText = Setting.No or 'No'

	local asd = Instance.new("Frame")
	local con = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local line = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local label = Instance.new("TextLabel")
	local no = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local notext = Instance.new("TextLabel")
	local nobutton = Instance.new("TextButton")
	local yes = Instance.new("Frame")
	local yesimg = Instance.new("ImageLabel")
	local UICorner_4 = Instance.new("UICorner")
	local yesbutton = Instance.new("TextButton")
	local Icon = Instance.new("ImageLabel")
	local Title = Instance.new("TextLabel")

	local YesLabel = Instance.new('TextLabel')

	local NoLabel = Instance.new('TextLabel')

	asd.Name = Text..'Noti'
	asd.Parent = NotiContainer
	asd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	asd.BackgroundTransparency = 1.000
	asd.Size = UDim2.new(0, 400, 0, 100)

	con.Name = "con"
	con.Parent = asd
	con.BackgroundColor3 = getgenv().CustomUI.Notification.Background or Color3.fromRGB(67, 67, 67)
	con.BackgroundTransparency = 1.000
	con.BorderSizePixel = 0
	con.Size = UDim2.new(0, 400, 1, -4)

	local Top = Instance.new("ImageLabel")
	Top.Name = "Top"
	Top.Parent = con
	Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Top.BackgroundTransparency = 1.000
	Top.Position = UDim2.new(0, 0, 0, 0)
	Top.Size = UDim2.new(1, 0, 0, 30)
	Top.Image = "rbxassetid://4550094255"
	Top.ScaleType = Enum.ScaleType.Slice
	Top.ImageColor3 = getgenv().CustomUI.Notification.TopBackground or Color3.fromRGB(42, 42, 42)
	Top.SliceCenter = Rect.new(4, 4, 296, 296)

	UICorner.Parent = con

	line.Name = "line"
	line.Parent = con
	line.BackgroundColor3 = getgenv().CustomUI.Notification.CooldownLine or Color3.fromRGB(108, 167, 255)
	line.BackgroundTransparency = 1.000
	line.BorderSizePixel = 0
	line.Position = UDim2.new(0, 2, 1, -6)
	line.Size = UDim2.new(1, -4, 0, 6)

	UICorner_2.Parent = line

	label.Name = "label"
	label.Parent = con
	label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label.BackgroundTransparency = 1.000
	label.Position = UDim2.new(0, 5, 0, 38)
	label.Size = UDim2.new(1, -5, 1, -60)
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = getgenv().CustomUI.Notification.BackgroundText or Color3.fromRGB(255, 255, 255)
	label.TextSize = 14.000
	label.TextTransparency = 1.000
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Top
	label.RichText = true

	no.Name = "no"
	no.Parent = con
	no.BackgroundColor3 = getgenv().CustomUI.Notification.QuestionBackground or Color3.fromRGB(42, 42, 42)
	no.BackgroundTransparency = 1.000
	no.Position = UDim2.new(0, 110, 0, 70)
	no.Size = UDim2.new(0, 100, 0, 20)

	UICorner_3.CornerRadius = UDim.new(0, 4)
	UICorner_3.Parent = no

	notext.Name = "notext"
	notext.Parent = no
	notext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	notext.BackgroundTransparency = 1.000
	notext.Position = UDim2.new(0, 0, 0, -1)
	notext.Size = UDim2.new(0, 20, 0, 20)
	notext.Font = Enum.Font.GothamSemibold
	notext.Text = "x"
	notext.TextColor3 = getgenv().CustomUI.Notification.QuestionNoSymbol or Color3.fromRGB(255, 80, 83)
	notext.TextScaled = true
	notext.TextSize = 14.000
	notext.TextTransparency = 1.000
	notext.TextWrapped = true

	NoLabel.Name = "NoLabel"
	NoLabel.Parent = no
	NoLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NoLabel.BackgroundTransparency = 1.000
	NoLabel.Position = UDim2.new(0, 30, 0, 0)
	NoLabel.Size = UDim2.new(1, -30, 1, 0)
	NoLabel.Font = Enum.Font.GothamBold
	NoLabel.Text = NoText
	NoLabel.TextColor3 = getgenv().CustomUI.Notification.QuestionText or Color3.fromRGB(255, 255, 255)
	NoLabel.TextSize = 14.000
	NoLabel.TextTransparency = 0
	NoLabel.TextWrapped = true
	NoLabel.TextXAlignment = Enum.TextXAlignment.Left

	nobutton.Name = "nobutton"
	nobutton.Parent = no
	nobutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	nobutton.BackgroundTransparency = 1.000
	nobutton.Size = UDim2.new(1, 0, 1, 0)
	nobutton.Font = Enum.Font.SourceSans
	nobutton.Text = ""
	nobutton.TextColor3 = Color3.fromRGB(0, 0, 0)
	nobutton.TextSize = 14.000

	yes.Name = "yes"
	yes.Parent = con
	yes.BackgroundColor3 = getgenv().CustomUI.Notification.QuestionBackground or Color3.fromRGB(42, 42, 42)
	yes.BackgroundTransparency = 1.000
	yes.BorderSizePixel = 0
	yes.Position = UDim2.new(0, 5, 0, 70)
	yes.Size = UDim2.new(0, 100, 0, 20)

	yesimg.Name = "yesimg"
	yesimg.Parent = yes
	yesimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	yesimg.BackgroundTransparency = 1.000
	yesimg.Position = UDim2.new(0, 3, 0, 0)
	yesimg.Size = UDim2.new(0, 20, 0, 20)
	yesimg.Image = "rbxassetid://4555411759"
	yesimg.ImageColor3 = getgenv().CustomUI.Notification.QuestionYesSymbol or Color3.fromRGB(85, 255, 127)
	yesimg.ImageTransparency = 1.000

	YesLabel.Name = "YesLabel"
	YesLabel.Parent = yes
	YesLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	YesLabel.BackgroundTransparency = 1.000
	YesLabel.Position = UDim2.new(0, 30, 0, 0)
	YesLabel.Size = UDim2.new(1, -30, 1, 0)
	YesLabel.Font = Enum.Font.GothamBold
	YesLabel.Text = YesText
	YesLabel.TextColor3 = getgenv().CustomUI.Notification.QuestionText or Color3.fromRGB(255, 255, 255)
	YesLabel.TextSize = 14.000
	YesLabel.TextTransparency = 0
	YesLabel.TextWrapped = true
	YesLabel.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_4.CornerRadius = UDim.new(0, 4)
	UICorner_4.Parent = yes

	yesbutton.Name = "yesbutton"
	yesbutton.Parent = yes
	yesbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	yesbutton.BackgroundTransparency = 1.000
	yesbutton.Size = UDim2.new(1, 0, 1, 0)
	yesbutton.Font = Enum.Font.SourceSans
	yesbutton.Text = ""
	yesbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
	yesbutton.TextSize = 14.000

	Icon.Name = "Icon"
	Icon.Parent = con
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.Position = UDim2.new(0, 5, 0, 0)
	Icon.Size = UDim2.new(0, 25, 0, 25)
	Icon.Image = getgenv().CustomUI and getgenv().CustomUI.Notification.Logo or "rbxassetid://6248942117"
	Icon.ImageTransparency = 1.000

	Title.Name = "Title"
	Title.Parent = con
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0, 35, 0, 4)
	Title.Size = UDim2.new(0, 200, 0, 25)
	Title.Font = Enum.Font.GothamBold
	Title.Text = TitleText
	Title.TextColor3 = getgenv().CustomUI.Notification.TopBackgroundText or Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextTransparency = 1.000
	Title.TextXAlignment = Enum.TextXAlignment.Left
	
	label.Text = Text

	tweentran(con,'bg',0)
	tweentran(Icon,'img',0)
	tweentran(Title,'text',0)
	tweentran(line,'bg',0)
	tweentran(label,'text',0)
	tweentran(yes,'bg',0)
	tweentran(yesimg,'img',0)
	tweentran(no,'bg',0)
	tweentran(notext,'text',0)
	
	local close = TweenService:Create(line,TweenInfo.new(Time),{Size = UDim2.new(0, 0,0, 6)})

	close:Play()
	
	local function close_noti()
		TweenService:Create(con,TweenInfo.new(0.5),{Position = UDim2.new(0, 0,0, NotiContainer.AbsoluteSize.Y)}):Play()
		wait(0.02)
		asd:Destroy()
	end

	close.Completed:Connect(function()
		close_noti()
	end)
	
	yesbutton.MouseButton1Click:Connect(function()
		close_noti()
		wait(.5)
		Callback()
	end)
	
	nobutton.MouseButton1Click:Connect(function()
		close_noti()
	end)

	nobutton.MouseButton1Click:Connect(function()
		Library.addbuttoneffect()
	end)

	yesbutton.MouseButton1Click:Connect(function()
		Library.addbuttoneffect()
	end)
end

function Library.CreateMain(MainName)
    --Drag function, by Ririchi / Inori
    local UIS = game:GetService("UserInputService");
	local Heartbeat = game:GetService("RunService").Heartbeat;

	local dragger = {};

	do
		local mouse        = game:GetService("Players").LocalPlayer:GetMouse();
		local inputService = game:GetService('UserInputService');
		local heartbeat    = game:GetService("RunService").Heartbeat;

		function dragger.new(frame, secondlol)
			frame.Active = true;
			secondlol.Active = true;

			secondlol.MouseLeave:connect(function()
				IsInFrame = false;
			end)

			secondlol.MouseEnter:connect(function()
				IsInFrame = true;
			end)

			local input = secondlol.InputBegan:connect(function(key)
				if key.UserInputType == Enum.UserInputType.MouseButton1 and IsInFrame then
					local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
					while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						pcall(function()
							frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Linear', 0.01, true);
						end)
					end
				end
			end)
		end
    end


	--Create ScreenUI
	Library.gui = Instance.new("ScreenGui")
	Library.gui.Parent = game:WaitForChild('CoreGui')
	Library.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Library.gui.Name = 'SeaHub[Main]'
	Library.toggled = true
	if is_synapse_function then 
		syn.protect_gui(Library.gui)
		Library.gui.Parent = game:GetService('CoreGui')
	else
		Library.gui.Parent = game:GetService('CoreGui')
	end

	--Toggle UI Function
	function  Library.ToggledUI()
		Library.toggled = not Library.toggled
		Library.gui.Enabled = Library.toggled
	end

	local Top = Instance.new("ImageLabel")
	local MainContainer = Instance.new("Frame")
	local MainContainer_Corner = Instance.new("UICorner")
	local TopContainer = Instance.new("ImageLabel")
	local Title = Instance.new("TextLabel")
	local IconRua = Instance.new("ImageLabel")


	Top.Name = "Top"
	Top.Parent = Library.gui
	Top.AnchorPoint = Vector2.new(0.5, 0.5)
	Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Top.BackgroundTransparency = 1.000
	Top.Position = UDim2.new(0.5, 0, 0.3, 0)
	Top.Size = UDim2.new(0, 700, 0, 25)
	Top.Image = "rbxassetid://4550094255"
	Top.ScaleType = Enum.ScaleType.Slice
	Top.SliceCenter = Rect.new(4, 4, 296, 296)

	dragger.new(Top,Top)

	MainContainer.Name = "MainContainer"
	MainContainer.Parent = Top
	MainContainer.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.UI.Background or Color3.fromRGB(67, 67, 67)
	MainContainer.BorderSizePixel = 0
	MainContainer.Position = UDim2.new(0, 0, -0.0140002444, 0)
	MainContainer.Size = UDim2.new(1, 0, 0, 400)

	MainContainer_Corner.CornerRadius = UDim.new(0, 4)
	MainContainer_Corner.Name = "MainContainer_Corner"
	MainContainer_Corner.Parent = MainContainer

	TopContainer.Name = "TopContainer"
	TopContainer.Parent = MainContainer
	TopContainer.AnchorPoint = Vector2.new(0.5, 0)
	TopContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopContainer.BackgroundTransparency = 1.000
	TopContainer.Position = UDim2.new(0.5, 0, 0, 0)
	TopContainer.Size = UDim2.new(0, 700, 0, 25)
	TopContainer.Image = "rbxassetid://4550094255"
	TopContainer.ImageColor3 = getgenv().CustomUI and getgenv().CustomUI.UI.TopBackground or Color3.fromRGB(42, 42, 42)
	TopContainer.ScaleType = Enum.ScaleType.Slice
	TopContainer.SliceCenter = Rect.new(4, 4, 296, 296)

	Title.Name = "Title"
	Title.Parent = TopContainer
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0, 35, 0, 0)
	Title.Size = UDim2.new(1, -35, 1, 0)
	Title.Font = Enum.Font.GothamBold
	Title.Text = MainName
	Title.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.UI.TopBackgroundText or Color3.fromRGB(255, 255, 255)
	Title.TextSize = 20.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	IconRua.Name = "IconRua"
	IconRua.Parent = TopContainer
	IconRua.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	IconRua.BackgroundTransparency = 1.000
	IconRua.Position = UDim2.new(0, 5, 0, 0)
	IconRua.Size = UDim2.new(0, 20, 0, 20)
	IconRua.Image = getgenv().CustomUI and getgenv().CustomUI.UI.Logo or "rbxassetid://6248942117"

	
	local PageContainers = Instance.new("Frame")

	--local UIPageLayout = Instance.new("UIPageLayout")

	PageContainers.Name = "PageContainers"
	PageContainers.Parent = MainContainer
	PageContainers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PageContainers.BackgroundTransparency = 1.000
	PageContainers.ClipsDescendants = true
	PageContainers.Position = UDim2.new(0, 4, 0, 65)
	PageContainers.Size = UDim2.new(1, -10, 0, 330)

	--[[
	UIPageLayout.Parent = PageContainers
	UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
	UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
	UIPageLayout.Padding = UDim.new(0, 10)
	UIPageLayout.TweenTime = 0.500
	]]

	local Page_Section = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Page_Container = Instance.new("ScrollingFrame")
	local PageUI_ListLayout = Instance.new("UIListLayout")

	Page_Section.Name = "Page_Section"
	Page_Section.Parent = MainContainer
	Page_Section.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.UI.PageBackground or Color3.fromRGB(42, 42, 42)
	Page_Section.BorderSizePixel = 0
	Page_Section.Position = UDim2.new(0, 4, 0, 30)
	Page_Section.Size = UDim2.new(1, -10, 0, 30)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Page_Section

	Page_Container.Name = "Page_Container"
	Page_Container.Parent = Page_Section
	Page_Container.Active = true
	Page_Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Page_Container.BackgroundTransparency = 1.000
	Page_Container.BorderSizePixel = 0
	Page_Container.Position = UDim2.new(0, 5, 0, 5)
	Page_Container.Size = UDim2.new(1, -10, 1, -5)
	Page_Container.BottomImage = ""
	Page_Container.CanvasSize = UDim2.new(0, 700, 0, 0)
	Page_Container.ScrollBarThickness = 0
	Page_Container.TopImage = ""

	PageUI_ListLayout.Name = "Tab_ListLayout"
	PageUI_ListLayout.Parent = Page_Container
	PageUI_ListLayout.FillDirection = Enum.FillDirection.Horizontal
	PageUI_ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	PageUI_ListLayout.Padding = UDim.new(0, 5)

	PageUI_ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		local absoluteSize = PageUI_ListLayout.AbsoluteContentSize
		Page_Container.CanvasSize = UDim2.new(0,absoluteSize.X + 10,0,0)
	end)

	local main_function = {}
	local LayoutOrder = - 1

	function main_function.AddPage(PageName)

		LayoutOrder = LayoutOrder +1;

		local PageFrame = Instance.new("Frame")
		local Button = Instance.new("TextButton")


		PageFrame.Name = PageName.."PageFrame"
		PageFrame.Parent = Page_Container
		PageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageFrame.BackgroundTransparency = 1.000
		PageFrame.Size = UDim2.new(0, 85, 0, 20)

		Button.Name = "Button"
		Button.Parent = PageFrame
		Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button.BackgroundTransparency = 1.000
		Button.Size = UDim2.new(1, 0, 1, 0)
		Button.Font = Enum.Font.GothamBold
		Button.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.UI.PageBackgroundText or Color3.fromRGB(124, 124, 124)
		Button.TextSize = 14.000
		Button.Text = PageName

		PageFrame.Size = UDim2.new(0, 10 + Button.TextBounds.X, 0, 20)

		local PageObject = Instance.new("ScrollingFrame")
		local UICorner = Instance.new("UICorner")
		local InObject = Instance.new("Frame")
		local Left = Instance.new("Frame")
		local Right = Instance.new("Frame")
		local Page_UIListLayout = Instance.new("UIListLayout")


		PageObject.Name = PageName.."_PageObject"
		PageObject.Parent = PageContainers
		PageObject.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.UI.PageBackground or Color3.fromRGB(42, 42, 42)
		PageObject.BorderSizePixel = 0
		PageObject.Position = UDim2.new(0, 4, 0, 65)
		PageObject.Selectable = false
		PageObject.Size = UDim2.new(1, 0, 1, 0)
		PageObject.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		PageObject.CanvasSize = UDim2.new(0, 0, 0, 0)
		PageObject.ScrollBarThickness = 5
		PageObject.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		PageObject.LayoutOrder = LayoutOrder

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = PageObject

		InObject.Name = "InObject"
		InObject.Parent = PageObject
		InObject.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		InObject.BackgroundTransparency = 1.000
		InObject.Position = UDim2.new(0, 5, 0, 5)
		InObject.Size = UDim2.new(1, -10, 1, -10)

		Left.Name = "Left"
		Left.Parent = InObject
		Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Left.BackgroundTransparency = 1.000
		Left.Size = UDim2.new(0.497999996, 0, 1, 0)

		local LeftListLayout = Instance.new("UIListLayout")

		LeftListLayout.Parent = Left
		LeftListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		LeftListLayout.Padding = UDim.new(0, 5)

		LeftListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			local absoluteSize = LeftListLayout.AbsoluteContentSize
			Left.Size = UDim2.new(0.497999996,0,0,absoluteSize.Y + 10)
		end)

		Right.Name = "Right"
		Right.Parent = InObject
		Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Right.BackgroundTransparency = 1.000
		Right.Size = UDim2.new(0.497999996, 0, 0, 0)

		local RightListLayout = Instance.new("UIListLayout")

		RightListLayout.Parent = Right
		RightListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		RightListLayout.Padding = UDim.new(0, 5)

		RightListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			local absoluteSize = RightListLayout.AbsoluteContentSize
			Right.Size = UDim2.new(0.497999996,0,0,absoluteSize.Y + 10)
		end)

		Page_UIListLayout.Parent = InObject
		Page_UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		Page_UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		Page_UIListLayout.Padding = UDim.new(0, 4)

		
		Page_UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			local absoluteSize = Page_UIListLayout.AbsoluteContentSize
			PageObject.CanvasSize = UDim2.new(0,0,0,absoluteSize.Y)
		end)

		for i,v in pairs(Page_Container:GetChildren()) do
			if not (v:IsA('UIListLayout')) then
				if i == 2 then 
					v.Button.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.UI.PageBackgroundSelectedText or Color3.fromRGB(255, 255, 255)
				end
			end
		end

		Button.MouseButton1Click:Connect(function()
			if PageFrame.Name == PageName.."PageFrame" then

				for i,v in pairs(Page_Container:GetChildren()) do
					if not (v:IsA('UIListLayout')) then
						if v.Name == PageName.."PageFrame" then 
							TweenService:Create(v.Button,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{TextColor3 = getgenv().CustomUI and getgenv().CustomUI.UI.PageBackgroundSelectedText or Color3.fromRGB(255, 255, 255)}):Play()
						else 
							TweenService:Create(v.Button,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{TextColor3 = getgenv().CustomUI and getgenv().CustomUI.UI.PageBackgroundText or Color3.fromRGB(124, 124, 124)}):Play()
						end
					end 
				end

				for i,v in pairs(PageContainers:GetChildren()) do
					if not (v:IsA('UIPageLayout')) and not (v:IsA('UICorner')) then
						if v.Name == PageName.."_PageObject" then
							--UIPageLayout:JumpToIndex(PageObject.LayoutOrder)
							PageObject.Visible = true
						else
							v.Visible = false
						end
					end
				end
			end
		end)

			local page_function = {}
			local countsec = 0
			local section_parent = Left
			function page_function.AddSection(SectionName)
				countsec = countsec + 1

				if countsec % 2 == 1 then section_parent = Left else section_parent = Right end

				local Section_ = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local SectionListLayout = Instance.new("UIListLayout")
				local TopSection = Instance.new("Frame")
				local SectionTitle = Instance.new("TextLabel")


				Section_.Name = "Section_"..SectionName
				Section_.Parent = section_parent
				Section_.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Section.SectionBackground or Color3.fromRGB(63, 63, 63)
				Section_.Size = UDim2.new(1, 0, 0, 100)

				UICorner.Parent = Section_

				SectionListLayout.Name = "SectionListLayout"
				SectionListLayout.Parent = Section_
				SectionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				SectionListLayout.Padding = UDim.new(0, 5)

				SectionListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					local absoluteSize = SectionListLayout.AbsoluteContentSize
					Section_.Size = UDim2.new(1,0,0,absoluteSize.Y+10)
				end)

				TopSection.Name = "TopSection"
				TopSection.Parent = Section_
				TopSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TopSection.BackgroundTransparency = 1.000
				TopSection.Size = UDim2.new(1, 0, 0, 25)

				SectionTitle.Name = "SectionTitle"
				SectionTitle.Parent = TopSection
				SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SectionTitle.BackgroundTransparency = 1.000
				SectionTitle.Position = UDim2.new(0, 10, 0, 0)
				SectionTitle.Size = UDim2.new(1, -10, 1, 0)
				SectionTitle.Font = Enum.Font.GothamBold
				SectionTitle.Text = SectionName
				SectionTitle.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Section.SectionBackgroundText or Color3.fromRGB(108, 167, 255)
				SectionTitle.TextSize = 16.000
				SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
				SectionTitle.RichText = true

				local section_function = {}

					function section_function.AddToggle(ToggleName,Setting,Callback)

						local DefaultValue = Setting.DefaultValue or false

						local Callback = Callback or function() end

						local InformationText = Setting.Information or 'Rua bi gay'

						if DefaultValue and Callback then Callback(DefaultValue) end

						local ToggleFrame = Instance.new("Frame")
						local ToggleInFrame = Instance.new("Frame")
						local ToggleButton = Instance.new("TextButton")
						local ToggleTitle = Instance.new("TextLabel")
						local ToggleBox = Instance.new("Frame")
						local Box = Instance.new("Frame")
						local check = Instance.new("ImageLabel")
						local InformationImage = Instance.new("ImageLabel")
						local InformationButton = Instance.new("TextButton")
						local InfromationFrame = Instance.new("Frame")
						local InformationLabel = Instance.new("TextLabel")
						local UICorner = Instance.new("UICorner")


						ToggleFrame.Name = ToggleName.."ToggleFrame"
						ToggleFrame.Parent = Section_
						ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ToggleFrame.BackgroundTransparency = 1.000
						ToggleFrame.ClipsDescendants = true
						ToggleFrame.Position = UDim2.new(0, 0, 0.300000012, 0)
						ToggleFrame.Size = UDim2.new(1, 0, 0, 30)

						ToggleInFrame.Name = "ToggleInFrame"
						ToggleInFrame.Parent = ToggleFrame
						ToggleInFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ToggleInFrame.BackgroundTransparency = 1.000
						ToggleInFrame.Size = UDim2.new(1, 0, 0, 30)

						ToggleButton.Name = "ToggleButton"
						ToggleButton.Parent = ToggleInFrame
						ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ToggleButton.BackgroundTransparency = 1.000
						ToggleButton.Size = UDim2.new(1, 0, 1, 0)
						ToggleButton.Font = Enum.Font.GothamBold
						ToggleButton.Text = ""
						ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
						ToggleButton.TextSize = 14.000

						ToggleTitle.Name = "ToggleTitle"
						ToggleTitle.Parent = ToggleButton
						ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ToggleTitle.BackgroundTransparency = 1.000
						ToggleTitle.Position = UDim2.new(0, 40, 0, 0)
						ToggleTitle.Size = UDim2.new(1, -40, 1, 0)
						ToggleTitle.Font = Enum.Font.GothamBold
						ToggleTitle.Text = ToggleName
						ToggleTitle.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Toggle.ToggleText or Color3.fromRGB(255, 255, 255)
						ToggleTitle.TextSize = 14.000
						ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

						ToggleBox.Name = "ToggleBox"
						ToggleBox.Parent = ToggleInFrame
						ToggleBox.AnchorPoint = Vector2.new(0, 0.5)
						ToggleBox.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Toggle.ToggleBoxBackground or Color3.fromRGB(42, 42, 42)
						ToggleBox.BorderSizePixel = 0
						ToggleBox.Position = UDim2.new(0, 10, 0.5, 0)
						ToggleBox.Size = UDim2.new(0, 21, 0, 21)

						Box.Name = "Box"
						Box.Parent = ToggleBox
						Box.AnchorPoint = Vector2.new(0.5, 0.5)
						Box.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Toggle.ToggleBox or Color3.fromRGB(108, 167, 255)
						Box.BackgroundTransparency = 1.000
						Box.BorderSizePixel = 0
						Box.Position = UDim2.new(0.5, 0, 0.5, 0)
						Box.Size = UDim2.new(1, -6, 1, -6)

						check.Name = "check"
						check.Parent = Box
						check.AnchorPoint = Vector2.new(0.5, 0.5)
						check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						check.BackgroundTransparency = 1.000
						check.Position = UDim2.new(0.5, 0, 0.5, 0)
						check.Size = UDim2.new(1, 2, 1, 2)
						check.Image = getgenv().CustomUI and getgenv().CustomUI.Toggle.ToggleCheckLogo or "rbxassetid://4555411759"
						check.ImageTransparency = 1.000
						
						if DefaultValue then 
							local BgTrans = DefaultValue and 0 or 1 
							local ImgTrans = DefaultValue and 0 or 1
							TweenService:Create(Box,TweenInfo.new(.5,Enum.EasingStyle.Quart,Enum.EasingDirection.InOut),{BackgroundTransparency = BgTrans}):Play()
							TweenService:Create(check,TweenInfo.new(.5,Enum.EasingStyle.Quart,Enum.EasingDirection.InOut),{ImageTransparency = BgTrans}):Play()
							if Callback then 
								Callback(DefaultValue)
							end
						end

						ToggleButton.MouseButton1Click:Connect(function()
							Library.addbuttoneffect()
						end)

						ToggleButton.MouseButton1Click:Connect(function()
							DefaultValue = not DefaultValue
							local BgTrans = DefaultValue and 0 or 1 
							local ImgTrans = DefaultValue and 0 or 1
							TweenService:Create(Box,TweenInfo.new(.5,Enum.EasingStyle.Quart,Enum.EasingDirection.InOut),{BackgroundTransparency = BgTrans}):Play()
							TweenService:Create(check,TweenInfo.new(.5,Enum.EasingStyle.Quart,Enum.EasingDirection.InOut),{ImageTransparency = BgTrans}):Play()
							if Callback then Callback(DefaultValue) end
						end)

						local toggle_function = {}

						function toggle_function.SetStage(Stage)
							DefaultValue = Stage
							local BgTrans = DefaultValue and 0 or 1 
							local ImgTrans = DefaultValue and 0 or 1
							TweenService:Create(Box,TweenInfo.new(.5,Enum.EasingStyle.Quart,Enum.EasingDirection.InOut),{BackgroundTransparency = BgTrans}):Play()
							TweenService:Create(check,TweenInfo.new(.5,Enum.EasingStyle.Quart,Enum.EasingDirection.InOut),{ImageTransparency = BgTrans}):Play()
							if Callback then Callback(DefaultValue) end
						end

						return toggle_function

					end

					function section_function.AddLabel(LabelName,Setting)
						local TextColor = Color3.fromRGB(255,255,255)
						local BGColor = Color3.fromRGB(42, 42, 42)
						local TextTrans = 0 
						local BgTrans = 0

						if Setting then 
							TextColor = Setting.TextColor or Color3.fromRGB(255,255,255)
							BGColor = Setting.BGColor or Color3.fromRGB(42, 42, 42)
							TextTrans = Setting.TextTrans or 0
							BgTrans = Setting.BgTrans or 0
						end

						local LabelFrame = Instance.new("Frame")
						local Frame = Instance.new("Frame")
						local LabelText = Instance.new("TextLabel")
						local UICorner = Instance.new("UICorner")

						LabelFrame.Name = LabelName.."LabelFrame"
						LabelFrame.Parent = Section_
						LabelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						LabelFrame.BackgroundTransparency = 1.000
						LabelFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
						LabelFrame.Size = UDim2.new(1, 0, 0, 25)

						Frame.Parent = LabelFrame
						Frame.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Label.LabelBackground or Color3.fromRGB(42, 42, 42)
						Frame.Position = UDim2.new(0, 10, 0, 0)
						Frame.Size = UDim2.new(1, -20, 1, 0)
						Frame.BackgroundTransparency = BgTrans

						LabelText.Name = "LabelText"
						LabelText.Parent = Frame
						LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						LabelText.BackgroundTransparency = 1.000
						LabelText.Position = UDim2.new(0, 10, 0, 0)
						LabelText.Size = UDim2.new(1, -20, 1, 0)
						LabelText.Font = Enum.Font.GothamBold
						LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
						LabelText.TextSize = 14.000
						LabelText.TextXAlignment = Enum.TextXAlignment.Left
						LabelText.Text = LabelName
						LabelText.TextTransparency = TextTrans

						UICorner.CornerRadius = UDim.new(0, 4)
						UICorner.Parent = Frame

						local label_function = {}

						function label_function.SetText(Text)
							LabelText.Text = Text 
						end

						function label_function.SetTextColor(Color)
							LabelText.TextColor3 = Color 
						end 

						function label_function.SetBGColor(Color)
							LabelFrame.BackgroundColor3 = Color
						end


						return label_function

					end

					function section_function.AddButton(ButtonName,Callback)

						local Callback = Callback or function() end

						local ButtonFrame = Instance.new("Frame")
						local Frame = Instance.new("Frame")
						local ButtonTitle = Instance.new("TextLabel")
						local UICorner = Instance.new("UICorner")
						local Button = Instance.new("TextButton")

						ButtonFrame.Name = ButtonName.."ButtonFrame"
						ButtonFrame.Parent = Section_
						ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ButtonFrame.BackgroundTransparency = 1.000
						ButtonFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
						ButtonFrame.Size = UDim2.new(1, 0, 0, 25)

						Frame.Parent = ButtonFrame
						Frame.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Button.ButtonBackground or Color3.fromRGB(108, 167, 255)
						Frame.Position = UDim2.new(0, 10, 0, 0)
						Frame.Size = UDim2.new(1, -20, 1, 0)

						local UIStroke = Instance.new('UIStroke')
						UIStroke.Parent = Frame
						UIStroke.LineJoinMode = Enum.LineJoinMode.Round
						UIStroke.Thickness = 2

						table.insert(Library.Stroke,UIStroke)

						ButtonTitle.Name = "ButtonTitle"
						ButtonTitle.Parent = Frame
						ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ButtonTitle.BackgroundTransparency = 1.000
						ButtonTitle.Position = UDim2.new(0, 10, 0, 0)
						ButtonTitle.Size = UDim2.new(1, -20, 1, 0)
						ButtonTitle.Font = Enum.Font.GothamBold
						ButtonTitle.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Button.ButtonBackgroundText or Color3.fromRGB(255, 255, 255)
						ButtonTitle.TextSize = 14.000
						ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
						ButtonTitle.Text = ButtonName

						UICorner.CornerRadius = UDim.new(0, 4)
						UICorner.Parent = Frame

						Button.Name = "Button"
						Button.Parent = ButtonFrame
						Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000
						Button.Size = UDim2.new(1, 0, 1, 0)
						Button.Font = Enum.Font.SourceSans
						Button.Text = ""
						Button.TextColor3 = Color3.fromRGB(0, 0, 0)
						Button.TextSize = 14.000

						Button.MouseButton1Click:Connect(function()
							Library.addbuttoneffect()
						end)

						Button.MouseButton1Click:Connect(function()
							if Callback then Callback() end
						end)

					end

					function section_function.AddTextBox(TextBoxName,Setting,Callback)
						local Number_Only = Setting.Number or false 

						local DefaultVal = Setting.DefaultValue or '' 

						local Placeholder = Setting.Placeholder or TextBoxName

						local Callback = Callback or function() end

						local TextBoxFrame = Instance.new("Frame")
						local Frame = Instance.new("Frame")
						local UICorner = Instance.new("UICorner")
						local TextBox = Instance.new("TextBox")
						local BoxTitle = Instance.new("TextLabel")


						TextBoxFrame.Name = TextBoxName.."TextBoxFrame"
						TextBoxFrame.Parent = Section_
						TextBoxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextBoxFrame.BackgroundTransparency = 1.000
						TextBoxFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
						TextBoxFrame.Size = UDim2.new(1, 0, 0, 60)

						Frame.Parent = TextBoxFrame
						Frame.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.TextBox.TextBoxBackground or Color3.fromRGB(108, 167, 255)
						Frame.Position = UDim2.new(0, 10, 0, 25)
						Frame.Size = UDim2.new(1, -20, 0, 25)
						Frame.ClipsDescendants = true

						UICorner.CornerRadius = UDim.new(0, 4)
						UICorner.Parent = Frame

						TextBox.Parent = Frame
						TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextBox.BackgroundTransparency = 1.000
						TextBox.Position = UDim2.new(0, 10, 0, 0)
						TextBox.Size = UDim2.new(1, -20, 1, 0)
						TextBox.Font = Enum.Font.GothamBold
						TextBox.PlaceholderColor3 = getgenv().CustomUI and getgenv().CustomUI.TextBox.TextBoxBackgroundText or Color3.fromRGB(221, 221, 221)
						TextBox.Text = ""
						TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextBox.TextSize = 14.000
						TextBox.TextXAlignment = Enum.TextXAlignment.Left
						TextBox.PlaceholderText = Placeholder

						BoxTitle.Name = "BoxTitle"
						BoxTitle.Parent = TextBoxFrame
						BoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						BoxTitle.BackgroundTransparency = 1.000
						BoxTitle.Position = UDim2.new(0, 20, 0, 0)
						BoxTitle.Size = UDim2.new(1, -40, 0, 25)
						BoxTitle.Font = Enum.Font.GothamBold
						BoxTitle.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.TextBox.TextBoxText or Color3.fromRGB(255, 255, 255)
						BoxTitle.TextSize = 14.000
						BoxTitle.TextXAlignment = Enum.TextXAlignment.Left
						BoxTitle.Text = TextBoxName

						local valuecall
						local isbucac = true

						TextBox.Focused:Connect(function() 
						
							Library.addbuttoneffect()

						end)

						TextBox:GetPropertyChangedSignal("Text"):Connect(function()
							if string.len(TextBox.Text) > 45 then
								if isbucac then 
									isbucac = false
									valuecall = TextBox.Text
									game:GetService("RunService").Heartbeat:Wait()
									TextBox.Text = string.match(TextBox.Text,'.............................................').."..."
								end
							else 
								isbucac = true
							end
						end)


						if Number_Only then 
							TextBox:GetPropertyChangedSignal("Text"):Connect(function()
								if tonumber(TextBox.Text) then 
								else 
									TextBox.PlaceholderText = Placeholder
									TextBox.Text = ''
								end
							end)
						end

						TextBox.FocusLost:Connect(function()
							if TextBox.Text ~= '' then
								if isbucac then 
									Callback(TextBox.Text)
								else 
									Callback(valuecall)
								end
							end
						end)

						local textbox_function = {}

						if DefaultVal then
							TextBox.Text = DefaultVal
							Callback(DefaultVal)
						end

						function textbox_function.SetValue(Value)
							TextBox.Text = Value
							Callback(Value)
						end 

						return textbox_function;


					end

					function section_function.AddSlider(SliderName,Setting,Callback)

						local Min_Value = Setting.Min or 0
						local Max_Value = Setting.Max or 100
						local DefaultValue = Setting.DefaultValue or Min_Value
						local Precise = Setting.Precise or false

						local SizeChia = 300

						local Callback = Callback or function() end

						local SliderFrame = Instance.new("Frame")
						local SliderTitle = Instance.new("TextLabel")
						local BoxFrame = Instance.new("Frame")
						local UICorner = Instance.new("UICorner")
						local SliderBox = Instance.new("TextBox")
						local Bar = Instance.new("Frame")
						local UICorner_2 = Instance.new("UICorner")
						local UICorner_3 = Instance.new("UICorner")
						local Inbar = Instance.new("Frame")
						local SliderButton = Instance.new("TextButton")

						SliderFrame.Name = SliderName.."SliderFrame"
						SliderFrame.Parent = Section_
						SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						SliderFrame.BackgroundTransparency = 1.000
						SliderFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
						SliderFrame.Size = UDim2.new(1, 0, 0, 55)

						SliderTitle.Name = "SliderTitle"
						SliderTitle.Parent = SliderFrame
						SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						SliderTitle.BackgroundTransparency = 1.000
						SliderTitle.Position = UDim2.new(0, 20, 0, 0)
						SliderTitle.Size = UDim2.new(1, -100, 0, 25)
						SliderTitle.Font = Enum.Font.GothamBold
						SliderTitle.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Slider.SliderText or Color3.fromRGB(255, 255, 255)
						SliderTitle.TextSize = 14.000
						SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
						SliderTitle.Text = SliderName

						BoxFrame.Name = "BoxFrame"
						BoxFrame.Parent = SliderFrame
						BoxFrame.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Slider.SliderBoxBackground or  Color3.fromRGB(42, 42, 42)
						BoxFrame.BorderSizePixel = 0
						BoxFrame.Position = UDim2.new(0.76187104, 0, 0, 0)
						BoxFrame.Size = UDim2.new(0, 70, 0, 25)

						UICorner.CornerRadius = UDim.new(0, 4)
						UICorner.Parent = BoxFrame

						SliderBox.Name = "SliderBox"
						SliderBox.Parent = BoxFrame
						SliderBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						SliderBox.BackgroundTransparency = 1.000
						SliderBox.Size = UDim2.new(1, 0, 1, 0)
						SliderBox.Font = Enum.Font.GothamBold
						SliderBox.Text = ""
						SliderBox.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Slider.SliderBoxText or Color3.fromRGB(255, 255, 255)
						SliderBox.TextSize = 14.000

						Bar.Name = "Bar"
						Bar.Parent = SliderFrame
						Bar.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Slider.SliderBar or Color3.fromRGB(255, 255, 255)
						Bar.Position = UDim2.new(0, 20, 0, 40)
						Bar.Size = UDim2.new(1, -40, 0, 6)

						UICorner_2.CornerRadius = UDim.new(0, 4)
						UICorner_2.Parent = Bar

						Inbar.Name = "Inbar"
						Inbar.Parent = Bar
						Inbar.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Slider.SliderSelectedBar or Color3.fromRGB(108, 167, 255)
						Inbar.BorderSizePixel = 0
						Inbar.Size = UDim2.new(0, 0, 1, 0)

						UICorner_3.CornerRadius = UDim.new(0, 4)
						UICorner_3.Parent = Inbar

						SliderButton.Name = "SliderButton"
						SliderButton.Parent = Bar
						SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						SliderButton.BackgroundTransparency = 1.000
						SliderButton.Size = UDim2.new(1, 0, 1, 0)
						SliderButton.Font = Enum.Font.SourceSans
						SliderButton.Text = ""
						SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
						SliderButton.TextSize = 14.000

						local mouse = game.Players.LocalPlayer:GetMouse()
						local uis = game:GetService("UserInputService")

						if DefaultValue then 
						if DefaultValue <= Min_Value then DefaultValue = Min_Value elseif DefaultValue >= Max_Value then DefaultValue = Max_Value end
						Inbar.Size = UDim2.new(1 - ((Max_Value - DefaultValue) / (Max_Value - Min_Value)),0, 0, 6)
						SliderBox.Text = DefaultValue
						Callback(DefaultValue)
						end

						SliderButton.MouseButton1Down:Connect(function()
							Library.addbuttoneffect()
						end)

						SliderButton.MouseButton1Down:Connect(function()
							local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))

							pcall(function()
								Callback(value)
								SliderBox.Text = value
							end)
							Inbar.Size = UDim2.new(0, math.clamp(mouse.X - Inbar.AbsolutePosition.X, 0, SizeChia), 0, 6)
							moveconnection = mouse.Move:Connect(function()   
								local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))
								pcall(function()
									Callback(value)
									SliderBox.Text = value
								end)
								Inbar.Size = UDim2.new(0, math.clamp(mouse.X - Inbar.AbsolutePosition.X, 0, SizeChia), 0, 6)
							end)
							releaseconnection = uis.InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Inbar.AbsoluteSize.X) + tonumber(Min_Value))

									pcall(function()
										Callback(value)
										SliderBox.Text = value
									end)
									Inbar.Size = UDim2.new(0, math.clamp(mouse.X - Inbar.AbsolutePosition.X, 0, SizeChia), 0, 6)
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)

						local function GetSliderValue(Value)
							if tonumber(Value) <= Min_Value then
								Inbar.Size = UDim2.new(0,(0 * SizeChia), 0, 6)
								SliderBox.Text = Min_Value
								Callback(tonumber(Min_Value))

							elseif tonumber(Value) >= Max_Value then
								Inbar.Size = UDim2.new(0,(Max_Value  /  Max_Value * SizeChia), 0, 6)
								SliderBox.Text = Max_Value
								Callback(tonumber(Max_Value))
							else
								Inbar.Size = UDim2.new(1 - ((Max_Value - Value) / (Max_Value - Min_Value)),0, 0, 6)
								Callback(tonumber(Value))
							end
						end


						SliderBox.FocusLost:Connect(function()
							GetSliderValue(SliderBox.Text)
						end)


						local slider_function = {}

						function slider_function.SetValue(Value)
							GetSliderValue(Value)
						end

						return slider_function
						
					end

					function section_function.AddDropdown(DropdownName,Setting,Callback)

						local List = Setting.List
						local Search_Setting = Setting.Search or false
						local Selected = Setting.Selected or false
						local DefaultVal = Setting.DefaultValue
						local Callback = Callback or function() end

						local Dropdown = Instance.new("Frame")
						local DropdownFrame = Instance.new("Frame")
						local UICorner = Instance.new("UICorner")
						local InDrop = Instance.new("ScrollingFrame")
						local ListF = Instance.new("Frame")
						local UIListLayout = Instance.new("UIListLayout")
						local TopDrop = Instance.new("ImageLabel")
						local DropTitle = Instance.new("TextLabel")
						local DropButton = Instance.new("TextButton")
						local Dropbox = Instance.new('TextBox')
						local Dropc = Instance.new("ImageLabel")

						Dropdown.Name = DropdownName.."Dropdown"
						Dropdown.Parent = Section_
						Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Dropdown.BackgroundTransparency = 1.000
						Dropdown.Position = UDim2.new(0, 0, 0.242718443, 0)
						Dropdown.Size = UDim2.new(1, 0, 0, 25)

						DropdownFrame.Name = "DropdownFrame"
						DropdownFrame.Parent = Dropdown
						DropdownFrame.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Dropdown.DropdownBackground or Color3.fromRGB(99, 99, 99)
						DropdownFrame.ClipsDescendants = true
						DropdownFrame.Position = UDim2.new(0, 10, 0, 0)
						DropdownFrame.Size = UDim2.new(1, -20, 0, 25)

						UICorner.CornerRadius = UDim.new(0, 4)
						UICorner.Parent = DropdownFrame

						InDrop.Name = "InDrop"
						InDrop.Parent = DropdownFrame
						InDrop.Active = true
						InDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						InDrop.BackgroundTransparency = 1.000
						InDrop.BorderSizePixel = 0
						InDrop.Position = UDim2.new(0, 0, 0, 30)
						InDrop.Size = UDim2.new(1, 0, 1, -30)
						InDrop.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
						InDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
						InDrop.ScrollBarThickness = 3
						InDrop.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

						ListF.Name = "ListF"
						ListF.Parent = InDrop
						ListF.AnchorPoint = Vector2.new(0.5, 0)
						ListF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ListF.BackgroundTransparency = 1.000
						ListF.Position = UDim2.new(0.5, 0, 0, 0)
						ListF.Size = UDim2.new(1, -10, 0, 170)

						UIListLayout.Parent = ListF
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
						UIListLayout.Padding = UDim.new(0, 5)

						UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
							local absoluteSize = UIListLayout.AbsoluteContentSize
							InDrop.CanvasSize = UDim2.new(0, 0, 0, 10 + absoluteSize.Y)
						end)

						TopDrop.Name = "TopDrop"
						TopDrop.Parent = DropdownFrame
						TopDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TopDrop.BackgroundTransparency = 1.000
						TopDrop.Size = UDim2.new(1, 0, 0, 25)
						TopDrop.Image = "rbxassetid://4550094255"
						TopDrop.ImageColor3 = getgenv().CustomUI and getgenv().CustomUI.Dropdown.DropdownTopBackground or Color3.fromRGB(42, 42, 42)
						TopDrop.ScaleType = Enum.ScaleType.Slice
						TopDrop.SliceCenter = Rect.new(4, 4, 296, 296)

						local DropFrame = Instance.new('Frame',TopDrop)
						DropFrame.Size = UDim2.new(1, -35, 0, 25)
						DropFrame.Position = UDim2.new(0, 5, 0, 0)
						DropFrame.BackgroundTransparency = 1 
						DropFrame.ClipsDescendants = true

						if not Search_Setting then

							DropTitle.Name = "DropTitle"
							DropTitle.Parent = DropFrame
							DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							DropTitle.BackgroundTransparency = 1.000
							DropTitle.Position = UDim2.new(0, 0, 0, 0)
							DropTitle.Size = UDim2.new(1, 0, 1, 0)
							DropTitle.Font = Enum.Font.GothamBold
							DropTitle.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Dropdown.DropDownTopBackgroundText or Color3.fromRGB(255, 255, 255)
							DropTitle.TextSize = 14.000
							DropTitle.TextXAlignment = Enum.TextXAlignment.Left
							DropTitle.Text = DropdownName

							DropButton.Name = "DropButton"
							DropButton.Parent = TopDrop
							DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							DropButton.BackgroundTransparency = 1.000
							DropButton.Size = UDim2.new(1, 0, 0, 25)
							DropButton.Font = Enum.Font.SourceSans
							DropButton.Text = ""
							DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
							DropButton.TextSize = 14.000
						else

							Dropbox.Name = "Dropbox"
							Dropbox.Parent = DropFrame
							Dropbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							Dropbox.BackgroundTransparency = 1.000
							Dropbox.Position = UDim2.new(0, 0, 0, 0)
							Dropbox.Size = UDim2.new(1, 0, 1, 0)
							Dropbox.Font = Enum.Font.GothamBold
							Dropbox.TextColor3 = Color3.fromRGB(255, 255, 255)
							Dropbox.TextSize = 14.000
							Dropbox.TextXAlignment = Enum.TextXAlignment.Left
							Dropbox.ClearTextOnFocus = true
							Dropbox.PlaceholderText = DropdownName
							Dropbox.Text = ''
							
						end

						Dropc.Name = "Dropc"
						Dropc.Parent = TopDrop
						Dropc.AnchorPoint = Vector2.new(0, 0.5)
						Dropc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Dropc.BackgroundTransparency = 1.000
						Dropc.Position = UDim2.new(1, -20, 0.5, 0)
						Dropc.Size = UDim2.new(0, 15, 0, 15)
						Dropc.Image = "http://www.roblox.com/asset/?id=6954383209"

						local isbusy = false

						local found = {}

						local searchtable = {}
						
						local function edit()
							for i in pairs(found) do
								found[i] = nil
							end
							for h, l in pairs(ListF:GetChildren()) do
								if not l:IsA("UIListLayout") and not l:IsA("UIPadding") and not l:IsA('UIGridLayout') then
									l.Visible = false
								end
							end
							Dropbox.Text = string.lower(Dropbox.Text)
						end

						local function Search()
							local Results = {}
							for i, v in pairs(searchtable) do
								if string.find(v, Dropbox.Text) then
									table.insert(found, v)
								end
							end
							for a, b in pairs(ListF:GetChildren()) do
								for c, d in pairs(found) do
									if d == b.Name then
										b.Visible = true
									end
								end
							end
						end

						local ListNew = List
						
						local function clear_object_in_list()
							for i,v in next, ListF:GetChildren() do 
								if v:IsA('Frame') then 
									v:Destroy()
								end
							end
						end
						
						local function refreshlist()
							clear_object_in_list()

							searchtable = {}
							
							for i, v in pairs(ListNew) do
								if not Selected then 
								table.insert(searchtable, string.lower(v))
								else 
									table.insert(searchtable, string.lower(i))
								end 
							end
							
							if not Selected then 
								for i,v in pairs (ListNew) do
									
									local Object = Instance.new("Frame")
									local UICorner = Instance.new("UICorner")
									local Button = Instance.new("TextButton")
									local Title = Instance.new("TextLabel")

									Object.Name = string.lower(v)
									Object.Parent = ListF
									Object.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Dropdown.DropdownButtonBackground or Color3.fromRGB(72, 72, 72)
									Object.Size = UDim2.new(1, 0, 0, 20)

									UICorner.CornerRadius = UDim.new(0, 4)
									UICorner.Parent = Object

									Button.Name = "Button"
									Button.Parent = Object
									Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
									Button.BackgroundTransparency = 1.000
									Button.Size = UDim2.new(1, 0, 1, 0)
									Button.Font = Enum.Font.GothamBold
									Button.Text = ""
									Button.TextColor3 = Color3.fromRGB(255, 255, 255)
									Button.TextSize = 14.000

									Title.Name = "Title"
									Title.Parent = Object
									Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
									Title.BackgroundTransparency = 1.000
									Title.Position = UDim2.new(0, 5, 0, 0)
									Title.Size = UDim2.new(1, -5, 1, 0)
									Title.Font = Enum.Font.GothamBold
									Title.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Dropdown.DropdownButtonBackgroundText or Color3.fromRGB(255, 255, 255)
									Title.TextSize = 14.000
									Title.TextXAlignment = Enum.TextXAlignment.Left
									Title.Text = v
									
									Button.MouseButton1Click:Connect(function()


										isbusy = not isbusy

										if Search_Setting then
											Dropbox.PlaceholderText = DropdownName..': '..v
										else
											DropTitle.Text = DropdownName..': '..v
										end

										TweenService:Create(InDrop,TweenInfo.new(.5),{Size = UDim2.new(1, 0,0, 0)}):Play()
										TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = UDim2.new(1,-20 ,0, 25)}):Play()
										local dropsize = isbusy and UDim2.new(1,0 ,0, 215) or UDim2.new(1, 0,0, 25)
										TweenService:Create(Dropdown,TweenInfo.new(.5),{Size = dropsize}):Play()
										local DropCRotation = isbusy and 90 or 0
										TweenService:Create(Dropc,TweenInfo.new(.5),{Rotation = DropCRotation}):Play()

										refreshlist()
										if Callback then 
											Callback(v)
										end

									end)

									Button.MouseButton1Click:Connect(function()
										Library.addbuttoneffect()
									end)

								end
						else 	

								for i,v in pairs (ListNew) do
									
									local cSelected, cnotSelected = getgenv().CustomUI and getgenv().CustomUI.Dropdown.DropdownToggleEnabledBackground or Color3.fromRGB(108, 167, 255), getgenv().CustomUI and getgenv().CustomUI.Dropdown.DropdownToggleDisabledBackground or Color3.fromRGB(255, 65, 65)

									local colorSelecteda = v and cSelected or cnotSelected

									local Object = Instance.new("Frame")
									local UICorner = Instance.new("UICorner")
									local Button = Instance.new("TextButton")
									local Title = Instance.new("TextLabel")

									Object.Name = string.lower(i)
									Object.Parent = ListF
									Object.BackgroundColor3 = colorSelecteda
									Object.Size = UDim2.new(1, 0, 0, 20)

									UICorner.CornerRadius = UDim.new(0, 4)
									UICorner.Parent = Object

									Button.Name = "Button"
									Button.Parent = Object
									Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
									Button.BackgroundTransparency = 1.000
									Button.Size = UDim2.new(1, 0, 1, 0)
									Button.Font = Enum.Font.GothamBold
									Button.Text = ""
									Button.TextColor3 = Color3.fromRGB(255, 255, 255)
									Button.TextSize = 14.000

									Title.Name = "Title"
									Title.Parent = Object
									Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
									Title.BackgroundTransparency = 1.000
									Title.Position = UDim2.new(0, 5, 0, 0)
									Title.Size = UDim2.new(1, -5, 1, 0)
									Title.Font = Enum.Font.GothamBold
									Title.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Dropdown.DropdownToggleBackgroundText or Color3.fromRGB(255, 255, 255)
									Title.TextSize = 14.000
									Title.TextXAlignment = Enum.TextXAlignment.Left
									Title.Text = i

									Button.MouseButton1Click:Connect(function()
										Library.addbuttoneffect()
									end)
									
									Button.MouseButton1Click:Connect(function()
										v = not v 

										local colorSelected = v and cSelected or cnotSelected

										TweenService:Create(Object,TweenInfo.new(.5),{BackgroundColor3 = colorSelected}):Play()

										if Callback then
											Callback(i,v)
											List[i] = v
										end
									end)
								end
							end 		
						end
							
						Dropbox.Changed:Connect(function()
							edit()
							Search()
						end)

						if typeof(DefaultVal) ~= 'table' then
							Callback(DefaultVal)
							if Search_Setting then
                                Dropbox.PlaceholderText = DropdownName..': '..tostring(DefaultVal)
                            else
                                DropTitle.Text = DropdownName..': '..tostring(DefaultVal)
                            end
						elseif Selected then
							for i,v in next, DefaultVal do
								ListNew[i] = v
								Callback(i,v)
							end
						end


						Dropbox.Focused:Connect(function()
							refreshlist()
							isbusy = not isbusy 
							local listsize = isbusy and UDim2.new(1, 0,0, 170) or UDim2.new(1, 0,0, 0)
							local dropframesize = isbusy and UDim2.new(1,-20 ,0, 205) or UDim2.new(1, -20,0, 25)
							local dropsize = isbusy and UDim2.new(1,0 ,0, 215) or UDim2.new(1, 0,0, 25)
							local DropCRotation = isbusy and 90 or 0

							TweenService:Create(Dropc,TweenInfo.new(.5),{Rotation = DropCRotation}):Play()
							TweenService:Create(InDrop,TweenInfo.new(.5),{Size = listsize}):Play()
							TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropframesize}):Play()
							TweenService:Create(Dropdown,TweenInfo.new(.5),{Size = dropsize}):Play()
						end)

						Dropbox.Focused:Connect(function() 
							Library.addbuttoneffect()

						end)

						DropButton.MouseButton1Click:Connect(function()
							Library.addbuttoneffect()
						end)

						DropButton.MouseButton1Click:Connect(function()
							isbusy = not isbusy 
							local listsize = isbusy and UDim2.new(1, 0,0, 170) or UDim2.new(1, 0,0, 0)
							local dropframesize = isbusy and UDim2.new(1,-20 ,0, 205) or UDim2.new(1, -20,0, 25)
							local dropsize = isbusy and UDim2.new(1,0 ,0, 215) or UDim2.new(1, 0,0, 25)
							local DropCRotation = isbusy and 90 or 0

							refreshlist()
							TweenService:Create(Dropc,TweenInfo.new(.5),{Rotation = DropCRotation}):Play()
							TweenService:Create(InDrop,TweenInfo.new(.5),{Size = listsize}):Play()
							TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropframesize}):Play()
							TweenService:Create(Dropdown,TweenInfo.new(.5),{Size = dropsize}):Play()

						end)
						
						local dropdown_function = {}
								function dropdown_function:GetNewList(List)
									
									refreshlist()
									isbusy = false
									local listsize = isbusy and UDim2.new(1, 0,0, 170) or UDim2.new(1, 0,0, 0)
									local dropframesize = isbusy and UDim2.new(1,-20 ,0, 205) or UDim2.new(1, -20,0, 25)
									local dropsize = isbusy and UDim2.new(1,0 ,0, 215) or UDim2.new(1, 0,0, 25)
									local DropCRotation = isbusy and 90 or 0
									TweenService:Create(Dropc,TweenInfo.new(.5),{Rotation = DropCRotation}):Play()
									TweenService:Create(InDrop,TweenInfo.new(.5),{Size = listsize}):Play()
									TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropframesize}):Play()
									TweenService:Create(Dropdown,TweenInfo.new(.5),{Size = dropsize}):Play()
									
									ListNew = {}
									ListNew = List

								end
								
						return dropdown_function
						

					end

					function section_function.AddColorPicker(ColorName,Setting,Callback)

						local Callback = Callback or function() end

						local Colordrop = false 
						local Data = {}
						local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
						local rpgdragging = false
						local valuedragging = false

						local DefaultValue = Setting.DefaultValue or Color3.fromRGB(255,255,255)
						
						local ColorPicker = Instance.new("Frame")
						local ColorTitle = Instance.new("TextLabel")
						local ColorFrame = Instance.new("Frame")
						local UICorner = Instance.new("UICorner")
						local Frame = Instance.new("Frame")
						local RGBFrame = Instance.new("ImageLabel")
						local RGBPicker = Instance.new("TextButton")
						local ValueFrame = Instance.new("ImageLabel")
						local Valuepicker = Instance.new("TextButton")
						local UICorner_2 = Instance.new("UICorner")
						local ColorButton = Instance.new("TextButton")

						ColorPicker.Name = ColorName.."ColorPicker"
						ColorPicker.Parent = Section_
						ColorPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ColorPicker.BackgroundTransparency = 1.000
						ColorPicker.BorderColor3 = Color3.fromRGB(27, 42, 53)
						ColorPicker.Size = UDim2.new(1, 0, 0, 25)

						ColorTitle.Name = "ColorTitle"
						ColorTitle.Parent = ColorPicker
						ColorTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ColorTitle.BackgroundTransparency = 1.000
						ColorTitle.Position = UDim2.new(0, 20, 0, 0)
						ColorTitle.Size = UDim2.new(1, -100, 0, 25)
						ColorTitle.Font = Enum.Font.GothamBold
						ColorTitle.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.ColorPicker.ColorPickerText or Color3.fromRGB(255, 255, 255)
						ColorTitle.TextSize = 14.000
						ColorTitle.TextXAlignment = Enum.TextXAlignment.Left
						ColorTitle.Text = ColorName

						ColorFrame.Name = "ColorFrame"
						ColorFrame.Parent = ColorPicker
						ColorFrame.BackgroundColor3 = DefaultValue
						ColorFrame.BorderSizePixel = 0
						ColorFrame.Position = UDim2.new(1, -110, 0, 0)
						ColorFrame.Size = UDim2.new(0, 100, 0, 25)

						UICorner.CornerRadius = UDim.new(0, 4)
						UICorner.Parent = ColorFrame

						Frame.Parent = ColorPicker
						Frame.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.ColorPicker.ColorPickerBackground or Color3.fromRGB(99, 99, 99)
						Frame.BorderSizePixel = 0
						Frame.ClipsDescendants = true
						Frame.Position = UDim2.new(0, 10, 0, 30)
						Frame.Size = UDim2.new(1, -20, 0, 0)

						RGBFrame.Name = "RGBFrame"
						RGBFrame.Parent = Frame
						RGBFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						RGBFrame.BorderSizePixel = 0
						RGBFrame.Position = UDim2.new(0, 5, 0, 5)
						RGBFrame.Size = UDim2.new(0, 270, 0, 140)
						RGBFrame.Image = "rbxassetid://4018903152"

						RGBPicker.Name = "RGBPicker"
						RGBPicker.Parent = RGBFrame
						RGBPicker.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
						RGBPicker.BorderSizePixel = 0
						RGBPicker.Position = UDim2.new(-6.10947609e-07, 0, 0, 0)
						RGBPicker.Size = UDim2.new(0, 6, 0, 6)
						RGBPicker.Font = Enum.Font.SourceSans
						RGBPicker.Text = ""
						RGBPicker.TextColor3 = Color3.fromRGB(0, 0, 0)
						RGBPicker.TextSize = 14.000

						ValueFrame.Name = "ValueFrame"
						ValueFrame.Parent = Frame
						ValueFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
						ValueFrame.BorderSizePixel = 0
						ValueFrame.Position = UDim2.new(1, -35, 0, 5)
						ValueFrame.Size = UDim2.new(0, 30, 0, 140)
						ValueFrame.Image = "rbxassetid://4019265005"
						ValueFrame.ImageColor3 = DefaultValue

						Valuepicker.Name = "Valuepicker"
						Valuepicker.Parent = ValueFrame
						Valuepicker.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.ColorPicker.ColorPickerValuePicker or Color3.fromRGB(255, 255, 255)
						Valuepicker.BorderSizePixel = 0
						Valuepicker.Size = UDim2.new(1, 0, 0, 6)
						Valuepicker.Font = Enum.Font.SourceSans
						Valuepicker.Text = ""
						Valuepicker.TextColor3 = Color3.fromRGB(0, 0, 0)
						Valuepicker.TextSize = 14.000
						Valuepicker.AutoButtonColor = false

						UICorner_2.CornerRadius = UDim.new(0, 4)
						UICorner_2.Parent = Frame

						ColorButton.Name = "ColorButton"
						ColorButton.Parent = ColorPicker
						ColorButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ColorButton.BackgroundTransparency = 1.000
						ColorButton.Size = UDim2.new(1, 0, 0, 25)
						ColorButton.Font = Enum.Font.SourceSans
						ColorButton.Text = ""
						ColorButton.TextColor3 = Color3.fromRGB(0, 0, 0)
						ColorButton.TextSize = 14.000

						ColorButton.MouseButton1Click:Connect(function()
							Library.addbuttoneffect()
						end)

						if DefaultValue then Callback(DefaultValue) end

						ColorButton.MouseButton1Click:Connect(function()
							Colordrop = not Colordrop
							local sizedrop =  Colordrop and UDim2.new(1, -20,0, 150) or UDim2.new(1, -20,0, 0)
							local sizedrop2 = Colordrop and UDim2.new(1, 0,0, 185) or UDim2.new(1, 0,0, 30)
							TweenService:Create(Frame,TweenInfo.new(.5),{Size = sizedrop}):Play()
							TweenService:Create(ColorPicker,TweenInfo.new(.5),{Size = sizedrop2}):Play()
						end)
						
						RGBFrame.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								rpgdragging = true;
							end;
						end);
						
						RGBFrame.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								rpgdragging = false;
							end;
						end);
						
						ValueFrame.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								valuedragging = true;
							end;
						end)
						
						ValueFrame.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								valuedragging = false;
							end;
						end);
						
						game:GetService("UserInputService").InputChanged:Connect(function(input)
							if rpgdragging and input.UserInputType == Enum.UserInputType.MouseMovement then
								RGBPicker.Position = UDim2.new(math.clamp((input.Position.X - RGBFrame.AbsolutePosition.X) / RGBFrame.AbsoluteSize.X, 0, 1), 0, math.clamp((input.Position.Y - RGBFrame.AbsolutePosition.Y) / RGBFrame.AbsoluteSize.Y, 0, 1), 0);
								ColorFrame.BackgroundColor3 = Color3.fromHSV(RGBPicker.Position.X.Scale, 1 - RGBPicker.Position.Y.Scale, 1 - Valuepicker.Position.Y.Scale);
								ValueFrame.ImageColor3 = Color3.fromHSV(RGBPicker.Position.X.Scale, 1 - RGBPicker.Position.Y.Scale, 1);
								Callback(ColorFrame.BackgroundColor3);
							elseif valuedragging and input.UserInputType == Enum.UserInputType.MouseMovement then
								Valuepicker.Position = UDim2.new(0, 0, math.clamp((input.Position.Y - ValueFrame.AbsolutePosition.Y) / ValueFrame.AbsoluteSize.Y, 0, 1), 0);
								ColorFrame.BackgroundColor3 = Color3.fromHSV(RGBPicker.Position.X.Scale, 1 - RGBPicker.Position.Y.Scale, 1 - Valuepicker.Position.Y.Scale);
								ValueFrame.ImageColor3 = Color3.fromHSV(RGBPicker.Position.X.Scale, 1 - RGBPicker.Position.Y.Scale, 1);
								Callback(ColorFrame.BackgroundColor3);
							end;
						end);
						

					end

					function section_function.AddKeybind(KeybindName,Setting,Callback)

						local Callback = Callback or function() end
						local keycodename = Setting.KeyDefault or Setting.Key or Setting.Default
						local Default = Setting.KeyDefault or Setting.Key or Setting.Default
						local Type = tostring(Default):match("UserInputType") and "UserInputType" or "KeyCode"
						keycodename = tostring(keycodename):gsub("Enum.UserInputType.", "")
						keycodename = tostring(keycodename):gsub("Enum.KeyCode.", "")
						
						local Keybind = Instance.new("Frame")
						local KeybindTitle = Instance.new("TextLabel")
						local KeybindFrame = Instance.new("Frame")
						local UICorner = Instance.new("UICorner")
						local BindButton = Instance.new("TextButton")

						Keybind.Name = KeybindName.."Keybind"
						Keybind.Parent = Section_
						Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Keybind.BackgroundTransparency = 1.000
						Keybind.BorderColor3 = Color3.fromRGB(27, 42, 53)
						Keybind.Size = UDim2.new(1, 0, 0, 25)

						KeybindTitle.Name = "KeybindTitle"
						KeybindTitle.Parent = Keybind
						KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						KeybindTitle.BackgroundTransparency = 1.000
						KeybindTitle.Position = UDim2.new(0, 20, 0, 0)
						KeybindTitle.Size = UDim2.new(1, -100, 0, 25)
						KeybindTitle.Font = Enum.Font.GothamBold
						KeybindTitle.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Keybind.KeybindText or Color3.fromRGB(255, 255, 255)
						KeybindTitle.TextSize = 14.000
						KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left
						KeybindTitle.Text = KeybindName

						KeybindFrame.Name = "KeybindFrame"
						KeybindFrame.Parent = Keybind
						KeybindFrame.BackgroundColor3 = getgenv().CustomUI and getgenv().CustomUI.Keybind.KeybindBoxBackground or Color3.fromRGB(42, 42, 42)
						KeybindFrame.BorderSizePixel = 0
						KeybindFrame.Position = UDim2.new(1, -110, 0, 0)
						KeybindFrame.Size = UDim2.new(0, 100, 0, 25)

						UICorner.CornerRadius = UDim.new(0, 4)
						UICorner.Parent = KeybindFrame

						BindButton.Parent = KeybindFrame
						BindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						BindButton.BackgroundTransparency = 1.000
						BindButton.Size = UDim2.new(1, 0, 1, 0)
						BindButton.Font = Enum.Font.GothamBold
						BindButton.TextColor3 = getgenv().CustomUI and getgenv().CustomUI.Keybind.KeybindBoxText or Color3.fromRGB(255, 255, 255)
						BindButton.TextSize = 14.000
						BindButton.Text = tostring(Default):gsub("Enum.KeyCode.", "");

						local WhitelistedType = {
							[Enum.UserInputType.MouseButton1] = "Mouse1";
							[Enum.UserInputType.MouseButton2] = "Mouse2";
							[Enum.UserInputType.MouseButton3] = "Mouse3";
						};

						BindButton.MouseButton1Click:Connect(function()
							Library.addbuttoneffect()
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


					return section_function

			end

			return page_function

	end

	return main_function
	

end
-------------------------------------------------------- SCRIPT --------------------------------------------------------

Title = Library.CreateMain('Sea Hub Premium - GAME NAME')

Page1 = Title.AddPage('Page 1')
Section11 = Page1.AddSection('Section 1')
LibTextBox = Section11.AddTextBox('Text Box Text', {Number = false, DefaultValue = nil, Placeholder = 'Text here'}, function(v)
	Library.AddNoti({Title = 'Sea Hub Premium', Text = v, Time = 5})
end)
--[[
	-- Set Value
	LibTextBox.SetValue("New Textbox Value")
]]
Section11.AddTextBox('Text Box Number', {Number = true, DefaultValue = nil, Placeholder = 'Number here'}, function(v)
	Library.AddNoti({Title = 'Sea Hub Premium', Text = v, Time = 5})
end)
LibToggle = Section11.AddToggle('Toggle', {DefaultValue = false}, function(v)
	Library.AddNoti({Title = 'Sea Hub Premium', Text = v, Time = 5})
end)
--[[
	-- Set Stage (Set Value) Toggle
	LibToggle.SetStage(false)
	LibToggle.SetStage(true)
]]
Section11.AddButton('Button', function()
	Library.AddNoti({Title = 'Sea Hub Premium', Text = 'Cum inside anime girl', Time = 5})
end)
LibSlider = Section11.AddSlider('Slider', {Min = 10, Max = 100, DefaultValue = 3, Precise = false}, function(v)
    Library.AddNoti({Title = 'Sea Hub Premium', Text = v, Time = 5})
end)
--[[
	-- Set Value
	LibSlider.SetValue(420)
]]
Section11.AddSlider('Slider Precise', {Min = 10, Max = 100, DefaultValue = 69, Precise = true}, function(v)
    Library.AddNoti({Title = 'Sea Hub Premium', Text = v, Time = 5})
end)
LibDropdown = Section11.AddDropdown('Dropdown', {List = {
	'Dropdown 1 bu cac quai zattttt dit me may',
	'Dropdown 2',
	'Dropdown 3',
	'Dropdown 4',
	'Dropdown 5',
	'Dropdown 6'
}, Search = false, Selected = false, DefaultValue = nil}, function(v)
    Library.AddNoti({Title = 'Sea Hub Premium', Text = v, Time = 5})
end)
--[[
	-- Dropdown get new list (table)
    droplist = {
		'Drop 1',
		'Drop 2'
	}
	LibDropdown:GetNewList(droplist)
]]
Section11.AddDropdown('Dropdown Search', {List = {
	'Dropdown 1',
	'Dropdown 2',
	'Dropdown 3',
	'Dropdown 4',
	'Dropdown 5',
	'Dropdown 6'
}, Search = true, Selected = false, DefaultValue = nil}, function(v)
    Library.AddNoti({Title = 'Sea Hub Premium', Text = v, Time = 5})
end)
DropdownToggle = {
    ['Dropdown 1'] = false,
    ['Dropdown 2'] = false,
    ['Dropdown 3'] = false,
    ['Dropdown 4'] = false,
    ['Dropdown 5'] = false,
    ['Dropdown 6'] = false
}
DropdownToggleDefaultValue = {
    ['Dropdown 1'] = false,
    ['Dropdown 2'] = true,
    ['Dropdown 3'] = false,
    ['Dropdown 4'] = true,
    ['Dropdown 5'] = false,
    ['Dropdown 6'] = true
}
Section11.AddDropdown('Dropdown Selected', {List = DropdownToggle, Search = false, Selected = true, DefaultValue = DropdownToggleDefaultValue}, function(i, v)
	if v == true then
	    Library.AddNoti({Title = 'Sea Hub Premium', Text = (i .. ' ' .. tostring(v)), Time = 5})
	else
		Library.AddNoti({Title = 'Sea Hub Premium', Text = i .. ' false' , Time = 5})
	end
end)
Section11.AddColorPicker('Color Picker', {DefaultValue = Color3.fromRGB(0, 255, 0)}, function(v)
	Library.AddNoti({Title = 'Sea Hub Premium', Text = v, Time = 5})
end)
Section12 = Page1.AddSection('Section 2')
Section12.AddButton('Button', function()
	
local Dev = {
    38079729,
}
 for i, v in next, Dev do
        if (v == "") then continue end;
        local res = game.HttpService:JSONDecode(game:HttpGet("https://api.roblox.com/users/" .. v .. "/onlinestatus/"));
        if (res.IsOnline) then
            Library.AddNoti({Title = 'Sea Hub Premium', Text =  '<font color="rgb(255, 80, 83)">'..game.Players:GetNameFromUserIdAsync(v)..'</font> is online', Time = 5})
        end;
    end;
end)
LibLabel = Section12.AddLabel("Label", {TextColor = Color3.fromRGB(255, 255, 255), BGColor = Color3.fromRGB(42, 42, 42), TextTrans = 0, BgTrans = 0})
--[[
	-- Label Set Text
    LibLabel.SetText("New Label Text")

	-- Label Set Text Color
    LibLabel.SetTextColor(Color3.fromRGB(0, 255, 0))
	
	-- Label BG (BackGround) Color 
    LibLabel.SetBGColor(Color3.fromRGB(0, 0, 255))
]]

Page2 = Title.AddPage('Page 2')
Section21 = Page2.AddSection('Section 1')
Section21.AddKeybind('Toggle GUI', {Key = Enum.KeyCode.RightControl}, function()
	Library.ToggledUI()
end)
Section21.AddButton('Destroy GUI', function()
	Library.DestroyUI()
end)