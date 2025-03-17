local soundId = "rbxassetid://1842155223" -- Replace with your sound ID
local soundService = game:GetService("SoundService")

-- Function to lower the volume of all other sounds
local function lowerOtherSounds()
    for _, otherSound in pairs(soundService:GetDescendants()) do
        if otherSound:IsA("Sound") and otherSound.SoundId ~= soundId then
            otherSound.Volume = 0.2 -- Lower volume of other sounds
        end
    end
end

-- Create a new Sound instance
local sound = Instance.new("Sound")
sound.SoundId = soundId
sound.Volume = 1.5 -- Adjust main music volume (0-10)
sound.Looped = true
sound.Parent = soundService

-- Play the sound and lower other sounds
sound:Play()
lowerOtherSounds()

-- Restore volumes when the music stops
sound.Ended:Connect(function()
    for _, otherSound in pairs(soundService:GetDescendants()) do
        if otherSound:IsA("Sound") then
            otherSound.Volume = 1 -- Reset to normal
        end
    end
end)


local assetId = "rbxassetid://4751140181"  -- Replace with your asset ID

-- Load the asset using game:GetObjects() for client-side access
local asset = game:GetObjects(assetId)[1]

if asset then
    asset.Parent = workspace

    if asset:IsA("Model") then
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart") -- Ensure HumanoidRootPart is loaded

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local tweenService = game:GetService("TweenService")

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create a black background that fully covers the screen
local blackBackground = Instance.new("Frame")
blackBackground.Size = UDim2.new(1, 0, 1, 36) -- Ensures it covers the entire screen
blackBackground.Position = UDim2.new(0, 0, 0, -36) -- Offsets to fully cover the top
blackBackground.BackgroundColor3 = Color3.new(0, 0, 0) -- Black color
blackBackground.Parent = screenGui

-- Create an ImageLabel for the wolf decal
local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0.4, 0, 0.4, 0) -- 40% of screen size
imageLabel.Position = UDim2.new(0.3, 0, 0.3, 0) -- Centered on screen
imageLabel.BackgroundTransparency = 1 -- No background
imageLabel.Image = "rbxassetid://3623872759"
imageLabel.ImageTransparency = 0 -- Start fully visible
imageLabel.Parent = screenGui

-- Fade out the wolf decal
local fadeOut = tweenService:Create(imageLabel, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ImageTransparency = 1})
fadeOut:Play()
fadeOut.Completed:Wait()

-- Cleanup: Remove the black background and decal after fade out
screenGui:Destroy()


        -- Set the target position 2500 studs above the player
        local targetCFrame = hrp.CFrame * CFrame.new(0, 2500, 0)

        -- Move the model while preserving its structure
        if asset.PrimaryPart then
            asset:SetPrimaryPartCFrame(targetCFrame)
        else
            asset:MoveTo(targetCFrame.Position)
        end
    end
end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart") -- Get the HumanoidRootPart

task.wait(3.3)
-- Teleport the player 500 studs up
hrp.CFrame = hrp.CFrame + Vector3.new(0, 2600, 0)


local Lighting = game:GetService("Lighting")

-- The asset IDs for the six faces of the skybox
local skyboxBk = "rbxassetid://1370717244"  -- Back face
local skyboxDn = "rbxassetid://1370717336"  -- Down face
local skyboxFt = "rbxassetid://1370717438"  -- Front face
local skyboxLf = "rbxassetid://1370717567"  -- Left face
local skyboxRt = "rbxassetid://1370717698"  -- Right face
local skyboxUp = "rbxassetid://1370717782"  -- Up face

-- Function to change the skybox
local function changeSkybox()
    -- Find the first Sky object in Lighting
    local existingSky = Lighting:FindFirstChildOfClass("Sky")
    
    if existingSky then
        -- If a Sky object exists, we will update it
        existingSky.SkyboxBk = skyboxBk
        existingSky.SkyboxDn = skyboxDn
        existingSky.SkyboxFt = skyboxFt
        existingSky.SkyboxLf = skyboxLf
        existingSky.SkyboxRt = skyboxRt
        existingSky.SkyboxUp = skyboxUp
    else
        -- If no Sky object exists, create a new one
        local newSky = Instance.new("Sky")
        newSky.SkyboxBk = skyboxBk
        newSky.SkyboxDn = skyboxDn
        newSky.SkyboxFt = skyboxFt
        newSky.SkyboxLf = skyboxLf
        newSky.SkyboxRt = skyboxRt
        newSky.SkyboxUp = skyboxUp

        -- Parent the new Sky object to Lighting
        newSky.Parent = Lighting
    end
end

-- Call the function to change the skybox
changeSkybox()


local Lighting = game:GetService("Lighting")

-- Set the lighting style to a cold, Siberian village feel
Lighting.Ambient = Color3.fromRGB(180, 200, 255) -- Light blue tone to mimic the cold
Lighting.OutdoorAmbient = Color3.fromRGB(120, 150, 255) -- Slightly warmer outdoor ambient light
Lighting.Brightness = 2 -- Adjust to make lighting slightly less harsh
Lighting.ColorShift_Top = Color3.fromRGB(200, 220, 255) -- Light, icy top color shift
Lighting.ColorShift_Bottom = Color3.fromRGB(150, 180, 255) -- Cold bottom tone
Lighting.ExposureCompensation = 0.25 -- To reduce the overexposure
Lighting.FogColor = Color3.fromRGB(230, 240, 255) -- Soft fog to simulate cold weather
Lighting.FogEnd = 500 -- End the fog at a decent range to keep things visible but still foggy
Lighting.FogStart = 50 -- Start the fog near the player
Lighting.GlobalShadows = true -- Enable global shadows for realism

-- Set sun properties for a soft, welcoming glow
Lighting.SunRays.Enabled = true
Lighting.SunRays.Intensity = 0.5
Lighting.SunRays.Spread = 0.25
Lighting.SunRays.Quality = Enum.QualityLevel.Medium

-- Set the time of day to mid-morning for a soft, cold daylight feel
Lighting.TimeOfDay = "09:00:00"

-- Adjust the environment for the cold yet welcoming feel
Lighting.Reflectance = 0.5 -- Slightly reflective surfaces to give a chill yet welcoming touch
Lighting.ShadowSoftness = 0.25 -- Softer shadows to create a cozy, inviting atmosphere
Lighting.FogStart = 50
Lighting.FogEnd = 500
Lighting.Ambient = Color3.fromRGB(200, 220, 255) -- Cool tone for the snowy village
Lighting.OutdoorAmbient = Color3.fromRGB(150, 180, 255) -- Outdoor soft lighting
