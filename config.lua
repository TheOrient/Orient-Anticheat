
ORT_AC = {}


ORT_AC.AntiCheat = true 
ORT_AC.AntiFirePlayer = true
ORT_AC.AntiCarRam = true
ORT_AC.AntiGodmode = true 
ORT_AC.AntiBlips = false 
ORT_AC.PlayerProtection = true 
ORT_AC.AntiPedAttack = true 


ORT_AC.LOG              = "webhook"

ORT_AC.SteamApiKey = "steam api ip ye uygun"

ORT_AC.AntiCheatEngine = true 
ORT_AC.AntiInjection = true 
ORT_AC.AntiInjectionv2 = true 
ORT_AC.AntiSpectate = true
ORT_AC.AntiCMD = true
ORT_AC.AntiBMCGLOBAL = true
ORT_AC.AntiCarDestroy = true

ORT_AC.AntiKeyLog = true
ORT_AC.AntiKeyKick = true
ORT_AC.AntiKeyInsert = true
ORT_AC.AntiKeyALTF8  = true
ORT_AC.AntiKeyShiftG = true
ORT_AC.AntiKeyct5rlf8 = true
ORT_AC.BlacklistWeaponLog = true
ORT_AC.BlacklistWeaponKick = true
ORT_AC.BlacklistWeaponBan = false

ORT_AC.TriggerDetection = true
ORT_AC.BlacklistEventLog = true
ORT_AC.BlacklistEventKick = true
ORT_AC.BlacklistEventBan = false


ORT_AC.StopResourceLog = true
ORT_AC.StopResourceKick = true
ORT_AC.StopResourceBan = false

ORT_AC.CheckBLWeaponTimeOut = 1000


ORT_AC.BlacklistWordLog = true
ORT_AC.BlacklistWordKick = true
ORT_AC.BlacklistWordBan = false

ORT_AC.BlacklistPedLog = true
ORT_AC.BlacklistPedKick = false
ORT_AC.BlacklistPedBan = false

ORT_AC.BlacklistVehLog = true
ORT_AC.BlacklistVehKick = false
ORT_AC.BlacklistVehBan = false

ORT_AC.BlacklistPropLog = true
ORT_AC.BlacklistPropKick = false
ORT_AC.BlacklistPropBan = false

ORT_AC.BlacklistCommandLog = true
ORT_AC.BlacklistCommandKick = true
ORT_AC.BlacklistCommandBan = false


ORT_AC.ExplosionLog = true
ORT_AC.ExplosionKick = false
ORT_AC.ExplosionBan= false

ORT_AC.SpamEntityLog = true
ORT_AC.SpamEntityKick = false
ORT_AC.SpamEntityBan = false

