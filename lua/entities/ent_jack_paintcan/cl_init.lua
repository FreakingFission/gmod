//local Shit=Material("models/entities/mat_jack_apersbomb")
include('shared.lua')
function ENT:Initialize()
	self.Can1=ClientsideModel("models/props_borealis/bluebarrel001.mdl")
	self.Can1:SetPos(self:GetPos())
	self.Can1:SetParent(self)
	self.Can1:SetNoDraw(true)
	self.Can1:SetModelScale(.1,0)
	self.Can1:SetMaterial("models/mat_jack_spraypaintcan")
	self.Can2=ClientsideModel("models/props_borealis/bluebarrel001.mdl")
	self.Can2:SetPos(self:GetPos())
	self.Can2:SetParent(self)
	self.Can2:SetNoDraw(true)
	self.Can2:SetModelScale(.1,0)
	self.Can2:SetMaterial("models/mat_jack_spraypaintcan")
	self.Can3=ClientsideModel("models/props_borealis/bluebarrel001.mdl")
	self.Can3:SetPos(self:GetPos())
	self.Can3:SetParent(self)
	self.Can3:SetNoDraw(true)
	self.Can3:SetModelScale(.1,0)
	self.Can3:SetMaterial("models/mat_jack_spraypaintcan")
	self.Can4=ClientsideModel("models/props_borealis/bluebarrel001.mdl")
	self.Can4:SetPos(self:GetPos())
	self.Can4:SetParent(self)
	self.Can4:SetNoDraw(true)
	self.Can4:SetModelScale(.1,0)
	self.Can4:SetMaterial("models/mat_jack_spraypaintcan")
	self.Can5=ClientsideModel("models/props_borealis/bluebarrel001.mdl")
	self.Can5:SetPos(self:GetPos())
	self.Can5:SetParent(self)
	self.Can5:SetNoDraw(true)
	self.Can5:SetModelScale(.1,0)
	self.Can5:SetMaterial("models/mat_jack_spraypaintcan")
	self.Tape=ClientsideModel("models/props_vehicles/tire001b_truck.mdl")
	self.Tape:SetPos(self:GetPos())
	self.Tape:SetParent(self)
	self.Tape:SetNoDraw(true)
	self.Tape:SetModelScale(.1,0)
	self.Tape:SetMaterial("models/debug/debugwhite")
	--local Matricks=Matrix()
	--Matricks:Scale(Vector(.85,.85,.625))
	--self.Can1:EnableMatrix("RenderMultiply",Matricks)
end
function ENT:Draw()
	local Ang=self:GetAngles()
	local Up=self:GetUp()
	local Forward=self:GetForward()
	local Right=self:GetRight()
	local Pos=self:GetPos()+Up*2
	self.Can1:SetRenderAngles(Ang)
	self.Can2:SetRenderAngles(Ang)
	self.Can3:SetRenderAngles(Ang)
	self.Can4:SetRenderAngles(Ang)
	self.Can5:SetRenderAngles(Ang)
	Ang:RotateAroundAxis(Ang:Right(),90)
	self.Tape:SetRenderAngles(Ang)
	self.Can1:SetRenderOrigin(Pos+Right*2.75)
	self.Can2:SetRenderOrigin(Pos-Right*2.75)
	self.Can3:SetRenderOrigin(Pos+Forward*2.75)
	self.Can4:SetRenderOrigin(Pos-Forward*2.75)
	self.Can5:SetRenderOrigin(Pos)
	self.Tape:SetRenderOrigin(Pos+Up*3)
	render.SetColorModulation(.05,.05,.05)
	self.Can1:DrawModel()
	render.SetColorModulation(1,.05,1)
	self.Can2:DrawModel()
	render.SetColorModulation(.05,1,1)
	self.Can3:DrawModel()
	render.SetColorModulation(1,1,1)
	self.Can4:DrawModel()
	render.SetColorModulation(1,1,.05)
	self.Can5:DrawModel()
	render.SetColorModulation(.9,.9,.825)
	self.Tape:DrawModel()
	--render.SetBlend(.5)
	--self:DrawModel()
	--render.SetBlend(1)
end
function ENT:OnRemove()
	--fuck you kid you're a dick
end
--[[--------------------------------------------------------------
	I hate desiging UIs so damn much
---------------------------------------------------------------]]--
local function OpenMenu(data)
	local Tab={}
	Tab.Self=data:ReadEntity()
	Tab.Self:OpenTheMenu(Tab)
end
usermessage.Hook("JackaSprayPaintOpenMenu",OpenMenu)
function ENT:OpenTheMenu(tab)
	local DermaPanel=vgui.Create("DFrame")
	DermaPanel:SetPos(40,80)
	DermaPanel:SetSize(225,300)
	DermaPanel:SetTitle("Choose Color")
	DermaPanel:SetVisible(true)
	DermaPanel:SetDraggable(true)
	DermaPanel:ShowCloseButton(false)
	DermaPanel:MakePopup()
	DermaPanel:Center()

	local MainPanel=vgui.Create("DPanel",DermaPanel)
	MainPanel:SetPos(5,25)
	MainPanel:SetSize(215,270)
	MainPanel.Paint=function()
		surface.SetDrawColor(0,20,40,255)
		surface.DrawRect(0,0,MainPanel:GetWide(),MainPanel:GetTall()+3)
	end
	
	local Mixer=vgui.Create("DColorMixer",MainPanel)
	Mixer:SetPos(10,10)
	Mixer:SetSize(200,200)
	Mixer:SetPalette(true)
	Mixer:SetAlphaBar(false)
	Mixer:SetWangs(true)
	Mixer:SetColor(Color(128,128,128))
	
	local ColorPanel=vgui.Create("DPanel",DermaPanel)
	ColorPanel:SetPos(170,111)
	ColorPanel:SetSize(40,50)
	ColorPanel.Paint=function()
		local PntCol=Mixer:GetColor()
		local LgtCol=render.GetLightColor(self:GetPos())
		LgtCol=Color(math.Clamp(LgtCol.r*4,0,1),math.Clamp(LgtCol.g*4,0,1),math.Clamp(LgtCol.b*4,0,1))
		local ActCol=Color(PntCol.r*LgtCol.r,PntCol.g*LgtCol.g,PntCol.b*LgtCol.b)
		surface.SetDrawColor(ActCol)
		surface.DrawRect(0,0,ColorPanel:GetWide(),ColorPanel:GetTall()+3)
	end
	
	local exitbutton = vgui.Create("Button",MainPanel)
	exitbutton:SetSize(90,40)
	exitbutton:SetPos(10,220)
	exitbutton:SetText("Exit")
	exitbutton:SetVisible(true)
	exitbutton.DoClick=function()
		DermaPanel:Close()
		RunConsoleCommand("JackaSprayPaintClose",tostring(self:GetNetworkedInt("JackIndex")))
	end
	
	local gobutton = vgui.Create("Button",MainPanel)
	gobutton:SetSize(90,40)
	gobutton:SetPos(115,220)
	gobutton:SetText("Paint")
	gobutton:SetVisible(true)
	gobutton.DoClick=function()
		DermaPanel:Close()
		local Col=Mixer:GetColor()
		RunConsoleCommand("JackaSprayPaintGo",tostring(self:GetNetworkedInt("JackIndex")),Col.r,Col.g,Col.b)
	end
end
language.Add("ent_jack_aidfuel_paintcan","Spray Paint")