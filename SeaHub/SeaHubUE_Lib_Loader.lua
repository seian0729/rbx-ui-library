getgenv().UI_Setting = {
    Loading = false;
} 


getgenv().UI_Color = {
    ['Loader'] = {
        ['Main Color'] = Color3.fromRGB(131, 181, 255);
        ['Image Icon'] = "rbxassetid://6248942117";
    };
}

local Library_Function = {}
local TweenService = game:GetService('TweenService')

Library_Function.LoaderGui = Instance.new('ScreenGui')
Library_Function.LoaderGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Library_Function.LoaderGui.Name = 'Sea Hub - [Premium Edition]'
Library_Function.LoaderGui.Enabled = false

if syn.protect_gui then 
    syn.protect_gui(Library_Function.LoaderGui)
    Library_Function.LoaderGui.Parent = game:GetService('CoreGui')
end

local Loader = Instance.new("Frame")
local djtmemay = Instance.new("ImageLabel")
local LoaderContainer = Instance.new("Frame")
local LoaderCorner = Instance.new("UICorner")
local LoaderMain = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Image = Instance.new("ImageLabel")
local Concac = Instance.new("TextLabel")
local Conloading = Instance.new("Frame")
local Listloading = Instance.new("UIListLayout")

Loader.Name = "Loader"
Loader.Parent = Library_Function.LoaderGui
Loader.AnchorPoint = Vector2.new(0.5, 0.5)
Loader.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Loader.BackgroundTransparency = 1.000
Loader.Position = UDim2.new(0.5, 0, 0.5, 0)
Loader.Size = UDim2.new(0, 240, 0, 70)

djtmemay.Name = "djtmemay"
djtmemay.Parent = Loader
djtmemay.AnchorPoint = Vector2.new(0.5, 0.5)
djtmemay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
djtmemay.BackgroundTransparency = 1.000
djtmemay.Position = UDim2.new(0.5, 0, 0.5, 0)
djtmemay.Selectable = true
djtmemay.Size = UDim2.new(1, 12, 1, 12)
djtmemay.Image = "rbxassetid://8068653048"
djtmemay.ImageColor3 = Color3.fromRGB(131, 181, 255)
djtmemay.ScaleType = Enum.ScaleType.Slice
djtmemay.SliceCenter = Rect.new(15, 15, 175, 175)
djtmemay.SliceScale = 1.300

LoaderContainer.Name = "LoaderContainer"
LoaderContainer.Parent = Loader
LoaderContainer.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
LoaderContainer.Size = UDim2.new(1, 0, 1, 0)

LoaderCorner.CornerRadius = UDim.new(0, 4)
LoaderCorner.Name = "LoaderCorner"
LoaderCorner.Parent = LoaderContainer

LoaderMain.Name = "LoaderMain"
LoaderMain.Parent = LoaderContainer
LoaderMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoaderMain.BackgroundTransparency = 1.000
LoaderMain.Size = UDim2.new(1, 0, 0, 25)

