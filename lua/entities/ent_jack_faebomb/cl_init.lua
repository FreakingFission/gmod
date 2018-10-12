
include('shared.lua')

function ENT:Initialize()
	self.Nice=ClientsideModel("models/props_phx/ww2bomb.mdl")
	self.Nice:SetMaterial("models/entities/mat_jack_faebomb")
	self.Nice:SetPos(self:GetPos()-self:GetUp()*6)
	self.Nice:SetAngles(self:GetAngles())
	self.Nice:SetParent(self)
	self.Nice:SetNoDraw(true)
end

function ENT:Draw()
	local Matricks=Matrix()
	Matricks:Scale(Vector(1,.45,1))
	self.Nice:EnableMatrix("RenderMultiply",Matricks)
	self.Nice:DrawModel()
	--self.Entity:DrawModel()
end

function ENT:OnRemove()
end
language.Add("ent_jack_faebomb","Thermobaric Bomb")


