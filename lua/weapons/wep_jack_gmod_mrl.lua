SWEP.Base = "wep_jack_gmod_gunbase"

SWEP.PrintName = "Multiple Rocket Launcher"

SWEP.Slot = 4

SWEP.ViewModel = "models/weapons/c_bo1_m202.mdl"
SWEP.WorldModel = "models/weapons/w_jmod_m202.mdl"
SWEP.ViewModelFOV = 75
SWEP.BodyHolsterSlot = "back"
SWEP.BodyHolsterAng = Angle(0,-105,0)
SWEP.BodyHolsterAngL = Angle(20,-75,180)
SWEP.BodyHolsterPos = Vector(5.5,-15,-13)
SWEP.BodyHolsterPosL = Vector(-2.25,-15,14)
SWEP.BodyHolsterScale = .8

SWEP.Damage = 260
SWEP.BlastRadius = 190
SWEP.DamageRand = .1
SWEP.BlastRadiusRand = .1
SWEP.ShootEntity = "ent_jack_gmod_ezminirocket"
SWEP.MuzzleVelocity = 9000
SWEP.ShootEntityAngle = Angle(0,-90,0)
SWEP.ShootEntityOffset = Vector(10,0,0)
SWEP.BackBlast = 1
SWEP.ShootEntityNoPhys = true

SWEP.Primary.ClipSize = 4 -- DefaultClip is automatically set.
SWEP.ChamberSize = 0 -- sigh arctic

SWEP.Recoil = 1
SWEP.RecoilSide = 0.5
SWEP.RecoilRise = 0.6

SWEP.Delay = 60 / 200 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 20 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 600 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 200

SWEP.Primary.Ammo = "Mini Rocket" -- what ammo type the gun uses

SWEP.FirstShootSound = "snds_jack_gmod/ez_weapons/rocket_fire.wav"
SWEP.ShootSound = "snds_jack_gmod/ez_weapons/rocket_fire.wav"
SWEP.DistantShootSound = "snds_jack_gmod/ez_weapons/rifle_far.wav"
SWEP.ShootSoundExtraMult=1
SWEP.ShakeOnShoot = 1

SWEP.HoldtypeActive = "rpg"
SWEP.HoldtypeSights = "rpg"

SWEP.MuzzleEffect = "muzzleflash_m79"
SWEP.ShellModel = "models/jhells/shell_9mm.mdl"
SWEP.ShellPitch = 50
SWEP.ShellScale = 7

SWEP.SpeedMult = .85
SWEP.SightedSpeedMult = .6
SWEP.SightTime = .9

SWEP.IronSightStruct = {
    Pos = Vector(-1.64, -3, -2.6),
    Ang = Angle(13.4, 0, -10),
    Magnification = 1.15,
    SwitchToSound = JMod_GunHandlingSounds.aim.inn,
    SwitchFromSound = JMod_GunHandlingSounds.aim.out
}

SWEP.ActivePos = Vector(0, -1, 0)
SWEP.ActiveAng = Angle(13, -10, 0)

SWEP.HolsterPos = Vector(-10, 14, 12)
SWEP.HolsterAng = Angle(-90, -60, 0)

SWEP.MeleeAttackTime=.35

SWEP.BarrelLength = 40

