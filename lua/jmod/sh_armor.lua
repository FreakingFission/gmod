--[[ ArmorSlots

	-- if damage is locational (bullets):

	HITGROUP_HEAD
		eyes (1/2 of hit if hit is from front)
		mouthnose (1/2 of hit if hit is from front)
		ears (nonprotective: receives damage but doesn't protect, 1/4)
		head (if hit angle isn't from front)
	HITGROUP_CHEST
		chest (all of HITGROUP_CHEST)
		back (nonprotective: receives damage but doesn't protect, 1/4)
	HITGROUP_STOMACH
		abdomen (all of HITGROUP_STOMACH)
	HITGROUP_LEFTLEG
		leftthigh (1/2)
		leftcalf (1/2)
	HITGROUP_RIGHTLEG
		rightthigh (1/2)
		rightcalf (1/2)
	HITGROUP_RIGHTARM
		rightbicep (1/2)
		rightforearm (1/2)
	HITGROUP_LEFTARM
		leftbicep (1/2)
		leftforearm (1/2)
	
--]]
JMod_LocationalDmgTypes={
	DMG_BULLET,DMG_BUCKSHOT,DMG_AIRBOAT,DMG_SNIPER
}
JMod_FullBodyDmgTypes={
	DMG_CRUSH,DMG_SLASH,DMG_BURN,DMG_VEHICLE,DMG_BLAST,DMG_CLUB,DMG_ACID,DMG_PLASMA
}
JMod_BiologicalDmgTypes={
	DMG_NERVEGAS,DMG_RADIATION
}
JMod_BodyPartHealthMults={
	-- HITGROUP_HEAD
	eyes=.05,
	mouthnose=.05,
	ears=0,
	head=.18,
	-- HITGROUP_CHEST
	chest=.25,
	back=0,
	-- HITGROUP_STOMACH
	abdomen=.1,
	pelvis=.05,
	-- HITGROUP_LEFTLEG
	leftthigh=.04,
	leftcalf=.04,
	-- HITGROUP_RIGHTLEG
	rightthigh=.04,
	rightcalf=.04,
	-- HITGROUP_RIGHTARM
	rightshoulder=.04,
	rightforearm=.04,
	-- HITGROUP_LEFTARM
	leftshoulder=.04,
	leftforearm=.04
}
local BasicArmorProtectionProfile={
	[DMG_BUCKSHOT]=.99,
	[DMG_CLUB]=.9,
	[DMG_SLASH]=.9,
	[DMG_BULLET]=.85,
	[DMG_BLAST]=.85,
	[DMG_SNIPER]=.8,
	[DMG_AIRBOAT]=.8,
	[DMG_CRUSH]=.7,
	[DMG_VEHICLE]=.6,
	[DMG_BURN]=.6,
	[DMG_PLASMA]=.6,
	[DMG_ACID]=.5
}
local NonArmorProtectionProfile={
	[DMG_BUCKSHOT]=.05,
	[DMG_BLAST]=.05,
	[DMG_BULLET]=.05,
	[DMG_SNIPER]=.05,
	[DMG_AIRBOAT]=.05,
	[DMG_CLUB]=.05,
	[DMG_SLASH]=.05,
	[DMG_CRUSH]=.05,
	[DMG_VEHICLE]=.05,
	[DMG_BURN]=.05,
	[DMG_PLASMA]=.05,
	[DMG_ACID]=.05
}
JMod_ArmorTable={
	["GasMask"]={
		mdl="models/splinks/kf2/cosmetics/gas_mask.mdl", -- kf2
		slots={
			eyes=1,
			mouthnose=1
		},
		def=table.Inherit({
			[DMG_NERVEGAS]=1,
			[DMG_RADIATION]=.5
		},NonArmorProtectionProfile),
		dur=5,
		chrg={biochem=200},
		bon="ValveBiped.Bip01_Head1",
		siz=Vector(1,1,1),
		pos=Vector(0,.1,0),
		ang=Angle(100,180,90),
		wgt=5,
		mskmat="mats_jack_gmod_sprites/vignette.png",
		sndlop="snds_jack_gmod/mask_breathe.wav",
		ent="ent_jack_gmod_ezarmor_gasmask",
		tgl=true
	},
	["BallisticMask"]={
		mdl="models/arachnit/csgoheavyphoenix/items/mask.mdl", -- csgo misc
		slots={
			eyes=1,
			mouthnose=1
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_Head1",
		siz=Vector(1,1,1),
		pos=Vector(14.5,-68,0),
		ang=Angle(100,180,90),
		wgt=5,
		dur=150,
		mskmat="mats_jack_gmod_sprites/hard_vignette.png",
		ent="ent_jack_gmod_ezarmor_balmask",
		gayPhysics=true,
		tgl=true
	},
	["NightVisionGoggles"]={
		mdl="models/nvg.mdl", -- scp something
		slots={
			eyes=1
		},
		def=NonArmorProtectionProfile,
		bon="ValveBiped.Bip01_Head1",
		siz=Vector(1.05,1.05,1.05),
		pos=Vector(6.5,2.75,0),
		ang=Angle(-100,0,90),
		wgt=5,
		dur=3,
		chrg={electricity=60},
		mskmat="mats_jack_gmod_sprites/vignette.png",
		eqsnd="snds_jack_gmod/tinycapcharge.wav",
		ent="ent_jack_gmod_ezarmor_nvgs",
		eff={nightVision=true},
		tgl=true
	},
	["ThermalGoggles"]={
		mdl="models/nvg.mdl", -- scp something
		slots={
			eyes=1
		},
		def=NonArmorProtectionProfile,
		bon="ValveBiped.Bip01_Head1",
		siz=Vector(1.05,1.05,1.05),
		pos=Vector(6.5,2.75,0),
		ang=Angle(-100,0,90),
		wgt=5,
		dur=3,
		chrg={electricity=40},
		mskmat="mats_jack_gmod_sprites/vignette.png",
		eqsnd="snds_jack_gmod/tinycapcharge.wav",
		ent="ent_jack_gmod_ezarmor_thermals",
		eff={thermalVision=true},
		tgl=true
	},
	["Respirator"] = {
		mdl="models/jmod/respirator.mdl", -- MGSV
		slots={
			mouthnose=1
		},
		def=table.Inherit({
			[DMG_NERVEGAS]=.25,
			[DMG_RADIATION]=.5
		},NonArmorProtectionProfile),
		bon="ValveBiped.Bip01_Head1",
		siz=Vector(1,1,1),
		pos=Vector(3.25,1,0),
		ang=Angle(100,180,90),
		chrg={biochem=100},
		wgt=5,
		dur=3,
		sndlop="snds_jack_gmod/mask_breathe.wav",
		ent="ent_jack_gmod_ezarmor_respirator",
		tgl=true
	},
	["Headset"]={
		mdl="models/lt_c/sci_fi/headset_2.mdl", -- sci fi lt
		slots={
			ears=1
		},
		def=NonArmorProtectionProfile,
		bon="ValveBiped.Bip01_Head1",
		siz=Vector(1.2,1.05,1.1),
		pos=Vector(.5,3,.1),
		ang=Angle(130,0,90),
		wgt=5,
		dur=3,
		chrg={electricity=100},
		ent="ent_jack_gmod_ezarmor_headset",
		eff={teamComms=true},
		tgl=true
	},
	["Light-Helmet"]={
		mdl="models/player/helmet_achhc_black/achhc_black.mdl", -- tarkov
		slots={
			head=.8
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_Head1",
		siz=Vector(1.07,1,1.1),
		pos=Vector(1,-2,0),
		ang=Angle(-90,0,-90),
		wgt=10,
		dur=100,
		ent="ent_jack_gmod_ezarmor_lhead"
	},
	["Medium-Helmet"]={
		mdl="models/player/helmet_ulach_black/ulach.mdl", -- tarkov
		slots={
			head=.9
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_Head1",
		siz=Vector(1.05,1,1.05),
		pos=Vector(1,-2,0),
		ang=Angle(-90,0,-90),
		wgt=15,
		dur=150,
		ent="ent_jack_gmod_ezarmor_mhead"
	},
	["Heavy-Helmet"]={
		mdl="models/player/helmet_psh97_jeta/jeta.mdl", -- tarkov
		slots={
			head=1
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_Head1",
		siz=Vector(1.1,1,1.1),
		pos=Vector(1,-3,0),
		ang=Angle(-90,0,-90),
		wgt=20,
		dur=200,
		ent="ent_jack_gmod_ezarmor_hhead"
	},
	["Light-Vest"]={
		mdl="models/player/armor_trooper/trooper.mdl", -- tarkov
		slots={
			chest=.8,
			abdomen=.5
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_Spine2",
		siz=Vector(1,1.05,.9),
		pos=Vector(-2.5,-4.5,0),
		ang=Angle(-90,0,90),
		wgt=5,
		dur=300,
		ent="ent_jack_gmod_ezarmor_ltorso",
		gayPhysics=true
	},
	["Medium-Light-Vest"]={
		mdl="models/player/armor_paca/paca.mdl", -- tarkov
		slots={
			chest=.85,
			abdomen=.6
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_Spine2",
		siz=Vector(1.05,1.05,.95),
		pos=Vector(-3,-4.5,0),
		ang=Angle(-90,0,90),
		wgt=10,
		dur=400,
		ent="ent_jack_gmod_ezarmor_mltorso",
		gayPhysics=true
	},
	["Medium-Vest"]={
		mdl="models/player/armor_gjel/gjel.mdl", -- tarkov
		slots={
			chest=.9,
			abdomen=.7
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_Spine2",
		siz=Vector(1.05,1.05,1),
		pos=Vector(-3,-6.5,0),
		ang=Angle(-90,0,90),
		wgt=20,
		dur=500,
		ent="ent_jack_gmod_ezarmor_mtorso",
		gayPhysics=true
	},
	["Medium-Heavy-Vest"]={
		mdl="models/player/armor_6b13_killa/6b13_killa.mdl", -- tarkov
		slots={
			chest=.95,
			abdomen=.8
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_Spine2",
		siz=Vector(1.05,1.05,1),
		pos=Vector(-4.5,-12,0),
		ang=Angle(-85,0,90),
		wgt=40,
		dur=550,
		ent="ent_jack_gmod_ezarmor_mhtorso",
		gayPhysics=true
	},
	["Heavy-Vest"]={
		mdl="models/arachnit/csgo/ctm_heavy/items/ctm_heavy_vest.mdl", -- csgo hydra
		slots={
			chest=1,
			abdomen=.9
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_Spine2",
		siz=Vector(.9,.9,1),
		pos=Vector(-10.5,-53.5,0),
		ang=Angle(-85,0,90),
		wgt=80,
		dur=600,
		ent="ent_jack_gmod_ezarmor_htorso",
		gayPhysics=true
	},
	["Pelvis-Panel"]={
		mdl="models/arachnit/csgoheavyphoenix/items/pelviscover.mdl", -- csgo misc
		slots={
			pelvis=1,
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_Pelvis",
		siz=Vector(1.5,1.4,1.8),
		pos=Vector(71,0,-2),
		ang=Angle(90,-90,0),
		wgt=10,
		dur=300,
		ent="ent_jack_gmod_ezarmor_spelvis",
		gayPhysics=true
	},
	["Light-Left-Shoulder"]={
		mdl="models/snowzgmod/payday2/armour/armourlbicep.mdl", -- aegis
		slots={
			leftshoulder=.8,
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_L_UpperArm",
		siz=Vector(1,1,1),
		pos=Vector(0,0,-.5),
		ang=Angle(-90,-90,-90),
		wgt=5,
		dur=150,
		ent="ent_jack_gmod_ezarmor_llshoulder"
	},
	["Heavy-Left-Shoulder"]={
		mdl="models/arachnit/csgo/ctm_heavy/items/ctm_heavy_left_armor_pad.mdl", -- csgo hydra
		slots={
			leftshoulder=1,
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_L_UpperArm",
		siz=Vector(1,1,1),
		pos=Vector(-6,60,-31),
		ang=Angle(90,-20,110),
		wgt=15,
		dur=250,
		ent="ent_jack_gmod_ezarmor_hlshoulder",
		gayPhysics=true
	},
	["Light-Right-Shoulder"]={
		mdl="models/snowzgmod/payday2/armour/armourrbicep.mdl", -- aegis
		slots={
			rightshoulder=.8,
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_R_UpperArm",
		siz=Vector(1,1,1),
		pos=Vector(0,0,.5),
		ang=Angle(-90,-90,-90),
		wgt=5,
		dur=150,
		ent="ent_jack_gmod_ezarmor_lrshoulder"
	},
	["Heavy-Right-Shoulder"]={
		mdl="models/arachnit/csgo/ctm_heavy/items/ctm_heavy_right_armor_pad.mdl", -- csgo hydra
		slots={
			rightshoulder=1,
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_R_UpperArm",
		siz=Vector(1,1,1),
		pos=Vector(-32,55,25),
		ang=Angle(90,30,30),
		wgt=15,
		dur=250,
		ent="ent_jack_gmod_ezarmor_hrshoulder",
		gayPhysics=true
	},
	["Left-Forearm"]={
		mdl="models/snowzgmod/payday2/armour/armourlforearm.mdl", -- aegis
		slots={
			leftforearm=.95
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_L_Forearm",
		siz=Vector(1.1,1,1),
		pos=Vector(0,0,-.5),
		ang=Angle(0,-90,-50),
		wgt=10,
		dur=150,
		ent="ent_jack_gmod_ezarmor_slforearm",
		gayPhysics=true
	},
	["Right-Forearm"]={
		mdl="models/snowzgmod/payday2/armour/armourrforearm.mdl", -- aegis
		slots={
			rightforearm=.95
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_R_Forearm",
		siz=Vector(1.1,1,1),
		pos=Vector(-.5,0,.5),
		ang=Angle(0,-90,50),
		wgt=10,
		dur=150,
		ent="ent_jack_gmod_ezarmor_srforearm",
		gayPhysics=true
	},
	["Left-Thigh"]={
		mdl="models/snowzgmod/payday2/armour/armourlthigh.mdl", -- aegis
		slots={
			leftthigh=.95
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_L_Thigh",
		siz=Vector(.9,1,1.05),
		pos=Vector(-.5,0,-1.5),
		ang=Angle(90,-85,110),
		wgt=15,
		dur=250,
		ent="ent_jack_gmod_ezarmor_slthigh",
		gayPhysics=true
	},
	["Right-Thigh"]={
		mdl="models/snowzgmod/payday2/armour/armourrthigh.mdl", -- aegis
		slots={
			rightthigh=.95
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_R_Thigh",
		siz=Vector(.9,1,1.05),
		pos=Vector(.5,0,1),
		ang=Angle(90,-95,80),
		wgt=15,
		dur=250,
		ent="ent_jack_gmod_ezarmor_srthigh",
		gayPhysics=true
	},
	["Left-Calf"]={
		mdl="models/snowzgmod/payday2/armour/armourlcalf.mdl", -- aegis
		slots={
			leftcalf=.95
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_L_Calf",
		siz=Vector(1,1,1),
		pos=Vector(-1.5,-1,-.5),
		ang=Angle(-180,-83,-180),
		wgt=15,
		dur=250,
		ent="ent_jack_gmod_ezarmor_slcalf"
	},
	["Right-Calf"]={
		mdl="models/snowzgmod/payday2/armour/armourrcalf.mdl", -- aegis
		slots={
			rightcalf=.95
		},
		def=BasicArmorProtectionProfile,
		bon="ValveBiped.Bip01_R_Calf",
		siz=Vector(1,1,1),
		pos=Vector(-1.5,-1,.5),
		ang=Angle(-180,-83,-180),
		wgt=15,
		dur=250,
		ent="ent_jack_gmod_ezarmor_srcalf"
	}
}

hook.Add("SetupMove","JMOD_ARMOR_MOVE",function(ply,mv,cmd)
	if((ply.EZarmor)and(ply.EZarmor.speedfrac)and not(ply.EZarmor.speedfrac==1))then
		local origSpeed=(cmd:KeyDown(IN_SPEED) and ply:GetRunSpeed()) or ply:GetWalkSpeed()
		mv:SetMaxClientSpeed(origSpeed*ply.EZarmor.speedfrac)
	end
end)