Title.Name = "Title"
Title.Parent = LoaderMain
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 35, 0, 0)
Title.Size = UDim2.new(1, -35, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "<font color=\"rgb(131, 181, 255)\">Sea Hub Premium Edition</font>"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.RichText = true

Image.Name = "Image"
Image.Parent = LoaderMain
Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Image.BackgroundTransparency = 1.000
Image.Position = UDim2.new(0, 5, 0, 0)
Image.Size = UDim2.new(0, 25, 0, 25)
Image.Image = "rbxassetid://6248942117"

Concac.Name = "Concac"
Concac.Parent = Loader
Concac.AnchorPoint = Vector2.new(0.5, 0)
Concac.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Concac.BackgroundTransparency = 1.000
Concac.Position = UDim2.new(0.5, 0, 0.5, -4)
Concac.Size = UDim2.new(1, 0, 0, 27)
Concac.Font = Enum.Font.GothamBold
Concac.Text = ""
Concac.TextColor3 = Color3.fromRGB(255, 255, 255)
Concac.TextSize = 14.000
Concac.RichText = true

Conloading.Name = "Conloading"
Conloading.Parent = Concac
Conloading.AnchorPoint = Vector2.new(0.5, 0.5)
Conloading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Conloading.BackgroundTransparency = 1.000
Conloading.BorderColor3 = Color3.fromRGB(27, 42, 53)
Conloading.Position = UDim2.new(0.5, 0, 0.5, 0)
Conloading.Size = UDim2.new(1, -20, 1, 0)

Listloading.Name = "Listloading"
Listloading.Parent = Conloading
Listloading.FillDirection = Enum.FillDirection.Horizontal
Listloading.HorizontalAlignment = Enum.HorizontalAlignment.Center
Listloading.SortOrder = Enum.SortOrder.LayoutOrder
Listloading.VerticalAlignment = Enum.VerticalAlignment.Center
Listloading.Padding = UDim.new(0, 5)

local AnimateUI = {}
function AnimateUI.typeWrite(guiObject, text, delayBetweenChars)
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

for i=1, 10 do 

    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")


    Frame.Parent = Conloading
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BackgroundTransparency = 1.000
    Frame.Size = UDim2.new(0, 10, 0, 10)

    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = Frame

end

function Library_Function.LoaderShow(Stage)
    Library_Function.LoaderGui.Enabled = Stage
end

function Library_Function.LoaderChangeText(text)
    Concac.Text =''
    TweenService:Create(Concac, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    wait(.25)
    TweenService:Create(Concac, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    wait(.5)
    AnimateUI.typeWrite(Concac, text, 0.05)
end

spawn(function()
    while wait() do
        spawn(function()
            if getgenv().UI_Setting.Loading then
                game.TweenService:Create(Concac,TweenInfo.new(.25),{TextTransparency = 1}):Play()
            end
        end)
        if getgenv().UI_Setting.Loading then
            for i,v in next, Conloading:GetChildren() do 
                if v:IsA('Frame') then 
                    if v.Transparency == 1 then 
                        game.TweenService:Create(v,TweenInfo.new(.25),{Transparency = 0}):Play()
                    else
                        game.TweenService:Create(v,TweenInfo.new(.25),{Transparency = 1}):Play()
                    end
                    if v.Size == UDim2.new(0,10,0,10) then 
                        game.TweenService:Create(v,TweenInfo.new(.1),{Size  = UDim2.new(0, 15, 0, 15)}):Play()
                    else
                        game.TweenService:Create(v,TweenInfo.new(.1),{Size  = UDim2.new(0, 10, 0, 10)}):Play()
                    end
                    wait(.1)
                end
            end
            wait(.5)
        end
    end
    if not getgenv().UI_Setting.Loading then 
        for i,v in next, Conloading:GetChildren() do 
            if v:IsA('Frame') then 
                game.TweenService:Create(v,TweenInfo.new(.25),{Transparency = 1}):Play()
            end
        end
        wait(.5)
        if Concac.Transparency == 1 then 
            game.TweenService:Create(Concac,TweenInfo.new(.25),{TextTransparency = 0}):Play()
        else
            game.TweenService:Create(Concac,TweenInfo.new(.25),{TextTransparency = 1}):Play()
        end
    end
end)


function Library_Function.Getcolor(color)
	return {math.floor(color.r*255),math.floor(color.g*255),math.floor(color.b*255)}
end

if getgenv().UI_Setting.Loaded then 
    print("UI is already loaded, exec cai lon me");
    return
end

getgenv().UI_Setting.Loaded = true;

function Library_Function.ToggledUI()
    getgenv().UI_Setting.Toggled = not getgenv().UI_Setting.Toggled;
    Library_Function.Gui.Enabled = getgenv().UI_Setting.Toggled;
end

Library_Function.LoaderShow(true)
getgenv().UI_Setting.Loading = true
wait(2)
getgenv().UI_Setting.Loading = false
wait(.5)
Library_Function.LoaderChangeText([[Checking Whitelist...]])
wait(.5)
getgenv().UI_Setting.Loading = true
wait(2)
getgenv().UI_Setting.Loading = false
wait(.5)
Library_Function.LoaderChangeText([[Authentication <font color="rgb(129,255,115)">Success</font>]])
wait(.5)
Library_Function.LoaderShow(false)