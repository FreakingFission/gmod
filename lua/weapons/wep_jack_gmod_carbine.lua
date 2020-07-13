SWEP.Base = "wep_jack_gmod_gunbase"
SWEP.Spawnable = true -- this obviously has to be set to true

SWEP.PrintName = "Carbine"

SWEP.Slot = 2

SWEP.ViewModel = "models/weapons/v_cod4_g36.mdl"
SWEP.WorldModel = "models/weapons/w_jmod_g36.mdl"
SWEP.ViewModelFOV = 60
SWEP.BodyHolsterSlot = "back"
SWEP.BodyHolsterAng = Angle(0,-105,10)
SWEP.BodyHolsterAngL = Angle(10,-75,180)
SWEP.BodyHolsterPos = Vector(1,-11,-11)
SWEP.BodyHolsterPosL = Vector(.5,-11,11)
SWEP.BodyHolsterScale = .8

SWEP.Damage = 34
SWEP.DamageMin = 5 -- damage done at maximum range
SWEP.DamageRand = .35
SWEP.Range = 150 -- in METERS
SWEP.Penetration = 55

SWEP.Primary.ClipSize = 30 -- DefaultClip is automatically set.

SWEP.Recoil = .55
SWEP.RecoilSide = 0.5
SWEP.RecoilRise = 0.6

SWEP.Delay = 60 / 800 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 5 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 600 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 250
SWEP.AimSwayFactor=1.1

SWEP.Primary.Ammo = "Light Rifle Round" -- what ammo type the gun uses

SWEP.FirstShootSound = "snds_jack_gmod/weapons/light_rifle.wav"
SWEP.ShootSound = "snds_jack_gmod/weapons/light_rifle.wav"
SWEP.DistantShootSound = "snds_jack_gmod/weapons/rifle_far.wav"
SWEP.ShootSoundExtraMult=1

SWEP.MuzzleEffect = "muzzleflash_4"
SWEP.ShellModel = "models/jhells/shell_556.mdl"
SWEP.ShellPitch = 95
SWEP.ShellScale = 1.75
SWEP.ShellOffsetFix = Vector(0,0,-3)

SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = .8
SWEP.SightTime = .4

SWEP.IronSightStruct = {
    Pos = Vector(-3.55, 0, .58),
    Ang = Angle(-1, 0, -5),
    Magnification = 1.1,
    SwitchToSound = "", -- sound that plays when switching to this sight
}

SWEP.ActivePos = Vector(1.5, 0, .5)
SWEP.ActiveAng = Angle(1.8, 1.5, -2.5)

SWEP.HolsterPos = Vector(4, -4, 0)
SWEP.HolsterAng = Angle(-20, 50, 0)

SWEP.MeleeAttackTime=.35

SWEP.BarrelLength = 28

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
        Time = 1
    },
    ["draw"] = {
        Source = "draw1",
        Time = 0.45,
        SoundTable = {{s = "snds_jack_gmod/weapons/assault_rifle/draw.wav", t = 0, v=60}},
		Mult=2,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.35,
    },
    ["ready"] = {
        Source = "draw2",
        Time = 1,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["fire"] = {
        Source = "shoot1",
        Time = 0.4,
        ShellEjectAt = 0,
    },
    ["fire_iron"] = {
        Source = "shoot1",
        Time = 0.4,
        ShellEjectAt = 0,
    },
    ["reload"] = {
        Source = "reload_full",
        Time = 2.5,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Checkpoints = {24, 42, 59, 71},
        FrameRate = 37,
		Mult=1.2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
		SoundTable = {
			{s = "snds_jack_gmod/weapons/carbine/mag_out.wav", t = .3, v=65},
			{s = "snds_jack_gmod/weapons/tap1.wav", t = 1.3, v=65},
			{s = "snds_jack_gmod/weapons/carbine/mag_in.wav", t = 1.45, v=65}
		}
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        Time = 3.1,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Checkpoints = {24, 42, 59, 71, 89},
        FrameRate = 37,
		Mult=1.2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
		SoundTable = {
			{s = "snds_jack_gmod/weapons/carbine/mag_out.wav", t = .3, v=65},
			{s = "snds_jack_gmod/weapons/tap1.wav", t = 1.1, v=65},
			{s = "snds_jack_gmod/weapons/carbine/mag_in.wav", t = 1.25, v=65},
			{s = "snds_jack_gmod/weapons/carbine/bolt_pull.wav", t = 1.95, v=65},
			{s = "snds_jack_gmod/weapons/carbine/bolt_release.wav", t = 2.2, v=65}
		}
    },
}