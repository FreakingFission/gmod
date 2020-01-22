AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "EZ Armor Closet"
ENT.Category = "JMod - EZ Misc."
ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.ArmorPos = {
	Face 			= {Vector(0,-2,22), 		Angle(-100,-180,-90)},
	Head 			= {Vector(-1,0,20), 		Angle(90,0,90)},
	Torso			= {Vector(3,5,0), 	Angle(90,0,-90)},
	Pelvis 			= {Vector(0,0,0), 		Angle(0,0,0)},
	LeftShoulder 	= {Vector(-10,0,20), 	Angle(0,0,0)},
	RightShoulder 	= {Vector(10,0,20), 	Angle(0,0,0)},
	LeftForearm 	= {Vector(-15,0,10), 	Angle(0,0,0)},
	RightForearm 	= {Vector(15,0,10), 	Angle(0,0,0)},
	LeftThigh 		= {Vector(-10,0,-15), 	Angle(0,0,0)},
	RightThigh 		= {Vector(10,0,-15), 	Angle(0,0,0)},
	LeftCalf 		= {Vector(-10,0,-25), 	Angle(0,0,0)},
	RightCalf 		= {Vector(10,0,-25), 	Angle(0,0,0)}
}

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
		
		if not activator:KeyDown(IN_WALK) then
			
			print("About to store armor")
			--PrintTable(activator.EZarmor.slots)
			for k, v in pairs(activator.EZarmor.slots) do
				if not self.ArmorTbl[k] then
					print("Put in armor " .. activator.EZarmor.slots[k][1] .. " of type " .. k)
					self.ArmorTbl[k] = activator.EZarmor.slots[k]
					activator.EZarmor.slots[k] = nil
				end
			end

			JModEZarmorSync(activator)
			self:ArmorUpdate()

		else

			print("About to retrieve armor")
			--PrintTable(self.ArmorTbl)
			for k, v in pairs(self.ArmorTbl) do
				if not activator.EZarmor.slots[k] then
					print("Grabbed armor " .. self.ArmorTbl[k][1] .. " of slot " .. k)
					activator.EZarmor.slots[k] = self.ArmorTbl[k]
					self.ArmorTbl[k] = nil
				end
			end
			JModEZarmorSync(activator)
			self:ArmorUpdate()

		end

	end

elseif CLIENT then

	ENT.ArmorCSModels = {}

	net.Receive("JMod_ArmorCloset", function()
		local closet = net.ReadEntity()
		closet.ArmorTbl = net.ReadTable()

		-- Remove all Clientside models
		for _, v in pairs(closet.ArmorCSModels) do v:Remove() end
		closet.ArmorCSModels = {}

		for k, v in pairs(closet.ArmorTbl) do

			local globalTbl = JMod_ArmorTable[k][v[1]]
			local localTbl = closet.ArmorPos[k]
			local csMdl = ClientsideModel(globalTbl.mdl)
			closet.ArmorCSModels[k] = csMdl

			local pos = closet:GetPos() 
					+ closet:GetRight() 	* (localTbl[1].x + globalTbl.pos.x)
					+ closet:GetForward() 	* (localTbl[1].y + globalTbl.pos.y)
					+ closet:GetUp() 		* (localTbl[1].z + globalTbl.pos.z)

			local ang = closet:GetAngles()
			ang:RotateAroundAxis(closet:GetRight(),		localTbl[2].p + globalTbl.ang.p)
			ang:RotateAroundAxis(closet:GetUp(), 	localTbl[2].y + globalTbl.ang.y)
			ang:RotateAroundAxis(closet:GetForward(), 		localTbl[2].r + globalTbl.ang.r)

			local matrix = Matrix()
			matrix:Scale(globalTbl.siz)
			csMdl:EnableMatrix("RenderMultiply",matrix)

			csMdl:SetPos(pos)
			csMdl:SetAngles(ang)
			csMdl:SetColor(Color(v[3].r, v[3].g, v[3].b, v[3].a))

			csMdl:SetParent(closet)
		end

	end)

	function ENT:OnRemove()
		for _, v in pairs(self.ArmorCSModels) do v:Remove() end
	end

end