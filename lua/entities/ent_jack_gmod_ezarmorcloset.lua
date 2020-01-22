AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "EZ Armor Closet"
ENT.Category = "JMod - EZ Misc."
ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.ArmorTbl = {}

if SERVER then

	util.AddNetworkString("JMod_ArmorCloset") -- TODO move to jmod_server.lua

	function ENT:ArmorUpdate()
		net.Start("JMod_ArmorCloset")
			net.WriteEntity(self)
			net.WriteTable(self.ArmorTbl)
		net.Broadcast()
	end

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

		JMod_Hint(activator, "armorcloset")
		
		if not activator:KeyDown(IN_WALK) then
			
			for k, v in pairs(activator.EZarmor.slots) do
				if not self.ArmorTbl[k] then
					self.ArmorTbl[k] = activator.EZarmor.slots[k]
					activator.EZarmor.slots[k] = nil
				end
			end
			JMod_EZ_Update_Armor(activator)
			self:ArmorUpdate()

		else

			for k, v in pairs(self.ArmorTbl) do
				if not activator.EZarmor.slots[k] then
					activator.EZarmor.slots[k] = self.ArmorTbl[k]
					self.ArmorTbl[k] = nil
				end
			end
			JMod_EZ_Update_Armor(activator)
			self:ArmorUpdate()

		end

	end

elseif CLIENT then

	local EZarmorBoneTable={
		Torso="ValveBiped.Bip01_Spine2",
		Head="ValveBiped.Bip01_Head1",
		LeftShoulder="ValveBiped.Bip01_L_UpperArm",
		RightShoulder="ValveBiped.Bip01_R_UpperArm",
		LeftForearm="ValveBiped.Bip01_L_Forearm",
		RightForearm="ValveBiped.Bip01_R_Forearm",
		LeftThigh="ValveBiped.Bip01_L_Thigh",
		RightThigh="ValveBiped.Bip01_R_Thigh",
		LeftCalf="ValveBiped.Bip01_L_Calf",
		RightCalf="ValveBiped.Bip01_R_Calf",
		Pelvis="ValveBiped.Bip01_Pelvis",
		Face="ValveBiped.Bip01_Head1"
	}

	ENT.ArmorCSModels = {}
	ENT.MannequinMdl = nil

	net.Receive("JMod_ArmorCloset", function()
		local closet = net.ReadEntity()
		closet.ArmorTbl = net.ReadTable()

		-- Remove all Clientside models
		for _, v in pairs(closet.ArmorCSModels) do v:Remove() end
		closet.ArmorCSModels = {}

		for k, v in pairs(closet.ArmorTbl) do
			local globalTbl = JMod_ArmorTable[k][v[1]]
			local csMdl = ClientsideModel(globalTbl.mdl)
			csMdl:SetPos(ply:GetPos())
			csMdl:SetMaterial(globalTbl.mat or "")
			csMdl:SetParent(closet.MannequinMdl)
			csMdl:SetNoDraw(true) -- Handled in ENT:Draw()
			closet.ArmorCSModels[k] = csMdl
		end
	end)

	function ENT:Draw()

		self:DrawModel()

		
		for k, mdl in pairs(self.ArmorCSModels) do

			local localTbl = self.ArmorTbl[k]
			local globalTbl = JMod_ArmorTable[k][localTbl[1]]
			local i = self.MannequinMdl:LookupBone(EZarmorBoneTable[k])

			if i then

				local pos, ang = self.MannequinMdl:GetBonePosition(i)
				if pos and ang then

					local r,f,u= ang:Right(), ang:Forward(), ang:Up()
					pos = pos + (r*globalTbl.pos.x) + (f*globalTbl.pos.y) + (u*globalTbl.pos.z)
					ang:RotateAroundAxis(r,globalTbl.ang.p)
					ang:RotateAroundAxis(u,globalTbl.ang.y)
					ang:RotateAroundAxis(f,globalTbl.ang.r)
					mdl:SetRenderOrigin(pos)
					mdl:SetRenderAngles(ang)

					local matrix=Matrix()
					matrix:Scale(globalTbl.siz)
					mdl:EnableMatrix("RenderMultiply",matrix)

					local OldR,OldG,OldB=render.GetColorModulation()
					render.SetColorModulation(localTbl[3].r/255,localTbl[3].g/255,localTbl[3].b/255)
					mdl:DrawModel()
					render.SetColorModulation(OldR,OldG,OldB)

				end

			end

		end
		
	end

	function ENT:Initialize()
		self.MannequinMdl = ClientsideModel("models/Humans/Group01/male_07.mdl")
		self.MannequinMdl:SetMaterial("models/props_c17/FurnitureMetal001a")

		local matrix = Matrix()
		matrix:Scale(Vector(0.85, 0.85, 0.85))
		self.MannequinMdl:EnableMatrix("RenderMultiply",matrix)

		self.MannequinMdl:SetPos(self:GetPos() + Vector(0,0,-30))
		self.MannequinMdl:SetAngles(self:GetAngles())
		self.MannequinMdl:SetParent(self)
	end

	function ENT:OnRemove()
		for _, v in pairs(self.ArmorCSModels) do v:Remove() end
		if IsValid(self.MannequinMdl) then self.MannequinMdl:Remove() end
	end

end