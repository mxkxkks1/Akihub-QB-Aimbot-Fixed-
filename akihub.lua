getgenv().QBAimbotSettings = {
	Enabled = true,
	ToggleKeybind = 'Q',
	AngleBased = false,
	DesiredAngle = 30,
	YOffset = 1.25,
	XZOffset = 0,
	PowerBased = true,
	DesiredPower = 94,
	BoundsTolerance = 15,
	maxAirTime = 20,
	JumpPassKeybind = 'LeftControl',
	JumpPassHeight = 6.36+1.65,
	MaxYOffset = 12
}

getgenv().ballSpawnOffset = Vector3.new(0,3,0)

getgenv().ModeConfigs = {
    Dot = {
        ['stationary'] = {
            YOffset = 0,
            XZOffset = 0
        },
        ['streak'] = {
            YOffset = 8,
            XZOffset = 0
        },
        ['post/corner'] = {
            YOffset = 5,
            XZOffset = .5
        },
        ['slant'] = {
            YOffset = 0,
            XZOffset = .5
        },
        ['in/out'] = {
            YOffset = 0,
            XZOffset = .5
        },
        ['curl/comeback'] = {
            YOffset = 0,
            XZOffset = 0
        }
    },
    
    Dive = {
        ['stationary'] = {
            YOffset = 0,
            XZOffset = 0
        },
        ['streak'] = {
            YOffset = 9.5,
            XZOffset = .5
        },
        ['post/corner'] = {
            YOffset = 8.5,
            XZOffset = .5
        },
        ['slant'] = {
            YOffset = 8.5,
            XZOffset = .5
        },
        ['in/out'] = {
            YOffset = 0,
            XZOffset = .5
        },
        ['curl/comeback'] = {
            YOffset = 0,
            XZOffset = 0
        }
    },

    Mag = {
        ['stationary'] = {
            YOffset = 0,
            XZOffset = 0
        },
        ['streak'] = {
            YOffset = 10,
            XZOffset = .5
        },
        ['post/corner'] = {
            YOffset = 10,
            XZOffset = .5
        },
        ['slant'] = {
            YOffset = 0,
            XZOffset = .5
        },
        ['in/out'] = {
            YOffset = 0,
            XZOffset = .5
        },
        ['curl/comeback'] = {
            YOffset = 0,
            XZOffset = 0
        }
    }
}

getgenv().QBAimbotSettings.TimeToggleKeybind = 'J'

local practiceMode = game.PlaceId == 8206123457
local botMode = false

local get=function(x)return game:GetService(x)end local players=game:FindFirstChildOfClass("Players")local ws=game:FindFirstChildOfClass("Workspace")local rs=game:FindFirstChildOfClass("ReplicatedStorage")local rus=get'RunService'local uis=get'UserInputService'local http=get'HttpService'local ts=get'TeleportService'local lighting=get'Lighting'local coregui=get'CoreGui'local plr=players.LocalPlayer local cf=CFrame local v3=Vector3 local v2=Vector2 local ud2=UDim2 local c3=Color3 local rgb=c3.fromRGB local step=rus.Stepped local rstep=rus.RenderStepped local heartbeat=rus.Heartbeat local keys=Enum.KeyCode local states=Enum.HumanoidStateType local JSON={stringify=function(x)return http:JSONEncode(x)end,parse=function(x)return http:JSONDecode(x)end}local char=plr.Character or plr.CharacterAdded:Wait()local hum,hrp,torso local function onCharAdded(c)hum=c:WaitForChild'Humanoid'hrp=c:WaitForChild'HumanoidRootPart'torso=char:WaitForChild(hum.RigType==Enum.HumanoidRigType.R6 and'Torso'or'UpperTorso')end onCharAdded(char)plr.CharacterAdded:Connect(onCharAdded)local function create(class,parent,props,children)if not class then return end props=props or {} children=children or {} local obj=Instance.new(class,parent)for prop,name in pairs(props)do obj[prop]=name end for _,child in pairs(children)do child.Parent=obj end return obj end local function bind(key,func)uis.InputBegan:Connect(function(k,gpe)if not gpe and k.KeyCode==key then func()end end)end local function find(tbl,value)local func=type(value)== 'function' and value or function(x)return v==x end for _,v in pairs(tbl)do if func(v)then return v end end return end local function indexOf(tbl,value)for i,v in pairs(tbl)do if v==value then return i end end return end local function draw(type,props)local d=Drawing.new(type)for i,v in pairs(props)do local s,e=pcall(function()d[i]=v end)if not s then warn('Error when setting property "'..i..'": '..e)end end return d end local function handleChar(p, func) local char2 = p.Character if char2 then local hum2 = char2:FindFirstChild('Humanoid') local hrp2 = char2:FindFirstChild('HumanoidRootPart') if hum2 and hrp2 then func(char2, hum2, hrp2) end end end

local atan = math.atan
local sqrt = math.sqrt


