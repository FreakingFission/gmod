SWEP.Base = "wep_jack_gmod_gunbase"

SWEP.PrintName = "Designated Marksman Rifle"

SWEP.Slot = 3

SWEP.ViewModel = "models/weapons/c_mw2_m21ebr.mdl"
SWEP.WorldModel = "models/weapons/w_jmod_m21.mdl"
SWEP.ViewModelFOV = 70
SWEP.BodyHolsterSlot = "back"
SWEP.BodyHolsterAng = Angle(0,-105,0)
SWEP.BodyHolsterAngL = Angle(0,-75,190)
SWEP.BodyHolsterPos = Vector(3,-10,-9)
SWEP.BodyHolsterPosL = Vector(4,-10,9)
SWEP.BodyHolsterScale = .95

SWEP.DefaultBodygroups = "01000"

SWEP.Damage = 70
SWEP.DamageMin = 15 -- damage done at maximum range
SWEP.DamageRand = .35
SWEP.Range = 350 -- in METERS
SWEP.Penetration = 95

SWEP.Primary.ClipSize = 15 -- DefaultClip is automatically set.

SWEP.Recoil = 1
SWEP.RecoilSide = 0.5
SWEP.RecoilRise = 0.6

SWEP.Delay = 60 / 550 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 3 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 200

SWEP.Primary.Ammo = "Medium Rifle Round" -- what ammo type the gun uses

SWEP.FirstShootSound = "snds_jack_gmod/ez_weapons/medium_rifle.wav"
SWEP.ShootSound = "snds_jack_gmod/ez_weapons/medium_rifle.wav"
SWEP.DistantShootSound = "snds_jack_gmod/ez_weapons/rifle_far.wav"
SWEP.ShootSoundExtraMult=1

SWEP.MuzzleEffect = "muzzleflash_g3"
SWEP.ShellModel = "models/jhells/shell_762nato.mdl"
SWEP.ShellPitch = 80
SWEP.ShellScale = 2

SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = .6
SWEP.SightTime = .75

SWEP.IronSightStruct = {
    Pos = Vector(-3.75, 0, .5),
    Ang = Angle(-.1, 0, -5),
    Magnification = 1.1,
    SwitchToSound = "" -- sound that plays when switching to this sight
}

SWEP.ActivePos = Vector(1, 1, 1)
SWEP.ActiveAng = Angle(1.8, 1.5, -2.5)

SWEP.HolsterPos = Vector(6, -1, 0)
SWEP.HolsterAng = Angle(-20, 50, 0)

SWEP.MeleeAttackTime=.35

SWEP.BarrelLength = 46

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic_ez"},
        Bone = "tag_weapon",
        Offset = {
            vang = Angle(0, 0, 0),
			vpos = Vector(10, 0, 3.8),
            wpos = Vector(10, .8, -7),
            wang = Angle(-10.393, 0, 180)
        },
		-- remove Slide because it ruins my life
        Installed = "optic_jack_scope_low"
    }
}

-- extra anims: holster, sprint
SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
        Time = 1
    },
    ["draw"] = {
        Source = "draw",
        Time = 0.8,
        SoundTable = {{s = "snds_jack_gmod/ez_weapons/dmr/draw.wav", t = 0, v=60}},
		Mult=2.5,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.35,
    },
    ["ready"] = {
        Source = "draw_first",
        Time = 1,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["fire"] = {
        Source = "fire",
        Time = 0.4,
        ShellEjectAt = 0,
    },
    ["fire_iron"] = {
        Source = "fire",
        Time = 0.4,
        ShellEjectAt = 0,
    },
    ["reload"] = {
        Source = "reload_tac",
        Time = 3.2,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Checkpoints = {24, 42, 59, 71},
        FrameRate = 37,
		Mult=1.2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
		SoundTable = {
			{s = "snds_jack_gmod/ez_weapons/dmr/magout.wav", t = .65, v=65},
			{s = "snds_jack_gmod/ez_weapons/dmr/magstore.wav", t = 1, v=65},
			{s = "snds_jack_gmod/ez_weapons/dmr/magdraw.wav", t = 1.5, v=65},
			{s = "snds_jack_gmod/ez_weapons/dmr/magin.wav", t = 2.15, v=65}
		}
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        Time = 4.2,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Checkpoints = {24, 42, 59, 71, 89},
        FrameRate = 37,
		Mult=1.2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
		SoundTable = {
			{s = "snds_jack_gmod/ez_weapons/dmr/magout.wav", t = .65, v=65},
			{s = "snds_jack_gmod/ez_weapons/dmr/magstore.wav", t = 1, v=65},
			{s = "snds_jack_gmod/ez_weapons/dmr/magdraw.wav", t = 1.5, v=65},
			{s = "snds_jack_gmod/ez_weapons/dmr/magin.wav", t = 2.15, v=65},
			{s = "snds_jack_gmod/ez_weapons/dmr/boltpull.wav", t = 3.25, v=65},
			{s = "snds_jack_gmod/ez_weapons/dmr/boltrelease.wav", t = 3.5, v=65}
		}
    },
}