ORT_AC.SpectateCheckTimeout = 1
ORT_AC.SpamTimecycle = 5
ORT_AC.SpamMaxEntities = 160  
ORT_AC.KickMessage = 'bye baby :)'
ORT_AC.BanMessage = 'baybay'
ORT_AC.WebhookName = 'Orient Anticheat'
ORT_AC.WebhookAvatarUrl = 'https://i.imgyukle.com/2020/12/14/Yq1IUS.png'



     ORT_AC.ExplosionsList = { -- its recommended settings -- if u don't know what you're doing, dont change
        [0] = { name = "Grenade", block = true, log = true, drop = false},
        [1] = { name = "GrenadeLauncher", block = true, log = true, drop = false},
        [2] = { name = "StickyBomb", block = true, log = true, drop = false},
        [3] = { name = "Molotov", block = true, log = true, drop = false},
        [4] = { name = "Rocket", block = true, log = true, drop = false},
        [5] = { name = "TankShell", block = true, log = true, drop = true}, --
        [6] = { name = "Hi_Octane", block = true, log = true, drop = false},
        [7] = { name = "Car", block = true, log = true, drop = false},
        [8] = { name = "Plance", block = true, log = true, drop = false}, --
        [9] = { name = "PetrolPump", block = true, log = true, drop = false},
        [10] = { name = "Bike", block = true, log = true, drop = false},
        [11] = { name = "Dir_Steam", block = true, log = true, drop = false},
        [12] = { name = "Dir_Flame", block = true, log = true, drop = false},
        [13] = { name = "Dir_Water_Hydrant", block = true, log = false, drop = false}, --sokak fıskiyeleri
        [14] = { name = "Dir_Gas_Canister", block = true, log = true, drop = false},
        [15] = { name = "Boat", block = true, log = true, drop = false},
        [16] = { name = "Ship_Destroy", block = true, log = true, drop = false},
        [17] = { name = "Truck", block = true, log = true, drop = false},
        [18] = { name = "Bullet", block = true, log = true, drop = false},
        [19] = { name = "SmokeGrenadeLauncher", block = true, log = true, drop = false},
        [20] = { name = "SmokeGrenade", block = true, log = true, drop = false},
        [21] = { name = "BZGAS", block = true, log = true, drop = false},
        [22] = { name = "Flare", block = true, log = true, drop = false},
        [23] = { name = "Gas_Canister", block = true, log = true, drop = false},
        [24] = { name = "Extinguisher", block = true, log = true, drop = false},
        [25] = { name = "Programmablear", block = false, log = true, drop = false},
        [26] = { name = "Train", block = true, log = true, drop = false},
        [27] = { name = "Barrel", block = true, log = true, drop = false},
        [28] = { name = "PROPANE", block = true, log = true, drop = false},
        [29] = { name = "Blimp", block = true, log = true, drop = false},
        [30] = { name = "Dir_Flame_Explode", block = true, log = true, drop = false},
        [31] = { name = "Tanker", block = true, log = true, drop = false},
        [32] = { name = "PlaneRocket", block = true, log = true, drop = false},
        [33] = { name = "VehicleBullet", block = true, log = true, drop = false},
        [34] = { name = "Gas_Tank", block = true, log = true, drop = false},
        [35] = { name = "FireWork", block = true, log = true, drop = false},
        [36] = { name = "SnowBall", block = true, log = true, drop = false},
        [37] = { name = "ProxMine", block = true, log = true, drop = true}, --
        [38] = { name = "Valkyrie_Cannon", block = true, log = true, drop = false}
    }

    ORT_AC.BlacklistedWeapons = {
        "WEAPON_HAMMER",
        "WEAPON_GOLFCLUB",
        "WEAPON_SAWNOFFSHOTGUN",
        "WEAPON_BULLPUPSHOTGUN",
        "WEAPON_GRENADELAUNCHER",
        "WEAPON_GRENADELAUNCHER_SMOKE",
        "WEAPON_RPG",
        "WEAPON_STINGER",
        "WEAPON_MINIGUN",
        "WEAPON_GRENADE",
        "WEAPON_BALL",
        "WEAPON_BOTTLE",
        "WEAPON_HEAVYSHOTGUN",
        "WEAPON_GARBAGEBAG",
        "WEAPON_RAILGUN",
        "WEAPON_RAILPISTOL",
        "WEAPON_RAILGUN",
        "WEAPON_RAYPISTOL", 
        "WEAPON_RAYCARBINE", 
        "WEAPON_RAYMINIGUN",
        "WEAPON_DIGISCANNER",
        "WEAPON_SPECIALCARBINE_MK2",
        "WEAPON_BULLPUPRIFLE_MK2",
        "WEAPON_PUMPSHOTGUN_MK2",
        "WEAPON_MARKSMANRIFLE_MK2",
        "WEAPON_COMPACTLAUNCHER",
        "WEAPON_SNSPISTOL_MK2",
        "WEAPON_REVOLVER_MK2",
        "WEAPON_FIREWORK",
        "WEAPON_HOMINGLAUNCHER", 
        "WEAPON_SMG_MK2"
    }

    ORT_AC.BlacklistProps = {
        "prop_gas_pump_1d",
        "prop_gas_pump_1a",
        "prop_gas_pump_1b",
        "prop_gas_pump_1c",
        "prop_gas_pump_1d",
        "prop_gas_pump_old2",
        "prop_gas_pump_old3",
        "prop_vintage_pump",
        "prop_fnclink_05crnr1",
        "xs_prop_hamburgher_wl",
        "xs_prop_plastic_bottle_wl",
        "prop_windmill_01",
        "p_spinning_anus_s",
        "stt_prop_ramp_adj_flip_m",
        "stt_prop_ramp_adj_flip_mb",
        "stt_prop_ramp_adj_flip_s",
        "stt_prop_ramp_adj_flip_sb",
        "stt_prop_ramp_adj_hloop",
        "stt_prop_ramp_adj_loop",
        "stt_prop_ramp_jump_l",
        "stt_prop_ramp_jump_m",
        "stt_prop_ramp_jump_s",
        "stt_prop_ramp_jump_xl",
        "stt_prop_ramp_jump_xs",
        "stt_prop_ramp_jump_xxl",
        "stt_prop_stunt_track_dwslope30",
        "stt_prop_ramp_multi_loop_rb",
        "stt_prop_ramp_spiral_l",
        "stt_prop_ramp_spiral_l_l",
        "stt_prop_ramp_spiral_l_m",
        "stt_prop_ramp_spiral_l_s",
        "stt_prop_ramp_spiral_l_xxl",
        "stt_prop_ramp_spiral_m",
        "stt_prop_ramp_spiral_s",
        "stt_prop_ramp_spiral_xxl",
        "dt1_02_w01",
        "dt1_02_ground",
        "dt1_02_groundb",
        "dt1_02_ground_ns",
        "dt1_03_build1x",
        "dt1_03_build1_ns",
        "dt1_03_build2",
        "dt1_03_build2top",
        "dt1_04_build",
        "dt1_05_build1_damage",
        "dt1_05_build1_damage_lod",
        "dt1_05_build1_h",
        "dt1_05_build1_repair",
        "dt1_05_build1_repair_slod",
        "dt1_05_build2_h",
        "dt1_05_carparkshell",
        "dt1_05_carpark_details",
        "dt1_05_carpark_reflect",
        "dt1_05_ground",
        "dt1_05_rubble",
        "dt1_06_build1_1",
        "dt1_06_build1b_1",
        "dt1_06_build2_1",
        "dt1_06_build3_1",
        "dt1_07_building2",
        "dt1_07_grounda",
        "dt1_07_groundb",
        "dt1_08_ground2",
        "dt1_09_building_01",
        "dt1_09_building_03",
        "dt1_09_carpark",
        "dt1_10_build1",
        "dt1_10_build2",
        "dt1_10_build3",
        "dt1_11_dt1_tower",
        "dt1_11_build_logo",
        "dt1_11_dt1_planter",
        "dt1_11_dt1_planter_lod",
        "dt1_11_dt1_plaza",
        "dt1_11_dt1_plaza_gr",
        "dt1_12_build1",
        "dt1_12_build2",
        "dt1_12_build3",
        "dt1_12_build6",
        "dt1_13_build1",
        "dt1_13_build2",
        "dt1_14_build2",
        "dt1_14_build3",
        "dt1_14_build4",
        "dt1_15_build1",
        "dt1_17_build1",
        "dt1_17_build2",
        "dt1_18_build0",
        "dt1_18_build1",
        "dt1_18_build2",
        "dt1_18_build3",
        "dt1_18_build4",
        "dt1_20_build1",
        "dt1_20_build2",
        "dt1_20_build2b",
        "dt1_20_ground",
        "dt1_20_ground2",
        "dt1_03_shadow",
        "dt1_20_sc1",
        "dt1_20_sc2",
        "dt1_20_sc3",
        "dt1_21_b1d_y1",
        "dt1_21_b1_dx10",
        "dt1_21_b1_dx11",
        "dt1_21_b1_dx12",
        "dt1_21_b1_dx13",
        "dt1_21_b1_dx14",
        "dt1_21_b1_dx3",
        "dt1_21_b1_dx4",
        "dt1_21_b1_dx5",
        "dt1_21_b1_dx6",
        "dt1_21_b9_d1",
        "dt1_21_beams",
        "dt1_21_beamx",
        "dt1_21_build09",
        "dt1_21_build09d",
        "dt1_21_build1",
        "dt1_21_build1z",
        "dt1_21_gd1_d002",
        "dt1_21_gd1_d002_d",
        "dt1_21_gd1_dz1",
        "dt1_21_gd1_dz2",
        "dt1_21_gd1_dz3",
        "dt1_21_gd1_dz4",
        "dt1_21_gd1_dz5",
        "dt1_21_ground1",
        "dt1_21_ground2",
        "dt1_21_sbar1",
        "dt1_21_sbar2",
        "dt1_21_scafa",
        "dt1_21_scafc",
        "dt1_21_scafd",
        "dt1_21_scaffold_01",
        "dt1_21_scaffold_02",
        "dt1_21_scaffold_03",
        "dt1_21_scaffold_05",
        "dt1_21_scaffold_06",
        "dt1_21_scaffold_07",
        "dt1_21_scaffold_08",
        "dt1_21_scaffold_09",
        "dt1_21_scaffold_10",
        "dt1_21_scaffold_11",
        "dt1_21_scaffold_44",
        "dt1_21_station",
        "dt1_21_top_shell",
        "dt1_21_unf",
        "dt1_22_bldg1",
        "dt1_22_bldg1b",
        "prop_ld_toilet_01",
        "prop_gas_tank_01a",
        "prop_cs_dildo_01",
        "prop_ld_bomb_anim",
        "prop_ld_farm_couch01",
        "sr_prop_spec_tube_xxs_01a",
        "prop_rock_1_b"
    }

    ORT_AC.BlacklistVehicles = {
        "rhino",
        'akula',
        'savage',
        'hunter',
        'buzzard',
        'buzzard2',
        'valkyrie',
        'hydra',
        'apc',
        'lazer',
        'oppressor',
        'mogul',
        'dump',
        'barrage',
        'khanjali',
        'volatol',
        'chernobog',
        'avenger',
        'stromberg',
        'nightshark',
        'besra',
        'babushka ',
        'starling',
        'insurgent',
        'cargobob',
        'cargobob2',
        'cargobob3',
        'cargobob4',
        'caracara',
        'deluxo',
        'menacer',
        'scramjet',
        'oppressor2',
        'revolter',
        'viseris',
        'savestra',
        'thruster',
        'ardent',
        'dune3',
        'tampa3',
        'halftrack',
        'nokota',
        'strikeforce',
        'bombushka',
        'molotok',
        'pyro',
        'ruiner2',
        'limo2',
        'technical',
        'technical2',
        'technical3',
        'jb700w',
        'insurgent3',
        'boxville5',
        'bruiser',
        'bruiser2',
        'bruiser3',
        'brutus',
        'cerberus',
        'cerberus2',
        'cerberus3',
        'dominator4',
        'dominator5',
        'dominator6',
        'impaler2',
        'impaler3',
        'impaler4',
        'imperator',
        'imperator2',
        'imperator3',
        'monster3',
        'monster4',
        'monster5',
        'scarab',
        'scarab2',
        'scarab3',
        'avenger2',
        'blimp',
        'blimp2',
        'blimp3',
        'cargoplane',
        'cuban800',
        'dodo',
        'duster',
        'howard',
        'jet',
        'luxor',
        'luxor2',
        'mammatus',
        'microlight',
        'miljet',
        'nimbus',
        'rogue',
        'seabreeze',
        'shamal',
        'stunt',
        'titan',
        'tula',
        'velum',
        'velum2',
        'vestra'
    }

    ORT_AC.BlacklistPeds = {
    "CSB_BallasOG",
	"MP_S_ARMOURED_01",
	"S_M_Y_Marine_01",
	"S_M_Y_Marine_02",
	"S_M_Y_Marine_03",
	"S_M_SECURITY_01",
	"S_M_SECURITY_02",
	"s_m_y_swat_01",
	"a_m_y_mexthug_01",
	"u_m_y_zombie_01",
	"S_M_SECURITY_03",
	"s_m_y_swat_01",
	"S_M_Y_ARMYMECH_01",
	"S_M_Y_ARMYMECH_02",
	"S_M_Y_ARMYMECH_03",
	"S_M_Y_BLACKOPS_01",
	"S_M_Y_BLACKOPS_02",
     "S_M_Y_BLACKOPS_03",
     "a_c_boar",
     "a_c_cat_0",
     "a_c_chickenhawk",
     "a_c_chimp",
     "a_c_cormorant",
     "a_c_cow",
     "a_c_coyote",
     "a_c_crow",
     "a_c_pig",
     "a_c_mtlion",
     "a_c_pigeon",
     "a_c_poodle",
     "a_c_poodle",
     "a_c_rabbit_01",
     "a_c_rat",
     "a_c_seagull",
     "a_c_sharktiger",
     "a_c_shepherd",
     "a_c_stingray",
     "a_c_westy",
     "a_c_killerwhale",
     "a_c_dolphin",
     "a_c_hen"
    }

    ORT_AC.Events = {
        "gcPhone:_internalAddMessage",
        "gcPhone:tchat_channel",
        "esx_vehicleshop:setVehicleOwned",
        "esx_mafiajob:confiscatePlayerItem",
        "lscustoms:payGarage",
        "vrp_slotmachine:server:2",
        "Banca:deposit",
        "bank:deposit",
        "esx_jobs:caution",
        "give_back",
        "esx_fueldelivery:pay",
        "esx_carthief:pay",
        "esx_godirtyjob:pay",
        "esx_pizza:pay",
        "esx_ranger:pay",
        "esx_garbagejob:pay",
        "esx_truckerjob:pay",
        "AdminMenu:giveBank",
        "AdminMenu:giveCash",
        "esx_gopostaljob:pay",
        "esx_banksecurity:pay",
        "esx_slotmachine:sv:2",
        "esx:giveInventoryItem",
        "NB:recruterplayer",
        "esx_billing:sendBill",
        "esx_jailer:sendToJail",
        "esx_jail:sendToJail",
        "js:jailuser",
        "esx-qalle-jail:jailPlayer",
        "esx_dmvschool:pay", 
        "LegacyFuel:PayFuel",
        "OG_cuffs:cuffCheckNearest",
        "CheckHandcuff",
        "cuffServer",
        "cuffGranted",
        "police:cuffGranted",
        "esx_handcuffs:cuffing",
        "esx_policejob:handcuff",
        "bank:withdraw",
        "dmv:success",
        "esx_skin:responseSaveSkin",
        "esx_dmvschool:addLicense",
        "esx_mechanicjob:startCraft",
        "esx_drugs:startHarvestWeed",
        "esx_drugs:startTransformWeed",
        "esx_drugs:startSellWeed",
        "esx_drugs:startHarvestCoke",
        "esx_drugs:startTransformCoke",
        "esx_drugs:startSellCoke",
        "esx_drugs:startHarvestMeth",
        "esx_drugs:startTransformMeth",
        "esx_drugs:startSellMeth",
        "esx_drugs:startHarvestOpium",
        "esx_drugs:startSellOpium",
        "esx_drugs:startTransformOpium",
        "esx_blanchisseur:startWhitening",
        "esx_drugs:stopHarvestCoke",
        "esx_drugs:stopTransformCoke",
        "esx_drugs:stopSellCoke",
        "esx_drugs:stopHarvestMeth",
        "esx_drugs:stopTransformMeth",
        "esx_drugs:stopSellMeth",
        "esx_drugs:stopHarvestWeed",
        "esx_drugs:stopTransformWeed",
        "esx_drugs:stopSellWeed",
        "esx_drugs:stopHarvestOpium",
        "esx_drugs:stopTransformOpium",
        "esx_drugs:stopSellOpium",
        "esx_society:openBossMenu",
        "esx_jobs:caution",
        "esx_tankerjob:pay",
        "esx_vehicletrunk:giveDirty",
        "gambling:spend",
        "AdminMenu:giveDirtyMoney",
        "esx_moneywash:deposit",
        "esx_moneywash:withdraw",
        "mission:completed",
        "truckerJob:success",
        "99kr-burglary:addMoney",
        "esx_jailer:unjailTime",
        "esx_ambulancejob:revive",
        "DiscordBot:playerDied",
        "hentailover:xdlol",
        "antilynx8:anticheat",
        "antilynxr6:detection",
        "esx_society:getOnlinePlayers",
        "_chat:messageEntered",
        "antilynx8r4a:anticheat",
        "antilynxr4:detect",
        "js:jailuser", 
        "ynx8:anticheat",
        "lynx8:anticheat",
        "adminmenu:allowall",
        "h:xd",
        "ljail:jailplayer",
        "esx-qalle-jail:jailPlayer",
        "adminmenu:setsalary",
        "adminmenu:cashoutall",
        "bank:transfer",
        "paycheck:bonus",
        "paycheck:salary",
        "HCheat:TempDisableDetection",
        "esx_drugs:pickedUpCannabis",
        "esx_drugs:processCannabis",
        "esx-qalle-hunting:reward",
        "esx-qalle-hunting:sell",
        "esx_mecanojob:onNPCJobCompleted",
        "BsCuff:Cuff696999",
        "veh_SR:CheckMoneyForVeh",
        "esx_carthief:alertcops",
        "mellotrainer:adminTempBan",
        "mellotrainer:adminKick",
        "esx_society:putVehicleInGarage",
        "kashactersS:DeleteCharacter",
        "esx:clientLog",
    }

    ORT_AC.Words = {
        'Desudo',
        'Brutan',
        'EulenCheats',
        "Lynx 8",
        "www.lynxmenu.com",
        "HamHaxia",
        "Ham Mafia",
        "www.renalua.com",
        "Fallen#0811",
        "Rena",
        "HamHaxia", 
        "Ham Mafia", 
        "Xanax#0134", 
        ">:D Player Crash",  
        "34ByTe Community", 
        "lynxmenu.com", 
        "Anti-Lynx",
        "Baran#8992",
        "iLostName#7138",
        "85.190.90.118",
        "Melon#1379",
        "hammafia.com",
        "AlphaV ~ 5391",
        "vjuton.pl",
        "Soviet Bear",
        "MARVIN menu",
        "KoGuSzEk#3251",
    }
    
    ORT_AC.Commands = {
        "menu",
        "memes",
        "file",
        "exec",
        "pk",
        "insert",
        "run",
        "dump",
        "open",
        "save",
        "panic",
        "kill",
        "ins",
        "root",
        "lua",
        "lynx",
        "killmenu"
    }