local AkiInterface = Instance.new("ScreenGui") local MainContainer = Instance.new("Frame") MainContainer.Visible = false local Container = Instance.new("Frame") local ModeContainer = Instance.new("Frame") local KeybindTips = Instance.new("Frame") local Switch = Instance.new("TextLabel") local UIListLayout = Instance.new("UIListLayout") local UIPadding = Instance.new("UIPadding") local UICorner = Instance.new("UICorner") local Subcontainer = Instance.new("Frame") local UIListLayout_2 = Instance.new("UIListLayout") local UIPadding_2 = Instance.new("UIPadding") local ValueContainer = Instance.new("Frame") local ModeText = Instance.new("TextLabel") local Name = Instance.new("TextLabel") local UIListLayout_3 = Instance.new("UIListLayout") local PowerContainer = Instance.new("Frame") local Subcontainer_2 = Instance.new("Frame") local UIListLayout_4 = Instance.new("UIListLayout") local UIPadding_3 = Instance.new("UIPadding") local ValueContainer_2 = Instance.new("Frame") local PowerText = Instance.new("TextLabel") local Name_2 = Instance.new("TextLabel") local UICorner_2 = Instance.new("UICorner") local AirtimeContainer = Instance.new("Frame") local UICorner_3 = Instance.new("UICorner") local KeybindTips_2 = Instance.new("Frame") local TextLabel = Instance.new("TextLabel") local UIListLayout_5 = Instance.new("UIListLayout") local UIPadding_4 = Instance.new("UIPadding") local Subcontainer_3 = Instance.new("Frame") local UIListLayout_6 = Instance.new("UIListLayout") local UIPadding_5 = Instance.new("UIPadding") local ValueContainer_3 = Instance.new("Frame") local AirtimeText = Instance.new("TextLabel") local Name_3 = Instance.new("TextLabel") local UIListLayout_7 = Instance.new("UIListLayout") AkiInterface.Name = "Aki Interface" AkiInterface.Parent = players.LocalPlayer:WaitForChild("PlayerGui") AkiInterface.ZIndexBehavior = Enum.ZIndexBehavior.Sibling AkiInterface.DisplayOrder = 1000000000 AkiInterface.ResetOnSpawn = false MainContainer.Name = "MainContainer" MainContainer.Parent = AkiInterface MainContainer.AnchorPoint = Vector2.new(0.200000003, 0) MainContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0) MainContainer.BackgroundTransparency = 1.000 MainContainer.BorderSizePixel = 0 MainContainer.Position = UDim2.new(0.449999988, 0, 0.100000001, 0) MainContainer.Size = UDim2.new(0, 355, 0, 130) Container.Name = "Container" Container.Parent = MainContainer Container.AnchorPoint = Vector2.new(0.5, 0) Container.BackgroundColor3 = Color3.fromRGB(0, 0, 0) Container.BackgroundTransparency = 1.000 Container.BorderSizePixel = 0 Container.Position = UDim2.new(0.491549283, 0, 0.100000001, 0) Container.Size = UDim2.new(0.983098567, 0, 0.800000012, 0) ModeContainer.Name = "ModeContainer" ModeContainer.Parent = Container ModeContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35) ModeContainer.BorderSizePixel = 0 ModeContainer.LayoutOrder = 2 ModeContainer.Position = UDim2.new(0.187679082, 0, 0.0192307699, 0) ModeContainer.Size = UDim2.new(0, 117, 0, 100) KeybindTips.Name = "KeybindTips" KeybindTips.Parent = ModeContainer KeybindTips.AnchorPoint = Vector2.new(0.5, 0) KeybindTips.BackgroundColor3 = Color3.fromRGB(50, 50, 75) KeybindTips.BackgroundTransparency = 1.000 KeybindTips.BorderSizePixel = 0 KeybindTips.Position = UDim2.new(0.5, 0, 0, 0) KeybindTips.Size = UDim2.new(1, 0, 0.25, 0) Switch.Name = "Switch" Switch.Parent = KeybindTips Switch.AnchorPoint = Vector2.new(0.5, 0.5) Switch.BackgroundColor3 = Color3.fromRGB(50, 50, 75) Switch.BackgroundTransparency = 1.000 Switch.BorderSizePixel = 0 Switch.LayoutOrder = 2 Switch.Position = UDim2.new(0.5, 0, 0.5, 0) Switch.Size = UDim2.new(1, 0, 1, 0) Switch.Font = Enum.Font.SourceSansLight Switch.Text = "T" Switch.TextColor3 = Color3.fromRGB(125, 125, 125) Switch.TextScaled = true Switch.TextSize = 14.000 Switch.TextTransparency = 0.100 Switch.TextWrapped = true Switch.TextXAlignment = Enum.TextXAlignment.Right UIListLayout.Parent = KeybindTips UIListLayout.FillDirection = Enum.FillDirection.Horizontal UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center UIPadding.Parent = KeybindTips UIPadding.PaddingLeft = UDim.new(0, 5) UIPadding.PaddingRight = UDim.new(0, 5) UIPadding.PaddingTop = UDim.new(0, 5) UICorner.CornerRadius = UDim.new(0, 5) UICorner.Parent = ModeContainer Subcontainer.Name = "Subcontainer" Subcontainer.Parent = ModeContainer Subcontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Subcontainer.BackgroundTransparency = 1.000 Subcontainer.BorderSizePixel = 0 Subcontainer.LayoutOrder = 1 Subcontainer.Size = UDim2.new(1, 0, 1, 0) UIListLayout_2.Parent = Subcontainer UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center UIPadding_2.Parent = Subcontainer UIPadding_2.PaddingBottom = UDim.new(0, 10) UIPadding_2.PaddingLeft = UDim.new(0, 10) UIPadding_2.PaddingRight = UDim.new(0, 10) UIPadding_2.PaddingTop = UDim.new(0, 10) ValueContainer.Name = "ValueContainer" ValueContainer.Parent = Subcontainer ValueContainer.AnchorPoint = Vector2.new(0.5, 0.5) ValueContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 75) ValueContainer.BackgroundTransparency = 1.000 ValueContainer.BorderSizePixel = 0 ValueContainer.Size = UDim2.new(1, 0, 0.75, 0) ModeText.Name = "ModeText" ModeText.Parent = ValueContainer ModeText.AnchorPoint = Vector2.new(0.5, 0.5) ModeText.BackgroundColor3 = Color3.fromRGB(50, 50, 75) ModeText.BackgroundTransparency = 1.000 ModeText.BorderSizePixel = 0 ModeText.Position = UDim2.new(0.5, 0, 0.582499921, 0) ModeText.Size = UDim2.new(1, 0, 0.552, 0) ModeText.Font = Enum.Font.SourceSansSemibold ModeText.Text = "Dot" ModeText.TextColor3 = Color3.fromRGB(230, 230, 230) ModeText.TextScaled = true ModeText.TextSize = 18.000 ModeText.TextTransparency = 0.100 ModeText.TextWrapped = true Name.Name = "Name" Name.Parent = Subcontainer Name.AnchorPoint = Vector2.new(0.5, 0.5) Name.BackgroundColor3 = Color3.fromRGB(50, 50, 75) Name.BackgroundTransparency = 1.000 Name.BorderSizePixel = 0 Name.LayoutOrder = 1 Name.Position = UDim2.new(0.5, 0, 0.800000012, 0) Name.Size = UDim2.new(1, 0, 0.25, 0) Name.Font = Enum.Font.SourceSansSemibold Name.Text = "Mode" Name.TextColor3 = Color3.fromRGB(150, 150, 150) Name.TextScaled = true Name.TextSize = 14.000 Name.TextTransparency = 0.100 Name.TextWrapped = true UIListLayout_3.Parent = Container UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center UIListLayout_3.Padding = UDim.new(0, 5) PowerContainer.Name = "PowerContainer" PowerContainer.Parent = Container PowerContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35) PowerContainer.BorderSizePixel = 0 PowerContainer.LayoutOrder = 2 PowerContainer.Position = UDim2.new(0.645070434, 0, 0.0192307699, 0) PowerContainer.Size = UDim2.new(0, 106, 0, 100) Subcontainer_2.Name = "Subcontainer" Subcontainer_2.Parent = PowerContainer Subcontainer_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Subcontainer_2.BackgroundTransparency = 1.000 Subcontainer_2.BorderSizePixel = 0 Subcontainer_2.LayoutOrder = 1 Subcontainer_2.Size = UDim2.new(1, 0, 1, 0) UIListLayout_4.Parent = Subcontainer_2 UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_4.VerticalAlignment = Enum.VerticalAlignment.Center UIPadding_3.Parent = Subcontainer_2 UIPadding_3.PaddingBottom = UDim.new(0, 10) UIPadding_3.PaddingLeft = UDim.new(0, 10) UIPadding_3.PaddingRight = UDim.new(0, 10) UIPadding_3.PaddingTop = UDim.new(0, 10) ValueContainer_2.Name = "ValueContainer" ValueContainer_2.Parent = Subcontainer_2 ValueContainer_2.AnchorPoint = Vector2.new(0.5, 0.5) ValueContainer_2.BackgroundColor3 = Color3.fromRGB(50, 50, 75) ValueContainer_2.BackgroundTransparency = 1.000 ValueContainer_2.BorderSizePixel = 0 ValueContainer_2.Size = UDim2.new(1, 0, 0.75, 0) PowerText.Name = "PowerText" PowerText.Parent = ValueContainer_2 PowerText.AnchorPoint = Vector2.new(0.5, 0.5) PowerText.BackgroundColor3 = Color3.fromRGB(50, 50, 75) PowerText.BackgroundTransparency = 1.000 PowerText.BorderSizePixel = 0 PowerText.Position = UDim2.new(0.5, 0, 0.574166656, 0) PowerText.Size = UDim2.new(1, 0, 0.65166676, 0) PowerText.Font = Enum.Font.SourceSansSemibold PowerText.Text = "40" PowerText.TextColor3 = Color3.fromRGB(230, 230, 230) PowerText.TextScaled = true PowerText.TextSize = 20.000 PowerText.TextTransparency = 0.100 PowerText.TextWrapped = true Name_2.Name = "Name" Name_2.Parent = Subcontainer_2 Name_2.AnchorPoint = Vector2.new(0.5, 0.5) Name_2.BackgroundColor3 = Color3.fromRGB(50, 50, 75) Name_2.BackgroundTransparency = 1.000 Name_2.BorderSizePixel = 0 Name_2.LayoutOrder = 1 Name_2.Position = UDim2.new(0.5, 0, 0.800000012, 0) Name_2.Size = UDim2.new(1, 0, 0.25, 0) Name_2.Font = Enum.Font.SourceSansSemibold Name_2.Text = "Power" Name_2.TextColor3 = Color3.fromRGB(150, 150, 150) Name_2.TextScaled = true Name_2.TextSize = 14.000 Name_2.TextTransparency = 0.100 Name_2.TextWrapped = true UICorner_2.CornerRadius = UDim.new(0, 5) UICorner_2.Parent = PowerContainer AirtimeContainer.Name = "AirtimeContainer" AirtimeContainer.Parent = Container AirtimeContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35) AirtimeContainer.BorderSizePixel = 0 AirtimeContainer.LayoutOrder = 1 AirtimeContainer.Position = UDim2.new(0.102816902, 0, 0.0192307699, 0) AirtimeContainer.Size = UDim2.new(0, 93, 0, 100) UICorner_3.CornerRadius = UDim.new(0, 5) UICorner_3.Parent = AirtimeContainer KeybindTips_2.Name = "KeybindTips" KeybindTips_2.Parent = AirtimeContainer KeybindTips_2.AnchorPoint = Vector2.new(0.5, 0) KeybindTips_2.BackgroundColor3 = Color3.fromRGB(50, 50, 75) KeybindTips_2.BackgroundTransparency = 1.000 KeybindTips_2.BorderSizePixel = 0 KeybindTips_2.Position = UDim2.new(0.5, 0, 0, 0) KeybindTips_2.Size = UDim2.new(1, 0, 0.25, 0) TextLabel.Name = "-" TextLabel.Parent = KeybindTips_2 TextLabel.AnchorPoint = Vector2.new(0.5, 0.5) TextLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 75) TextLabel.BackgroundTransparency = 1.000 TextLabel.BorderSizePixel = 0 TextLabel.LayoutOrder = 1 TextLabel.Position = UDim2.new(0.790322602, 0, 0.600000024, 0) TextLabel.Size = UDim2.new(1.05421686, 0, 1, 0) TextLabel.Font = Enum.Font.SourceSansLight TextLabel.Text = " F                      R" TextLabel.TextColor3 = Color3.fromRGB(125, 125, 125) TextLabel.TextScaled = true TextLabel.TextSize = 14.000 TextLabel.TextTransparency = 0.100 TextLabel.TextWrapped = true TextLabel.TextXAlignment = Enum.TextXAlignment.Left UIListLayout_5.Parent = KeybindTips_2 UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_5.VerticalAlignment = Enum.VerticalAlignment.Center UIPadding_4.Parent = KeybindTips_2 UIPadding_4.PaddingLeft = UDim.new(0, 5) UIPadding_4.PaddingRight = UDim.new(0, 5) UIPadding_4.PaddingTop = UDim.new(0, 5) Subcontainer_3.Name = "Subcontainer" Subcontainer_3.Parent = AirtimeContainer Subcontainer_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Subcontainer_3.BackgroundTransparency = 1.000 Subcontainer_3.BorderSizePixel = 0 Subcontainer_3.LayoutOrder = 1 Subcontainer_3.Size = UDim2.new(1, 0, 1, 0) UIListLayout_6.Parent = Subcontainer_3 UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_6.VerticalAlignment = Enum.VerticalAlignment.Center UIPadding_5.Parent = Subcontainer_3 UIPadding_5.PaddingBottom = UDim.new(0, 10) UIPadding_5.PaddingLeft = UDim.new(0, 10) UIPadding_5.PaddingRight = UDim.new(0, 10) UIPadding_5.PaddingTop = UDim.new(0, 10) ValueContainer_3.Name = "ValueContainer" ValueContainer_3.Parent = Subcontainer_3 ValueContainer_3.AnchorPoint = Vector2.new(0.5, 0.5) ValueContainer_3.BackgroundColor3 = Color3.fromRGB(50, 50, 75) ValueContainer_3.BackgroundTransparency = 1.000 ValueContainer_3.BorderSizePixel = 0 ValueContainer_3.Size = UDim2.new(1, 0, 0.75, 0) AirtimeText.Name = "AirtimeText" AirtimeText.Parent = ValueContainer_3 AirtimeText.AnchorPoint = Vector2.new(0.5, 0.5) AirtimeText.BackgroundColor3 = Color3.fromRGB(50, 50, 75) AirtimeText.BackgroundTransparency = 1.000 AirtimeText.BorderSizePixel = 0 AirtimeText.Position = UDim2.new(0.5, 0, 0.574166656, 0) AirtimeText.Size = UDim2.new(1, 0, 0.65166676, 0) AirtimeText.Font = Enum.Font.SourceSansSemibold AirtimeText.Text = "2s" AirtimeText.TextColor3 = Color3.fromRGB(230, 230, 230) AirtimeText.TextScaled = true AirtimeText.TextSize = 20.000 AirtimeText.TextTransparency = 0.100 AirtimeText.TextWrapped = true Name_3.Name = "Name" Name_3.Parent = Subcontainer_3 Name_3.AnchorPoint = Vector2.new(0.5, 0.5) Name_3.BackgroundColor3 = Color3.fromRGB(50, 50, 75) Name_3.BackgroundTransparency = 1.000 Name_3.BorderSizePixel = 0 Name_3.LayoutOrder = 1 Name_3.Position = UDim2.new(0.5, 0, 0.800000012, 0) Name_3.Size = UDim2.new(1, 0, 0.25, 0) Name_3.Font = Enum.Font.SourceSansSemibold Name_3.Text = "Airtime" Name_3.TextColor3 = Color3.fromRGB(150, 150, 150) Name_3.TextScaled = true Name_3.TextSize = 14.000 Name_3.TextTransparency = 0.100 Name_3.TextWrapped = true UIListLayout_7.Parent = MainContainer UIListLayout_7.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_7.VerticalAlignment = Enum.VerticalAlignment.Center UIListLayout_7.Padding = UDim.new(0, 5)


