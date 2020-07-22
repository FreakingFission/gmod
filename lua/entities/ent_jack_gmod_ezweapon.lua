-- Jackarunda 2020
AddCSLuaFile()
ENT.Type="anim"
ENT.Author="Jackarunda"
ENT.Category="JMod - EZ Weapons"
ENT.Information="glhfggwpezpznore"
ENT.PrintName="EZ Weapon"
ENT.NoSitAllowed=true
ENT.Spawnable=false
ENT.AdminSpawnable=false
---
ENT.JModEZstorable=true
---
if(SERVER)then
	function ENT:SpawnFunction(ply,tr)
		local SpawnPos=tr.HitPos+tr.HitNormal*40
		local ent=ents.Create(self.ClassName)
		ent:SetAngles(Angle(0,0,0))
		ent:SetPos(SpawnPos)
		JMod_Owner(ent,ply)
		ent:Spawn()
		ent:Activate()
		--local effectdata=EffectData()
		--effectdata:SetEntity(ent)
		--util.Effect("propspawn",effectdata)
		return ent
	end
	function ENT:Initialize()
		self.Specs=JMod_WeaponTable[self.WeaponName]
		self.Entity:SetModel(self.Specs.mdl)
		self.Entity:SetMaterial(self.Specs.mat or "")
		--self.Entity:PhysicsInitBox(Vector(-10,-10,-10),Vector(10,10,10))
		if((self.ModelScale)and not(self.Specs.gayPhysics))then self:SetModelScale(self.ModelScale) end
		self.Entity:PhysicsInit(SOLID_VPHYSICS)
		self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
		self.Entity:SetSolid(SOLID_VPHYSICS)
		self.Entity:DrawShadow(true)
		self.Entity:SetUseType(SIMPLE_USE)
		self:GetPhysicsObject():SetMass(20)
		timer.Simple(.01,function()
			self:GetPhysicsObject():SetMass(20)
			self:GetPhysicsObject():Wake()
		end)
		---
		self.EZID=self.EZID or JMod_GenerateGUID()
		---
		self.MagRounds=self.MagRounds or 0
	end
	function ENT:PhysicsCollide(data,physobj)
		if(data.DeltaTime>0.2)then
			if(data.Speed>50)then
				self.Entity:EmitSound("Weapon.ImpactHard")
			end
		end
	end
	function ENT:OnTakeDamage(dmginfo)
		self.Entity:TakePhysicsDamage(dmginfo)
		if(dmginfo:GetDamage()>=120)then
			self:Remove()
		end
	end
	function ENT:Use(activator)
		local Alt=activator:KeyDown(JMOD_CONFIG.AltFunctionKey)
		if(Alt)then
			activator:PickupObject(self)
		else
			if not(activator:HasWeapon(self.Specs.swep))then
				activator:Give(self.Specs.swep)
				activator:GetWeapon(self.Specs.swep):SetClip1(self.MagRounds)
				activator:SelectWeapon(self.Specs.swep)
				JMod_Hint(activator,"weapon drop")
				JMod_Hint(activator,"weapon steadiness")
				JMod_Hint(activator,activator:GetWeapon(self.Specs.swep).Primary.Ammo)
				self:Remove()
			else
				activator:PickupObject(self)
			end
		end
	end
elseif(CLIENT)then
	function ENT:Draw()
		self:DrawModel()
	end
	language.Add("ent_jack_gmod_ezweapon","EZ Weapon")
end