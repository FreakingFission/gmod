AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "EZ Armor Closet"
ENT.Category = "JMod - EZ Misc."
ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.ArmorPos = {

}
ENT.Armor = {}

if SERVER then

	function ENT:SpawnFunction(ply,tr)

		local SpawnPos = tr.HitPos + tr.HitNormal * 15 + Vector(0,0,30)
		local ent = ents.Create(self.ClassName)
		ent:SetAngles(Angle(0,ply:GetAngles().y+180,0))
		ent:SetPos(SpawnPos)
		JMod_Owner(ent,ply)

		ent:Spawn()
		ent:Activate()

		return ent
	end

	function ENT:Initialize()

		self:SetModel("models/props_c17/FurnitureShelf001a.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:DrawShadow(true)
		self:SetUseType(SIMPLE_USE)

		local phys=self:GetPhysicsObject()

		if phys:IsValid() then
			phys:Wake()
			phys:SetMass(300)
			phys:SetBuoyancyRatio(.1)
		end

	end

	function ENT:Use(activator, caller)
		-- body
	end

else

end