local Mode = ModeText



local function angleToHitCoords(distXZ, targetHeightRel, projSpeed, grav)
    
    local lobAngle = atan((projSpeed^2 + sqrt(projSpeed^4 - grav*(grav*distXZ^2 + 2*targetHeightRel*projSpeed^2)))/(grav*distXZ))

    local projHeightAtTarget = distXZ * math.tan(lobAngle) - (grav * distXZ^2) / (2 * projSpeed^2 * math.cos(lobAngle)^2)

    local correctedTargetHeightRel = targetHeightRel - projHeightAtTarget

    local normalAngle = atan((projSpeed^2 - sqrt(projSpeed^4 - grav*(grav*distXZ^2 + 2*correctedTargetHeightRel*projSpeed^2)))/(grav*distXZ))

    return normalAngle, lobAngle
end


local function calcAirTime_fromAngle(projSpeed, angleDeg, initialHeight, grav)
    local thetaRad = math.rad(angleDeg)

    local v0x = projSpeed * math.cos(thetaRad)
    local v0y = projSpeed * math.sin(thetaRad)

    local tMax = v0y / grav  

    local totalTimeOfFlight = 0
    if initialHeight >= 0 then
        local tRise = v0y / grav 
        totalTimeOfFlight = tRise + tMax
    else
        totalTimeOfFlight = 2 * tMax
    end

    return totalTimeOfFlight