--[[
idle
reload_tac
draw
fire
holster
sprint
--]]
SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
        Time = 1
    },
    ["draw"] = {
        Source = "draw",
        Time = 1.1,
        SoundTable = {
			{s = JMod_GunHandlingSounds.draw.longgun, t = .01, v=60, p=90},
			{s = JMod_GunHandlingSounds.grab, t = .425, v=60},
			{s = "snds_jack_gmod/ez_weapons/mrl/extend.wav", t = .525, v=65},
			{s = JMod_GunHandlingSounds.cloth.quiet, t = .5, v=65},
			{s = JMod_GunHandlingSounds.grab, t = .95, v=65}
		},
		Mult=2.5,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.35,
    },
    ["ready"] = {
        Source = "draw",
        Time = 1.1,
        SoundTable = {
			{s = JMod_GunHandlingSounds.draw.longgun, t = .01, v=60, p=90},
			{s = JMod_GunHandlingSounds.grab, t = .425, v=60},
			{s = "snds_jack_gmod/ez_weapons/mrl/extend.wav", t = .525, v=65},
			{s = JMod_GunHandlingSounds.cloth.quiet, t = .5, v=65},
			{s = JMod_GunHandlingSounds.grab, t = .95, v=65}
		},
		Mult=2.5,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["fire"] = {
        Source = "fire",
        Time = .5
    },
    ["fire_iron"] = {
        Source = "fire",
        Time = .5
    },
    ["reload"] = {
        Source = "reload_tac",
        Time = 6,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Checkpoints = {24, 42, 59, 71, 89},
        FrameRate = 37,
		Mult=1.2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
		SoundTable = {
			{s = JMod_GunHandlingSounds.cloth.quiet, t = .01, v=60},
			{s = JMod_GunHandlingSounds.grab, t = .15, v=55},
			{s = "snds_jack_gmod/ez_weapons/mrl/fold.wav", t = .15, v=65},
			{s = JMod_GunHandlingSounds.cloth.loud, t = .3, v=65},
			{s = JMod_GunHandlingSounds.grab, t = .85, v=55},
			{s = "snds_jack_gmod/ez_weapons/mrl/out.wav", t = 1.2, v=65},
			{s = "snds_jack_gmod/ez_weapons/mrl/drop.wav", t = 1.9, v=60},
			{s = JMod_GunHandlingSounds.cloth.magpull, t = 2.3, v=65, p=80},
			{s = "snds_jack_gmod/ez_weapons/mrl/tap.wav", t = 2.9, v=65},
			{s = "snds_jack_gmod/ez_weapons/mrl/in.wav", t = 3.3, v=65},
			{s = JMod_GunHandlingSounds.cloth.quiet, t = 3.3, v=60},
			{s = JMod_GunHandlingSounds.grab, t = 4, v=65},
			{s = JMod_GunHandlingSounds.cloth.loud, t = 4.2, v=65},
			{s = "snds_jack_gmod/ez_weapons/mrl/extend.wav", t = 4.9, v=65},
			{s = JMod_GunHandlingSounds.cloth.move, t = 5.4, v=65},
			{s = JMod_GunHandlingSounds.grab, t = 5.6, v=60}
		}
    },
    ["reload_empty"] = {
        Source = "reload_tac",
        Time = 6,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Checkpoints = {24, 42, 59, 71, 89},
        FrameRate = 37,
		Mult=1.2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
		SoundTable = {
			{s = JMod_GunHandlingSounds.cloth.quiet, t = .01, v=60},
			{s = JMod_GunHandlingSounds.grab, t = .15, v=55},
			{s = "snds_jack_gmod/ez_weapons/mrl/fold.wav", t = .15, v=65},
			{s = JMod_GunHandlingSounds.cloth.loud, t = .3, v=65},
			{s = JMod_GunHandlingSounds.grab, t = .85, v=55},
			{s = "snds_jack_gmod/ez_weapons/mrl/out.wav", t = 1.2, v=65},
			{s = "snds_jack_gmod/ez_weapons/mrl/drop.wav", t = 1.9, v=60},
			{s = JMod_GunHandlingSounds.cloth.magpull, t = 2.3, v=65, p=80},
			{s = "snds_jack_gmod/ez_weapons/mrl/tap.wav", t = 2.9, v=65},
			{s = "snds_jack_gmod/ez_weapons/mrl/in.wav", t = 3.3, v=65},
			{s = JMod_GunHandlingSounds.cloth.quiet, t = 3.3, v=60},
			{s = JMod_GunHandlingSounds.grab, t = 4, v=65},
			{s = JMod_GunHandlingSounds.cloth.loud, t = 4.2, v=65},
			{s = "snds_jack_gmod/ez_weapons/mrl/extend.wav", t = 4.9, v=65},
			{s = JMod_GunHandlingSounds.cloth.move, t = 5.4, v=65},
			{s = JMod_GunHandlingSounds.grab, t = 5.6, v=60}
		}
    }
}