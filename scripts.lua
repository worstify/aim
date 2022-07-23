--65pzo owns

if not game:IsLoaded()then game.Loaded:Wait()end;if not syn or not protectgui then getgenv().protectgui= function() end end;local a= {
    Enabled = true,
    
    ClassName = "Universal Silent Aim - Project Redacted",
    ToggleKey = "RightAlt",
    
    TeamCheck = true,
    VisibleCheck = false, 
    TargetPart = "HumanoidRootPart",
    SilentAimMethod = "Raycast",
    
    FOVRadius = 200,
    FOVVisible = false,
    ShowSilentAimTarget = false, 
    
    MouseHitPrediction = false,
    MouseHitPredictionAmount = 0.165,
    HitChance = 100
}getgenv().SilentAimSettings=Settings;local b="UniversalSilentAim"local c,c="",""local d= workspace.CurrentCamera;local e= game:GetService("Players")local f= game:GetService("RunService")local g= game:GetService("GuiService")local h= game:GetService("UserInputService")local i= game:GetService("HttpService")local j= e.LocalPlayer;local k= j:GetMouse()local l= game.GetChildren;local l= e.GetPlayers;local m= d.WorldToScreenPoint;local n= d.WorldToViewportPoint;local o= d.GetPartsObscuringTarget;local p= game.FindFirstChild;local f= f.RenderStepped;local g= g.GetGuiInset;local g= h.GetMouseLocation;local q= coroutine.resume;local r= coroutine.create;local s= {"Head", "HumanoidRootPart"}local t=0.165;local u= Drawing.new("Square")u.Visible=true;u.ZIndex=999;u.Color= Color3.fromRGB(54, 57, 241)u.Thickness=20;u.Size= Vector2.new(20, 20)u.Filled=true;local v= Drawing.new("Circle")v.Thickness=1;v.NumSides=100;v.Radius=180;v.Filled=false;v.Visible=false;v.ZIndex=999;v.Transparency=1;v.Color= Color3.fromRGB(54, 57, 241)local w= {
    FindPartOnRayWithIgnoreList = {
        ArgCountRequired = 3,
        Args = {
            "Instance", "Ray", "table", "boolean", "boolean"
        }
    },
    FindPartOnRayWithWhitelist = {
        ArgCountRequired = 3,
        Args = {
            "Instance", "Ray", "table", "boolean"
        }
    },
    FindPartOnRay = {
        ArgCountRequired = 2,
        Args = {
            "Instance", "Ray", "Instance", "boolean", "boolean"
        }
    },
    Raycast = {
        ArgCountRequired = 3,
        Args = {
            "Instance", "Vector3", "Vector3", "RaycastParams"
        }
    }
}function a(a)a= math.floor(a)local b= math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100)/100;return b<=a/100 end;do if not isfolder(b)then makefolder(b)end;if not isfolder(string.format("%s/%s", b, tostring(game.PlaceId)))then makefolder(string.format("%s/%s", b, tostring(game.PlaceId)))end end;local x= listfiles(string.format("%s/%s", "UniversalSilentAim", tostring(game.PlaceId)))local function y()local a= {}for b=1,#x do local b= x[b]if b:sub(-4)=='.lua'then local c= b:find('.lua', 1, true)local d=c;local e= b:sub(c, c)while e~='/'and e~='\\'and e~=''do c=c-1;e= b:sub(c, c)end;if e=='/'or e=='\\'then table.insert(a, b:sub(c + 1, d - 1))end end end;return a end;local function x(c)assert(c or c == "string", "oopsies")writefile(string.format("%s/%s/%s.lua", b, tostring(game.PlaceId), c), i:JSONEncode(a))end;local function z(c)assert(c or c == "string", "oopsies")local b= string.format("%s/%s/%s.lua", b, tostring(game.PlaceId), c)local b= i:JSONDecode(readfile(b))for b,c in next,b do a[b]=c end end;local function b(a)local a,b= m(d, a)return Vector2.new(a.X, a.Y),b end;local function i(a,b)local c=0;if#a<b.ArgCountRequired then return false end;for a,d in next,a do if typeof(d)==b.Args[a]then c=c+1 end end;return c>=b.ArgCountRequired end;local function m(a,b)return(b - a).Unit*1000 end;local function A()return g(h)end;local function g(a)local a= a.Character;local b= j.Character;if not(a or b)then return end;local c= p(a, Options.TargetPart.Value)or p(a, "HumanoidRootPart")if not c then return end;local a,b= {c.Position, b, a}, {b, a}local a=#o(d, a, b)return((a == 0 and true) or (a > 0 and false))end;local function h()if not Options.TargetPart.Value then return end;local a;local c;for d,d in next, l(e)do if d==j then continue end;if Toggles.TeamCheck.Value and d.Team==j.Team then continue end;local e= d.Character;if not e then continue end;if Toggles.VisibleCheck.Value and not g(d)then continue end;local d= p(e, "HumanoidRootPart")local f= p(e, "Humanoid")if not d or not f or f and f.Health<=0 then continue end;local b,d= b(d.Position)if not d then continue end;local b= (A() - b).Magnitude;if b<=(c or Options.Radius.Value or 2000)then a= ((Options.TargetPart.Value == "Random" and e[s[math.random(1, #s)]]) or e[Options.TargetPart.Value])c=b end end;return a end;local b= loadstring(game:HttpGet("https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/UI's/Linoria/Source.lua"))()local b= b:CreateWindow("Universal Silent Aim, by Project Redacted")local b= b:AddTab("General")local e= b:AddLeftTabbox("Main")do local b= e:AddTab("Main")b:AddToggle("aim_Enabled", {Text = "Enabled"}):AddKeyPicker("aim_Enabled_KeyPicker", {Default = "RightAlt", SyncToggleState = true, Mode = "Toggle", Text = "Enabled", NoUI = false})Options.aim_Enabled_KeyPicker:OnClick(function()
        a.Enabled = not a.Enabled
        
        Toggles.aim_Enabled.Value = a.Enabled
        Toggles.aim_Enabled:SetValue(a.Enabled)
        
        u.Visible = a.Enabled
    end)b:AddToggle("TeamCheck", {Text = "Team Check", Default = a.TeamCheck}):OnChanged(function()
        a.TeamCheck = Toggles.TeamCheck.Value
    end)b:AddToggle("VisibleCheck", {Text = "Visible Check", Default = a.VisibleCheck}):OnChanged(function()
        a.VisibleCheck = Toggles.VisibleCheck.Value
    end)b:AddDropdown("TargetPart", {Text = "Target Part", Default = a.TargetPart, Values = {"Head", "HumanoidRootPart", "Random"}}):OnChanged(function()
        a.TargetPart = Options.TargetPart.Value
    end)b:AddDropdown("Method", {Text = "Silent Aim Method", Default = a.SilentAimMethod, Values = {
        "Raycast","FindPartOnRay",
        "FindPartOnRayWithWhitelist",
        "FindPartOnRayWithIgnoreList",
        "Mouse.Hit/Target"
    }}):OnChanged(function() 
        a.SilentAimMethod = Options.Method.Value 
    end)b:AddSlider('HitChance', {
        Text = 'Hit chance',
        Default = 100,
        Min = 0,
        Max = 100,
        Rounding = 1,
    
        Compact = false,
    })Options.HitChance:OnChanged(function()
        a.HitChance = Options.HitChance.Value
    end)end;local e= b:AddLeftTabbox("Miscellaneous")local g= b:AddLeftTabbox("Field Of View")do local b= g:AddTab("Visuals")b:AddToggle("Visible", {Text = "Show FOV Circle"}):AddColorPicker("Color", {Default = Color3.fromRGB(54, 57, 241)}):OnChanged(function()
        v.Visible = Toggles.Visible.Value
        a.FOVVisible = Toggles.Visible.Value
    end)b:AddSlider("Radius", {Text = "FOV Circle Radius", Min = 0, Max = 360, Default = 130, Rounding = 0}):OnChanged(function()
        v.Radius = Options.Radius.Value
        a.FOVRadius = Options.Radius.Value
    end)b:AddToggle("MousePosition", {Text = "Show Silent Aim Target"}):AddColorPicker("MouseVisualizeColor", {Default = Color3.fromRGB(54, 57, 241)}):OnChanged(function()
        u.Visible = Toggles.MousePosition.Value 
        a.ShowSilentAimTarget = Toggles.MousePosition.Value 
    end)local b= e:AddTab("Prediction")b:AddToggle("Prediction", {Text = "Mouse.Hit/Target Prediction"}):OnChanged(function()
        a.MouseHitPrediction = Toggles.Prediction.Value
    end)b:AddSlider("Amount", {Text = "Prediction Amount", Min = 0.165, Max = 1, Default = 0.165, Rounding = 3}):OnChanged(function()
        t = Options.Amount.Value
        a.MouseHitPredictionAmount = Options.Amount.Value
    end)end;local e= b:AddRightTabbox("Create Configuration")do local a= e:AddTab("Create Configuration")a:AddInput("CreateConfigTextBox", {Default = "", Numeric = false, Finished = false, Text = "Create Configuration to Create", Tooltip = "Creates a configuration file containing settings you can save and load", Placeholder = "File Name here"}):OnChanged(function()
        if Options.CreateConfigTextBox.Value and string.len(Options.CreateConfigTextBox.Value) ~= "" then 
            c = Options.CreateConfigTextBox.Value
        end
    end)a:AddButton("Create Configuration File", function()
        if c ~= "" or c ~= nil then 
            x(c)
        end
    end)end;local c= b:AddRightTabbox("Save Configuration")do local a= c:AddTab("Save Configuration")a:AddDropdown("SaveConfigurationDropdown", {Values = y(), Text = "Choose Configuration to Save"})a:AddButton("Save Configuration", function()
        if Options.SaveConfigurationDropdown.Value then 
            x(Options.SaveConfigurationDropdown.Value)
        end
    end)end;local b= b:AddRightTabbox("Load Configuration")do local b= b:AddTab("Load Configuration")b:AddDropdown("LoadConfigurationDropdown", {Values = y(), Text = "Choose Configuration to Load"})b:AddButton("Load Configuration", function()
        if table.find(y(), Options.LoadConfigurationDropdown.Value) then
            z(Options.LoadConfigurationDropdown.Value)
            
            Toggles.TeamCheck:SetValue(a.TeamCheck)
            Toggles.VisibleCheck:SetValue(a.VisibleCheck)
            Options.TargetPart:SetValue(a.TargetPart)
            Options.Method:SetValue(a.SilentAimMethod)
            Toggles.Visible:SetValue(a.FOVVisible)
            Options.Radius:SetValue(a.FOVRadius)
            Toggles.MousePosition:SetValue(a.ShowSilentAimTarget)
            Toggles.Prediction:SetValue(a.MouseHitPrediction)
            Options.Amount:SetValue(a.MouseHitPredictionAmount)
            Options.HitChance:SetValue(a.HitChance)
        end
    end)end;q(r(function()
    f:Connect(function()
        if Toggles.MousePosition.Value and Toggles.aim_Enabled.Value then
            if h() then 
                local a = h().Parent.PrimaryPart or h()
                local a, b = n(d, a.Position);
                -- using PrimaryPart instead because if your Target Part is "Random" it will flicker the square between the Target's Head and HumanoidRootPart (its annoying)
                
                u.Visible = b
                u.Position = Vector2.new(a.X, a.Y)
            else 
                u.Visible = false 
                u.Position = Vector2.new()
            end
        end
        
        if Toggles.Visible.Value then 
            v.Visible = Toggles.Visible.Value
            v.Color = Options.Color.Value
            v.Position = A()
        end
    end)
end))local b;b= hookmetamethod(game, "__namecall", newcclosure(function(...)
    local c = getnamecallmethod()
    local d = {...}
    local e = d[1]
    local a = CalculateChance(a.HitChance)
    if Toggles.aim_Enabled.Value and e == workspace and not checkcaller() and a == true then
        if c == "FindPartOnRayWithIgnoreList" and Options.Method.Value == c then
            if i(d, w.FindPartOnRayWithIgnoreList) then
                local a = d[2]

                local c = h()
                if c then
                    local a = a.Origin
                    local c = m(a, c.Position)
                    d[2] = Ray.new(a, c)

                    return b(unpack(d))
                end
            end
        elseif c == "FindPartOnRayWithWhitelist" and Options.Method.Value == c then
            if i(d, w.FindPartOnRayWithWhitelist) then
                local a = d[2]

                local c = h()
                if c then
                    local a = a.Origin
                    local c = m(a, c.Position)
                    d[2] = Ray.new(a, c)

                    return b(unpack(d))
                end
            end
        elseif (c == "FindPartOnRay" or c == "findPartOnRay") and Options.Method.Value:lower() == c:lower() then
            if i(d, w.FindPartOnRay) then
                local a = d[2]

                local c = h()
                if c then
                    local a = a.Origin
                    local c = m(a, c.Position)
                    d[2] = Ray.new(a, c)

                    return b(unpack(d))
                end
            end
        elseif c == "Raycast" and Options.Method.Value == c then
            if i(d, w.Raycast) then
                local a = d[2]

                local c = h()
                if c then
                    d[3] = m(a, c.Position)

                    return b(unpack(d))
                end
            end
        end
    end
    return b(...)
end))local a=nil;a= hookmetamethod(game, "__index", newcclosure(function(b, c)
    if b == k and not checkcaller() and Toggles.aim_Enabled.Value and Options.Method.Value == "Mouse.Hit/Target" and h() then
        local a = h()
         
        if c == "Target" or c == "target" then 
            return a
        elseif c == "Hit" or c == "hit" then 
            return ((Toggles.Prediction.Value and (a.CFrame + (a.Velocity * t))) or (not Toggles.Prediction.Value and a.CFrame))
        elseif c == "X" or c == "x" then 
            return b.X 
        elseif c == "Y" or c == "y" then 
            return b.Y 
        elseif c == "UnitRay" then 
            return Ray.new(b.Origin, (b.Hit - b.Origin).Unit)
        end
    end

    return a(b, c)
end))