end

local function getAirTimeForPower(power, distXZ,targetHeightRel,grav,useLobAngle)



	local useLobAngle = useLobAngle or false

	local normalAngle,lobAngle = angleToHitCoords(distXZ,targetHeightRel,power,grav)

	normalAngle = math.deg(normalAngle)
	lobAngle = math.deg(lobAngle)
	
	local airTime = calcAirTime_fromAngle(power,useLobAngle and lobAngle or normalAngle,-targetHeightRel,grav)

	return airTime
end





local modes = {}
for i,_ in pairs(ModeConfigs) do 
	table.insert(modes,i) 
end
local mode = modes[1] 
local modeIndex = 1 
uis.InputBegan:Connect(function(io,gpe) 
	if not gpe then
		local k = io.KeyCode
		if k == keys.T then
			modeIndex+=1 
			if modeIndex > #modes then 
				modeIndex = 1 
			end
			local lastMode = mode 
			mode = modes[modeIndex] 
			Mode.Text = mode 
		end
	end
end)

local function applyRouteThrowConfig(currentRoute)
	for routeName,config in pairs(ModeConfigs[Mode.Text]) do
		if routeName == currentRoute then
			for i,v in pairs(config) do
				QBAimbotSettings[i] = v
			end
		end
	end
end

local stats = get('Stats')
local function getPing()
	return stats.PerformanceStats.Ping:GetValue()
