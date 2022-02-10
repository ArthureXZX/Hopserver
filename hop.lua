
wait(2)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Player = game:GetService("Players").LocalPlayer
local Name = "Realsetting.asdg"
local DefaultSettings = {
    isfind = false
    }
    local Settings
if not pcall(function() readfile(Name) end) then writefile(Name, game:service'HttpService':JSONEncode(DefaultSettings)) end
Settings = game:service'HttpService':JSONDecode(readfile(Name))

local Window = Library.CreateLib("Serena Hub", "GrapeTheme")
local universalTab = Window:NewTab("Universal")
local universal = universalTab:NewSection("Kaigaku") -- section
--variable
local function Save()
    writefile(Name,game:service'HttpService':JSONEncode(Settings))
    end

_G.nodamage = false
local KaiHp = 0
loading = game:GetService("Players")[Player.Name].PlayerGui:FindFirstChild('LoadingScreen')


universal:NewLabel("isfind:",Settings.isfind)
universal:NewButton("Hop server","", function()
    Hopserver()
end)

local kaihop = universal:NewToggle("Kai function","",function (bool)
    if bool then
        Settings.isfind = bool
        print(_G.kaihop)
        Save()
    else
        _G.kaihop = false
        print(_G.kaihop)
        Save()
    end
end)
universal:NewToggle("Test","",true)



--function 
function Hopserver()
    -- no credit, no cock in admin ass
getgenv().ServerStartIndex = 100
getgenv().ServerEndIndex = 40000
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrKix/miscreleases/main/nullptrhop.lua"))()
end
local function getMob()
    local dist, mob = math.huge 
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v.Name == "Kaigaku" then 
            local get_mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:GetModelCFrame().p).magnitude 
            if get_mag < dist then 
                dist = get_mag 
                mob = v 
            end
        end
    end
    return mob
end



--spawn function

spawn(function ()  --เปิด hop หา kai
    while wait() do
        if Settings.isfind then 
            if game:GetService("Workspace"):FindFirstChild("Kaigaku") == nil then --ไม่เจอ
                Hopserver()
                wait(7)
            else --เจอ 
                wait()
                pcall(function()  
                    if(game:GetService("Players")[ game.Players.LocalPlayer.Name
                    ].PlayerGui.LoadingScreen.Background.Loading:FindFirstChild("Skip")) then
                        wait(5)
                        firesignal(game:GetService("Players")[ game.Players.LocalPlayer.Name
                        ].PlayerGui.LoadingScreen.Background.Loading.Skip.MouseButton1Click)
                    end
                end)
                HP = game:GetService("Workspace").Kaigaku.Health.Value 
                KaiHp = HP
                wait(5)
                Name  =game.Players.LocalPlayer.Name
                local baseplate = Instance.new("Part")
                baseplate.Parent = workspace
                baseplate.Size = Vector3.new(10,2,10) -- change size
                baseplate.Anchored = true
                baseplate.Transparency =1
                kaipos = getMob():GetModelCFrame()
                baseplate.CFrame = kaipos + Vector3.new(0,200,0) -- higher number for it to spawn higher
                wait(3)
                game:GetService"Players".LocalPlayer.Character:WaitForChild"Humanoid"
                  repeat wait() until not game.Players.LocalPlayer:FindFirstChild("LastSpawned") wait(1)
                game:GetService("ReplicatedStorage").Remotes.Sync:InvokeServer("Player", "SpawnCharacter")
                repeat wait() until game.Players.LocalPlayer:FindFirstChild("SecurityBypass") wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = baseplate.CFrame + Vector3.new(0,10,0)
                wait(5)
                local vu = game:GetService("VirtualUser")
                 game:GetService("Players").LocalPlayer.Idled:connect(function()
                 vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                 wait(1)
                  vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end)
                wait()
                _G.nodamage = true
            end 
        end
    end
end)
spawn(function ()
    while wait() do
        if _G.nodamage then
            local nofall 
            nofall = hookmetamethod(game, "__namecall", function(self, ...)
                local method = getnamecallmethod()
                local args = {...}
            
                if method == "FireServer" and tostring(self) == "Async" and args[1] == "Character" and args[2] == "FallDamageServer"  then 
                    return nil
                end
            
                if method == "FireServer" and tostring(self) == "Async" and args[1] == "Character" and args[2] == "DemonWeakness"   then 
                    return nil
                end
            
                if method == "FireServer" and tostring(self) == "Async" and args[1] == "Character" and args[2] == "Crow"  then 
                    return nil
                end
                if method == "Kick" and tostring(self) == Players.LocalPlayer then
                    return 
                end    
                return nofall(self, ...)
            end)
            break
        end
       end
end)

local queue_on_teleport =
queue_on_teleport or
    syn and
        syn.queue_on_teleport [[
       repeat wait() until game:IsLoaded() wait(5) print("ServerHoped or rejoined")
       loadstring(game:HttpGet('https://raw.githubusercontent.com/ArthureXZX/Demon-fall/main/kaihop'))()
]]
   

