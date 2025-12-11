getgenv().Occho = {}
getgenv().UI_Color = {
    ['Main'] = {
        ['Main Color'] = Color3.fromRGB(131, 181, 255);
        ['Text Color'] = Color3.fromRGB(230, 230, 230);
        ['Image Icon'] = "rbxassetid://6248942117"; -- Default Logo
        ['Button Effect'] = Color3.fromRGB(230, 230, 230);
    };
    ['Noti'] = {
        ['Main Color'] = Color3.fromRGB(131, 181, 255);
        ['Title Color'] = Color3.fromRGB(230, 230, 230);
        ['Image Icon'] = "rbxassetid://6248942117"; -- Default Logo
        ['Text Color'] = Color3.fromRGB(230, 230, 230);
    };
    ['Page'] = {
        ['Page Selected Color'] = Color3.fromRGB(131, 181, 255);
        ['Page Search Color'] = Color3.fromRGB(131, 181, 255);
    };
    ['Custom Theme'] = {
        ['Custom Theme Search Color'] = Color3.fromRGB(131, 181, 255);
        ['Checkbox Color'] = Color3.fromRGB(131, 181, 255);
        ['Checked Color'] = Color3.fromRGB(230, 230, 230);
        ['Line Color'] = Color3.fromRGB(131, 181, 255);
        ['Underline Color'] = Color3.fromRGB(131, 181, 255);
    };
    ['Section'] = {
        ['Underline Color'] = Color3.fromRGB(131, 181, 255);
        ['Text Color'] = Color3.fromRGB(131, 181, 255);
    };
    ['Toggle'] = {
        ['Main Color'] = Color3.fromRGB(131, 181, 255);
        ['Background Color'] = Color3.fromRGB(43, 43, 43);
        ['Checkbox Color'] = Color3.fromRGB(131, 181, 255);
        ['Checked Color'] = Color3.fromRGB(230, 230, 230);
        ['Title Color'] = Color3.fromRGB(230, 230, 230);
        ['Desc Color'] = Color3.fromRGB(185, 185, 185);

    };
    ['Button'] = {
        ['Main Color'] = Color3.fromRGB(131, 181, 255);
        ['Text Color'] = Color3.fromRGB(230, 230, 230);
    };
    ['Label'] = {
        ['Main Color'] = Color3.fromRGB(101, 152, 220);
        ['Text Color'] = Color3.fromRGB(230, 230, 230);
    };
    ['Dropdown'] = {
        ['Main Color'] = Color3.fromRGB(90, 90, 90);
        ['Text Color'] = Color3.fromRGB(230, 230, 230);
        ['Icon Color'] = Color3.fromRGB(230, 230, 230);
		['Button Color'] = Color3.fromRGB(90, 90, 90);
        ['Selected Color'] = Color3.fromRGB(131, 181, 255);
    };
    ['Bind'] = {
        ['Background Color'] = Color3.fromRGB(43, 43, 43);
        ['Text Color'] = Color3.fromRGB(230, 230, 230);
        ['Key Color'] = Color3.fromRGB(230, 230, 230);
        ['Bind Color'] = Color3.fromRGB(90, 90, 90);
    },
    ['Box'] = {
        ['Background Color'] = Color3.fromRGB(43, 43, 43);
        ['Box Color'] = Color3.fromRGB(90, 90, 90);
        ['Title Color'] = Color3.fromRGB(230, 230, 230);
        ['Text Color'] = Color3.fromRGB(230, 230, 230);
        ['Placeholder Color'] = Color3.fromRGB(178, 178, 178);
        ['Line Color'] = Color3.fromRGB(131, 181, 255);
    };
    ['Slider'] = {
        ['Background Color'] = Color3.fromRGB(43, 43, 43);
        ['Box Color'] = Color3.fromRGB(90, 90, 90);
        ['Title Color'] = Color3.fromRGB(230, 230, 230);
        ['Value Color'] = Color3.fromRGB(230, 230, 230);
        ['Barr Color'] = Color3.fromRGB(75, 75, 75);
        ['Bar Active Color'] = Color3.fromRGB(131, 181, 255);
        ['Bar Color'] = Color3.fromRGB(59, 82, 115);
    }
}
local currcolor = {}
local Library = {};
local Library_Function = {}
local TweenService = game:GetService('TweenService')
local uis = game:GetService("UserInputService")

function Library_Function.Destroy()
    Library_Function.Gui:Destroy();
	Library_Function.NotiGui:Destroy();
end

--Button Effect
function Library_Function.ButtonEffect()
	local mouse = game:GetService("Players").LocalPlayer:GetMouse();
	local buttoneffect = Drawing.new("Circle")
	buttoneffect.Visible = true
	buttoneffect.Radius = 10
	buttoneffect.Filled = true
	buttoneffect.Color = getgenv().ButtonEffect
	buttoneffect.Position = Vector2.new(mouse.X, mouse.Y + 35)


	local BuoiFolder = Instance.new('Folder')
	BuoiFolder.Parent = Library_Function.gui
	BuoiFolder.Name = 'Game nhu buoi'

	local a = Instance.new('NumberValue')
	a.Value = 10
	a.Parent = BuoiFolder
	a.Name = 'Rua nhu buoi'

	local b = Instance.new('NumberValue')
	b.Value = 1
	b.Parent = BuoiFolder
	b.Name = 'Rua nhu buoi 2'

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

Library_Function.GetIMG = function(url)
    local File = 'SynAsset ['
    local returnimage = "rbxassetid://6248942117"
    if string.find(url, "rbxassetid://") then
        returnimage = url
    else
        pcall(function()
            if url and type(url) == 'string' and tostring(game:HttpGet(url)):find('PNG') then
                for i = 1, 5 do
                    File = tostring(File..string.char(math.random(65, 122)))
                end
                File = File..'].png'
                writefile(File, game:HttpGet(url))
                coroutine.wrap(function()
                    wait(5)
                    if isfile(File) then
                        delfile(File)
                    end
                end)()
                returnimage = getsynasset(File)
            end
        end)
    end
    return returnimage
end


Library_Function.Gui = Instance.new('ScreenGui')
Library_Function.Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Library_Function.Gui.Name = 'Sea Hub Premium GUI'

if BackgroundVideo then
	getgenv().ReadyForGuiLoaded = false
	spawn(function()
		Library_Function.Gui.Enabled = false
		repeat wait()
		until getgenv().ReadyForGuiLoaded
		Library_Function.Gui.Enabled = true
	end)
end

Library_Function.NotiGui = Instance.new('ScreenGui')
Library_Function.NotiGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Library_Function.NotiGui.Name = 'Sea Hub Premium Notification'


local NotiContainer = Instance.new("Frame")
local NotiList = Instance.new("UIListLayout")


NotiContainer.Name = "NotiContainer"
NotiContainer.Parent = Library_Function.NotiGui
NotiContainer.AnchorPoint = Vector2.new(1, 1)
NotiContainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
NotiContainer.BackgroundTransparency = 1.000
NotiContainer.Position = UDim2.new(1, -5, 1, -5)
NotiContainer.Size = UDim2.new(0, 350, 1, -10)

NotiList.Name = "NotiList"
NotiList.Parent = NotiContainer
NotiList.SortOrder = Enum.SortOrder.LayoutOrder
NotiList.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotiList.Padding = UDim.new(0, 5)


if syn.protect_gui then 
	--syn.protect_gui(Library_Function.Gui)
    --syn.protect_gui(Library_Function.NotiGui)
	Library_Function.Gui.Parent = game:GetService('CoreGui')
    Library_Function.NotiGui.Parent = game:GetService('CoreGui')
end



function Library_Function.Getcolor(color)
	return {math.floor(color.r*255),math.floor(color.g*255),math.floor(color.b*255)}
end
getgenv().GuiToggled = false
function Library_Function.ToggledUI()
    getgenv().GuiToggled = not getgenv().GuiToggled
    Library_Function.Gui.Enabled = getgenv().GuiToggled
end