end
local function getServerPing()
	return stats.Network.ServerStatsItem['Data Ping']:GetValue()
end


local function clampPosInBounds(pos)
	if practiceMode then return pos end
	local BoundsTolerance = QBAimbotSettings.BoundsTolerance
	local boundX = 80+BoundsTolerance
	local boundZ = 180+BoundsTolerance
	local clampedPos = Vector3.new(math.clamp(pos.X,-boundX,boundX),pos.Y,math.clamp(pos.Z,-boundZ,boundZ))
	return clampedPos
end


local function calcVelComponents(startPos, targetPos, grav, T)
	local displacement = targetPos - startPos

	local xDisplacement = Vector2.new(displacement.X, displacement.Z).Magnitude
	local yDisplacement = displacement.Y


	local horizontalVelocity = xDisplacement / T


	local verticalVelocity = (yDisplacement + (0.5 * grav * T * T)) / T

	return horizontalVelocity, verticalVelocity
end


local function calcVel(startPos, targetPos, grav, T)
	local horizontalVel, verticalVel = calcVelComponents(startPos, targetPos, grav, T)


	local diff3 = targetPos - startPos
	local diff3_XZ = diff3 * Vector3.new(1, 0, 1)
	local dir3_XZ = diff3_XZ / diff3_XZ.Magnitude


	local vel3_XZ = dir3_XZ * horizontalVel


	local vel3 = vel3_XZ + Vector3.new(0, verticalVel, 0)

	return vel3
end

local function estimateTime(startPos, targetPos, maxSpeed)
	local displacement = targetPos - startPos
	local distance = (displacement*Vector3.new(1,0,1)).Magnitude

	local estimatedTime = distance / maxSpeed

	return estimatedTime
end

local function calcAngleFromVel3(initialVelocity)
	local horizontalVelocity = Vector3.new(initialVelocity.X, 0, initialVelocity.Z)
	
	local horizontalSpeed = horizontalVelocity.Magnitude
	
	local launchAngle = math.atan(initialVelocity.Y / horizontalSpeed)
	
	return launchAngle
end

local function calcTimeFromAngle(angle, initialVelocity, startPosition, endPosition, gravity)
	local radianAngle = angle 

	local horizontalDistance = (endPosition - startPosition).magnitude

	local verticalDistance = endPosition.Y - startPosition.Y

	
	local timeOfFlight = (2 * horizontalDistance * math.sin(radianAngle)) / initialVelocity

	
	local verticalVelocity = initialVelocity * math.sin(radianAngle) - gravity * timeOfFlight

	
	local timeToMaxHeight = verticalVelocity / gravity

	if verticalDistance > 0 then
		
		timeOfFlight = timeOfFlight + timeToMaxHeight + math.sqrt((2 * verticalDistance) / gravity)
	else
		
		local timeToLowestPoint = (verticalVelocity + math.sqrt(verticalVelocity * verticalVelocity + 2 * gravity * verticalDistance)) / gravity

		timeOfFlight = timeOfFlight + timeToLowestPoint
	end

	return timeOfFlight
end

local function calcProjSpeed_From_HorizontalVel_And_Angle(angle, horizontalVel)
	local radianAngle = angle 
	local initialVelocity = horizontalVel / math.cos(radianAngle)

	return initialVelocity
end

local function angleIsLargeEnough(startPosition, targetPosition, launchAngle, launchSpeed, grav)
	local horizontalDistance = (targetPosition - startPosition).magnitude

	local timeToReachTarget = horizontalDistance / (launchSpeed * math.cos(math.rad(launchAngle)))

	local targetHeight = targetPosition.Y - startPosition.Y

	local verticalVelocity = (targetHeight - (0.5 * -grav * (timeToReachTarget ^ 2))) / timeToReachTarget

	local maxAngle = math.deg(math.asin(verticalVelocity / launchSpeed))
	if launchAngle <= maxAngle then
		return true 
	else
		return false 
	end
end

local function calculateAccuracyOfNumber(value, ideal, upper, lower)
    return 1 - math.abs(ideal - value) / math.abs(upper - lower)
end

local function calcRoute(targetPlr)
	local routeName = ''
	local routeAccuracy = 0
	local char2 = targetPlr.Character
	if char2 then
		local hrp2 = char2:FindFirstChild('HumanoidRootPart')
		local hum2 = char2:FindFirstChild('Humanoid')
		if hrp2 and hum2 then
			local md = hum2.MoveDirection
			if md.Magnitude == 0 then
				routeName = 'stationary'
				routeAccuracy = 1
			else
				local streakVector = ((hrp2.Position-hrp.Position)*v3.new(0,0,1)).Unit
				local dotProd = md:Dot(streakVector)
				if dotProd >= .8 then
					routeName = 'streak'
					routeAccuracy = calculateAccuracyOfNumber(dotProd,1,1,.8)
				elseif dotProd >= .45 then
					routeName = 'post/corner'
					routeAccuracy = calculateAccuracyOfNumber(dotProd,.5,.8,.45)
				elseif dotProd >= .2 then
					routeName = 'slant'
					routeAccuracy = calculateAccuracyOfNumber(dotProd,.3,.45,.2)
				elseif dotProd >= -.2 then
					routeName = 'in/out'
					routeAccuracy = calculateAccuracyOfNumber(dotProd,0,.2,-.2)
				elseif dotProd < -.2 then
					routeName = 'curl/comeback'
					routeAccuracy = calculateAccuracyOfNumber(dotProd,-1,.2,-.2)
				end
			end
		end
	end
	return routeName,math.clamp(routeAccuracy,0,1)
end



local function predictPos(plr2,T)
	local ch2 = plr2.Character
	if ch2 then
		local hrp2 = ch2:FindFirstChild('HumanoidRootPart')
		local hum2 = ch2:FindFirstChild('Humanoid')
		if hrp2 and hum2 then
			local speed = uis:IsKeyDown(keys.C) and 0 or hrp2.Velocity.Magnitude
			local md = hum2.MoveDirection
			local currentPos = hrp2.Position
			local isJumpPass = uis:IsKeyDown(keys[QBAimbotSettings.JumpPassKeybind])
			local addedHeightForJump = isJumpPass and QBAimbotSettings.JumpPassHeight or 0
			local YOffset = QBAimbotSettings.YOffset+addedHeightForJump
			local offset = md*QBAimbotSettings.XZOffset + v3.new(0,YOffset,0)
			local futurePos = currentPos + md*speed*T + offset
			return futurePos
		else
			print('HRP OR HUM NOT FOUND')
		end
	else
		print('NO CHARACTER FOUND')
	end
end

local function predictBotPos(botChar,T)
	local hrp2 = botChar.HumanoidRootPart
	local hum2 = botChar.Humanoid
	if hrp2 and hum2 then
		local speed = 20
		local md = hrp2.CFrame.lookVector
		local currentPos = hrp2.Position
		local addedHeightForJump = uis:IsKeyDown(keys[QBAimbotSettings.JumpPassKeybind]) and QBAimbotSettings.JumpPassHeight or 0
		local offset = md*QBAimbotSettings.XZOffset + v3.new(0,QBAimbotSettings.YOffset + addedHeightForJump,0)
		local futurePos = currentPos + md*speed*T + offset
		return futurePos
	end
end

local throwDelay = .15
local releaseTime = .15

spawn(function()
	while wait(.1) do
		releaseTime = throwDelay + (getPing()+getServerPing())/1000
	end
end)

local values = practiceMode or rs:WaitForChild('Values')
local status = practiceMode or values.Status
local playType = practiceMode or values.PlayType
local QB = practiceMode or values.QB
local ball = practiceMode or values.Ball
local throwable = practiceMode or values.Throwable