function Library_Function.CreateNoti(Setting)
	local TitleName = Setting.Title or ""; 
	local Desc = Setting.Desc; 
	local Timeshow = Setting.ShowTime or 10;

	local NotiFrame = Instance.new("Frame")
	local Noticontainer = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Topnoti = Instance.new("Frame")
	local Ruafimg = Instance.new("ImageLabel")
	local RuafimgCorner = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local CloseContainer = Instance.new("Frame")
	local CloseImage = Instance.new("ImageLabel")
	local TextButton = Instance.new("TextButton")
	local TextLabel_2 = Instance.new("TextLabel")

	NotiFrame.Name = "NotiFrame"
	NotiFrame.Parent = NotiContainer
	NotiFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	NotiFrame.BackgroundTransparency = 1.000
	NotiFrame.ClipsDescendants = true
	NotiFrame.Position = UDim2.new(0, 0, 0.865191162, 0)
	NotiFrame.Size = UDim2.new(1, 0, 0, 100)

	Noticontainer.Name = "Noticontainer"
	Noticontainer.Parent = NotiFrame
	Noticontainer.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	Noticontainer.Position = UDim2.new(1, 0, 0, 0)
	Noticontainer.Size = UDim2.new(1, 0, 1, 0)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Noticontainer

	Topnoti.Name = "Topnoti"
	Topnoti.Parent = Noticontainer
	Topnoti.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	Topnoti.BackgroundTransparency = 1.000
	Topnoti.Position = UDim2.new(0, 0, 0, 5)
	Topnoti.Size = UDim2.new(1, 0, 0, 25)

	Ruafimg.Name = "Ruafimg"
	Ruafimg.Parent = Topnoti
	Ruafimg.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	Ruafimg.BackgroundTransparency = 1.000
	Ruafimg.Position = UDim2.new(0, 10, 0, 0)
	Ruafimg.Size = UDim2.new(0, 25, 0, 25)
	Ruafimg.Image = getgenv().UI_Color['Noti']['Image Icon']
    table.insert(getgenv().Occho, Ruafimg)
    

	RuafimgCorner.CornerRadius = UDim.new(1, 0)
	RuafimgCorner.Name = "RuafimgCorner"
	RuafimgCorner.Parent = Ruafimg

	TextLabel.Parent = Topnoti
	TextLabel.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0, 40, 0, 0)
	TextLabel.Size = UDim2.new(1, -40, 1, 0)
	TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = "<font color=\"rgb("..tostring(Library_Function.Getcolor(getgenv().UI_Color['Noti']['Main Color'])[1])..','..tostring(Library_Function.Getcolor(getgenv().UI_Color['Noti']['Main Color'])[2])..','..tostring(Library_Function.Getcolor(getgenv().UI_Color['Noti']['Main Color'])[3])..")\">Sea Hub Premium</font> "..TitleName
	TextLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.RichText = true

	CloseContainer.Name = "CloseContainer"
	CloseContainer.Parent = Topnoti
	CloseContainer.AnchorPoint = Vector2.new(1, 0.5)
	CloseContainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	CloseContainer.BackgroundTransparency = 1.000
	CloseContainer.Position = UDim2.new(1, -4, 0.5, 0)
	CloseContainer.Size = UDim2.new(0, 22, 0, 22)

	CloseImage.Name = "CloseImage"
	CloseImage.Parent = CloseContainer
	CloseImage.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	CloseImage.BackgroundTransparency = 1.000
	CloseImage.Size = UDim2.new(1, 0, 1, 0)
	CloseImage.Image = "rbxassetid://3926305904"
	CloseImage.ImageRectOffset = Vector2.new(284, 4)
	CloseImage.ImageRectSize = Vector2.new(24, 24)

	TextButton.Parent = CloseContainer
	TextButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	TextButton.BackgroundTransparency = 1.000
	TextButton.Size = UDim2.new(1, 0, 1, 0)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.Text = ""
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextSize = 14.000

	if Desc then
        TextLabel_2.Name = 'Bu cac tao ne'
        TextLabel_2.Parent = Noticontainer
        TextLabel_2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        TextLabel_2.BackgroundTransparency = 1.000
        TextLabel_2.Position = UDim2.new(0, 10, 0, 35)
        TextLabel_2.Size = UDim2.new(1, -15, 1, -40)
        TextLabel_2.Font = Enum.Font.GothamBold
        TextLabel_2.Text = Desc
        TextLabel_2.TextColor3 = Color3.fromRGB(230, 230, 230)
        TextLabel_2.TextSize = 14.000
        TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel_2.RichText = true
    end

	local function remove()
		TweenService:Create(Noticontainer,TweenInfo.new(.25),{Position = UDim2.new(1,0,0,0)}):Play()
		wait(.25)
		NotiFrame:Destroy()
	end

	TweenService:Create(Noticontainer,TweenInfo.new(.25),{Position = UDim2.new(0,0,0,0)}):Play()

	TextButton.MouseEnter:Connect(function()
		TweenService:Create(CloseImage, TweenInfo.new(.25),{ImageColor3 = getgenv().UI_Color['Noti']['Main Color']}):Play()
	end)

	TextButton.MouseLeave:Connect(function()
		TweenService:Create(CloseImage, TweenInfo.new(.25),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
	end)

	TextButton.MouseButton1Click:Connect(function()
		spawn(function() Library_Function.ButtonEffect() end)
		wait(.25)
		remove()
	end)

	spawn(function()
		wait(Timeshow)
		remove()
	end)


end


function Library.CreateMain(Setting)

    local MainTitleText = tostring(Setting.Title) or "Sea Hub Premium"
    local MainDesc = Setting.Desc or ""

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
        uis.InputChanged:Connect(function(input)
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

    local Main = Instance.new("Frame")
    local maingui = Instance.new("ImageLabel")
    local MainCorner = Instance.new("UICorner")
    local TopMain = Instance.new("Frame")
    local Ruafimg = Instance.new("ImageLabel")
    local TextLabel = Instance.new("TextLabel")
    local PageControl = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local ControlList = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local ControlTitle = Instance.new("TextLabel")
    local MainPage = Instance.new("Frame")
    local UIPage = Instance.new("UIPageLayout")
    local SettionMain = Instance.new("Frame")
    local SettionButton = Instance.new("TextButton")
    local SettingIcon = Instance.new("ImageLabel")
    local Concacontainer = Instance.new("Frame")
    local Concacmain = Instance.new("Frame")
    local Concacmain1 = Instance.new("Frame")
    local Concacpage = Instance.new("UIPageLayout")

    local MainContainer

    Main.Name = "Main"
    Main.Parent = Library_Function.Gui
    Main.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
    Main.BackgroundTransparency = 1.000
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.Size = UDim2.new(0, 629, 0, 359)

    makeDraggable(Main, Main)

    maingui.Name = "maingui"
    maingui.Parent = Main
    maingui.AnchorPoint = Vector2.new(0.5, 0.5)
    maingui.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    maingui.BackgroundTransparency = 1.000
    maingui.Position = UDim2.new(0.5, 0, 0.5, 0)
    maingui.Selectable = true
    maingui.Size = UDim2.new(1, 30, 1, 30)
    maingui.Image = "rbxassetid://8068653048"
    maingui.ScaleType = Enum.ScaleType.Slice
    maingui.SliceCenter = Rect.new(15, 15, 175, 175)
    maingui.SliceScale = 1.300
    maingui.ImageColor3 = getgenv().UI_Color['Main']['Main Color']
    table.insert(getgenv().Occho, maingui)

    if BackgroundVideo then
        if getgenv().UI_Color['Custom Style']['Video'] then
            MainContainer = Instance.new("VideoFrame")  
            local url = BackgroundVideo
            writefile("friend.webm", syn.request({Url=url}).Body)
            local sus = isfile("friend.webm")
            if sus then
                MainContainer.Name = "MainContainer"
                MainContainer.Parent = Main
                MainContainer.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                MainContainer.Size = UDim2.new(1, 0, 1, 0)
                MainContainer.Video = getsynasset("friend.webm")
                MainContainer.Looped = true
                MainContainer:Play()
                wait()
                delfile('friend.webm')
            end
        else
            MainContainer = Instance.new("ImageLabel")
            MainContainer.Name = "MainContainer"
            MainContainer.Parent = Main
            MainContainer.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
            MainContainer.BackgroundTransparency = 1
            MainContainer.Size = UDim2.new(1, 0, 1, 0)
            MainContainer.Image = BackgroundVideo
        end
		getgenv().ReadyForGuiLoaded = true
    else
        MainContainer = Instance.new("Frame")
        MainContainer.Name = "MainContainer"
        MainContainer.Parent = Main
        MainContainer.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
        MainContainer.Size = UDim2.new(1, 0, 1, 0)
    end
    
    MainCorner.CornerRadius = UDim.new(0, 4)
    MainCorner.Name = "MainCorner"
    MainCorner.Parent = MainContainer

    Concacontainer.Name = "Concacontainer"
    Concacontainer.Parent = MainContainer
    Concacontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Concacontainer.BackgroundTransparency = 1.000
    Concacontainer.ClipsDescendants = true
    Concacontainer.Position = UDim2.new(0, 0, 0, 30)
    Concacontainer.Size = UDim2.new(1, 0, 1, -30)
    
    Concacmain.Name = "Concacmain"
    Concacmain.Parent = Concacontainer
    Concacmain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Concacmain.BackgroundTransparency = 1.000
    Concacmain.Selectable = true
    Concacmain.Size = UDim2.new(1, 0, 1, 0)
    
    Concacmain1.Name = "Concacmain1"
    Concacmain1.Parent = Concacontainer
    Concacmain1.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    Concacmain1.LayoutOrder = 1
    Concacmain1.Selectable = true
    Concacmain1.Size = UDim2.new(1, 0, 1, 0)

    if BackgroundVideo then Concacmain1.BackgroundTransparency = GUITransparency end
    
    Concacpage.Name = "Concacpage"
    Concacpage.Parent = Concacontainer
    Concacpage.SortOrder = Enum.SortOrder.LayoutOrder
    Concacpage.EasingDirection = Enum.EasingDirection.InOut
    Concacpage.EasingStyle = Enum.EasingStyle.Quad
    Concacpage.TweenTime = 0.250
    
    TopMain.Name = "TopMain"
    TopMain.Parent = MainContainer
    TopMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopMain.BackgroundTransparency = 1.000
    TopMain.Size = UDim2.new(1, 0, 0, 25)
    
    Ruafimg.Name = "Ruafimg"
    Ruafimg.Parent = TopMain
    Ruafimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ruafimg.BackgroundTransparency = 1.000
    Ruafimg.Position = UDim2.new(0, 5, 0, 0)
    Ruafimg.Size = UDim2.new(0, 25, 0, 25)
    Ruafimg.Image = "rbxassetid://6248942117"
    table.insert(getgenv().Occho, Ruafimg)
    
    TextLabel.Parent = TopMain
    TextLabel.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0, 35, 0, 0)
    TextLabel.Size = UDim2.new(1, -35, 1, 0)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = "<font color=\"rgb("..tostring(Library_Function.Getcolor(getgenv().UI_Color['Main']['Main Color'])[1])..','..tostring(Library_Function.Getcolor(getgenv().UI_Color['Main']['Main Color'])[2])..','..tostring(Library_Function.Getcolor(getgenv().UI_Color['Main']['Main Color'])[3])..")\">Sea Hub Premium</font> " .. MainDesc
    TextLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    TextLabel.RichText = true
    TextLabel.TextSize = 16.000
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    SettionMain.Name = "SettionMain"
    SettionMain.Parent = TopMain
    SettionMain.AnchorPoint = Vector2.new(1, 0)
    SettionMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SettionMain.BackgroundTransparency = 1.000
    SettionMain.Position = UDim2.new(1, 0, 0, 0)
    SettionMain.Size = UDim2.new(0, 30, 0, 30)
    
    SettionButton.Name = "SettionButton"
    SettionButton.Parent = SettionMain
    SettionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SettionButton.BackgroundTransparency = 1.000
    SettionButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
    SettionButton.Size = UDim2.new(1, 0, 1, 0)
    SettionButton.Font = Enum.Font.SourceSans
    SettionButton.Text = ""
    SettionButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    SettionButton.TextSize = 14.000
    SettionButton.Visible = true
    
    SettingIcon.Name = "SettingIcon"
    SettingIcon.Parent = SettionMain
    SettingIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    SettingIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SettingIcon.BackgroundTransparency = 1.000
    SettingIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    SettingIcon.Size = UDim2.new(1, -10, 1, -10)
    SettingIcon.Image = "rbxassetid://7397332215"
    SettingIcon.Visible = true

    PageControl.Name = "PageControl"
    PageControl.Parent = Concacmain
    PageControl.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    PageControl.Position = UDim2.new(0, 5, 0, 0)
    PageControl.Size = UDim2.new(0, 180, 0, 325)
    if BackgroundVideo then
        PageControl.BackgroundTransparency = GUITransparency
    end

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = PageControl

    ControlList.Name = "ControlList"
    ControlList.Parent = PageControl
    ControlList.Active = true
    ControlList.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    ControlList.BackgroundTransparency = 1.000
    ControlList.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ControlList.BorderSizePixel = 0
    ControlList.Position = UDim2.new(0, 0, 0, 30)
    ControlList.Size = UDim2.new(1, -5, 1, -30)
    ControlList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    ControlList.CanvasSize = UDim2.new(0, 0, 0, 0)
    ControlList.ScrollBarThickness = 5
    ControlList.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    UIListLayout.Parent = ControlList
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    ControlTitle.Name = "ControlTitle"
    ControlTitle.Parent = PageControl
    ControlTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    ControlTitle.BackgroundTransparency = 1.000
    ControlTitle.Position = UDim2.new(0, 5, 0, 0)
    ControlTitle.Size = UDim2.new(1, 0, 0, 25)
    ControlTitle.Font = Enum.Font.GothamBold
    ControlTitle.Text = MainTitleText
    ControlTitle.TextColor3 = Color3.fromRGB(230, 230, 230)
    ControlTitle.TextSize = 14.000
    ControlTitle.TextXAlignment = Enum.TextXAlignment.Left

    MainPage.Name = "MainPage"
    MainPage.Parent = Concacmain
    MainPage.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    MainPage.BackgroundTransparency = 1.000
    MainPage.ClipsDescendants = true
    MainPage.Position = UDim2.new(0, 190, 0, 0)
    MainPage.Size = UDim2.new(0, 435, 0, 325)

    UIPage.Name = "UIPage"
    UIPage.Parent = MainPage
    UIPage.FillDirection = Enum.FillDirection.Vertical
    UIPage.SortOrder = Enum.SortOrder.LayoutOrder
    UIPage.EasingDirection = Enum.EasingDirection.InOut
    UIPage.EasingStyle = Enum.EasingStyle.Quart
    UIPage.Padding = UDim.new(0, 10)
    UIPage.TweenTime = .25

    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ControlList.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 5)
    end)

    function Library_Function.ReloadMain()
        maingui.ImageColor3 = getgenv().UI_Color['Main']['Main Color']
        TextLabel.Text = "<font color=\"rgb("..tostring(Library_Function.Getcolor(getgenv().UI_Color['Main']['Main Color'])[1])..','..tostring(Library_Function.Getcolor(getgenv().UI_Color['Main']['Main Color'])[2])..','..tostring(Library_Function.Getcolor(getgenv().UI_Color['Main']['Main Color'])[3])..")\">Sea Hub Premium</font> " .. MainDesc
        local MainContainer_
        if getgenv().UI_Color['Custom Style']['Video'] then 
            BackgroundVideo = getgenv().UI_Color['Custom Style']['Background']
        else
            BackgroundVideo = Library_Function.GetIMG(getgenv().UI_Color['Custom Style']['Background'])
        end
        if BackgroundVideo then
            if getgenv().UI_Color['Custom Style']['Video'] then
                MainContainer_ = Instance.new("VideoFrame")  
                local url = BackgroundVideo
                writefile("friend.webm", syn.request({Url=url}).Body)
                local sus = isfile("friend.webm")
                if sus then
                    MainContainer_.Name = "MainContainer"
                    MainContainer_.Parent = Main
                    MainContainer_.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                    MainContainer_.Size = UDim2.new(1, 0, 1, 0)
                    MainContainer_.Video = getsynasset("friend.webm")
                    MainContainer_.Looped = true
                    MainContainer_:Play()
                    wait()
                    delfile('friend.webm')
                end
            else
                MainContainer_ = Instance.new("ImageLabel")
                MainContainer_.Name = "MainContainer"
                MainContainer_.Parent = Main
                MainContainer_.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                MainContainer_.BackgroundTransparency = 1
                MainContainer_.Size = UDim2.new(1, 0, 1, 0)
                MainContainer_.Image = BackgroundVideo
            end
            getgenv().ReadyForGuiLoaded = true
        else
            MainContainer_ = Instance.new("Frame")
            MainContainer_.Name = "MainContainer"
            MainContainer_.Parent = Main
            MainContainer_.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
            MainContainer_.Size = UDim2.new(1, 0, 1, 0)
        end
        MainCorner_ = Instance.new("UICorner")
        MainCorner_.CornerRadius = UDim.new(0, 4)
        MainCorner_.Name = "MainCorner"
        MainCorner_.Parent = MainContainer_
        for i,e in next, Main:GetChildren() do 
            if e.Name == "MainContainer" then
                for i,v in next, e:GetChildren() do
                    v.Parent = MainContainer_
                end
                wait()
                e:Destroy()
                break
            end
        end
    end


    local cummm = false 

    SettionButton.MouseButton1Click:Connect(function() Library_Function.ButtonEffect() end)

    SettionButton.MouseButton1Click:Connect(function()
        cummm = not cummm
        pa = cummm and 1 or 0 
        ro = cummm and 180 or 0 
        Concacpage:JumpToIndex(pa)
        game.TweenService:Create(SettingIcon,TweenInfo.new(.25),{Rotation = ro}):Play()
    end)

    local CustomList = Instance.new("ScrollingFrame")
    local CustomListLayout = Instance.new("UIListLayout")


    CustomList.Name = "CustomList"
    CustomList.Parent = Concacmain1
    CustomList.Active = true
    CustomList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CustomList.BackgroundTransparency = 1.000
    CustomList.BorderColor3 = Color3.fromRGB(27, 42, 53)
    CustomList.BorderSizePixel = 0
    CustomList.Position = UDim2.new(0, 5, 0, 30)
    CustomList.Size = UDim2.new(1, -10, 1, -30)
    CustomList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    CustomList.ScrollBarThickness = 5
    CustomList.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    CustomListLayout.Name = "CustomListLayout"
    CustomListLayout.Parent = CustomList
    CustomListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    CustomListLayout.Padding = UDim.new(0, 5)

    CustomListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        CustomList.CanvasSize = UDim2.new(0, 0, 0, CustomListLayout.AbsoluteContentSize.Y + 5)
    end)

    local CustomTitle = Instance.new("TextLabel")

    CustomTitle.Name = "CustomTitle"
    CustomTitle.Parent = Concacmain1
    CustomTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CustomTitle.BackgroundTransparency = 1.000
    CustomTitle.Position = UDim2.new(0, 15, 0, 0)
    CustomTitle.Size = UDim2.new(1, -15, 0, 25)
    CustomTitle.Font = Enum.Font.GothamBold
    CustomTitle.Text = ''
    CustomTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    CustomTitle.TextSize = 16.000
    CustomTitle.TextXAlignment = Enum.TextXAlignment.Left

    local CustomSearch = Instance.new("Frame")
    local PageSearchCorner = Instance.new("UICorner")
    local SearchFrame = Instance.new("Frame")
    local SearchIcon = Instance.new("ImageLabel")
    local active = Instance.new("TextButton")
    local SearchBucu = Instance.new("TextBox")

    CustomSearch.Name = "CustomSearch"
    CustomSearch.Parent = Concacmain1
    CustomSearch.AnchorPoint = Vector2.new(1, 0)
    CustomSearch.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
    CustomSearch.ClipsDescendants = true
    CustomSearch.Position = UDim2.new(1, -5, 0, 5)
    CustomSearch.Size = UDim2.new(0, 20, 0, 20)
    CustomSearch.ClipsDescendants = true

    PageSearchCorner.CornerRadius = UDim.new(0, 2)
    PageSearchCorner.Name = "PageSearchCorner"
    PageSearchCorner.Parent = CustomSearch

    SearchFrame.Name = "SearchFrame"
    SearchFrame.Parent = CustomSearch
    SearchFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SearchFrame.BackgroundTransparency = 1.000
    SearchFrame.Size = UDim2.new(0, 20, 0, 20)

    SearchIcon.Name = "SearchIcon"
    SearchIcon.Parent = SearchFrame
    SearchIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    SearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SearchIcon.BackgroundTransparency = 1.000
    SearchIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    SearchIcon.Size = UDim2.new(0, 16, 0, 16)
    SearchIcon.Image = "rbxassetid://8154282545"

    active.Name = "active"
    active.Parent = SearchFrame
    active.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    active.BackgroundTransparency = 1.000
    active.Size = UDim2.new(1, 0, 1, 0)
    active.Font = Enum.Font.SourceSans
    active.Text = ""
    active.TextColor3 = Color3.fromRGB(0, 0, 0)
    active.TextSize = 14.000

    SearchBucu.Name = "SearchBucu"
    SearchBucu.Parent = CustomSearch
    SearchBucu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SearchBucu.BackgroundTransparency = 1.000
    SearchBucu.Position = UDim2.new(0, 30, 0, 0)
    SearchBucu.Size = UDim2.new(1, -30, 1, 0)
    SearchBucu.Font = Enum.Font.GothamBold
    SearchBucu.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
    SearchBucu.Text = ''
    SearchBucu.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBucu.TextSize = 14.000
    SearchBucu.TextXAlignment = Enum.TextXAlignment.Left
    SearchBucu.PlaceholderText =  "Search Section name"

    local cummmed_ = false 

        active.MouseEnter:Connect(function()
            TweenService:Create(SearchIcon,TweenInfo.new(0.1),{ImageColor3 = getgenv().UI_Color['Custom Theme']['Custom Theme Search Color']}):Play()
        end)

        active.MouseLeave:Connect(function()
            TweenService:Create(SearchIcon,TweenInfo.new(0.1),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
        end)

        active.MouseButton1Click:Connect(function()
            Library_Function.ButtonEffect()
        end)

        SearchBucu.Focused:Connect(function()
            Library_Function.ButtonEffect()
        end)

        active.MouseButton1Click:Connect(function()
            cummmed_ = not cummmed_
            local size = cummmed_ and UDim2.new(0,175,0,20) or  UDim2.new(0,20,0,20)
	        game.TweenService:Create(CustomSearch,TweenInfo.new(.5),{Size = size}):Play()
        end)

        local function succac_()
            for i,v in next, CustomList:GetChildren() do 
                if not v:IsA('UIListLayout') then 
                    v.Visible = false
                end
            end
        end
        
        local function ra_()
            for a, b in pairs(CustomList:GetChildren()) do
                if not b:IsA('UIListLayout') then 
                    if string.find(string.lower(b.Name),string.lower(SearchBucu.Text)) then 
                        b.Visible = true
                    end
                end
            end
        end
        
        SearchBucu:GetPropertyChangedSignal("Text"):Connect(function()
            succac_()
            ra_()
        end)

    function Library.CreateCustomColor(Name)

        CustomTitle.Text = Name or 'Custom Color'


        local Setting_Function = {}

        function Setting_Function.CreateSection(Section_Name)

            local Section = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local Topsec = Instance.new("Frame")
            local Sectiontitle = Instance.new("TextLabel")
            local Linesec = Instance.new("Frame")
            local UIGradient = Instance.new("UIGradient")
            local SectionList = Instance.new("UIListLayout")
            local SectionName = Section_Name or "Section"

            Section.Name = Section_Name.."Section"
            Section.Parent = CustomList
            Section.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
            Section.Size = UDim2.new(1, 0, 0, 285)
            if BackgroundVideo then
                Section.BackgroundTransparency = GUITransparency
            end

            UICorner.CornerRadius = UDim.new(0, 4)
            UICorner.Parent = Section

            Topsec.Name = "Topsec"
            Topsec.Parent = Section
            Topsec.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Topsec.BackgroundTransparency = 1.000
            Topsec.Size = UDim2.new(1, 0, 0, 27)

            Sectiontitle.Name = "Setting_Sectiontitle"
            Sectiontitle.Parent = Topsec
            Sectiontitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sectiontitle.BackgroundTransparency = 1.000
            Sectiontitle.Size = UDim2.new(1, 0, 1, 0)
            Sectiontitle.Font = Enum.Font.GothamBold
            Sectiontitle.Text = Section_Name
            Sectiontitle.TextSize = 14.000
            Sectiontitle.TextColor3 = getgenv().UI_Color['Section']['Text Color']
            table.insert(getgenv().Occho, Sectiontitle)

            Linesec.Name = "Setting_Linesec"
            Linesec.Parent = Topsec
            Linesec.AnchorPoint = Vector2.new(0.5, 1)
            Linesec.BorderSizePixel = 0
            Linesec.Position = UDim2.new(0.5, 0, 1, -2)
            Linesec.Size = UDim2.new(1, -10, 0, 2)
            Linesec.BackgroundColor3 = getgenv().UI_Color['Section']['Underline Color']
            table.insert(getgenv().Occho, Linesec)

            UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(0.51, 0.02), NumberSequenceKeypoint.new(1.00, 1.00)}
            UIGradient.Parent = Linesec

            SectionList.Name = "SectionList"
            SectionList.Parent = Section
            SectionList.SortOrder = Enum.SortOrder.LayoutOrder
            SectionList.Padding = UDim.new(0, 5)

            SectionList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                Section.Size = UDim2.new(1, 0, 0, SectionList.AbsoluteContentSize.Y + 5)
            end)

            local Setting_Section_Function = {}

                function Setting_Section_Function.CreateColorPicker(Setting,Callback)

                    local Title = Setting.Title or "Color Picker"
                    local Default = Setting.Default or Color3.fromRGB(255, 255, 255)
                    local Type = Setting.Type
                    local Cor1Val = Color3.fromRGB(255, 255, 255)
                    local Cor2Val = Color3.fromRGB(255, 255, 255)
                    if Setting.Breathing then 
                        Cor1Val = Setting.Breathing.Cor1
                        Cor2Val = Setting.Breathing.Cor2
                    end

                    local ColorPick = Instance.new("Frame")
                    local ColorPickCorner = Instance.new("UICorner")
                    local ColorPickBg = Instance.new("Frame")
                    local ColorpickBGCorner = Instance.new("UICorner")
                    local ColorpickTitle = Instance.new("TextLabel")
                    local ColorVal = Instance.new("Frame")
                    local ColorValCorner = Instance.new("UICorner")
                    local ColorValButton = Instance.new("TextButton")
                    local Hue = Instance.new("Frame")
                    local HueGra = Instance.new("UIGradient")
                    local Frame = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local Concac = Instance.new("Frame")
                    local RFrame = Instance.new("Frame")
                    local RText = Instance.new("TextLabel")
                    local RBox = Instance.new("TextBox")
                    local GFrame = Instance.new("Frame")
                    local GText = Instance.new("TextLabel")
                    local GBox = Instance.new("TextBox")
                    local BFrame = Instance.new("Frame")
                    local BText = Instance.new("TextLabel")
                    local BBox = Instance.new("TextBox")
                    local UIListLayout = Instance.new("UIListLayout")
                    local HexFrame = Instance.new("Frame")
                    local HexText = Instance.new("TextLabel")
                    local HexBox = Instance.new("TextBox")
                    local Linesec = Instance.new("Frame")
                    local UIGradient = Instance.new("UIGradient")
                    local CungroiF = Instance.new("Frame")
                    local CungroiFF = Instance.new("Frame")
                    local cungroitext = Instance.new("TextLabel")
                    local checkbox = Instance.new("ImageLabel")
                    local check = Instance.new("ImageLabel")
                    local Cungroitog = Instance.new("TextButton")
                    local Color = Instance.new("ImageLabel")
                    local SelectorColor = Instance.new("Frame")
                    local UICorner_2 = Instance.new("UICorner")
                    local HoithoF = Instance.new("Frame")
                    local HoithoF_2 = Instance.new("Frame")
                    local hoithotext = Instance.new("TextLabel")
                    local checkbox_2 = Instance.new("ImageLabel")
                    local check_2 = Instance.new("ImageLabel")
                    local Hoithoitog = Instance.new("TextButton")
                    local Frame_2 = Instance.new("Frame")
                    local UIListLayout_2 = Instance.new("UIListLayout")
                    local Cor1 = Instance.new("Frame")
                    local UICorner_3 = Instance.new("UICorner")
                    local BCor1 = Instance.new("TextButton")
                    local Cor2 = Instance.new("Frame")
                    local UICorner_4 = Instance.new("UICorner")
                    local BCor2 = Instance.new("TextButton")

                    ColorPick.Name = "ColorPick"
                    ColorPick.Parent = Section
                    ColorPick.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    ColorPick.BackgroundTransparency = 1.000
                    ColorPick.ClipsDescendants = true
                    ColorPick.Position = UDim2.new(0, 0, 0.112280704, 0)
                    ColorPick.Size = UDim2.new(1, 0, 0, 35)

                    ColorPickCorner.CornerRadius = UDim.new(0, 4)
                    ColorPickCorner.Name = "ColorPickCorner"
                    ColorPickCorner.Parent = ColorPick

                    ColorPickBg.Name = "ColorPickBg"
                    ColorPickBg.Parent = ColorPick
                    ColorPickBg.AnchorPoint = Vector2.new(0.5, 0.5)
                    ColorPickBg.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                    ColorPickBg.Position = UDim2.new(0.5, 0, 0.5, 0)
                    ColorPickBg.Size = UDim2.new(1, -10, 1, 0)

                    if BackgroundVideo then ColorPickBg.BackgroundTransparency = GUITransparency end

                    ColorpickBGCorner.CornerRadius = UDim.new(0, 4)
                    ColorpickBGCorner.Name = "ColorpickBGCorner"
                    ColorpickBGCorner.Parent = ColorPickBg

                    ColorpickTitle.Name = "ColorpickTitle"
                    ColorpickTitle.Parent = ColorPickBg
                    ColorpickTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ColorpickTitle.BackgroundTransparency = 1.000
                    ColorpickTitle.Position = UDim2.new(0, 10, 0, 0)
                    ColorpickTitle.Size = UDim2.new(1, -10, 0, 35)
                    ColorpickTitle.Font = Enum.Font.GothamBlack
                    ColorpickTitle.Text = Title
                    ColorpickTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ColorpickTitle.TextSize = 14.000
                    ColorpickTitle.TextXAlignment = Enum.TextXAlignment.Left

                    ColorVal.Name = "ColorVal"
                    ColorVal.Parent = ColorPick
                    ColorVal.AnchorPoint = Vector2.new(1, 0)
                    ColorVal.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                    ColorVal.Position = UDim2.new(1, -10, 0, 5)
                    ColorVal.Size = UDim2.new(0, 150, 0, 25)

                    ColorValCorner.CornerRadius = UDim.new(0, 4)
                    ColorValCorner.Name = "ColorValCorner"
                    ColorValCorner.Parent = ColorVal

                    ColorValButton.Name = "ColorValButton"
                    ColorValButton.Parent = ColorVal
                    ColorValButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ColorValButton.BackgroundTransparency = 1.000
                    ColorValButton.Size = UDim2.new(1, 0, 1, 0)
                    ColorValButton.Font = Enum.Font.SourceSans
                    ColorValButton.Text = ""
                    ColorValButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                    ColorValButton.TextSize = 14.000

                    Hue.Name = "Hue"
                    Hue.Parent = ColorPick
                    Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Hue.BorderSizePixel = 0
                    Hue.Position = UDim2.new(0, 460, 0, 40)
                    Hue.Size = UDim2.new(0, 25, 0, 200)

                    HueGra.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.17, Color3.fromRGB(235, 7, 255)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 9, 189)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(0, 193, 196)), ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.84, Color3.fromRGB(255, 247, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
                    HueGra.Rotation = 90
                    HueGra.Name = "HueGra"
                    HueGra.Parent = Hue

                    Frame.Parent = Hue
                    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Frame.Position = UDim2.new(0, 0, 1, 0)
                    Frame.Size = UDim2.new(1, 0, 0, 2)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Hue

                    Concac.Name = "Concac"
                    Concac.Parent = ColorPick
                    Concac.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Concac.BackgroundTransparency = 1.000
                    Concac.Position = UDim2.new(0, 495, 0, 40)
                    Concac.Size = UDim2.new(0, 115, 0, 100)

                    RFrame.Name = "RFrame"
                    RFrame.Parent = Concac
                    RFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    RFrame.BackgroundTransparency = 1.000
                    RFrame.Size = UDim2.new(1, 0, 0, 25)
                    RFrame.LayoutOrder = 0

                    RText.Name = "RText"
                    RText.Parent = RFrame
                    RText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    RText.BackgroundTransparency = 1.000
                    RText.Size = UDim2.new(0, 25, 0, 25)
                    RText.Font = Enum.Font.GothamBold
                    RText.Text = "R:"
                    RText.TextColor3 = Color3.fromRGB(115, 115, 115)
                    RText.TextSize = 14.000
                    RText.TextXAlignment = Enum.TextXAlignment.Left

                    RBox.Name = "RBox"
                    RBox.Parent = RFrame
                    RBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    RBox.BackgroundTransparency = 1.000
                    RBox.Position = UDim2.new(0, 25, 0, 0)
                    RBox.Size = UDim2.new(1, -25, 1, 0)
                    RBox.ClearTextOnFocus = false
                    RBox.Font = Enum.Font.GothamBold
                    RBox.Text = "255"
                    RBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                    RBox.TextSize = 14.000
                    RBox.TextXAlignment = Enum.TextXAlignment.Left

                    GFrame.Name = "GFrame"
                    GFrame.Parent = Concac
                    GFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    GFrame.BackgroundTransparency = 1.000
                    GFrame.Size = UDim2.new(1, 0, 0, 25)
                    GFrame.LayoutOrder = 1

                    GText.Name = "GText"
                    GText.Parent = GFrame
                    GText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    GText.BackgroundTransparency = 1.000
                    GText.Size = UDim2.new(0, 25, 0, 25)
                    GText.Font = Enum.Font.GothamBold
                    GText.Text = "G:"
                    GText.TextColor3 = Color3.fromRGB(115, 115, 115)
                    GText.TextSize = 14.000
                    GText.TextXAlignment = Enum.TextXAlignment.Left

                    GBox.Name = "GBox"
                    GBox.Parent = GFrame
                    GBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    GBox.BackgroundTransparency = 1.000
                    GBox.Position = UDim2.new(0, 25, 0, 0)
                    GBox.Size = UDim2.new(1, -25, 1, 0)
                    GBox.ClearTextOnFocus = false
                    GBox.Font = Enum.Font.GothamBold
                    GBox.Text = "255"
                    GBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                    GBox.TextSize = 14.000
                    GBox.TextXAlignment = Enum.TextXAlignment.Left

                    BFrame.Name = "BFrame"
                    BFrame.Parent = Concac
                    BFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    BFrame.BackgroundTransparency = 1.000
                    BFrame.Size = UDim2.new(1, 0, 0, 25)
                    BFrame.LayoutOrder = 2

                    BText.Name = "BText"
                    BText.Parent = BFrame
                    BText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    BText.BackgroundTransparency = 1.000
                    BText.Size = UDim2.new(0, 25, 0, 25)
                    BText.Font = Enum.Font.GothamBold
                    BText.Text = "B:"
                    BText.TextColor3 = Color3.fromRGB(115, 115, 115)
                    BText.TextSize = 14.000
                    BText.TextXAlignment = Enum.TextXAlignment.Left

                    BBox.Name = "BBox"
                    BBox.Parent = BFrame
                    BBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    BBox.BackgroundTransparency = 1.000
                    BBox.Position = UDim2.new(0, 25, 0, 0)
                    BBox.Size = UDim2.new(1, -25, 1, 0)
                    BBox.ClearTextOnFocus = false
                    BBox.Font = Enum.Font.GothamBold
                    BBox.Text = "255"
                    BBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                    BBox.TextSize = 14.000
                    BBox.TextXAlignment = Enum.TextXAlignment.Left

                    UIListLayout.Parent = Concac
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

                    HexFrame.Name = "HexFrame"
                    HexFrame.Parent = Concac
                    HexFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    HexFrame.BackgroundTransparency = 1.000
                    HexFrame.Size = UDim2.new(1, 0, 0, 25)
                    HexFrame.LayoutOrder = 3

                    HexText.Name = "HexText"
                    HexText.Parent = HexFrame
                    HexText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    HexText.BackgroundTransparency = 1.000
                    HexText.Size = UDim2.new(0, 25, 0, 25)
                    HexText.Font = Enum.Font.GothamBold
                    HexText.Text = "#"
                    HexText.TextColor3 = Color3.fromRGB(115, 115, 115)
                    HexText.TextSize = 14.000
                    HexText.TextXAlignment = Enum.TextXAlignment.Left

                    HexBox.Name = "HexBox"
                    HexBox.Parent = HexFrame
                    HexBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    HexBox.BackgroundTransparency = 1.000
                    HexBox.Position = UDim2.new(0, 25, 0, 0)
                    HexBox.Size = UDim2.new(1, -25, 1, 0)
                    HexBox.ClearTextOnFocus = false
                    HexBox.Font = Enum.Font.GothamBold
                    HexBox.Text = "FFFFFF"
                    HexBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                    HexBox.TextSize = 14.000
                    HexBox.TextXAlignment = Enum.TextXAlignment.Left

                    Linesec.Name = "Color_P_Linesec"
                    Linesec.Parent = Concac
                    Linesec.AnchorPoint = Vector2.new(0.5, 1)
                    Linesec.BorderSizePixel = 0
                    Linesec.Position = UDim2.new(0.5, 0, 1, -2)
                    Linesec.Size = UDim2.new(1, -10, 0, 2)
                    Linesec.LayoutOrder = 4
                    Linesec.BackgroundColor3 = getgenv().UI_Color['Custom Theme']['Underline Color']
                    table.insert(getgenv().Occho, Linesec)

                    UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.30, 0.25), NumberSequenceKeypoint.new(0.70, 0.25), NumberSequenceKeypoint.new(1.00, 1.00)}
                    UIGradient.Parent = Linesec

                    CungroiF.Name = "CungroiF"
                    CungroiF.Parent = ColorPick
                    CungroiF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    CungroiF.BackgroundTransparency = 1.000
                    CungroiF.Position = UDim2.new(0, 495, 0, 145)
                    CungroiF.Size = UDim2.new(0, 115, 0, 25)

                    CungroiFF.Name = "CungroiFF"
                    CungroiFF.Parent = CungroiF
                    CungroiFF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    CungroiFF.BackgroundTransparency = 1.000
                    CungroiFF.Size = UDim2.new(1, 0, 0, 25)
                    CungroiFF.LayoutOrder = 4

                    cungroitext.Name = "cungroitext"
                    cungroitext.Parent = CungroiFF
                    cungroitext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    cungroitext.BackgroundTransparency = 1.000
                    cungroitext.Size = UDim2.new(0, 85, 0, 25)
                    cungroitext.Font = Enum.Font.GothamBold
                    cungroitext.Text = "Rainbow"
                    cungroitext.TextColor3 = Color3.fromRGB(255, 255, 255)
                    cungroitext.TextSize = 14.000
                    cungroitext.TextXAlignment = Enum.TextXAlignment.Left

                    checkbox.Name = "Setting_checkbox"
                    checkbox.Parent = CungroiFF
                    checkbox.AnchorPoint = Vector2.new(1, 0.5)
                    checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    checkbox.BackgroundTransparency = 1.000
                    checkbox.Position = UDim2.new(1, -5, 0.5, 0)
                    checkbox.Size = UDim2.new(0, 25, 0, 25)
                    checkbox.Image = "rbxassetid://4552505888"
                    checkbox.ImageColor3 = getgenv().UI_Color['Custom Theme']['Checkbox Color']
                    table.insert(getgenv().Occho, checkbox)

                    check.Name = "Setting_check"
                    check.Parent = checkbox
                    check.AnchorPoint = Vector2.new(0, 1)
                    check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    check.BackgroundTransparency = 1.000
                    check.Position = UDim2.new(0, 0, 1, 0)
                    check.Image = "rbxassetid://4555411759"
                    check.ImageColor3 = getgenv().UI_Color['Custom Theme']['Checked Color']
                    table.insert(getgenv().Occho, check)

                    Cungroitog.Name = "Cungroitog"
                    Cungroitog.Parent = CungroiFF
                    Cungroitog.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Cungroitog.BackgroundTransparency = 1.000
                    Cungroitog.Size = UDim2.new(1, 0, 1, 0)
                    Cungroitog.Font = Enum.Font.SourceSans
                    Cungroitog.Text = ""
                    Cungroitog.TextColor3 = Color3.fromRGB(0, 0, 0)
                    Cungroitog.TextSize = 14.000

                    Color.Name = "Color"
                    Color.Parent = ColorPick
                    Color.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                    Color.BorderSizePixel = 0
                    Color.Position = UDim2.new(0, 10, 0, 40)
                    Color.Size = UDim2.new(0, 440, 0, 200)
                    Color.Image = "rbxassetid://4155801252"

                    SelectorColor.Name = "SelectorColor"
                    SelectorColor.Parent = Color
                    SelectorColor.AnchorPoint = Vector2.new(0.5, 0.5)
                    SelectorColor.BackgroundColor3 = Color3.fromRGB(203, 203, 203)
                    SelectorColor.BorderColor3 = Color3.fromRGB(70, 70, 70)
                    SelectorColor.Position = UDim2.new(1, 0, 0, 0)
                    SelectorColor.Size = UDim2.new(0, 4, 0, 4)

                    UICorner_2.CornerRadius = UDim.new(0, 4)
                    UICorner_2.Parent = Color

                    HoithoF.Name = "HoithoF"
                    HoithoF.Parent = ColorPick
                    HoithoF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    HoithoF.BackgroundTransparency = 1.000
                    HoithoF.Position = UDim2.new(0, 495, 0, 175)
                    HoithoF.Size = UDim2.new(0, 115, 0, 25)
                    HoithoF.LayoutOrder = 5

                    HoithoF_2.Name = "HoithoF"
                    HoithoF_2.Parent = HoithoF
                    HoithoF_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    HoithoF_2.BackgroundTransparency = 1.000
                    HoithoF_2.Size = UDim2.new(1, 0, 1, 25)

                    hoithotext.Name = "hoithotext"
                    hoithotext.Parent = HoithoF_2
                    hoithotext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    hoithotext.BackgroundTransparency = 1.000
                    hoithotext.Size = UDim2.new(0, 85, 0, 25)
                    hoithotext.Font = Enum.Font.GothamBold
                    hoithotext.Text = "Breathing"
                    hoithotext.TextColor3 = Color3.fromRGB(255, 255, 255)
                    hoithotext.TextSize = 14.000
                    hoithotext.TextXAlignment = Enum.TextXAlignment.Left

                    checkbox_2.Name = "setting_checkbox"
                    checkbox_2.Parent = HoithoF_2
                    checkbox_2.AnchorPoint = Vector2.new(1, 0)
                    checkbox_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    checkbox_2.BackgroundTransparency = 1.000
                    checkbox_2.Position = UDim2.new(1, -5, 0, 0)
                    checkbox_2.Size = UDim2.new(0, 25, 0, 25)
                    checkbox_2.Image = "rbxassetid://4552505888"
                    checkbox_2.ImageColor3 = Color3.fromRGB(131, 181, 255)
                    checkbox_2.ImageColor3 = getgenv().UI_Color['Custom Theme']['Checkbox Color']
                    table.insert(getgenv().Occho, checkbox_2)

                    check_2.Name = "setting_check"
                    check_2.Parent = checkbox_2
                    check_2.AnchorPoint = Vector2.new(0, 1)
                    check_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    check_2.BackgroundTransparency = 1.000
                    check_2.Position = UDim2.new(0, 0, 1, 0)
                    check_2.Image = "rbxassetid://4555411759"
                    check_2.ImageColor3 = getgenv().UI_Color['Custom Theme']['Checked Color']
                    table.insert(getgenv().Occho, check_2)

                    Hoithoitog.Name = "Hoithoitog"
                    Hoithoitog.Parent = HoithoF_2
                    Hoithoitog.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Hoithoitog.BackgroundTransparency = 1.000
                    Hoithoitog.Size = UDim2.new(1, 0, 0, 25)
                    Hoithoitog.Font = Enum.Font.SourceSans
                    Hoithoitog.Text = ""
                    Hoithoitog.TextColor3 = Color3.fromRGB(0, 0, 0)
                    Hoithoitog.TextSize = 14.000

                    Frame_2.Parent = HoithoF_2
                    Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Frame_2.BackgroundTransparency = 1.000
                    Frame_2.Position = UDim2.new(0, 0, 0, 30)
                    Frame_2.Size = UDim2.new(1, 0, 0, 25)

                    UIListLayout_2.Parent = Frame_2
                    UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
                    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout_2.Padding = UDim.new(0, 5)

                    Cor1.Name = "Cor1"
                    Cor1.Parent = Frame_2
                    Cor1.BackgroundColor3 = Cor1Val
                    Cor1.Selectable = true
                    Cor1.Size = UDim2.new(0, 25, 0, 25)

                    UICorner_3.CornerRadius = UDim.new(1, 0)
                    UICorner_3.Parent = Cor1

                    BCor1.Name = "BCor1"
                    BCor1.Parent = Cor1
                    BCor1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    BCor1.BackgroundTransparency = 1.000
                    BCor1.Size = UDim2.new(1, 0, 1, 0)
                    BCor1.Font = Enum.Font.SourceSans
                    BCor1.Text = ""
                    BCor1.TextColor3 = Color3.fromRGB(0, 0, 0)
                    BCor1.TextSize = 14.000

                    Cor2.Name = "Cor2"
                    Cor2.Parent = Frame_2
                    Cor2.BackgroundColor3 = Cor2Val
                    Cor2.Selectable = true
                    Cor2.Size = UDim2.new(0, 25, 0, 25)

                    UICorner_4.CornerRadius = UDim.new(1, 0)
                    UICorner_4.Parent = Cor2

                    BCor2.Name = "BCor2"
                    BCor2.Parent = Cor2
                    BCor2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    BCor2.BackgroundTransparency = 1.000
                    BCor2.Size = UDim2.new(1, 0, 1, 0)
                    BCor2.Font = Enum.Font.SourceSans
                    BCor2.Text = ""
                    BCor2.TextColor3 = Color3.fromRGB(0, 0, 0)
                    BCor2.TextSize = 14.000

                    local vandogbucu = false
                    ColorValButton.MouseButton1Click:Connect(function()
                        vandogbucu = not vandogbucu
                        local CSize = vandogbucu and UDim2.new(1, 0, 0, 255) or UDim2.new(1, 0, 0, 35)
                        TweenService:Create(ColorPick, TweenInfo.new(0.2), {Size = CSize}):Play()
                    end)

                    ColorValButton.MouseButton1Click:Connect(function()
                        Library_Function.ButtonEffect()
                    end)

                    local userInputService = game:GetService("UserInputService")
                    local runService = game:GetService("RunService")

                    local plr = game.Players.LocalPlayer
                    local mouse = plr:GetMouse()

                    local colorInput, hueInput = nil,nil
                    local nguvail = true
                    local cungroival = 0
                    local function cum(...)
                        if nguvail then
                            return wait(...)
                        else
                            wait()
                            return false
                        end
                    end

                    local function RBGToText(color)
                        return {math.floor(color.r*255),math.floor(color.g*255),math.floor(color.b*255)}
                    end

                    local function Color3FromHex(hex)
                        hex = hex:gsub("#", ""):upper():gsub("0X", "")
                        return Color3.fromRGB(tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16))
                    end
                    local function Color3ToHex(color)
                        local r, g, b = string.format("%X", math.floor(color.R * 255)), string.format("%X", math.floor(color.G * 255)), string.format("%X", math.floor(color.B * 255))
                        if #r < 2 then
                            r = "0" .. r
                        end
                        if #g < 2 then
                            g = "0" .. g
                        end
                        if #b < 2 then
                            b = "0" .. b
                        end
                        return string.format("%s%s%s", r, g, b)
                    end
                    H, S, V = 1,1,1
                    local function LayCaiLonHon(a,b) 
                        if a>b then return a,b else return b,a end
                    end
                    local function Cong(a,b) 
                        if (a+b)>255 then 
                            local lon,be = LayCaiLonHon(a,b)
                            local delta = 255-lon
                            local lon2,be2 = LayCaiLonHon(delta,be)

                            return (lon2-be2)
                        else
                            return (a+b)
                        end
                    end
                    function CongColor(a,b) 
                        local Color1,Color2=a,b
                        local SQRT = math.sqrt
                        local NewColor={}
                        NewColor.R = 255 - SQRT(((255-Color1.R)^2 + (255-Color2.R)^2)/2)
                        NewColor.G = 255 - SQRT(((255-Color1.G)^2 + (255-Color2.G)^2)/2)
                        NewColor.B = 255 - SQRT(((255-Color1.B)^2 + (255-Color2.B)^2)/2)
                        --print("cacasad")
                        return Color3.new(NewColor.R,NewColor.G,NewColor.B)
                        --return Color3.fromRGB(Cong(a.R*255,b.R*255),Cong(a.G*255,b.G*255),Cong(a.B*255,b.B*255))
                    end
                    local function UpdateColor(concac)
                        local NewColor = concac or Color3.fromHSV(H, S, V)
                        if not NewColor then S, H, V = concac:ToHSV() end
                        HexBox.Text = Color3ToHex(NewColor)
                        Color.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
                        if concac then
                            Color.BackgroundColor3 = concac
                            SelectorColor.Position = UDim2.new(concac and select(3, Color3.toHSV(concac)))
                        end
                        local pos = 1 - (Color3.toHSV(NewColor))
                        local scaley = Hue.Frame.Position.Y.Scale
                        if scaley ~= pos and not ((pos == 0 or pos == 1) and (scaley == 1 or scaley == 0)) then
                            Hue.Frame.Position = UDim2.fromScale(0,pos)
                        end
                        RBox.Text, GBox.Text, BBox.Text = RBGToText(NewColor)[1],RBGToText(NewColor)[2],RBGToText(NewColor)[3]
                        ColorVal.BackgroundColor3 = NewColor
                        if Callback then Callback(ColorVal.BackgroundColor3) end
                        if Type == "buttoneffect" then
                            getgenv().ButtonEffect = NewColor
                        else
                            for i, v in pairs(getgenv().Occho) do
                                if typeof(v) ~= "table"
                                and v.Name == Type then
                                    local ditmemaytvk
                                    if v:IsA("ImageLabel") then
                                        ditmemaytvk = "ImageColor3"
                                    elseif v:IsA("TextLabel") then
                                        ditmemaytvk = "TextColor3"
                                    else
                                        ditmemaytvk = "BackgroundColor3"
                                    end
                                    if not currcolor[v] then 
                                        currcolor[v] = v[ditmemaytvk]
                                    end
                                    v[ditmemaytvk] = NewColor
                                end
                            end
                        end
                    end
                    Callback = Callback or function() end

                    if Default and Callback then
                        UpdateColor(Default)
                    end

                    local function setcungroi(stage)
                        if colorInput then
                            colorInput = (colorInput:Disconnect() and nil) or nil
                        end
                        if hueInput then
                            hueInput = (hueInput:Disconnect() and nil) or nil
                        end
                        
                        if stage then 
                            pcall(function()
                                local kietthongminh = 1 / 255
                                while cum() and _G.Cungroi do
                                    cungroival = kietthongminh + cungroival
                                    if cungroival > 1 then
                                        cungroival = 0
                                    end
                                    H = cungroival
                                    UpdateColor(Color3.fromHSV(cungroival, 1, 1))
                                end
                            end)
                        end
                        
                    end

                    _G.Cungroi = false

                    Cungroitog.MouseButton1Click:Connect(function() Library_Function.ButtonEffect() end)

                    Cungroitog.MouseButton1Click:Connect(function()
                        _G.Cungroi = not _G.Cungroi
                        csize = _G.Cungroi and UDim2.new(1,-4,1,-4) or UDim2.new(0,0,0,0)
                        pos = _G.Cungroi and UDim2.new(.5,0,.5,0) or UDim2.new(0,0,1,0)
                        apos = _G.Cungroi and Vector2.new(.5,.5) or Vector2.new(0,1)
                        game.TweenService:Create(check,TweenInfo.new(.25),{Size = csize, Position = pos, AnchorPoint = apos}):Play()
                        setcungroi(_G.Cungroi)
                    end)

                    if Setting.CungRoi then 
                        _G.Cungroi = not _G.Cungroi
                        csize = _G.Cungroi and UDim2.new(1,-4,1,-4) or UDim2.new(0,0,0,0)
                        pos = _G.Cungroi and UDim2.new(.5,0,.5,0) or UDim2.new(0,0,1,0)
                        apos = _G.Cungroi and Vector2.new(.5,.5) or Vector2.new(0,1)
                        game.TweenService:Create(check,TweenInfo.new(.25),{Size = csize, Position = pos, AnchorPoint = apos}):Play()
                        setcungroi(_G.Cungroi)
                    end

                    HexBox.FocusLost:Connect(function()
                        if #HexBox.Text > 5 then
                            local occho, rac = pcall(Color3FromHex, HexBox.Text)
                            UpdateColor((occho and rac))
                        end
                    end)

                    RBox.FocusLost:Connect(function()
                        if tonumber(RBox.Text) > 255 then 
                            RBox.Text = 255
                        elseif tonumber(RBox.Text) < 0 then
                            RBox.Text = 0
                        end
                        local occho, rac = pcall(Color3.fromRGB, tonumber(RBox.Text),tonumber(BBox.Text),tonumber(GBox.Text))
                        UpdateColor((occho and rac))
                    end)

                    GBox.FocusLost:Connect(function()
                        if tonumber(GBox.Text) > 255 then 
                            GBox.Text = 255
                        elseif tonumber(GBox.Text) < 0 then
                            GBox.Text = 0
                        end
                        local occho, rac = pcall(Color3.fromRGB, tonumber(RBox.Text),tonumber(BBox.Text),tonumber(GBox.Text))
                        UpdateColor((occho and rac))
                    end)
                    BBox.FocusLost:Connect(function()
                        if tonumber(BBox.Text) > 255 then 
                            BBox.Text = 255
                        elseif tonumber(BBox.Text) < 0 then
                            BBox.Text = 0
                        end
                        local occho, rac = pcall(Color3.fromRGB, tonumber(RBox.Text),tonumber(BBox.Text),tonumber(GBox.Text))
                        UpdateColor((occho and rac))
                    end)

                    H = 1 - (math.clamp(Hue.Frame.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
                    S = (math.clamp(Color.SelectorColor.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
                    V = 1 - (math.clamp(Color.SelectorColor.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)

                    Color.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if colorInput then
                                colorInput:Disconnect()
                            end
                            djtmemay = true
                            colorInput = runService.RenderStepped:Connect(function()
                                local colorX = (math.clamp(mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
                                local colorY = (math.clamp(mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
                                SelectorColor.Position = UDim2.fromScale(colorX, colorY)
                                S = colorX
                                V = 1 - colorY
                                UpdateColor()
                            end)
                        end
                    end)

                    Color.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if colorInput then
                                djtmemay = false
                                colorInput:Disconnect()
                            end
                        end
                    end)

                    Hue.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if hueInput then
                                hueInput:Disconnect()
                            end
                            djtmemay = true
                            hueInput = runService.RenderStepped:Connect(function()
                                local hueY = math.clamp(mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y
                                Hue.Frame.Position = UDim2.fromScale(0,hueY)
                                H = 1 - hueY
                                UpdateColor()
                            end)
                        end
                    end)

                    Hue.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if hueInput then
                                djtmemay = false
                                hueInput:Disconnect()
                            end
                        end
                    end)

                    BCor1.MouseButton1Click:Connect(function()
                        Library_Function.ButtonEffect()
                    end)

                    BCor2.MouseButton1Click:Connect(function()
                        Library_Function.ButtonEffect()
                    end)

                    BCor1.MouseButton1Click:Connect(function()
                        Cor1.BackgroundColor3 = ColorVal.BackgroundColor3
                    end)

                    BCor2.MouseButton1Click:Connect(function()
                        Cor2.BackgroundColor3 = ColorVal.BackgroundColor3
                    end)
                   
                    Hoithoitog.MouseButton1Click:Connect(function() Library_Function.ButtonEffect() end)

                    local vanmeo = false

                    spawn(function() 
                        while wait() do 
                            if vanmeo then 
                                UpdateColor(ColorVal.BackgroundColor3)
                            end
                        end
                    end)


                    if Setting.Breathing then 

                        local co2, co1 = Cor2.BackgroundColor3, Cor1.BackgroundColor3
                        vanmeo = not vanmeo 
                        csize = vanmeo and UDim2.new(1,-4,1,-4) or UDim2.new(0,0,0,0)
                        pos = vanmeo and UDim2.new(.5,0,.5,0) or UDim2.new(0,0,1,0)
                        apos = vanmeo and Vector2.new(.5,.5) or Vector2.new(0,1)
                        game.TweenService:Create(check_2,TweenInfo.new(.25),{Size = csize, Position = pos, AnchorPoint = apos}):Play()
                        if vanmeo then 
                            ab = game.TweenService:Create(ColorVal,TweenInfo.new(2),{BackgroundColor3 = co1})
                            ab1 = game.TweenService:Create(Color,TweenInfo.new(2),{BackgroundColor3 = co1})
                            ab:Play()
                            ab1:Play()
                            local chuaxong = true
                            ab.Completed:Connect(function()
                                if vanmeo then 
                                    chuaxong=false
                                    ac = game.TweenService:Create(ColorVal,TweenInfo.new(2),{BackgroundColor3 = co2})
                                    ac1 = game.TweenService:Create(Color,TweenInfo.new(2),{BackgroundColor3 = co2})
                                    ac:Play()
                                    ac1:Play()
                                    if vanmeo then 
                                        ac.Completed:Connect(function()
                                            ab:Play()
                                            ab1:Play()
                                        end)
                                    end
                                end
                            end)
                        end
                    
                    
                    end

                    Hoithoitog.MouseButton1Click:Connect(function()
                        local co2, co1 = Cor2.BackgroundColor3, Cor1.BackgroundColor3
                        vanmeo = not vanmeo 
                        csize = vanmeo and UDim2.new(1,-4,1,-4) or UDim2.new(0,0,0,0)
                        pos = vanmeo and UDim2.new(.5,0,.5,0) or UDim2.new(0,0,1,0)
                        apos = vanmeo and Vector2.new(.5,.5) or Vector2.new(0,1)
                        game.TweenService:Create(check_2,TweenInfo.new(.25),{Size = csize, Position = pos, AnchorPoint = apos}):Play()
                        if vanmeo then 
                            ab = game.TweenService:Create(ColorVal,TweenInfo.new(2),{BackgroundColor3 = co1})
                            ab1 = game.TweenService:Create(Color,TweenInfo.new(2),{BackgroundColor3 = co1})
                            ab:Play()
                            ab1:Play()
                            local chuaxong = true
                            ab.Completed:Connect(function()
                                if vanmeo then 
                                    chuaxong=false
                                    ac = game.TweenService:Create(ColorVal,TweenInfo.new(2),{BackgroundColor3 = co2})
                                    ac1 = game.TweenService:Create(Color,TweenInfo.new(2),{BackgroundColor3 = co2})
                                    ac:Play()
                                    ac1:Play()
                                    if vanmeo then 
                                        ac.Completed:Connect(function()
                                            ab:Play()
                                            ab1:Play()
                                        end)
                                    end
                                end
                            end)
                        end
                    end)

                end

                function Setting_Section_Function.CreateBox(Setting,Callback)

                    local TitleText = tostring(Setting.Title) or ""
                    local Placeholder = tostring(Setting.Placeholder) or ""
                    local Default = Setting.Default or false
					local Callback = Callback or function() end

                    local BoxFrame = Instance.new("Frame")
                    local BoxCorner = Instance.new("UICorner")
                    local BoxBG = Instance.new("Frame")
                    local ButtonCorner = Instance.new("UICorner")
                    local Boxtitle = Instance.new("TextLabel")
                    local BoxCor = Instance.new("Frame")
                    local ButtonCorner_2 = Instance.new("UICorner")
                    local Boxxx = Instance.new("TextBox")
                    local Lineeeee = Instance.new("Frame")

                    BoxFrame.Name = "BoxFrame"
                    BoxFrame.Parent = Section
                    BoxFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    BoxFrame.BackgroundTransparency = 1.000
                    BoxFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
                    BoxFrame.Size = UDim2.new(1, 0, 0, 60)

                    BoxCorner.CornerRadius = UDim.new(0, 4)
                    BoxCorner.Name = "BoxCorner"
                    BoxCorner.Parent = BoxFrame

                    BoxBG.Name = "BoxBG"
                    BoxBG.Parent = BoxFrame
                    BoxBG.AnchorPoint = Vector2.new(0.5, 0.5)
                    BoxBG.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                    BoxBG.Position = UDim2.new(0.5, 0, 0.5, 0)
                    BoxBG.Size = UDim2.new(1, -10, 1, 0)

                    if BackgroundVideo then
                        BoxBG.BackgroundTransparency = GUITransparency
                    end

                    ButtonCorner.CornerRadius = UDim.new(0, 4)
                    ButtonCorner.Name = "ButtonCorner"
                    ButtonCorner.Parent = BoxBG

                    Boxtitle.Name = "Boxtitle"
                    Boxtitle.Parent = BoxBG
                    Boxtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Boxtitle.BackgroundTransparency = 1.000
                    Boxtitle.Position = UDim2.new(0, 10, 0, 0)
                    Boxtitle.Size = UDim2.new(1, -10, 0.5, 0)
                    Boxtitle.Font = Enum.Font.GothamBlack
                    Boxtitle.Text = TitleText
                    Boxtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Boxtitle.TextSize = 14.000
                    Boxtitle.TextXAlignment = Enum.TextXAlignment.Left

                    BoxCor.Name = "BoxCor"
                    BoxCor.Parent = BoxBG
                    BoxCor.AnchorPoint = Vector2.new(1, 0.5)
                    BoxCor.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
                    BoxCor.ClipsDescendants = true
                    BoxCor.Position = UDim2.new(1, -5, 0, 40)
                    BoxCor.Size = UDim2.new(1, -10, 0, 25)

                    ButtonCorner_2.CornerRadius = UDim.new(0, 4)
                    ButtonCorner_2.Name = "ButtonCorner"
                    ButtonCorner_2.Parent = BoxCor

                    Boxxx.Name = "Boxxx"
                    Boxxx.Parent = BoxCor
                    Boxxx.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Boxxx.BackgroundTransparency = 1.000
                    Boxxx.Position = UDim2.new(0, 5, 0, 0)
                    Boxxx.Size = UDim2.new(1, -5, 1, 0)
                    Boxxx.Font = Enum.Font.GothamBold
                    Boxxx.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
                    Boxxx.PlaceholderText = Placeholder
                    Boxxx.Text = ""
                    Boxxx.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Boxxx.TextSize = 14.000
                    Boxxx.TextXAlignment = Enum.TextXAlignment.Left

                    Lineeeee.Name = "Setting_Lineeeee"
					Lineeeee.Parent = BoxCor
					Lineeeee.BackgroundTransparency = 1.000
					Lineeeee.Position = UDim2.new(0, 0, 1, -2)
					Lineeeee.Size = UDim2.new(1, 0, 0, 6)
                    Lineeeee.BackgroundColor3 = getgenv().UI_Color['Custom Theme']['Line Color']
                    table.insert(getgenv().Occho, Lineeeee)

                    Boxxx.Focused:Connect(function() 
                        TweenService:Create(Lineeeee,TweenInfo.new(.5),{BackgroundTransparency = 0}):Play()
                    end)

                    Boxxx.Focused:Connect(function() 
                
                        Library_Function.ButtonEffect()

                    end)

                    Boxxx.FocusLost:Connect(function()
                        TweenService:Create(Lineeeee,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
                        if Boxxx.Text ~= '' then
                            Callback(Boxxx.Text)
                        end
                    end)

                    local textbox_function = {}

                    if Default then
                        Boxxx.Text = Default
                        Callback(Default)
                    end

                    function textbox_function.SetValue(Value)
                        Boxxx.Text = Value
                        Callback(Value)
                    end 

                    return textbox_function;


                end

                function Setting_Section_Function.CreateSlider(Setting,Callback)

                    local TitleText = tostring(Setting.Title) or ""
                    local Min_Value = tonumber(Setting.Min) or 0
                    local Max_Value = tonumber(Setting.Max) or 100
                    local Precise = Setting.Precise or false
                    local DefaultValue = tonumber(Setting.Default) or 0
                    local Callback = Callback or function() end

                    local SizeChia = 590;

                    local Callback = Callback or function() end

                    
                    local SliderFrame = Instance.new("Frame")
                    local SliderCorner = Instance.new("UICorner")
                    local SliderBG = Instance.new("Frame")
                    local SliderBGCorner = Instance.new("UICorner")
                    local SliderTitle = Instance.new("TextLabel")
                    local SliderBar = Instance.new("Frame")
                    local SliderButton = Instance.new("TextButton")
                    local SliderBarCorner = Instance.new("UICorner")
                    local Bar = Instance.new("Frame")
                    local BarCorner = Instance.new("UICorner")
                    local Sliderboxframe = Instance.new("Frame")
                    local Sliderbox = Instance.new("UICorner")
                    local Sliderbox_2 = Instance.new("TextBox")

                    SliderFrame.Name = TitleText..'buda'
                    SliderFrame.Parent = Section
                    SliderFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    SliderFrame.BackgroundTransparency = 1.000
                    SliderFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
                    SliderFrame.Size = UDim2.new(1, 0, 0, 50)

                    SliderCorner.CornerRadius = UDim.new(0, 4)
                    SliderCorner.Name = "SliderCorner"
                    SliderCorner.Parent = SliderFrame

                    SliderBG.Name = "Setting_SliderBG"
                    SliderBG.Parent = SliderFrame
                    SliderBG.AnchorPoint = Vector2.new(0.5, 0.5)
                    SliderBG.Position = UDim2.new(0.5, 0, 0.5, 0)
                    SliderBG.Size = UDim2.new(1, -10, 1, 0)
                    if BackgroundVideo then
                        SliderBG.BackgroundTransparency = GUITransparency
                    end
                    SliderBG.BackgroundColor3 = getgenv().UI_Color['Slider']['Background Color']
                    table.insert(getgenv().Occho, SliderBG)

                    SliderBGCorner.CornerRadius = UDim.new(0, 4)
                    SliderBGCorner.Name = "SliderBGCorner"
                    SliderBGCorner.Parent = SliderBG

                    SliderTitle.Name = "Setting_SliderTitle"
                    SliderTitle.Parent = SliderBG
                    SliderTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                    SliderTitle.BackgroundTransparency = 1.000
                    SliderTitle.Position = UDim2.new(0, 10, 0, 0)
                    SliderTitle.Size = UDim2.new(1, -10, 0, 25)
                    SliderTitle.Font = Enum.Font.GothamBlack
                    SliderTitle.Text = TitleText
                    SliderTitle.TextSize = 14.000
                    SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
                    SliderTitle.TextColor3 = getgenv().UI_Color['Slider']['Title Color']
                    table.insert(getgenv().Occho, SliderTitle)

                    SliderBar.Name = "Setting_SliderBar"
                    SliderBar.Parent = SliderFrame
                    SliderBar.AnchorPoint = Vector2.new(.5, 0.5)
                    SliderBar.Position = UDim2.new(.5, 0, 0.5, 14)
                    SliderBar.Size = UDim2.new(0, 590, 0, 6)
                    SliderBar.BackgroundColor3 = getgenv().UI_Color['Slider']['Barr Color']
                    table.insert(getgenv().Occho, SliderBar)

                    SliderButton.Name = "SliderButton "
                    SliderButton.Parent = SliderBar
                    SliderButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                    SliderButton.BackgroundTransparency = 1.000
                    SliderButton.Size = UDim2.new(1, 0, 1, 0)
                    SliderButton.Font = Enum.Font.GothamBold
                    SliderButton.Text = ""
                    SliderButton.TextColor3 = Color3.fromRGB(230, 230, 230)
                    SliderButton.TextSize = 14.000

                    SliderBarCorner.CornerRadius = UDim.new(1, 0)
                    SliderBarCorner.Name = "SliderBarCorner"
                    SliderBarCorner.Parent = SliderBar

                    Bar.Name = "Setting_Bar"
                    Bar.Parent = SliderBar
                    Bar.Size = UDim2.new(0, 0, 1, 0)
                    Bar.BackgroundColor3 = getgenv().UI_Color['Slider']['Bar Color']
                    table.insert(getgenv().Occho, Bar)


                    BarCorner.CornerRadius = UDim.new(1, 0)
                    BarCorner.Name = "BarCorner"
                    BarCorner.Parent = Bar

                    Sliderboxframe.Name = "Sliderboxframe"
                    Sliderboxframe.Parent = SliderFrame
                    Sliderboxframe.AnchorPoint = Vector2.new(1, 0)
                    Sliderboxframe.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
                    Sliderboxframe.Position = UDim2.new(1, -10, 0, 5)
                    Sliderboxframe.Size = UDim2.new(0, 150, 0, 25)

                    Sliderbox.CornerRadius = UDim.new(0, 4)
                    Sliderbox.Name = "Sliderbox"
                    Sliderbox.Parent = Sliderboxframe

                    Sliderbox_2.Name = "Setting_Sliderbox"
                    Sliderbox_2.Parent = Sliderboxframe
                    Sliderbox_2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                    Sliderbox_2.BackgroundTransparency = 1.000
                    Sliderbox_2.Size = UDim2.new(1, 0, 1, 0)
                    Sliderbox_2.Font = Enum.Font.GothamBold
                    Sliderbox_2.Text = ""
                    Sliderbox_2.TextSize = 14.000
                    Sliderbox_2.TextColor3 = getgenv().UI_Color['Slider']['Value Color']
                    table.insert(getgenv().Occho, Sliderbox_2)

                    SliderButton.MouseEnter:Connect(function()
                        TweenService:Create(Bar,TweenInfo.new(.5),{BackgroundColor3 = getgenv().UI_Color['Slider']['Bar Active Color']}):Play()
                    end)

                    SliderButton.MouseLeave:Connect(function()
                        TweenService:Create(Bar,TweenInfo.new(.5),{BackgroundColor3 = getgenv().UI_Color['Slider']['Bar Color']}):Play()
                    end)

                    local mouse = game.Players.LocalPlayer:GetMouse()

                    if DefaultValue then 
                        if DefaultValue <= Min_Value then DefaultValue = Min_Value elseif DefaultValue >= Max_Value then DefaultValue = Max_Value end
                        Bar.Size = UDim2.new(1 - ((Max_Value - DefaultValue) / (Max_Value - Min_Value)),0, 0, 6)
                        Sliderbox_2.Text = DefaultValue
                        Callback(DefaultValue)
                    end

                    SliderButton.MouseButton1Down:Connect(function()
                        local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

                        pcall(function()
                            Callback(value)
                            Sliderbox_2.Text = value
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                        moveconnection = mouse.Move:Connect(function()   
                            local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))
                            pcall(function()
                                Callback(value)
                                Sliderbox_2.Text = value
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                        end)
                        releaseconnection = uis.InputEnded:Connect(function(Mouse)
                            if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

                                pcall(function()
                                    Callback(value)
                                    Sliderbox_2.Text = value
                                end)
                                Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                                moveconnection:Disconnect()
                                releaseconnection:Disconnect()
                            end
                        end)
                    end)

                    local function GetSliderValue(Value)
                        if tonumber(Value) <= Min_Value then
                            Bar.Size = UDim2.new(0,(0 * SizeChia), 0, 6)
                            Sliderbox_2.Text = Min_Value
                            Callback(tonumber(Min_Value))

                        elseif tonumber(Value) >= Max_Value then
                            Bar.Size = UDim2.new(0,(Max_Value  /  Max_Value * SizeChia), 0, 6)
                            Sliderbox_2.Text = Max_Value
                            Callback(tonumber(Max_Value))
                        else
                            Bar.Size = UDim2.new(1 - ((Max_Value - Value) / (Max_Value - Min_Value)),0, 0, 6)
                            Callback(tonumber(Value))
                        end
                    end


                    Sliderbox_2.FocusLost:Connect(function()
                        GetSliderValue(Sliderbox_2.Text)
                    end)


                    local slider_function = {}

                    function slider_function.SetValue(Value)
                        GetSliderValue(Value)
                    end

                    return slider_function



                end

            return Setting_Section_Function

        end

        return Setting_Function


    end


    local Main_Function = {}

	local LayoutOrderBut = -1
	local LayoutOrder = -1
    function Main_Function.CreatePage(Setting)

        local Page_Name = tostring(Setting.Page_Name) 
        local Page_Title = tostring(Setting.Page_Title)

        LayoutOrder = LayoutOrder + 1
        LayoutOrderBut = LayoutOrderBut + 1

        --Control 
        local PageName = Instance.new("Frame")
        local Frame = Instance.new("Frame")
        local TabNameCorner = Instance.new("UICorner")
        local Line = Instance.new("Frame")
        local InLine = Instance.new("Frame")
        local LineCorner = Instance.new("UICorner")
        local TabTitleContainer = Instance.new("Frame")
        local TabTitle = Instance.new("TextLabel")
        local PageButton = Instance.new("TextButton")


        PageName.Name = Page_Name.."_Control"
        PageName.Parent = ControlList
        PageName.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        PageName.BackgroundTransparency = 1.000
        PageName.Size = UDim2.new(1, -10, 0, 25)
        PageName.LayoutOrder = LayoutOrderBut

        Frame.Parent = PageName
        Frame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        Frame.BackgroundTransparency = 1.000
        Frame.Position = UDim2.new(0, 5, 0, 0)
        Frame.Size = UDim2.new(1, -5, 1, 0)

        TabNameCorner.CornerRadius = UDim.new(0, 4)
        TabNameCorner.Name = "TabNameCorner"
        TabNameCorner.Parent = Frame

        Line.Name = "Line"
        Line.Parent = Frame
        Line.AnchorPoint = Vector2.new(0, 0.5)
        Line.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        Line.BackgroundTransparency = 1.000
        Line.Position = UDim2.new(0, 0, 0.5, 0)
        Line.Size = UDim2.new(0, 14, 1, 0)

        InLine.Name = "PageInLine"
        InLine.Parent = Line
        InLine.AnchorPoint = Vector2.new(0.5, 0.5)
        InLine.BorderSizePixel = 0
        InLine.Position = UDim2.new(0.5, 0, 0.5, 0)
        InLine.Size = UDim2.new(1, -10, 0, 0)
        InLine.BackgroundColor3 = getgenv().UI_Color['Page']['Page Selected Color']
        table.insert(getgenv().Occho, InLine)

        LineCorner.Name = "LineCorner"
        LineCorner.Parent = InLine

        TabTitleContainer.Name = "TabTitleContainer"
        TabTitleContainer.Parent = Frame
        TabTitleContainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        TabTitleContainer.BackgroundTransparency = 1.000
        TabTitleContainer.Position = UDim2.new(0, 15, 0, 0)
        TabTitleContainer.Size = UDim2.new(1, -15, 1, 0)

        TabTitle.Name = "TabTitle"
        TabTitle.Parent = TabTitleContainer
        TabTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        TabTitle.BackgroundTransparency = 1.000
        TabTitle.Size = UDim2.new(1, 0, 1, 0)
        TabTitle.Font = Enum.Font.GothamBold
        TabTitle.Text = Page_Name
        TabTitle.TextColor3 = Color3.fromRGB(230, 230, 230)
        TabTitle.TextSize = 14.000
        TabTitle.TextXAlignment = Enum.TextXAlignment.Left

        PageButton.Name = "PageButton"
        PageButton.Parent = PageName
        PageButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        PageButton.BackgroundTransparency = 1.000
        PageButton.Size = UDim2.new(1, 0, 1, 0)
        PageButton.Font = Enum.Font.SourceSans
        PageButton.Text = ""
        PageButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        PageButton.TextSize = 14.000

        -- Container

        local PageContainer = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local PageTitle = Instance.new("TextLabel")
        local PageList = Instance.new("ScrollingFrame")
        local Pagelistlayout = Instance.new("UIListLayout")

        PageContainer.Name = Page_Name.."_Container"
        PageContainer.Parent = MainPage
        PageContainer.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        PageContainer.Position = UDim2.new(0, 190, 0, 30)
        PageContainer.Size = UDim2.new(0, 435, 0, 325)
        PageContainer.LayoutOrder = LayoutOrder
        if BackgroundVideo then
            PageContainer.BackgroundTransparency = GUITransparency
        end

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = PageContainer

        PageTitle.Name = "PageTitle"
        PageTitle.Parent = PageContainer
        PageTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        PageTitle.BackgroundTransparency = 1.000
        PageTitle.Position = UDim2.new(0, 5, 0, 0)
        PageTitle.Size = UDim2.new(1, 0, 0, 25)
        PageTitle.Font = Enum.Font.GothamBold
        PageTitle.Text = Page_Title
        PageTitle.TextColor3 = Color3.fromRGB(230, 230, 230)
        PageTitle.TextSize = 16.000
        PageTitle.TextXAlignment = Enum.TextXAlignment.Left

        PageList.Name = "PageList"
        PageList.Parent = PageContainer
        PageList.Active = true
        PageList.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        PageList.BackgroundTransparency = 1.000
        PageList.BorderColor3 = Color3.fromRGB(27, 42, 53)
        PageList.BorderSizePixel = 0
        PageList.Position = UDim2.new(0, 5, 0, 30)
        PageList.Size = UDim2.new(1, -10, 1, -30)
        PageList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        PageList.ScrollBarThickness = 5
        PageList.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

        Pagelistlayout.Name = "Pagelistlayout"
        Pagelistlayout.Parent = PageList
        Pagelistlayout.SortOrder = Enum.SortOrder.LayoutOrder
        Pagelistlayout.Padding = UDim.new(0, 5)
        Pagelistlayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            PageList.CanvasSize = UDim2.new(0, 0, 0, Pagelistlayout.AbsoluteContentSize.Y + 5)
        end)

        local PageSearch = Instance.new("Frame")
        local PageSearchCorner = Instance.new("UICorner")
        local SearchFrame = Instance.new("Frame")
        local SearchIcon = Instance.new("ImageLabel")
        local active = Instance.new("TextButton")
        local Bucu = Instance.new("TextBox")

        PageSearch.Name = "PageSearch"
        PageSearch.Parent = PageContainer
        PageSearch.AnchorPoint = Vector2.new(1, 0)
        PageSearch.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
        PageSearch.Position = UDim2.new(1, -5, 0, 5)
        PageSearch.Size = UDim2.new(0, 20, 0, 20)
        PageSearch.ClipsDescendants = true

        PageSearchCorner.CornerRadius = UDim.new(0, 2)
        PageSearchCorner.Name = "PageSearchCorner"
        PageSearchCorner.Parent = PageSearch

        SearchFrame.Name = "SearchFrame"
        SearchFrame.Parent = PageSearch
        SearchFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SearchFrame.BackgroundTransparency = 1.000
        SearchFrame.Size = UDim2.new(0, 20, 0, 20)

        SearchIcon.Name = "SearchIcon"
        SearchIcon.Parent = SearchFrame
        SearchIcon.AnchorPoint = Vector2.new(0.5, 0.5)
        SearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SearchIcon.BackgroundTransparency = 1.000
        SearchIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
        SearchIcon.Size = UDim2.new(0, 16, 0, 16)
        SearchIcon.Image = "rbxassetid://8154282545"

        active.Name = "active"
        active.Parent = SearchFrame
        active.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        active.BackgroundTransparency = 1.000
        active.Size = UDim2.new(1, 0, 1, 0)
        active.Font = Enum.Font.SourceSans
        active.Text = ""
        active.TextColor3 = Color3.fromRGB(0, 0, 0)
        active.TextSize = 14.000

        Bucu.Name = "Bucu"
        Bucu.Parent = PageSearch
        Bucu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Bucu.BackgroundTransparency = 1.000
        Bucu.Position = UDim2.new(0, 30, 0, 0)
        Bucu.Size = UDim2.new(1, -30, 1, 0)
        Bucu.Font = Enum.Font.GothamBold
        Bucu.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
        Bucu.Text = ""
        Bucu.TextColor3 = Color3.fromRGB(255, 255, 255)
        Bucu.TextSize = 14.000
        Bucu.TextXAlignment = Enum.TextXAlignment.Left
        Bucu.PlaceholderText = "Search Section name"

        local cummmed = false 

        active.MouseEnter:Connect(function()
            TweenService:Create(SearchIcon,TweenInfo.new(0.1),{ImageColor3 = getgenv().UI_Color['Page']['Page Search Color']}):Play()
        end)

        active.MouseLeave:Connect(function()
            TweenService:Create(SearchIcon,TweenInfo.new(0.1),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
        end)

        active.MouseButton1Click:Connect(function()
            Library_Function.ButtonEffect()
        end)

        Bucu.Focused:Connect(function()
            Library_Function.ButtonEffect()
        end)

        active.MouseButton1Click:Connect(function()
            cummmed = not cummmed
            local size = cummmed and UDim2.new(0,175,0,20) or  UDim2.new(0,20,0,20)
	        game.TweenService:Create(PageSearch,TweenInfo.new(.5),{Size = size}):Play()
        end)

        local function succac()
            for i,v in next, PageList:GetChildren() do 
                if not v:IsA('UIListLayout') then 
                    v.Visible = false
                end
            end
        end
        
        local function ra()
            for a, b in pairs(PageList:GetChildren()) do
                if not b:IsA('UIListLayout') then 
                    if string.find(string.lower(b.Name),string.lower(Bucu.Text)) then 
                        b.Visible = true
                    end
                end
            end
        end
        
        Bucu:GetPropertyChangedSignal("Text"):Connect(function()
            succac()
            ra()
        end)

        for i,v in pairs(ControlList:GetChildren()) do
            if not (v:IsA('UIListLayout')) then
                if i == 2 then 
                    v.Frame.Line.PageInLine.Size = UDim2.new(1, -10, 1, -10)
                    oldlay = v.LayoutOrder
					oldobj = v
                end
            end
        end

        PageButton.MouseButton1Click:Connect(function()
            Library_Function.ButtonEffect()
        end)

        PageButton.MouseButton1Click:Connect(function()

            if PageContainer.Name == Page_Name.."_Container" then 

                for i,v in pairs(MainPage:GetChildren()) do
                    if not (v:IsA('UIPageLayout')) and not (v:IsA('UICorner')) then
                        v.Visible = false
                    end
                end
                PageContainer.Visible = true 
                UIPage:JumpTo(PageContainer)

                for i,v in next, ControlList:GetChildren() do
                    if not (v:IsA('UIListLayout')) then
                        if v.Name == Page_Name.."_Control" then 
                            if v.LayoutOrder > oldlay  then 
								oldobj.Active = false 
								TweenService:Create(oldobj.Frame.Line.PageInLine,TweenInfo.new(.175),{Size = UDim2.new(1,-10,0,0),Position = UDim2.new(0.5, 0, 1, 0), AnchorPoint = Vector2.new(.5,1)}):Play()
								v.Frame.Line.PageInLine.Position = UDim2.new(0.5, 0, 0, 0)
								v.Frame.Line.PageInLine.AnchorPoint = Vector2.new(.5,0)
								wait(.25/2)
								TweenService:Create(v.Frame.Line.PageInLine,TweenInfo.new(.175),{Size = UDim2.new(1,-10,1,-10),Position = UDim2.new(0.5, 0, .5, 0), AnchorPoint = Vector2.new(.5,.5)}):Play()

								v.Active = true
								oldobj = v
								oldlay = v.LayoutOrder
							else
								oldobj.Active = false 
								TweenService:Create(oldobj.Frame.Line.PageInLine,TweenInfo.new(.175),{Size = UDim2.new(1,-10,0,0),Position = UDim2.new(0.5, 0, 0, 0), AnchorPoint = Vector2.new(.5,0)}):Play()
								v.Frame.Line.PageInLine.Position = UDim2.new(0.5, 0, 1, 0)
								v.Frame.Line.PageInLine.AnchorPoint = Vector2.new(.5,1)
								wait(.25/2)
								TweenService:Create(v.Frame.Line.PageInLine,TweenInfo.new(.175),{Size = UDim2.new(1,-10,1,-10),Position = UDim2.new(0.5, 0, .5, 0), AnchorPoint = Vector2.new(.5,.5)}):Play()
								v.Active = true
								oldobj = v
								oldlay = v.LayoutOrder
							end

                        end
                    end
                end

            end
        end)

        local Page_Function = {}

            function Page_Function.CreateSection(Section_Name)

                local Section = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Topsec = Instance.new("Frame")
                local Sectiontitle = Instance.new("TextLabel")
                local Linesec = Instance.new("Frame")
                local UIGradient = Instance.new("UIGradient")
                local SectionList = Instance.new("UIListLayout")


                Section.Name = Section_Name.."_Dot"
                Section.Parent = PageList
                Section.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                Section.Size = UDim2.new(0, 415, 0, 100)
                if BackgroundVideo then
                    Section.BackgroundTransparency = GUITransparency
                end

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Section

                Topsec.Name = "Topsec"
                Topsec.Parent = Section
                Topsec.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                Topsec.BackgroundTransparency = 1.000
                Topsec.Size = UDim2.new(0, 415, 0, 30)

                Sectiontitle.Name = "Sectiontitle"
                Sectiontitle.Parent = Topsec
                Sectiontitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                Sectiontitle.BackgroundTransparency = 1.000
                Sectiontitle.Size = UDim2.new(1, 0, 1, 0)
                Sectiontitle.Font = Enum.Font.GothamBold
                Sectiontitle.Text = Section_Name
                Sectiontitle.TextSize = 14.000
                Sectiontitle.TextColor3 = getgenv().UI_Color['Section']['Text Color']
                table.insert(getgenv().Occho, Sectiontitle)

                Linesec.Name = "SecLinesec"
                Linesec.Parent = Topsec
                Linesec.AnchorPoint = Vector2.new(0.5, 1)
                Linesec.BorderSizePixel = 0
                Linesec.Position = UDim2.new(0.5, 0, 1, -2)
                Linesec.Size = UDim2.new(1, -10, 0, 2)
                Linesec.BackgroundColor3 = getgenv().UI_Color['Section']['Underline Color']
                table.insert(getgenv().Occho, Linesec)

                UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(0.51, 0.02), NumberSequenceKeypoint.new(1.00, 1.00)}
                UIGradient.Parent = Linesec

                SectionList.Name = "SectionList"
                SectionList.Parent = Section
                SectionList.SortOrder = Enum.SortOrder.LayoutOrder
                SectionList.Padding = UDim.new(0, 5)

                SectionList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    Section.Size = UDim2.new(1, -5, 0, SectionList.AbsoluteContentSize.Y + 5)
                end)

                local Section_Function = {}

                   function Section_Function.CreateToggle(Setting, Callback)

                        local Title = tostring(Setting.Title)
                        local Desc = Setting.Desc
                        local Default = Setting.Default or false
                        local Callback = Callback or function() end

                        local ToggleFrame = Instance.new("Frame")
                        local TogFrame1 = Instance.new("Frame")
                        local checkbox = Instance.new("ImageLabel")
                        local check = Instance.new("ImageLabel")
                        local ToggleDesc = Instance.new("TextLabel")
                        local ToggleTitle = Instance.new("TextLabel")
                        local ToggleBg = Instance.new("Frame")
                        local ToggleCorner = Instance.new("UICorner")
                        local ToggleButton = Instance.new("TextButton")
                        local ToggleList = Instance.new("UIListLayout")

                        ToggleFrame.Name = "ToggleFrame"
                        ToggleFrame.Parent = Section
                        ToggleFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        ToggleFrame.BackgroundTransparency = 1.000
                        ToggleFrame.Position = UDim2.new(0, 0, 0.300000012, 0)
                        ToggleFrame.Size = UDim2.new(1, 0, 0, 0)
                        ToggleFrame.AutomaticSize = Enum.AutomaticSize.Y

                        TogFrame1.Name = "TogFrame1"
                        TogFrame1.Parent = ToggleFrame
                        TogFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
                        TogFrame1.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        TogFrame1.BackgroundTransparency = 1.000
                        TogFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
                        TogFrame1.Size = UDim2.new(1, -10, 0, 0)
                        TogFrame1.AutomaticSize = Enum.AutomaticSize.Y

                        checkbox.Name = "checkbox"
                        checkbox.Parent = TogFrame1
                        checkbox.AnchorPoint = Vector2.new(1, 0.5)
                        checkbox.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        checkbox.BackgroundTransparency = 1.000
                        checkbox.Position = UDim2.new(1, -5, 0.5, 3)
                        checkbox.Size = UDim2.new(0, 25, 0, 25)
                        checkbox.Image = "rbxassetid://4552505888"
                        checkbox.ImageColor3 = getgenv().UI_Color['Toggle']['Checkbox Color']
                        table.insert(getgenv().Occho, checkbox)

                        check.Name = "check"
                        check.Parent = checkbox
                        check.AnchorPoint = Vector2.new(0, 1)
                        check.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        check.BackgroundTransparency = 1.000
                        check.Position = UDim2.new(0, 0, 1, 0)
                        check.Image = "rbxassetid://4555411759"
                        check.ImageColor3 = getgenv().UI_Color['Toggle']['Checked Color']
                        table.insert(getgenv().Occho, check)

                        local cac = 5
                        if Desc then
                            cac = 0
                            ToggleDesc.Name = "ToggleDesc"
                            ToggleDesc.Parent = TogFrame1
                            ToggleDesc.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            ToggleDesc.BackgroundTransparency = 1.000
                            ToggleDesc.Position = UDim2.new(0, 15, 0, 20)
                            ToggleDesc.Size = UDim2.new(1, -50, 0, 0)
                            ToggleDesc.Font = Enum.Font.GothamBlack
                            ToggleDesc.Text = Desc
                            ToggleDesc.TextSize = 13.000
                            ToggleDesc.TextWrapped = true
                            ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
                            ToggleDesc.RichText = true
                            ToggleDesc.AutomaticSize = Enum.AutomaticSize.Y
                            ToggleDesc.TextColor3 = getgenv().UI_Color['Toggle']['Desc Color']
                            table.insert(getgenv().Occho, ToggleDesc)
						else
							ToggleDesc.Text = ''
						end

                        ToggleTitle.Name = "ToggleTitle"
                        ToggleTitle.Parent = TogFrame1
                        ToggleTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        ToggleTitle.BackgroundTransparency = 1.000
                        ToggleTitle.Position = UDim2.new(0, 10, 0, cac)
                        ToggleTitle.Size = UDim2.new(1, -10, 0, 20)
                        ToggleTitle.Font = Enum.Font.GothamBlack
                        ToggleTitle.Text = Title
                        ToggleTitle.TextSize = 14.000
                        ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
                        ToggleTitle.TextYAlignment = Enum.TextYAlignment.Center
                        ToggleTitle.RichText = true
                        ToggleTitle.AutomaticSize = Enum.AutomaticSize.Y
                        ToggleTitle.TextColor3 = getgenv().UI_Color['Toggle']['Title Color']
                        table.insert(getgenv().Occho, ToggleTitle)

                        ToggleBg.Name = "ToggleBg"
                        ToggleBg.Parent = TogFrame1
                        ToggleBg.Size = UDim2.new(1, 0, 1, 6)
                        ToggleBg.ZIndex = 0
						if BackgroundVideo then
							ToggleBg.BackgroundTransparency = GUITransparency
						end
                        ToggleBg.BackgroundColor3 = getgenv().UI_Color['Toggle']['Background Color']
                        table.insert(getgenv().Occho, ToggleBg)

                        ToggleCorner.CornerRadius = UDim.new(0, 4)
                        ToggleCorner.Name = "ToggleCorner"
                        ToggleCorner.Parent = ToggleBg

                        ToggleButton.Name = "ToggleButton"
                        ToggleButton.Parent = TogFrame1
                        ToggleButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        ToggleButton.BackgroundTransparency = 1.000
                        ToggleButton.Size = UDim2.new(1, 0, 1, 6)
                        ToggleButton.Font = Enum.Font.SourceSans
                        ToggleButton.Text = ""
                        ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        ToggleButton.TextSize = 14.000

                        ToggleList.Name = "ToggleList"
                        ToggleList.Parent = ToggleFrame
                        ToggleList.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        ToggleList.SortOrder = Enum.SortOrder.LayoutOrder
                        ToggleList.VerticalAlignment = Enum.VerticalAlignment.Center
                        ToggleList.Padding = UDim.new(0, 5)

                        local function ChangeStage(val)

                            local csize = val and UDim2.new(1,-4,1,-4) or UDim2.new(0,0,0,0)
                            local pos = val and UDim2.new(.5,0,.5,0) or UDim2.new(0,0,1,0)
                            local apos = val and Vector2.new(.5,.5) or Vector2.new(0,1)

                            game.TweenService:Create(check,TweenInfo.new(.25),{Size = csize, Position = pos, AnchorPoint = apos}):Play()

                            Callback(val)

                        end

                        if  Callback then ChangeStage(Default) end 

                        ToggleButton.MouseButton1Click:Connect(function()
                            Library_Function.ButtonEffect()
                        end)

                        ToggleButton.MouseButton1Down:Connect(function()
                            Default = not Default
							ChangeStage(Default)
                        end)

                        local tog_func = {}

								function tog_func.SetStage(value)
									ChangeStage(value)
								end

						return tog_func


                    end

                    function Section_Function.CreateButton(Setting, Callback)

                        local Title = Setting.Title
                        local Callback = Callback or function() end

                        local ButtonFrame = Instance.new("Frame")
                        local ButtonBG = Instance.new("Frame")
                        local ButtonCorner = Instance.new("UICorner")
                        local ButtonTitle = Instance.new("TextLabel")
                        local Button = Instance.new("TextButton")

                        ButtonFrame.Name = Title..'dot'
                        ButtonFrame.Parent = Section
                        ButtonFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        ButtonFrame.BackgroundTransparency = 1.000
                        ButtonFrame.Position = UDim2.new(0, 0, 0.300000012, 0)
                        ButtonFrame.Size = UDim2.new(1, 0, 0, 25)

                        ButtonBG.Name = "ButtonBG"
                        ButtonBG.Parent = ButtonFrame
                        ButtonBG.AnchorPoint = Vector2.new(0.5, 0.5)
                        ButtonBG.Position = UDim2.new(0.5, 0, 0.5, 0)
                        ButtonBG.Size = UDim2.new(1, -10, 1, 0)
						if BackgroundVideo then
							ButtonBG.BackgroundTransparency = GUITransparency
						end
                        ButtonBG.BackgroundColor3 = getgenv().UI_Color['Button']['Main Color']
                        table.insert(getgenv().Occho, ButtonBG)

                        ButtonCorner.CornerRadius = UDim.new(0, 4)
                        ButtonCorner.Name = "ButtonCorner"
                        ButtonCorner.Parent = ButtonBG

                        ButtonTitle.Name = "ButtonTitle"
                        ButtonTitle.Parent = ButtonBG
                        ButtonTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        ButtonTitle.BackgroundTransparency = 1.000
                        ButtonTitle.Position = UDim2.new(0, 10, 0, 0)
                        ButtonTitle.Size = UDim2.new(1, -10, 1, 0)
                        ButtonTitle.Font = Enum.Font.GothamBlack
                        ButtonTitle.Text = Title
                        ButtonTitle.TextSize = 14.000
                        ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
                        ButtonTitle.TextColor3 = getgenv().UI_Color['Button']['Text Color']
                        table.insert(getgenv().Occho, ButtonTitle)

                        Button.Name = "Button"
                        Button.Parent = ButtonBG
                        Button.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        Button.BackgroundTransparency = 1.000
                        Button.Size = UDim2.new(1, 0, 1, 0)
                        Button.Font = Enum.Font.SourceSans
                        Button.Text = ""
                        Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                        Button.TextSize = 14.000

                        Button.MouseButton1Click:Connect(function()
                            Library_Function.ButtonEffect()
                        end)

                        Button.MouseButton1Down:Connect(function()
                            Callback()
                        end)

                    end

                    function Section_Function.CreateLabel(Setting)

                        local Title = tostring(Setting.Title)

                        local LabelFrame = Instance.new("Frame")
                        local LabelBG = Instance.new("Frame")
                        local LabelCorner = Instance.new("UICorner")
                        local LabelTitle = Instance.new("TextLabel")

                        LabelFrame.Name = "LabelFrame"
                        LabelFrame.Parent = Section
                        LabelFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        LabelFrame.BackgroundTransparency = 1.000
                        LabelFrame.Position = UDim2.new(0, 0, 0.300000012, 0)
                        LabelFrame.Size = UDim2.new(1, 0, 0, 25)

                        LabelBG.Name = "LabelBG"
                        LabelBG.Parent = LabelFrame
                        LabelBG.AnchorPoint = Vector2.new(0.5, 0.5)
                        LabelBG.Position = UDim2.new(0.5, 0, 0.5, 0)
                        LabelBG.Size = UDim2.new(1, -10, 1, 0)
						if BackgroundVideo then
							LabelBG.BackgroundTransparency = GUITransparency
						end
                        LabelBG.BackgroundColor3 = getgenv().UI_Color['Label']['Main Color']
                        table.insert(getgenv().Occho, LabelBG)

                        LabelCorner.CornerRadius = UDim.new(0, 4)
                        LabelCorner.Name = "LabelCorner"
                        LabelCorner.Parent = LabelBG

                        LabelTitle.Name = "LabelTitle"
                        LabelTitle.Parent = LabelBG
                        LabelTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        LabelTitle.BackgroundTransparency = 1.000
                        LabelTitle.Position = UDim2.new(0, 10, 0, 0)
                        LabelTitle.Size = UDim2.new(1, -10, 1, 0)
                        LabelTitle.Font = Enum.Font.GothamBlack
                        LabelTitle.Text = Title
                        LabelTitle.TextSize = 14.000
                        LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
                        LabelTitle.TextColor3 = getgenv().UI_Color['Label']['Text Color']
                        table.insert(getgenv().Occho, LabelTitle)

                        local label_func = {}

                            function label_func.SetText(text)
                                LabelTitle.Text = text
                            end

                            function label_func.SetColor(color)
                                LabelTitle.TextColor3 = color
                            end

                        return label_func
                    end

                    function Section_Function.CreateDropdown(Setting, Callback)

                        local Title = tostring(Setting.Title)
                        local List = Setting.List
                        local Search = Setting.Search or false
						local Selected = Setting.Selected or false
                        local Default = Setting.Default
                        local Callback = Callback or function() end

                        local DropdownFrame = Instance.new("Frame")
                        local Dropdownbg = Instance.new("Frame")
                        local Dropdowncorner = Instance.new("UICorner")
                        local Topdrop = Instance.new("Frame")
                        local UICorner = Instance.new("UICorner")
                        local ImgDrop = Instance.new("ImageLabel")
                        local DropdownButton = Instance.new("TextButton")
                        local Dropdownlisttt = Instance.new("Frame")
                        local DropdownScroll = Instance.new("ScrollingFrame")
                        local ScrollContainer = Instance.new("Frame")
                        local ScrollContainerList = Instance.new("UIListLayout")


                        local Dropdowntitle; 
                        if Search then 
                            Dropdowntitle = Instance.new("TextBox")
                            DropdownButton.Visible = false
                        else
                            Dropdowntitle = Instance.new("TextLabel")
                        end


                        DropdownFrame.Name = Title.."DropdownFrame"
                        DropdownFrame.Parent = Section
                        DropdownFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        DropdownFrame.BackgroundTransparency = 1.000
                        DropdownFrame.Position = UDim2.new(0, 0, 0.473684222, 0)
                        DropdownFrame.Size = UDim2.new(1, 0, 0, 25)

                        Dropdownbg.Name = "Dropdownbg"
                        Dropdownbg.Parent = DropdownFrame
                        Dropdownbg.AnchorPoint = Vector2.new(0.5, 0.5)
                        Dropdownbg.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                        Dropdownbg.Position = UDim2.new(0.5, 0, 0.5, 0)
                        Dropdownbg.Size = UDim2.new(1, -10, 1, 0)
                        Dropdownbg.ClipsDescendants = true
						if BackgroundVideo then
							Dropdownbg.BackgroundTransparency = GUITransparency
						end

                        Dropdowncorner.CornerRadius = UDim.new(0, 4)
                        Dropdowncorner.Name = "Dropdowncorner"
                        Dropdowncorner.Parent = Dropdownbg

                        Topdrop.Name = "Topdrop"
                        Topdrop.Parent = Dropdownbg
                        Topdrop.Size = UDim2.new(1, 0, 0, 25)
						if BackgroundVideo then
							Topdrop.BackgroundTransparency = GUITransparency
						end
                        Topdrop.BackgroundColor3 = getgenv().UI_Color['Dropdown']['Button Color']
                        table.insert(getgenv().Occho, Topdrop)

                        UICorner.CornerRadius = UDim.new(0, 4)
                        UICorner.Parent = Topdrop

                        Dropdowntitle.Name = "Dropdowntitle"
                        Dropdowntitle.Parent = Topdrop
                        Dropdowntitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        Dropdowntitle.BackgroundTransparency = 1.000
                        Dropdowntitle.Position = UDim2.new(0, 10, 0, 0)
                        Dropdowntitle.Size = UDim2.new(1, -10, 1, 0)
                        Dropdowntitle.Font = Enum.Font.GothamBlack
                        Dropdowntitle.Text = ''
                        Dropdowntitle.TextSize = 14.000
                        Dropdowntitle.TextXAlignment = Enum.TextXAlignment.Left
                        local Sel = Instance.new("IntValue",Dropdowntitle)
                        Sel.Value=-1
                        if Default and table.find(List,Default) then 
                            Sel.Value=table.find(List,Default)
                        end
                        if not Selected then
                            if Search then
                                Dropdowntitle.PlaceholderText = Title..': '..tostring(Default); 
                            else
                                Dropdowntitle.Text = Title..': '..tostring(Default); 
                            end
                        else
                            Dropdowntitle.Text = Title..': '..tostring(Default)
                        end
                        Dropdowntitle.TextColor3 = getgenv().UI_Color['Dropdown']['Text Color']
                        table.insert(getgenv().Occho, Dropdowntitle)

                        ImgDrop.Name = "ImgDrop"
                        ImgDrop.Parent = Topdrop
                        ImgDrop.AnchorPoint = Vector2.new(1, 0.5)
                        ImgDrop.BackgroundTransparency = 1.000
                        ImgDrop.BorderColor3 = Color3.fromRGB(27, 42, 53)
                        ImgDrop.Position = UDim2.new(1, -6, 0.5, 0)
                        ImgDrop.Size = UDim2.new(0, 15, 0, 15)
                        ImgDrop.Image = "rbxassetid://6954383209"
                        ImgDrop.BackgroundColor3 = getgenv().UI_Color['Dropdown']['Icon Color']
                        table.insert(getgenv().Occho, ImgDrop)

                        DropdownButton.Name = "DropdownButton"
                        DropdownButton.Parent = Topdrop
                        DropdownButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        DropdownButton.BackgroundTransparency = 1.000
                        DropdownButton.Size = UDim2.new(1, 0, 1, 0)
                        DropdownButton.Font = Enum.Font.GothamBold
                        DropdownButton.Text = ""
                        DropdownButton.TextColor3 = Color3.fromRGB(230, 230, 230)
                        DropdownButton.TextSize = 14.000

                        Dropdownlisttt.Name = "Dropdownlisttt"
                        Dropdownlisttt.Parent = Dropdownbg
                        Dropdownlisttt.BackgroundTransparency = 1.000
                        Dropdownlisttt.BorderSizePixel = 0
                        Dropdownlisttt.Position = UDim2.new(0, 0, 0, 25)
                        Dropdownlisttt.Size = UDim2.new(1, 0, 0, 25)
						if BackgroundVideo then
							Dropdownlisttt.BackgroundTransparency = GUITransparency
						end
                        Dropdownlisttt.BackgroundColor3 = getgenv().UI_Color['Dropdown']['Main Color']
                        table.insert(getgenv().Occho, Dropdownlisttt)

                        DropdownScroll.Name = "DropdownScroll"
                        DropdownScroll.Parent = Dropdownlisttt
                        DropdownScroll.Active = true
                        DropdownScroll.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        DropdownScroll.BackgroundTransparency = 1.000
                        DropdownScroll.BorderSizePixel = 0
                        DropdownScroll.Size = UDim2.new(1, 0, 1, 0)
                        DropdownScroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                        DropdownScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
                        DropdownScroll.ScrollBarThickness = 5
                        DropdownScroll.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

                        ScrollContainer.Name = "ScrollContainer"
                        ScrollContainer.Parent = DropdownScroll
                        ScrollContainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        ScrollContainer.BackgroundTransparency = 1.000
                        ScrollContainer.Position = UDim2.new(0, 5, 0, 5)
                        ScrollContainer.Size = UDim2.new(1, -15, 1, -5)

                        ScrollContainerList.Name = "ScrollContainerList"
                        ScrollContainerList.Parent = ScrollContainer
                        ScrollContainerList.SortOrder = Enum.SortOrder.LayoutOrder

                        ScrollContainerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                            DropdownScroll.CanvasSize = UDim2.new(0, 0, 0, 10 + ScrollContainerList.AbsoluteContentSize.Y + 5)
                        end)

                        local isbusy = false

                        local found = {}

						local searchtable = {}
						
						local function edit()
							for i in pairs(found) do
								found[i] = nil
							end
							for h, l in pairs(ScrollContainer:GetChildren()) do
								if not l:IsA("UIListLayout") and not l:IsA("UIPadding") and not l:IsA('UIGridLayout') then
									l.Visible = false
								end
							end
							Dropdowntitle.Text = string.lower(Dropdowntitle.Text)
						end

                        local function SearchDropdown()
							local Results = {}
							for i, v in pairs(searchtable) do
								if string.find(v, Dropdowntitle.Text) then
									table.insert(found, v)
								end
							end
							for a, b in pairs(ScrollContainer:GetChildren()) do
								for c, d in pairs(found) do
									if d == b.Name then
										b.Visible = true
									end
								end
							end
						end

                        local function clear_object_in_list()
							for i,v in next, ScrollContainer:GetChildren() do 
								if v:IsA('Frame') then 
									v:Destroy()
								end
							end
						end

						local ListNew = List
                        
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
                                    local Dropval = Instance.new("Frame")
                                    local DropvalCorner = Instance.new("UICorner")
                                    local Line = Instance.new("Frame")
                                    local InLine = Instance.new("Frame")
                                    local LineCorner = Instance.new("UICorner")
                                    local Dropvalcontainer = Instance.new("Frame")
                                    local Dropvalbutton = Instance.new("TextButton")

                                    Dropval.Name = string.lower(v)
                                    Dropval.Parent = ScrollContainer
                                    Dropval.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                    Dropval.BackgroundTransparency = 1.000
                                    Dropval.Size = UDim2.new(1, 0, 0, 25)

                                    DropvalCorner.CornerRadius = UDim.new(0, 4)
                                    DropvalCorner.Name = "DropvalCorner"
                                    DropvalCorner.Parent = Dropval

                                    Line.Name = "Line"
                                    Line.Parent = Dropval
                                    Line.AnchorPoint = Vector2.new(0, 0.5)
                                    Line.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                    Line.BackgroundTransparency = 1.000
                                    Line.Position = UDim2.new(0, 0, 0.5, 0)
                                    Line.Size = UDim2.new(0, 14, 1, 0)

                                    InLine.Name = "InLine"
                                    InLine.Parent = Line
                                    InLine.AnchorPoint = Vector2.new(0.5, 0.5)
                                    InLine.BorderSizePixel = 0
                                    InLine.Position = UDim2.new(0.5, 0, 0.5, 0)
                                    InLine.Size = UDim2.new(1, -10, 1, -10)
                                    InLine.BackgroundTransparency = 1
                                    InLine.BackgroundColor3 = getgenv().UI_Color['Dropdown']['Selected Color']
                                    table.insert(getgenv().Occho, InLine)

                                    LineCorner.Name = "LineCorner"
                                    LineCorner.Parent = InLine

                                    Dropvalcontainer.Name = "Dropvalcontainer"
                                    Dropvalcontainer.Parent = Dropval
                                    Dropvalcontainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                    Dropvalcontainer.BackgroundTransparency = 1.000
                                    Dropvalcontainer.Position = UDim2.new(0, 15, 0, 0)
                                    Dropvalcontainer.Size = UDim2.new(1, -15, 1, 0)

                                    Dropvalbutton.Name = "Dropvalbutton"
                                    Dropvalbutton.Parent = Dropvalcontainer
                                    Dropvalbutton.Active = false
                                    Dropvalbutton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                    Dropvalbutton.BackgroundTransparency = 1.000
                                    Dropvalbutton.Selectable = false
                                    Dropvalbutton.Size = UDim2.new(1, 0, 1, 0)
                                    Dropvalbutton.Font = Enum.Font.GothamBold
                                    Dropvalbutton.Text = v
                                    Dropvalbutton.TextColor3 = Color3.fromRGB(230, 230, 230)
                                    Dropvalbutton.TextSize = 14.000
                                    Dropvalbutton.TextWrapped = true
                                    Dropvalbutton.TextXAlignment = Enum.TextXAlignment.Left
                                    
                                    if Search then
                                        if Sel.Value == i then
                                            InLine.BackgroundTransparency = 0;
                                        end
                                    else
                                        if Sel.Value == i then
                                            InLine.BackgroundTransparency = 0;
                                        end
                                    end

                                    Dropvalbutton.MouseButton1Click:Connect(function()
                
                                        if Search then
											Dropdowntitle.PlaceholderText = Title..': '..v
                                            Sel.Value=i
                                           
										else
											Dropdowntitle.Text = Title..': '..v
                                            Sel.Value=i
                                          
										end


                                        refreshlist()
                                        if Callback then 
                                            Callback(v,i)
                                        end

                                    end)

                                    Dropvalbutton.MouseButton1Click:Connect(function()
                                        Library_Function.ButtonEffect()
                                    end)

                                end

                            else

                                for i,v in pairs (ListNew) do
											
                                    local linetran = v and 0 or 1

                                    local Dropval = Instance.new("Frame")
                                    local DropvalCorner = Instance.new("UICorner")
                                    local Line = Instance.new("Frame")
                                    local InLine = Instance.new("Frame")
                                    local LineCorner = Instance.new("UICorner")
                                    local Dropvalcontainer = Instance.new("Frame")
                                    local Dropvalbutton = Instance.new("TextButton")

                                    Dropval.Name = string.lower(i)
                                    Dropval.Parent = ScrollContainer
                                    Dropval.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                    Dropval.BackgroundTransparency = 1.000
                                    Dropval.Size = UDim2.new(1, 0, 0, 25)

                                    DropvalCorner.CornerRadius = UDim.new(0, 4)
                                    DropvalCorner.Name = "DropvalCorner"
                                    DropvalCorner.Parent = Dropval

                                    Line.Name = "Line"
                                    Line.Parent = Dropval
                                    Line.AnchorPoint = Vector2.new(0, 0.5)
                                    Line.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                    Line.BackgroundTransparency = 1
                                    Line.Position = UDim2.new(0, 0, 0.5, 0)
                                    Line.Size = UDim2.new(0, 14, 1, 0)

                                    InLine.Name = "InLine"
                                    InLine.Parent = Line
                                    InLine.AnchorPoint = Vector2.new(0.5, 0.5)
                                    InLine.BorderSizePixel = 0
                                    InLine.Position = UDim2.new(0.5, 0, 0.5, 0)
                                    InLine.Size = UDim2.new(1, -10, 1, -10)
                                    InLine.BackgroundTransparency = linetran
                                    InLine.BackgroundColor3 = getgenv().UI_Color['Dropdown']['Selected Color']
                                    table.insert(getgenv().Occho, InLine)

                                    LineCorner.Name = "LineCorner"
                                    LineCorner.Parent = InLine

                                    Dropvalcontainer.Name = "Dropvalcontainer"
                                    Dropvalcontainer.Parent = Dropval
                                    Dropvalcontainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                    Dropvalcontainer.BackgroundTransparency = 1.000
                                    Dropvalcontainer.Position = UDim2.new(0, 15, 0, 0)
                                    Dropvalcontainer.Size = UDim2.new(1, -15, 1, 0)

                                    Dropvalbutton.Name = "Dropvalbutton"
                                    Dropvalbutton.Parent = Dropvalcontainer
                                    Dropvalbutton.Active = false
                                    Dropvalbutton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                    Dropvalbutton.BackgroundTransparency = 1.000
                                    Dropvalbutton.Selectable = false
                                    Dropvalbutton.Size = UDim2.new(1, 0, 1, 0)
                                    Dropvalbutton.Font = Enum.Font.GothamBold
                                    Dropvalbutton.Text = i
                                    Dropvalbutton.TextColor3 = Color3.fromRGB(230, 230, 230)
                                    Dropvalbutton.TextSize = 14.000
                                    Dropvalbutton.TextWrapped = true
                                    Dropvalbutton.TextXAlignment = Enum.TextXAlignment.Left

                                    Dropvalbutton.MouseButton1Click:Connect(function()
                                        Library_Function.ButtonEffect()
                                    end)
                                    
                                    Dropvalbutton.MouseButton1Click:Connect(function()
                                        v = not v 

                                        local linetran = v and 0 or 1

                                        TweenService:Create(InLine,TweenInfo.new(.5),{BackgroundTransparency = linetran}):Play()

                                        if Callback then
                                            Callback(i,v)
                                            ListNew[i] = v
                                        end
                                    end)

                                end


                            end

                        end

                        if Search then
                            Dropdowntitle.Changed:Connect(function()
                                edit()
                                SearchDropdown()
                            end)
                        end

                        if typeof(Default) ~= 'table' then
							Callback(Default)
							if Search then
                                Dropdowntitle.PlaceholderText = Title..': '..tostring(Default)
                            else
                                Dropdowntitle.Text = Title..': '..tostring(Default)
                            end
						elseif Selected then
							for i,v in next, Default do
								ListNew[i] = v
								Callback(i,v)
							end
                            Dropdowntitle.Text = ''
                            Dropdowntitle.PlaceholderText = Title..': '
						end

                        DropdownButton.MouseButton1Click:Connect(function()
                            refreshlist()
                            isbusy = not isbusy
                            local listsize = isbusy and UDim2.new(1, 0,0, 170) or UDim2.new(1, 0,0, 0)
                            local mainsize = isbusy and UDim2.new(1, 0,0, 200) or UDim2.new(1, 0,0, 25)
                            local DropCRotation = isbusy and 90 or 0

                            TweenService:Create(Dropdownlisttt,TweenInfo.new(.5),{Size = listsize}):Play()
                            TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = mainsize}):Play()
                            TweenService:Create(ImgDrop,TweenInfo.new(.5),{Rotation = DropCRotation}):Play()

                        end)

                        DropdownButton.MouseButton1Click:Connect(function()
                            Library_Function.ButtonEffect()
                        end)

                        if Search then
                            Dropdowntitle.Focused:Connect(function()
                                refreshlist()
                                isbusy = not isbusy
                                local listsize = isbusy and UDim2.new(1, 0,0, 170) or UDim2.new(1, 0,0, 0)
                                local mainsize = isbusy and UDim2.new(1, 0,0, 200) or UDim2.new(1, 0,0, 25)
                                local DropCRotation = isbusy and 90 or 0
    
                                TweenService:Create(Dropdownlisttt,TweenInfo.new(.5),{Size = listsize}):Play()
                                TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = mainsize}):Play()
                                TweenService:Create(ImgDrop,TweenInfo.new(.5),{Rotation = DropCRotation}):Play()
    
                            end)
    
                            Dropdowntitle.Focused:Connect(function()
                                Library_Function.ButtonEffect()
                            end)
                        end

                        local dropdown_function = {rf=refreshlist}

						function dropdown_function:ClearText()
							if not Selected then
								if Search then
									Dropdowntitle.PlaceholderText = Title..': '
								else
									Dropdowntitle.Text = Title..': ' 
								end
							else
								Dropdowntitle.Text = Title..': '
							end
						end

						function dropdown_function:GetNewList(List)
							refreshlist()
							isbusy = false
							local listsize = isbusy and UDim2.new(1, 0,0, 170) or UDim2.new(1, 0,0, 0)
							local mainsize = isbusy and UDim2.new(1, 0,0, 200) or UDim2.new(1, 0,0, 25)
							local DropCRotation = isbusy and 90 or 0

							TweenService:Create(Dropdownlisttt,TweenInfo.new(.5),{Size = listsize}):Play()
							TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = mainsize}):Play()
							TweenService:Create(ImgDrop,TweenInfo.new(.5),{Rotation = DropCRotation}):Play()
							
							ListNew = {}
							ListNew = List

							for i,v in next, ListNew do
								if Selected then
									Callback(i,v)
								end
							end

						end
                        
                        return dropdown_function

                    end

                    function Section_Function.CreateBind(Setting, Callback)

                        local TitleText = tostring(Setting.Title) or ""
                        local KeyCode = Setting.Key
						local Default = Setting.Default or Setting.Key
						local Type = tostring(Default):match("UserInputType") and "UserInputType" or "KeyCode"
						local Callback = Callback or function() end
						
						KeyCode = tostring(KeyCode):gsub("Enum.UserInputType.", "")
						KeyCode = tostring(KeyCode):gsub("Enum.KeyCode.", "")

                        local BindFrame = Instance.new("Frame")
                        local BindCorner = Instance.new("UICorner")
                        local BindBG = Instance.new("Frame")
                        local ButtonCorner = Instance.new("UICorner")
                        local ButtonTitle = Instance.new("TextLabel")
                        local Button = Instance.new("TextButton")
                        local BindCor = Instance.new("Frame")
                        local ButtonCorner_2 = Instance.new("UICorner")
                        local Bindkey = Instance.new("TextButton")

                        BindFrame.Name = TitleText.."bguvl"
                        BindFrame.Parent = Section
                        BindFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        BindFrame.BackgroundTransparency = 1.000
                        BindFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
                        BindFrame.Size = UDim2.new(1, 0, 0, 35)

                        BindCorner.CornerRadius = UDim.new(0, 4)
                        BindCorner.Name = "BindCorner"
                        BindCorner.Parent = BindFrame

                        BindBG.Name = "BindBG"
                        BindBG.Parent = BindFrame
                        BindBG.AnchorPoint = Vector2.new(0.5, 0.5)
                        BindBG.Position = UDim2.new(0.5, 0, 0.5, 0)
                        BindBG.Size = UDim2.new(1, -10, 1, 0)
						if BackgroundVideo then
							BindBG.BackgroundTransparency = GUITransparency
						end
                        BindBG.BackgroundColor3 = getgenv().UI_Color['Bind']['Background Color']
                        table.insert(getgenv().Occho, BindBG)

                        ButtonCorner.CornerRadius = UDim.new(0, 4)
                        ButtonCorner.Name = "ButtonCorner"
                        ButtonCorner.Parent = BindBG

                        ButtonTitle.Name = "ButtonTitle"
                        ButtonTitle.Parent = BindBG
                        ButtonTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        ButtonTitle.BackgroundTransparency = 1.000
                        ButtonTitle.Position = UDim2.new(0, 10, 0, 0)
                        ButtonTitle.Size = UDim2.new(1, -10, 1, 0)
                        ButtonTitle.Font = Enum.Font.GothamBlack
                        ButtonTitle.Text = TitleText
                        ButtonTitle.TextSize = 14.000
                        ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
                        ButtonTitle.TextColor3 = getgenv().UI_Color['Bind']['Text Color']
                        table.insert(getgenv().Occho, ButtonTitle)

                        BindCor.Name = "BindCor"
                        BindCor.Parent = BindBG
                        BindCor.AnchorPoint = Vector2.new(1, 0.5)
                        BindCor.Position = UDim2.new(1, -5, 0.5, 0)
                        BindCor.Size = UDim2.new(0, 150, 0, 25)
                        BindCor.BackgroundColor3 = getgenv().UI_Color['Bind']['Bind Color']
                        table.insert(getgenv().Occho, BindCor)

                        ButtonCorner_2.CornerRadius = UDim.new(0, 4)
                        ButtonCorner_2.Name = "ButtonCorner"
                        ButtonCorner_2.Parent = BindCor

                        Bindkey.Name = "Bindkey"
                        Bindkey.Parent = BindCor
                        Bindkey.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        Bindkey.BackgroundTransparency = 1.000
                        Bindkey.Size = UDim2.new(1, 0, 1, 0)
                        Bindkey.Font = Enum.Font.GothamBold
                        Bindkey.Text = tostring(Default):gsub("Enum.KeyCode.", "");
                        Bindkey.TextSize = 14.000
                        Bindkey.TextColor3 = getgenv().UI_Color['Bind']['Key Color']
                        table.insert(getgenv().Occho, Bindkey)

                        local WhitelistedType = {
							[Enum.UserInputType.MouseButton1] = "Mouse1";
							[Enum.UserInputType.MouseButton2] = "Mouse2";
							[Enum.UserInputType.MouseButton3] = "Mouse3";
						};

						Bindkey.MouseButton1Click:Connect(function()
							Library_Function.ButtonEffect()
						end)
		
						Bindkey.MouseButton1Click:Connect(function()
							local Connection;
		
							Bindkey.Text = "...";
		
							Connection = game:GetService("UserInputService").InputBegan:Connect(function(i)
								if WhitelistedType[i.UserInputType] then
									Bindkey.Text = WhitelistedType[i.UserInputType];
									spawn(function()
										wait(0.1)
										Default = i.UserInputType;
										Type = "UserInputType";
									end);
								elseif i.KeyCode ~= Enum.KeyCode.Unknown then
									Bindkey.Text = tostring(i.KeyCode):gsub("Enum.KeyCode.", "");
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
		
						game:GetService("UserInputService").InputBegan:Connect(function(i)
							if (Default == i.UserInputType or Default == i.KeyCode) then
								Callback(Default);
							end;
						end);
                        
                    end

                    function Section_Function.CreateBox(Setting, Callback)

                        local TitleText = tostring(Setting.Title) or ""
                        local Placeholder = tostring(Setting.Placeholder) or ""
                        local Default = Setting.Default or false
                        local Number_Only = Setting.Number or false 
						local Callback = Callback or function() end

                        local BoxFrame = Instance.new("Frame")
                        local BoxCorner = Instance.new("UICorner")
                        local BoxBG = Instance.new("Frame")
                        local ButtonCorner = Instance.new("UICorner")
                        local Boxtitle = Instance.new("TextLabel")
                        local BoxCor = Instance.new("Frame")
                        local ButtonCorner_2 = Instance.new("UICorner")
                        local Boxxx = Instance.new("TextBox")
                        local Lineeeee = Instance.new("Frame")
                        local UICorner = Instance.new("UICorner")

                        BoxFrame.Name = "BoxFrame"
                        BoxFrame.Parent = Section
                        BoxFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        BoxFrame.BackgroundTransparency = 1.000
                        BoxFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
                        BoxFrame.Size = UDim2.new(1, 0, 0, 60)

                        BoxCorner.CornerRadius = UDim.new(0, 4)
                        BoxCorner.Name = "BoxCorner"
                        BoxCorner.Parent = BoxFrame

                        BoxBG.Name = "BoxBG"
                        BoxBG.Parent = BoxFrame
                        BoxBG.AnchorPoint = Vector2.new(0.5, 0.5)
                        BoxBG.Position = UDim2.new(0.5, 0, 0.5, 0)
                        BoxBG.Size = UDim2.new(1, -10, 1, 0)
						if BackgroundVideo then
							BoxBG.BackgroundTransparency = GUITransparency
						end
                        BoxBG.BackgroundColor3 = getgenv().UI_Color['Box']['Background Color']
                        table.insert(getgenv().Occho, BoxBG)

                        ButtonCorner.CornerRadius = UDim.new(0, 4)
                        ButtonCorner.Name = "ButtonCorner"
                        ButtonCorner.Parent = BoxBG

                        Boxtitle.Name = "Boxtitle"
                        Boxtitle.Parent = BoxBG
                        Boxtitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        Boxtitle.BackgroundTransparency = 1.000
                        Boxtitle.Position = UDim2.new(0, 10, 0, 0)
                        Boxtitle.Size = UDim2.new(1, -10, 0.5, 0)
                        Boxtitle.Font = Enum.Font.GothamBlack
                        Boxtitle.Text = TitleText
                        Boxtitle.TextSize = 14.000
                        Boxtitle.TextXAlignment = Enum.TextXAlignment.Left
                        Boxtitle.TextColor3 = getgenv().UI_Color['Box']['Title Color']
                        table.insert(getgenv().Occho, Boxtitle)

                        BoxCor.Name = "BoxCor"
                        BoxCor.Parent = BoxBG
                        BoxCor.AnchorPoint = Vector2.new(1, 0.5)
                        BoxCor.ClipsDescendants = true
                        BoxCor.Position = UDim2.new(1, -5, 0, 40)
                        BoxCor.Size = UDim2.new(1, -10, 0, 25)
                        BoxCor.BackgroundColor3 = getgenv().UI_Color['Box']['Box Color']
                        table.insert(getgenv().Occho, BoxCor)

                        ButtonCorner_2.CornerRadius = UDim.new(0, 4)
                        ButtonCorner_2.Name = "ButtonCorner"
                        ButtonCorner_2.Parent = BoxCor

                        Boxxx.Name = "Boxxx"
                        Boxxx.Parent = BoxCor
                        Boxxx.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        Boxxx.BackgroundTransparency = 1.000
                        Boxxx.Position = UDim2.new(0, 5, 0, 0)
                        Boxxx.Size = UDim2.new(1, -5, 1, 0)
                        Boxxx.Font = Enum.Font.GothamBold
                        Boxxx.PlaceholderText = Placeholder
                        Boxxx.Text = ""
                        Boxxx.TextSize = 14.000
                        Boxxx.TextXAlignment = Enum.TextXAlignment.Left
                        Boxxx.PlaceholderColor3 = getgenv().UI_Color['Box']['Placeholder Color']
                        Boxxx.TextColor3 = getgenv().UI_Color['Box']['Text Color']
                        table.insert(getgenv().Occho, Boxxx)


                        Lineeeee.Name = "TextNSBoxLineeeee"
						Lineeeee.Parent = BoxCor
						Lineeeee.BackgroundTransparency = 1.000
						Lineeeee.Position = UDim2.new(0, 0, 1, -2)
						Lineeeee.Size = UDim2.new(1, 0, 0, 6)
                        Lineeeee.BackgroundColor3 = getgenv().UI_Color['Box']['Line Color']
                        table.insert(getgenv().Occho, Lineeeee)
                        

                        UICorner.CornerRadius = UDim.new(1, 0)
						UICorner.Parent = Lineeeee

                        Boxxx.Focused:Connect(function() 
                            TweenService:Create(Lineeeee,TweenInfo.new(.5),{BackgroundTransparency = 0}):Play()
                        end)

                        Boxxx.Focused:Connect(function() 
                    
                            Library_Function.ButtonEffect()

                        end)

                        if Number_Only then 
                            Boxxx:GetPropertyChangedSignal("Text"):Connect(function()
                                if tonumber(Boxxx.Text) then 
                                else 
                                    Boxxx.PlaceholderText = Placeholder
                                    Boxxx.Text = ''
                                end
                            end)
                        end

                        Boxxx.FocusLost:Connect(function()
                            TweenService:Create(Lineeeee,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
                            if Boxxx.Text ~= '' then
                                Callback(Boxxx.Text)
                            end
                        end)

                        local textbox_function = {}

                        if Default then
                            Boxxx.Text = Default
                            Callback(Default)
                        end

                        function textbox_function.SetValue(Value)
                            Boxxx.Text = Value
                            Callback(Value)
                        end 

                        return textbox_function;


                    end

                    function Section_Function.CreateSlider(Setting, Callback)
                        
                        local TitleText = tostring(Setting.Title) or ""
                        local Min_Value = tonumber(Setting.Min) or 0
                        local Max_Value = tonumber(Setting.Max) or 100
						local Precise = Setting.Precise or false
                        local DefaultValue = tonumber(Setting.Default) or 0
						local Callback = Callback or function() end

                        local SizeChia = 400;

                        local Callback = Callback or function() end

                        local SliderFrame = Instance.new("Frame")
                        local SliderCorner = Instance.new("UICorner")
                        local SliderBG = Instance.new("Frame")
                        local SliderBGCorner = Instance.new("UICorner")
                        local SliderTitle = Instance.new("TextLabel")
                        local SliderBar = Instance.new("Frame")
                        local SliderButton = Instance.new("TextButton")
                        local SliderBarCorner = Instance.new("UICorner")
                        local Bar = Instance.new("Frame")
                        local BarCorner = Instance.new("UICorner")
                        local Sliderboxframe = Instance.new("Frame")
                        local Sliderbox = Instance.new("UICorner")
                        local Sliderbox_2 = Instance.new("TextBox")

                        SliderFrame.Name = TitleText..'buda'
                        SliderFrame.Parent = Section
                        SliderFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        SliderFrame.BackgroundTransparency = 1.000
                        SliderFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
                        SliderFrame.Size = UDim2.new(1, 0, 0, 50)

                        SliderCorner.CornerRadius = UDim.new(0, 4)
                        SliderCorner.Name = "SliderCorner"
                        SliderCorner.Parent = SliderFrame

                        SliderBG.Name = "SliderBG"
                        SliderBG.Parent = SliderFrame
                        SliderBG.AnchorPoint = Vector2.new(0.5, 0.5)
                        SliderBG.Position = UDim2.new(0.5, 0, 0.5, 0)
                        SliderBG.Size = UDim2.new(1, -10, 1, 0)
						if BackgroundVideo then
							SliderBG.BackgroundTransparency = GUITransparency
						end
                        SliderBG.BackgroundColor3 = getgenv().UI_Color['Slider']['Background Color']
                        table.insert(getgenv().Occho, SliderBG)

                        SliderBGCorner.CornerRadius = UDim.new(0, 4)
                        SliderBGCorner.Name = "SliderBGCorner"
                        SliderBGCorner.Parent = SliderBG

                        SliderTitle.Name = "SliderTitle"
                        SliderTitle.Parent = SliderBG
                        SliderTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        SliderTitle.BackgroundTransparency = 1.000
                        SliderTitle.Position = UDim2.new(0, 10, 0, 0)
                        SliderTitle.Size = UDim2.new(1, -10, 0, 25)
                        SliderTitle.Font = Enum.Font.GothamBlack
                        SliderTitle.Text = TitleText
                        SliderTitle.TextSize = 14.000
                        SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
                        SliderTitle.TextColor3 = getgenv().UI_Color['Slider']['Title Color']
                        table.insert(getgenv().Occho, SliderTitle)

                        SliderBar.Name = "SliderBar"
                        SliderBar.Parent = SliderFrame
                        SliderBar.AnchorPoint = Vector2.new(.5, 0.5)
                        SliderBar.Position = UDim2.new(.5, 0, 0.5, 14)
                        SliderBar.Size = UDim2.new(0, 400, 0, 6)
                        SliderBar.BackgroundColor3 = getgenv().UI_Color['Slider']['Barr Color']
                        table.insert(getgenv().Occho, SliderBar)

                        SliderButton.Name = "SliderButton "
                        SliderButton.Parent = SliderBar
                        SliderButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        SliderButton.BackgroundTransparency = 1.000
                        SliderButton.Size = UDim2.new(1, 0, 1, 0)
                        SliderButton.Font = Enum.Font.GothamBold
                        SliderButton.Text = ""
                        SliderButton.TextColor3 = Color3.fromRGB(230, 230, 230)
                        SliderButton.TextSize = 14.000

                        SliderBarCorner.CornerRadius = UDim.new(1, 0)
                        SliderBarCorner.Name = "SliderBarCorner"
                        SliderBarCorner.Parent = SliderBar

                        Bar.Name = "Bar"
                        Bar.Parent = SliderBar
                        Bar.Size = UDim2.new(0, 0, 1, 0)
                        Bar.BackgroundColor3 = getgenv().UI_Color['Slider']['Bar Color']
                        table.insert(getgenv().Occho, Bar)


                        BarCorner.CornerRadius = UDim.new(1, 0)
                        BarCorner.Name = "BarCorner"
                        BarCorner.Parent = Bar

                        Sliderboxframe.Name = "Sliderboxframe"
                        Sliderboxframe.Parent = SliderFrame
                        Sliderboxframe.AnchorPoint = Vector2.new(1, 0)
                        Sliderboxframe.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
                        Sliderboxframe.Position = UDim2.new(1, -10, 0, 5)
                        Sliderboxframe.Size = UDim2.new(0, 150, 0, 25)

                        Sliderbox.CornerRadius = UDim.new(0, 4)
                        Sliderbox.Name = "Sliderbox"
                        Sliderbox.Parent = Sliderboxframe

                        Sliderbox_2.Name = "Sliderbox"
                        Sliderbox_2.Parent = Sliderboxframe
                        Sliderbox_2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        Sliderbox_2.BackgroundTransparency = 1.000
                        Sliderbox_2.Size = UDim2.new(1, 0, 1, 0)
                        Sliderbox_2.Font = Enum.Font.GothamBold
                        Sliderbox_2.Text = ""
                        Sliderbox_2.TextSize = 14.000
                        Sliderbox_2.TextColor3 = getgenv().UI_Color['Slider']['Value Color']
                        table.insert(getgenv().Occho, Sliderbox_2)

                        SliderButton.MouseEnter:Connect(function()
                            TweenService:Create(Bar,TweenInfo.new(.5),{BackgroundColor3 = getgenv().UI_Color['Slider']['Bar Active Color']}):Play()
                        end)

                        SliderButton.MouseLeave:Connect(function()
                            TweenService:Create(Bar,TweenInfo.new(.5),{BackgroundColor3 = getgenv().UI_Color['Slider']['Bar Color']}):Play()
                        end)

                        local mouse = game.Players.LocalPlayer:GetMouse()

                        if DefaultValue then 
							if DefaultValue <= Min_Value then DefaultValue = Min_Value elseif DefaultValue >= Max_Value then DefaultValue = Max_Value end
							Bar.Size = UDim2.new(1 - ((Max_Value - DefaultValue) / (Max_Value - Min_Value)),0, 0, 6)
							Sliderbox_2.Text = DefaultValue
							Callback(DefaultValue)
						end

                        SliderButton.MouseButton1Down:Connect(function()
                            local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

                            pcall(function()
                                Callback(value)
                                Sliderbox_2.Text = value
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                            moveconnection = mouse.Move:Connect(function()   
                                local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))
                                pcall(function()
                                    Callback(value)
                                    Sliderbox_2.Text = value
                                end)
                                Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                            end)
                            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                    local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

                                    pcall(function()
                                        Callback(value)
                                        Sliderbox_2.Text = value
                                    end)
                                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                                    moveconnection:Disconnect()
                                    releaseconnection:Disconnect()
                                end
                            end)
                        end)

                        local function GetSliderValue(Value)
                            if tonumber(Value) <= Min_Value then
                                Bar.Size = UDim2.new(0,(0 * SizeChia), 0, 6)
                                Sliderbox_2.Text = Min_Value
                                Callback(tonumber(Min_Value))

                            elseif tonumber(Value) >= Max_Value then
                                Bar.Size = UDim2.new(0,(Max_Value  /  Max_Value * SizeChia), 0, 6)
                                Sliderbox_2.Text = Max_Value
                                Callback(tonumber(Max_Value))
                            else
                                Bar.Size = UDim2.new(1 - ((Max_Value - Value) / (Max_Value - Min_Value)),0, 0, 6)
                                Callback(tonumber(Value))
                            end
                        end


                        Sliderbox_2.FocusLost:Connect(function()
                            GetSliderValue(Sliderbox_2.Text)
                        end)


                        local slider_function = {}

                        function slider_function.SetValue(Value)
                            GetSliderValue(Value)
                        end

                        return slider_function


                    end


                return Section_Function

            end

        return Page_Function

    end

    return Main_Function

end

-- script

Main = Library.CreateMain({Title = 'Super Idol', Desc = '105 Temperature'})


Page1 = Main.CreatePage({Page_Name = 'Page1', Page_Title = 'Page 1'})

Section11 = Page1.CreateSection('Section 1')
NaziNuclearToggle = Section11.CreateToggle({Title = 'Toggle Nazi Nuclear', Desc = nil, Default_Value = false}, function(v)
    if v then
        Library_Function.CreateNoti({
            Title = 'Nuking',
            Desc =  'Bombing all the gays, Nazi on top',
            ShowTime = 5,
        })
    else
        Library_Function.CreateNoti({
            Title = 'Nuking',
            Desc =  'Stop nuking the gays',
            ShowTime = 5,
        })
    end
end)

NaziNuclearToggle = Section11.CreateToggle({Title = 'Toggle Nazi Nuclear', Desc = 'bu cui', Default_Value = false}, function(v)
    if v then
        Library_Function.CreateNoti({
            Title = 'Nuking',
            Desc =  'Bombing all the gays, Nazi on top',
            ShowTime = 5,
        })
    else
        Library_Function.CreateNoti({
            Title = 'Nuking',
            Desc =  'Stop nuking the gays',
            ShowTime = 5,
        })
    end
end)

-- NaziNuclearToggle.SetStage(<bool>)
Section11.CreateLabel({Title = 'Fuck LGBT, hitler is love hitler is life'})

Section12 = Page1.CreateSection('Section 2')
TodoList = {
    ['Join DDD'] = false,
    ['Sleep with your best friend mom'] = false,
    ['Joe biden'] = false,
    ['Sea Hub auto farm no work :sob:'] = false,
}
SelectWhatYouWantTodoDropdown = Section12.CreateDropdown({Title = 'Select what u want todo', List = TodoList, Search = true, Selected = true, Default = nil}, function(i, v)
    if v then
        Library_Function.CreateNoti({
            Title = 'Dropdown 1',
            Desc = 'You want to ' .. tostring(i),
            ShowTime = 5,
        })
    end
end)
TodoList2 = {
    ['Join DDD'] = false,
    ['Sleep with your best friend mom'] = true,
    ['Joe biden'] = true,
    ['Sea Hub auto farm no work :sob:'] = false,
}
Section12.CreateButton({Title = 'I dont know, suggest me what todo'}, function()
    SelectWhatYouWantTodoDropdown:GetNewList(TodoList2)
end)

Section12.CreateButton({Title = 'I dont know, suggest me what todo'}, function()
    for i,v in next, getgenv().Occho do 
        print(i,v)
    end
end)


Page2 = Main.CreatePage({Page_Name = 'Page2', Page_Title = 'Page 2'})

Section21 = Page2.CreateSection('Section 1')

Section21.CreateDropdown({Title = 'Select which GPO mod u want to fuck most', List = {
    "memebot",
    "Uchiha",
    "Falcon",
    "joe biden"
}, Search = true, Selected = false, Default = nil}, function(v)
    if v then
        Library_Function.CreateNoti({
            Title = 'GPO Mod fucker',
            Desc = 'You decided to fuck ' .. tostirng(v),
            ShowTime = 5,
        })
    end
end)

Section21.CreateBind({Title = 'Button to cum', Key = Enum.KeyCode.Home, Default = nil}, function()
    Library_Function.CreateNoti({
        Title = 'a',
        Desc = 'just cummed, feeling good',
        ShowTime = 5,
    })
end)

Section21.CreateBox({Title = 'Tell how u feels about joe biden porns', Placeholder = 'Type here', Number = false, Default = nil}, function(v)
    Library_Function.CreateNoti({
        Title = 'Success',
        Desc = 'Thanks for the feedback',
        ShowTime = 5,
    })
end)

Section21.CreateSlider({Title = 'Cock length', Min = 0, Max = 50, Default = 0, Precise = true}, function(v)
    -- print(v)
end)

local SettingPage = Main.CreatePage({Page_Name = 'Setting', Page_Title = 'Setting Tab'})

local GUISettingSection = SettingPage.CreateSection('GUI Settings')

TimerLabel = GUISettingSection.CreateLabel({Title = "Timer"})
spawn(function()
	while wait(.25) do
		local PlayTime = game.workspace.DistributedGameTime
		local Sec = PlayTime % 60
		local Min = math.floor(PlayTime / 60 % 60)
		local Hour = math.floor(PlayTime / 3600)
		TimerLabel.SetText(string.format('Timer: %.0fh %.0fm %.0fs', Hour, Min, Sec))
	end
end)
GUISettingSection.CreateBind({Title = 'Toggle GUI', Key = Enum.KeyCode.RightControl}, function()
	Library_Function.ToggledUI()
end)
if getgenv().Key == nil then
    GUISettingSection.CreateButton({Title = 'Destroy GUI'}, function()
	    Library_Function.Destroy()
    end)
end

local CustomColorUI = Library.CreateCustomColor()

local CCMain = CustomColorUI.CreateSection("Main")

CCMain.CreateColorPicker({Title = "Border Color", Type = "maingui", Default = Color3.fromRGB(131, 181, 255)}, function(v)
end)
CCMain.CreateColorPicker({Title = "Button Effect Color", Type = "buttoneffect", Default = Color3.fromRGB(230, 230, 230)}, function(v)
end)


CCMain.CreateBox({Title = 'Logo', Placeholder = 'URL Here (PNG only), Recommended 128x128', Number = false, Default = nil}, function(x)
    for i, v in pairs(getgenv().Occho) do
        if v.Name == "Ruafimg" then
            v.Image = Library_Function.GetIMG(x)
            print(v.Image)
        end
    end
end)

CCMain.CreateSlider({Title = 'Border Size', Min = 0, Max = 1, Default = 0, Precise = true}, function(v)
    print(v)
end)
CCMain.CreateColorPicker({Title = "Hoi Tho Active", Type = "buttoneffect", Default = Color3.fromRGB(230, 230, 230), Breathing = {Cor1 = Color3.fromRGB(0, 255, 255), Cor2 = Color3.fromRGB(255, 255, 0)}}, function(v)
end)

CCMain.CreateColorPicker({Title = "Cung Roi Active", Default = Color3.fromRGB(230, 230, 230), CungRoi = true}, function(v)
    print(v)
end)
--[[
    The First project after i came back to Exploiting
    SeaHub Premium Ultimate Edition UI Libary - designed and writed by Chim#0889
    Finished at 8:11 PM - 30/11/21 (JST)
]] 