local function getNearestPlayerToMouse()
	local cc = ws.CurrentCamera
	local target = nil
	local dist = math.huge
	for i,v in pairs(players:GetPlayers()) do
		if v.Name ~= plr.Name then
			if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Team == plr.Team then
				local screenpoint,onscreen = cc:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
				local check = (Vector2.new(uis:GetMouseLocation().X,uis:GetMouseLocation().Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude
				if check < dist then
					target = v
					dist = check
				end
			end
		end
	end
	return target
end

local function beamProjectile(g, v0, x0, t1)
	local c = 0.5*0.5*0.5;
	local p3 = 0.5*g*t1*t1 + v0*t1 + x0;
	local p2 = p3 - (g*t1*t1 + v0*t1)/3;
	local p1 = (c*g*t1*t1 + 0.5*v0*t1 + x0 - c*(x0+p3))/(3*c) - p2;
	local curve0 = (p1 - x0).magnitude;
	local curve1 = (p2 - p3).magnitude;
	local b = (x0 - p3).unit;
	local r1 = (p1 - x0).unit;
	local u1 = r1:Cross(b).unit;
	local r2 = (p2 - p3).unit;
	local u2 = r2:Cross(b).unit;
	b = u1:Cross(r1).unit;
	local cf1 = CFrame.new(
		x0.x, x0.y, x0.z,
		r1.x, u1.x, b.x,
		r1.y, u1.y, b.y,
		r1.z, u1.z, b.z
	)
	local cf2 = CFrame.new(
		p3.x, p3.y, p3.z,
		r2.x, u2.x, b.x,
		r2.y, u2.y, b.y,
		r2.z, u2.z, b.z
	)
	return curve0, -curve1, cf1, cf2;
end



local impossibleThrow = false




local angleBased = QBAimbotSettings.AngleBased
local desiredAngle = QBAimbotSettings.DesiredAngle
local angleMarginError = 1
local angleTimeIncrement = .05
local min_angleTimeIncrement = .001



local ANGLE_THROWING_AT = 0

local grav = 28

local ballTracer = draw("Line", {
	Visible = false,
	Thickness = 3, 
	Transparency = .75
})


local function updateAirTimeText()
	AirtimeText.Text = tostring(math.round(Time*100)/100).."s"
end

local T = nil

local Angle_TimeChangeDir = 0
local Angle_TimeChangeDir___switchCount = 0
local _angleTimeIncrement = angleTimeIncrement

local angleTime_redoCounter = 0
local powerTime_redoCounter = 0

local updateThrowInfo_debounce = false
local redirectionTime = 1
local function updateThrowInfo(targetPos,_Time,isRedo,originalTime)
	local isRedo = isRedo or false
	local originalTime = originalTime or _Time

	T = _Time or .01

	if angleTime_redoCounter >= 20 and angleBased then
		warn('Retry limit reached')
		angleBased = false
		T = originalTime
	end

	updateThrowInfo_debounce = true
	local fbTool = char:WaitForChild('Football')
	local fb = fbTool:WaitForChild('Handle')
	local fbRemote = fb:FindFirstChildOfClass('RemoteEvent')
	local originPos = char:WaitForChild('Head').Position + ballSpawnOffset

	local vel3 = calcVel(originPos,targetPos, grav, T) 

	local originPosAdjusted = originPos - vel3.Unit*5 
	local throwDir = vel3.Unit 
	local pow = vel3.Magnitude 
	local adjustedPower = math.round(math.clamp(pow, 0, 95))

	PowerText.Text = tostring(adjustedPower)

	local targetPlayer = getNearestPlayerToMouse()
	local routeName,routeAcc = calcRoute(targetPlayer)
	applyRouteThrowConfig(routeName)

	local angle = calcAngleFromVel3(vel3)
	local angleDeg = math.deg(angle)

	if angleBased and math.max(angleDeg,desiredAngle) - math.min(angleDeg,desiredAngle) >= angleMarginError and angleTime_redoCounter < 20 then
		if isRedo then
			angleTime_redoCounter+=1
			warn(angleTime_redoCounter)
		end
		local last__Angle_TimeChangeDir = Angle_TimeChangeDir
		if angleDeg < desiredAngle then 
			Angle_TimeChangeDir = 1
			T+=_angleTimeIncrement*T 
		elseif angleDeg > desiredAngle then 
			Angle_TimeChangeDir = -1
			T-=_angleTimeIncrement*T
		end
		
			updateThrowInfo(targetPos,T,true,originalTime) 
	end
	Time = T 
	Angle_TimeChangeDir = 0 
	Angle_TimeChangeDir___switchCount = 0 
	_angleTimeIncrement = angleTimeIncrement 
	angleTime_redoCounter = 0 

	if QBAimbotSettings.PowerBased then
		pcall(function()
			local distXZ = (originPos - targetPos).Magnitude
			local targetHeightRel = targetPos.Y - originPos.Y
			local _airTime = getAirTimeForPower(QBAimbotSettings.DesiredPower, distXZ, targetHeightRel, grav)
			if not tostring(_airTime):lower():find('nan') then
				Time = _airTime
			end
		end)
	end

	updateAirTimeText()


	local roundedAngleDeg = math.round(angleDeg*100)/100

	if targetPlayer then
		
		local targetPos,onScreen = ws.CurrentCamera:WorldToViewportPoint(targetPos)

		if onScreen then
			TargetLabel.Text = tostring(targetPlayer.Name)
			TimeLabel.Text = targetPlayer.Team ~= nil and tostring(targetPlayer.Team) or "No Team"
			ballTracer.From = uis.GetMouseLocation(uis)
			ballTracer.To = v2.new(targetPos.X, targetPos.Y)
			ballTracer.Color = 	rgb(255, 255, 255)
			local mousePos = uis:GetMouseLocation()
			local framePosition = UDim2.new(0, mousePos.X, 0, mousePos.Y)
			Frame.Position = framePosition
			ballTracer.Visible = true
			Frame.Visible = true
			MainContainer.Visible = true
		else
			Frame.Visible = false
			ballTracer.Visible = false
			MainContainer.Visible = false
		end
	end

	beam.Parent = ws
	updateBeam(originPos,vel3,T,grav)

	updateThrowInfo_debounce = false



	return {
		Power = pow,
		Angle = angleDeg
	}
end

local invalidPower_retryDir = 1

local function toggleTime()
    if getgenv().Time == 1 then
        getgenv().Time = 2
    else
        getgenv().Time = 1
    end
    updateAirTimeText()
    print("Time toggled to: " .. getgenv().Time)
end

local invalidPower_retryDir = 1


local throw
throw = function(targetPos,_Time)
	if impossibleThrow then return end
	local fbTool = char:WaitForChild('Football')
	local fb = fbTool:WaitForChild('Handle')
	local fbRemote = fb:FindFirstChildOfClass('RemoteEvent')
	local originPos = char:WaitForChild('Head').Position + ballSpawnOffset
	T = _Time or .01

	local vel3 = calcVel(originPos,targetPos, grav, T) 

	local originPosAdjusted = originPos - vel3.Unit*5 
	local throwDir = vel3.Unit 
	local pow = vel3.Magnitude 

	local powerRoundedClamped = math.clamp(math.round(pow),1,95)
	
	local angle = calcAngleFromVel3(vel3)
	local angleDeg = math.deg(angle)

	ANGLE_THROWING_AT = math.round(angleDeg*100)/100

	if angleBased == false and pow > 95 then
		if T > QBAimbotSettings.maxAirTime or T <= 0 then
			invalidPower_retryDir = -invalidPower_retryDir
		end
		T+=.01*invalidPower_retryDir
		throw(targetPos,T)
	else
		

		if not impossibleThrow then
			if practiceMode then
				fbRemote:FireServer('Clicked', originPosAdjusted, originPosAdjusted+throwDir*10000, pow, pow)
			else
				fbRemote:FireServer('Clicked', originPosAdjusted, originPosAdjusted+throwDir*10000, 95, pow)
			end
		end

	end
end

								
local TargetPos
getgenv().Time = 1 -- Ball airtime. Set to 1 for dots, keep at 2 for mag or dives
local ready = false

local htest = create('Hint',ws,{Text=''})
spawn(function()
	while task.wait() do
		htest.Text = Time
		if tostring(Time):lower():find('nan') then
			Time = 2
		end
	end
end)

if not practiceMode then
	local function onPlayStart()
		local function isQB()
			return plr.PlayerGui:FindFirstChild('BallGui')
		end
		if isQB() then 
			warn('IS QB!')
			while QBAimbotSettings.Enabled and step:wait() and isQB() and status.Value == 'InPlay' and throwable.Value do
				ready = true
				local targetPlr = getNearestPlayerToMouse()
				local routeName,routeAcc = calcRoute(targetPlr)
				applyRouteThrowConfig(routeName)
				local _time = Time
				TargetPos = clampPosInBounds(predictPos(targetPlr,_time+releaseTime))
			end
			ready = false
			ballTracer.Visible = false
			Frame.Visible = false
			MainContainer.Visible = false
		else
			warn('not qb.')
		end
	end
	status.Changed:Connect(function()
		warn('Status changed to',status.Value)
		if status.Value == 'InPlay' then
			onPlayStart()
		elseif status.Value == 'DeadPlay' or status.Value == 'PrePlay' then
			beam.Parent = nil
		end
	end)
end


spawn(function()
	while practiceMode and step:wait() do
		pcall(function()
			if char:FindFirstChild('Football') then
				MainContainer.Visible = true
				if botMode then
					local botCh = ws.npcwr.b['bot 3']
					TargetPos = clampPosInBounds(predictBotPos(botCh,Time+releaseTime))
				else
					targetPlayer = getNearestPlayerToMouse()
					local routeName,routeAcc = calcRoute(targetPlayer)
					applyRouteThrowConfig(routeName)
					if targetPlayer then
						TargetPos = clampPosInBounds(predictPos(targetPlayer,Time+releaseTime))
					else
						print('NO TARGET PLAYER')
					end
				end
			else
				MainContainer.Visible = false
				Frame.Visible = false
				ballTracer.Visible = false
			end
		end)
	end
end)

local stopVisuals = true


uis.InputBegan:Connect(function(io,gpe)
    local isReady = practiceMode and char:FindFirstChild('Football') or ready
    if isReady and QBAimbotSettings.Enabled and not gpe then
        if io.UserInputType == Enum.UserInputType.Keyboard then
            local k = io.KeyCode
            if k == keys.R then
                if angleBased then
                    desiredAngle = math.clamp(desiredAngle+5,5,90)
                elseif QBAimbotSettings.PowerBased then
                    QBAimbotSettings.DesiredPower = math.clamp(QBAimbotSettings.DesiredPower+5,5,95)
                else
                    Time = math.clamp(Time + .25, .25, QBAimbotSettings.maxAirTime)
                    updateAirTimeText()
                end
            elseif k == keys.F then
                if angleBased then
                    desiredAngle = math.clamp(desiredAngle-5,5,90)
                elseif QBAimbotSettings.PowerBased then
                    QBAimbotSettings.DesiredPower = math.clamp(QBAimbotSettings.DesiredPower-5,5,95)
                else
                    Time = math.clamp(Time - .25, .25, QBAimbotSettings.maxAirTime)
                    updateAirTimeText()
                end
            elseif k == keys[QBAimbotSettings.TimeToggleKeybind] then
                toggleTime()
            end
        elseif io.UserInputType == Enum.UserInputType.MouseButton1 and TargetPos then
            if not impossibleThrow then
                if QBAimbotSettings.Enabled == true then
                    spawn(playThrowAnim)
                    wait(throwDelay)
                    stopVisuals = true
                end
                pcall(function()
                    if QBAimbotSettings.Enabled == true then
                        throw(TargetPos,Time)
                    else
                        return
                    end
                end)
                delay(Time,function()
                    stopVisuals = false
                end)
            end
        elseif io.UserInputType == keys[QBAimbotSettings.ToggleKeybind] then
            QBAimbotSettings.Enabled = not QBAimbotSettings.Enabled
        end
    end
end)


local originalYOffset = QBAimbotSettings.YOffset

while task.wait() do
	local isReady = practiceMode and char:FindFirstChild('Football') or ready
	if isReady and not stopVisuals then
		visualPart.Position = TargetPos or visualPart.Position
		if not updateThrowInfo_debounce then
			local succ,err = pcall(function()

				local throwData = updateThrowInfo(TargetPos,Time)
				if throwData.Power > 95 then
					local angle45diff = math.max(throwData.Angle,45)-math.min(throwData.Angle,45)
					if angle45diff <= 1 then
						warnThrowImpossible()
					else
						if throwData.Angle > 45 then
							Time = math.clamp(Time-.25,.25,QBAimbotSettings.maxAirTime)
						elseif throwData.Angle < 45 then
							Time = math.clamp(Time+.25,.25,QBAimbotSettings.maxAirTime)
						end
					end
					updateAirTimeText()
				end

			end)
			if not succ then
				warn('ERROR:',err)
			end
		end
	end
	if isReady then
		local distToTargetXZ = ((hrp.Position-TargetPos)*v3.new(1,0,1)).Magnitude
		local canHit = true
		if angleBased and distToTargetXZ <= 30 then
			angleBased = false
			QBAimbotSettings.YOffset = 1.25
		elseif not canHit then
			angleBased = false
			warn("Can't hit target.")
		elseif not angleBased and canHit then
			angleBased = QBAimbotSettings.AngleBased
			QBAimbotSettings.YOffset = originalYOffset
		end
	end
end

warn("[AKI] QB Aimbot Loaded.")
