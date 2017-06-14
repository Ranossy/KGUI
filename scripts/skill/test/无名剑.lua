------------------------------------------------
-- 文件名    :  无名剑.lua
-- 创建人    :  张奇
-- 修改时间  ： 2008-10-11 
-- 用途(模块):  武功技能
-- 武功门派  :  
-- 武功类型  :  
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  人物级别,技能和装备调试
-- 装备修改  :  韩正春
------------------------------------------------

Include("scripts/Include/Player.lh")
Include("scripts/skill/test/levelupstring.ls")
Include("scripts/skill/经脉/VerationTable.lua")
Include("scripts/skill/经脉/Venation.lua")
Include("scripts/skill/天赋/Talent.lua")
Include("scripts/Include/Math.lh")
Include("scripts/Craft/Include/CraftData.ls")
Include("scripts/Include/Item.lh")

function OnUse(player, item)
	player.OpenWindow(TARGET.ITEM, item.dwID,
		--LEVELUP_STRING_TABLE["RepairAllItem"].. "\n" ..
		LEVELUP_STRING_TABLE["LearnVenationOpenWnd"].. "\n" ..
		LEVELUP_STRING_TABLE["AddBuffInvisible"].. "\n" ..
		LEVELUP_STRING_TABLE["ResetCD"].. "\n" ..
		LEVELUP_STRING_TABLE["GetTrain"].. "\n" ..
		LEVELUP_STRING_TABLE["ResetVenationForFree"].. "\n" ..
		LEVELUP_STRING_TABLE["ResetTalent"].. "\n" ..	
		LEVELUP_STRING_TABLE["CallWeaponShop"].. "\n" ..
		LEVELUP_STRING_TABLE["PackageAndHorse"].. "\n" ..
		LEVELUP_STRING_TABLE["LevelUp"].. "\n" ..
		LEVELUP_STRING_TABLE["DelAllItem"].. "\n" ..
		LEVELUP_STRING_TABLE["LevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["Tansformer"].. "\n" ..
		LEVELUP_STRING_TABLE["ProfessionLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["CallCraftShop"].. "\n" ..
		LEVELUP_STRING_TABLE["GetCourseItemBase"].. "\n" .. 		--获得基础装备	 
		LEVELUP_STRING_TABLE["GetCourseItemMagic"].. "\n" ..		--获得内功装备
		LEVELUP_STRING_TABLE["GetCourseItemPhysics"].. "\n" ..	--获得外功装备
		LEVELUP_STRING_TABLE["GetCourseItemDefend"].. "\n" ..		--获得防御装备
		LEVELUP_STRING_TABLE["GetCourseItemHeal"].. "\n" ..			--获得治疗装备
		LEVELUP_STRING_TABLE["GetCourseItemSet"].. "\n" ..			--获得套装
		LEVELUP_STRING_TABLE["TransportParty1"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportParty2"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportParty3"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportParty4"].. "\n" ..
		LEVELUP_STRING_TABLE["BattleField"].. "\n" ..
		LEVELUP_STRING_TABLE["GetNpcBangHui"],
--		LEVELUP_STRING_TABLE["GetCourseItemCYMagicDamage"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemCYMagicBase"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemCYPhysicsDamage"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemCYPhysicsBase"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemQXMagicDamage"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemQXMagicBase"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemQXTherapy"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemQXTherapyReplenish"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemWHMagicDamage"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemWHMagicBase"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemWHTherapy"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemWHTherapyReplenish"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemSLMagicDamage"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemSLMagicBase"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemSLDefence"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemTCPhysicsDamage"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemTCPhysicsBase"].. "\n" ..
--		LEVELUP_STRING_TABLE["GetCourseItemTCDefence"],
		--"RepairAllItem",
		"LearnVenationOpenWnd",
		"AddBuffInvisible",
		"ResetCD",
		"GetTrain",
		"ResetVenationForFree",
		"ResetTalent",
		"CallWeaponShop",
		"GetPackageAndHorse",
		"GetNextCourse",
		"DeleteAllItem",
		"GetCourseOEM",
		"GetTransformer",
		"ProfessionLevelUpOEM",
		"CallCraftShop",
		"GetCourseItemBase",
		"GetCourseItemMagic",
		"GetCourseItemPhysics",
		"GetCourseItemDefend",
		"GetCourseItemHeal",
		"GetCourseItemSet",
		"TransportParty1",
		"TransportParty2",
		"TransportParty3",
		"TransportParty4",
		"CallBattleField",
		"GetNpcBangHui"	
--		"GetCourseItemCYMagicDamage",
--		"GetCourseItemCYMagicBase",
--		"GetCourseItemCYPhysicsDamage",
--		"GetCourseItemCYPhysicsBase",
--		"GetCourseItemQXMagicDamage",
--		"GetCourseItemQXMagicBase",
--		"GetCourseItemQXTherapy",
--		"GetCourseItemQXTherapyReplenish",
--		"GetCourseItemWHMagicDamage",
--		"GetCourseItemWHMagicBase",
--		"GetCourseItemWHTherapy",
--		"GetCourseItemWHTherapyReplenish",
--		"GetCourseItemSLMagicDamage",
--		"GetCourseItemSLMagicBase",
--		"GetCourseItemSLDefence",
--		"GetCourseItemTCPhysicsDamage",
--		"GetCourseItemTCPhysicsBase",
--		"GetCourseItemTCDefence"
	)
	player.SetMaxLevel(80)
	return false, false
end

function GetTransformer(player)

	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["TransportDXC"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportKD"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportCY"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportTC"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportWH"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportSL"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportLD"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportLY"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportJS"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportFH"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportQX"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportYZ"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportCA"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportNPS"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportKL"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportKWF"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportFB"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportTGF"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportSCZ"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportDHG"].. "\n" .. 	
		LEVELUP_STRING_TABLE["TransportBL"].. "\n" .. 
		LEVELUP_STRING_TABLE["TransportWL"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportWD"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportRT"].. "\n" .. 
		LEVELUP_STRING_TABLE["TransportHL"].. "\n" .. 
		LEVELUP_STRING_TABLE["TransportCS"].. "\n" .. 
		LEVELUP_STRING_TABLE["TransportFW"].. "\n" .. 
		LEVELUP_STRING_TABLE["TransportWY"],
		"TransportDXC",
		"TransportKD",
		"TransportCY",
		"TransportTC",
		"TransportWH",
		"TransportSL",
		"TransportLD",
		"TransportLY",
		"TransportJS",
		"TransportFH",
		"TransportQX",
		"TransportYZ",
		"TransportCA",
		"TransportNPS",
		"TransportKL",
		"TransportKWF",
		"TransportFB",
		"TransportTGF",
		"TransportSCZ",
		"TransportDHG",
		"TransportBL",
		"TransportWL",
		"TransportWL",
		"TransportWD",
		"TransportRT",
		"TransportHL",
		"TransportCS",
		"TransportFW",
		"TransportWY"
	)
end
function LearnVenationOpenWnd(player)

	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["LearnVenation_1"].. "\n" ..
		LEVELUP_STRING_TABLE["LearnVenation_2"].. "\n" ..
		LEVELUP_STRING_TABLE["LearnVenation_3"].. "\n" ..
		LEVELUP_STRING_TABLE["LearnVenation_4"].. "\n" ..
		LEVELUP_STRING_TABLE["LearnVenation_5"].. "\n" ..
		LEVELUP_STRING_TABLE["LearnVenation_6"].. "\n" ..	
		LEVELUP_STRING_TABLE["LearnVenation_7"].. "\n" ..
		LEVELUP_STRING_TABLE["LearnVenation_8"].. "\n" ..
		LEVELUP_STRING_TABLE["LearnVenation_9"].. "\n" ..
		LEVELUP_STRING_TABLE["LearnVenation_10"].. "\n" ..
		LEVELUP_STRING_TABLE["TransportWY"],
		"LearnVenation_1",
		"LearnVenation_2",
		"LearnVenation_3",
		"LearnVenation_4",
		"LearnVenation_5",
		"LearnVenation_6",
		"LearnVenation_7",
		"LearnVenation_8",
		"LearnVenation_9",
		"LearnVenation_10",
		"TransportWY"
	)
end

function GetCourseOEM(player)

	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetStandardCourse1"].. "\n" ..
		LEVELUP_STRING_TABLE["GetStandardCourse5"].. "\n" ..
		LEVELUP_STRING_TABLE["GetStandardCourse10"].. "\n" ..
		LEVELUP_STRING_TABLE["GetLevelCourse15"].. "\n" ..
		LEVELUP_STRING_TABLE["GetStandardCourse16"].. "\n" ..
		LEVELUP_STRING_TABLE["GetStandardCourse20"].. "\n" ..	
		LEVELUP_STRING_TABLE["GetStandardCourse25"].. "\n" ..
		LEVELUP_STRING_TABLE["GetStandardCourse30"].. "\n" ..
		LEVELUP_STRING_TABLE["GetStandardCourse32"].. "\n" ..
		LEVELUP_STRING_TABLE["GetStandardCourse35"].. "\n" .. 
		LEVELUP_STRING_TABLE["GetStandardCourse40"].. "\n" .. 
		LEVELUP_STRING_TABLE["GetStandardCourse45"].. "\n" .. 
		LEVELUP_STRING_TABLE["GetStandardCourse50"].. "\n" .. 
		LEVELUP_STRING_TABLE["GetStandardCourse55"].. "\n" .. 
		LEVELUP_STRING_TABLE["GetStandardCourse60"].. "\n" ..	
		LEVELUP_STRING_TABLE["GetStandardCourse65"].. "\n" .. 
		LEVELUP_STRING_TABLE["GetStandardCourse70"].. "\n" .. 
		LEVELUP_STRING_TABLE["GetStandardCourse75"].. "\n" .. 
		LEVELUP_STRING_TABLE["GetStandardCourse80"],
		"GetStandardCourse1",
		"GetStandardCourse5",
		"GetStandardCourse10",
		"GetLevelCourse15",
		"GetStandardCourse16",
		"GetStandardCourse20",
		"GetStandardCourse25",
		"GetStandardCourse30",
		"GetStandardCourse32",
		"GetStandardCourse35",
		"GetStandardCourse40",
		"GetStandardCourse45",
		"GetStandardCourse50",
		"GetStandardCourse55",
		"GetStandardCourse60",
		"GetStandardCourse65",
		"GetStandardCourse70",
		"GetStandardCourse75",
		"GetStandardCourse80"
	)
end


function GetCourseItemBase(player)	--获得基础装备
--print(99999999999999)
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy1LevelRand1to65",
		"GetItemBy1LevelRand66to85",
		"GetItemBy1LevelRand86to115",
		"GetItemBy1LevelRand116to145",
		"GetItemBy1LevelRand145to175"  
	)                     
end 
function GetItemBy1LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 0, 0) 
end 
function GetItemBy1LevelRand66to85(player)
	GetCourseItem2(player, player.nLevel, 0, 0, 0) 
end
function GetItemBy1LevelRand86to115(player)
	GetCourseItem3(player, player.nLevel, 0, 0, 0) 
end 
function GetItemBy1LevelRand116to145(player)
	GetCourseItem4(player, player.nLevel, 0, 0, 0) 
end
function GetItemBy1LevelRand145to175(player)
	GetCourseItem5(player, player.nLevel, 0, 0, 0) 
end 

function GetCourseItemMagic(player)	--获得内功装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetCourseItemMagicBase"].. "\n" .. 						-- 内功基础装
		LEVELUP_STRING_TABLE["GetCourseItemMagicDamage"].. "\n" ..					-- 内功伤害装		
		LEVELUP_STRING_TABLE["GetCourseItemMagicFatal"].. "\n" ..						-- 内功会心装
		LEVELUP_STRING_TABLE["GetCourseItemMagicFatalPVP"].. "\n" ..				-- 内功会心PVP装
		LEVELUP_STRING_TABLE["GetCourseItemMagicFatalPVE"].. "\n" ..				-- 内功会心PVE装
		LEVELUP_STRING_TABLE["GetCourseItemMagicDamagePVP"].. "\n" ..				-- 内功伤害PVP装
		LEVELUP_STRING_TABLE["GetCourseItemMagicDamagePVE"].. "\n" ..				-- 内功伤害PVE装
		LEVELUP_STRING_TABLE["GetCourseItemMagicDamageAbiPVE"].. "\n" ..		-- 内功伤害持续PVE装  
		LEVELUP_STRING_TABLE["GetCourseItemMagicDamageAimPVE"], -- 内功伤害命中PVE装	
		"GetCourseItemMagicBase",
		"GetCourseItemMagicDamage",
		"GetCourseItemMagicFatal",
		"GetCourseItemMagicFatalPVP",
		"GetCourseItemMagicFatalPVE",
		"GetCourseItemMagicDamagePVP",
		"GetCourseItemMagicDamagePVE",
		"GetCourseItemMagicDamageAbiPVE",
		"GetCourseItemMagicDamageAimPVE"
	)
end
function GetCourseItemMagicBase(player)			-- 内功基础装
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy2LevelRand1to65",
		"GetItemBy2LevelRand66to85",
		"GetItemBy2LevelRand86to115",
		"GetItemBy2LevelRand116to145",
		"GetItemBy2LevelRand145to175"  
	)                           
end

function GetItemBy2LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 1, 1) 
end 
function GetItemBy2LevelRand66to85(player)
	GetCourseItem2(player, player.nLevel, 0, 1, 1) 
end
function GetItemBy2LevelRand86to115(player)
	GetCourseItem3(player, player.nLevel, 0, 1, 1) 
end 
function GetItemBy2LevelRand116to145(player)
	GetCourseItem4(player, player.nLevel, 0, 1, 1) 
end
function GetItemBy2LevelRand145to175(player)
	GetCourseItem5(player, player.nLevel, 0, 1, 1) 
end


 
function GetCourseItemMagicDamage(player)-- 内功伤害装	
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy3LevelRand1to65",
		"GetItemBy3LevelRand66to85",
		"GetItemBy3LevelRand86to115",
		"GetItemBy3LevelRand116to145",
		"GetItemBy3LevelRand145to175"  
	)                           
end	
function GetItemBy3LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 1, 2)   
end 
function GetItemBy3LevelRand66to85(player)
	GetCourseItem2(player, player.nLevel, 0, 1, 2)    
end
function GetItemBy3LevelRand86to115(player)
	GetCourseItem3(player, player.nLevel, 0, 1, 2) 
end 
function GetItemBy3LevelRand116to145(player)
	GetCourseItem4(player, player.nLevel, 0, 1, 2)   
end
function GetItemBy3LevelRand145to175(player)
	GetCourseItem5(player, player.nLevel, 0, 1, 2)   
end


function GetCourseItemMagicFatal(player)-- 内功会心装
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy4LevelRand1to65",
		"GetItemBy4LevelRand66to85",
		"GetItemBy4LevelRand86to115",
		"GetItemBy4LevelRand116to145",
		"GetItemBy4LevelRand145to175"  
	)                           
end	
function GetItemBy4LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 1, 3)   
end
function GetItemBy4LevelRand66to85(player)
	GetCourseItem2(player, player.nLevel, 0, 1, 3)   
end
function GetItemBy4LevelRand86to115(player)
	GetCourseItem3(player, player.nLevel, 0, 1, 3)   
end
function GetItemBy4LevelRand116to145(player)
	GetCourseItem4(player, player.nLevel, 0, 1, 3)   
end
function GetItemBy4LevelRand145to175(player)
	GetCourseItem5(player, player.nLevel, 0, 1, 3)   
end

function GetCourseItemMagicFatalPVP(player)	-- 内功会心PVP装
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy5LevelRand1to65",
		"GetItemBy5LevelRand66to85",
		"GetItemBy5LevelRand86to115",
		"GetItemBy5LevelRand116to145",
		"GetItemBy5LevelRand145to175"  
	)                           
end	
function GetItemBy5LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 1, 12)                             
end
function GetItemBy5LevelRand66to85(player)
	GetCourseItem2(player, player.nLevel, 0, 1, 12)                             
end 
function GetItemBy5LevelRand86to115(player)
	GetCourseItem3(player, player.nLevel, 0, 1, 12)                             
end
function GetItemBy5LevelRand116to145(player)
	GetCourseItem4(player, player.nLevel, 0, 1, 12)                             
end
function GetItemBy5LevelRand145to175(player)
	GetCourseItem5(player, player.nLevel, 0, 1, 12)                             
end 
 
function GetCourseItemMagicFatalPVE(player)		-- 内功会心PVE装
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy6LevelRand1to65",
		"GetItemBy6LevelRand66to85",
		"GetItemBy6LevelRand86to115",
		"GetItemBy6LevelRand116to145",
		"GetItemBy6LevelRand145to175"  
	)                           
end	
function GetItemBy6LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 1, 8)                             
end
function GetItemBy6LevelRand66to85(player)
	GetCourseItem2(player, player.nLevel, 0, 1, 8)                             
end 
function GetItemBy6LevelRand86to115(player)
	GetCourseItem3(player, player.nLevel, 0, 1, 8)                             
end
function GetItemBy6LevelRand116to145(player)
	GetCourseItem4(player, player.nLevel, 0, 1, 8)                             
end
function GetItemBy6LevelRand145to175(player)
	GetCourseItem5(player, player.nLevel, 0, 1, 8)                             
end

function GetCourseItemMagicDamagePVP(player)	-- 内功伤害PVP装
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy7LevelRand1to65",
		"GetItemBy7LevelRand66to85",
		"GetItemBy7LevelRand86to115",
		"GetItemBy7LevelRand116to145",
		"GetItemBy7LevelRand145to175"  
	)                           
end	
function GetItemBy7LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 1, 14)                             
end                                          
function GetItemBy6LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 1, 14)                             
end                                          
function GetItemBy7LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 1, 14)                             
end                                          
function GetItemBy7LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 1, 14)                             
end                                          
function GetItemBy7LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 1, 14)                             
end

function GetCourseItemMagicDamagePVE(player)	-- 内功伤害PVE装
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy8LevelRand1to65",
		"GetItemBy8LevelRand66to85",
		"GetItemBy8LevelRand86to115",
		"GetItemBy8LevelRand116to145",
		"GetItemBy8LevelRand145to175"  
	)                           
end	
function GetItemBy8LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 1, 11)                             
end                                          
function GetItemBy8LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 1, 11)                             
end                                          
function GetItemBy8LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 1, 11)                             
end                                          
function GetItemBy8LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 1, 11)                             
end                                          
function GetItemBy8LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 1, 11)                             
end
function GetCourseItemMagicDamageAbiPVE(player)	-- 内功伤害持续PVE装
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy9LevelRand1to65",
		"GetItemBy9LevelRand66to85",
		"GetItemBy9LevelRand86to115",
		"GetItemBy9LevelRand116to145",
		"GetItemBy9LevelRand145to175"  
	)                           
end	
function GetItemBy9LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 1, 19)                             
end                                          
function GetItemBy9LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 1, 19)                             
end                                          
function GetItemBy9LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 1, 19)                             
end                                          
function GetItemBy9LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 1, 19)                             
end                                          
function GetItemBy9LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 1, 19)                             
end  
 
function GetCourseItemMagicDamageAimPVE(player)	-- 内功伤害命中PVE装
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy10LevelRand1to65",
		"GetItemBy10LevelRand66to85",
		"GetItemBy10LevelRand86to115",
		"GetItemBy10LevelRand116to145",
		"GetItemBy10LevelRand145to175"  
	)                           
end	
function GetItemBy10LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 1, 15)                             
end                                          
function GetItemBy10LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 1, 15)                             
end                                          
function GetItemBy10LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 1, 15)                             
end                                          
function GetItemBy10LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 1, 15)                             
end                                          
function GetItemBy10LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 1, 15)                             
end  	
 
function GetCourseItemPhysics(player)	--获得外功装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetCourseItemPhysicsBase"].. "\n" ..     			--外功基础装         
		LEVELUP_STRING_TABLE["GetCourseItemPhysicsDamage"].. "\n" ..      	--外功伤害装		      
		LEVELUP_STRING_TABLE["GetCourseItemPhysicsFatal"].. "\n" ..   			--外功会心装          
		LEVELUP_STRING_TABLE["GetCourseItemPhysicsFatalPVP"].. "\n" ..    	--外功会心PVP装       
		LEVELUP_STRING_TABLE["GetCourseItemPhysicsFatalPVE"].. "\n" ..      --外功会心PVE装       
		LEVELUP_STRING_TABLE["GetCourseItemPhysicsDamagePVP"].. "\n" ..     --外功伤害PVP装       
		LEVELUP_STRING_TABLE["GetCourseItemPhysicsDamagePVE"].. "\n" ..     --外功伤害PVE装       
		LEVELUP_STRING_TABLE["GetCourseItemPhysicsAbiPVE"].. "\n" ..        --外功伤害持续PVE装   
		LEVELUP_STRING_TABLE["GetCourseItemPhysicsAimPVE"], --外功伤害命中PVE装	  
		"GetCourseItemPhysicsBase",
		"GetCourseItemPhysicsDamage",
		"GetCourseItemPhysicsFatal",
		"GetCourseItemPhysicsFatalPVP",
		"GetCourseItemPhysicsFatalPVE",
		"GetCourseItemPhysicsDamagePVP",
		"GetCourseItemPhysicsDamagePVE",
		"GetCourseItemPhysicsAbiPVE",
		"GetCourseItemPhysicsAimPVE"  
	)
end  
function GetCourseItemPhysicsBase(player)--获得外功基础装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy11LevelRand1to65",
		"GetItemBy11LevelRand66to85",
		"GetItemBy11LevelRand86to115",
		"GetItemBy11LevelRand116to145",
		"GetItemBy11LevelRand145to175"  
	)                           
end	
function GetItemBy11LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 2, 1)                             
end                                          
function GetItemBy11LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 2, 1)                             
end                                          
function GetItemBy11LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 2, 1)                             
end                                          
function GetItemBy11LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 2, 1)                             
end                                          
function GetItemBy11LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 2, 1)                             
end  		  
function GetCourseItemPhysicsDamage(player)--获得外功伤害装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy12LevelRand1to65",
		"GetItemBy12LevelRand66to85",
		"GetItemBy12LevelRand86to115",
		"GetItemBy12LevelRand116to145",
		"GetItemBy12LevelRand145to175"  
	)                         
end	
function GetItemBy12LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 2, 2)                             
end                                          
function GetItemBy12LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 2, 2)                             
end                                          
function GetItemBy12LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 2, 2)                             
end                                          
function GetItemBy12LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 2, 2)                             
end                                          
function GetItemBy12LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 2, 2)                             
end	 
function GetCourseItemPhysicsFatal(player)--获得外功会心装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy13LevelRand1to65",
		"GetItemBy13LevelRand66to85",
		"GetItemBy13LevelRand86to115",
		"GetItemBy13LevelRand116to145",
		"GetItemBy13LevelRand145to175"  
	)                           
end	
function GetItemBy13LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 2, 3)                             
end                                          
function GetItemBy13LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 2, 3)                             
end                                          
function GetItemBy13LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 2, 3)                             
end                                          
function GetItemBy13LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 2, 3)                             
end                                          
function GetItemBy13LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 2, 3)                             
end	
 
function GetCourseItemPhysicsFatalPVP(player)--获得外功会心PVP装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy14LevelRand1to65",
		"GetItemBy14LevelRand66to85",
		"GetItemBy14LevelRand86to115",
		"GetItemBy14LevelRand116to145",
		"GetItemBy14LevelRand145to175"  
	)                           
end	
function GetItemBy14LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 2, 12)                             
end                                          
function GetItemBy14LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 2, 12)                             
end                                          
function GetItemBy14LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 2, 12)                             
end                                          
function GetItemBy14LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 2, 12)                             
end                                          
function GetItemBy14LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 2, 12)                             
end	

function GetCourseItemPhysicsFatalPVE(player)--获得外功会心PVE装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy15LevelRand1to65",
		"GetItemBy15LevelRand66to85",
		"GetItemBy15LevelRand86to115",
		"GetItemBy15LevelRand116to145",
		"GetItemBy15LevelRand145to175"  
	)                           
end	
function GetItemBy15LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 2, 8)                             
end                                          
function GetItemBy15LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 2, 8)                             
end                                          
function GetItemBy15LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 2, 8)                             
end                                          
function GetItemBy15LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 2, 8)                             
end                                          
function GetItemBy15LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 2, 8)                             
end	

function GetCourseItemPhysicsDamagePVP(player)--获得外功伤害PVP装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy16LevelRand1to65",
		"GetItemBy16LevelRand66to85",
		"GetItemBy16LevelRand86to115",
		"GetItemBy16LevelRand116to145",
		"GetItemBy16LevelRand145to175"  
	)                           
end	
function GetItemBy16LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 2, 14)                             
end                                          
function GetItemBy16LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 2, 14)                             
end                                          
function GetItemBy16LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 2, 14)                             
end                                          
function GetItemBy16LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 2, 14)                             
end                                          
function GetItemBy16LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 2, 14)                             
end	

function GetCourseItemPhysicsDamagePVE(player)--获得外功伤害PVE装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy17LevelRand1to65",
		"GetItemBy17LevelRand66to85",
		"GetItemBy17LevelRand86to115",
		"GetItemBy17LevelRand116to145",
		"GetItemBy17LevelRand145to175"  
	)                           
end	
function GetItemBy17LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 2, 11)                             
end                                          
function GetItemBy17LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 2, 11)                             
end                                          
function GetItemBy17LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 2, 11)                             
end                                          
function GetItemBy17LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 2, 11)                             
end                                          
function GetItemBy17LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 2, 11)                             
end	
 
function GetCourseItemPhysicsAbiPVE(player)--获得外功持续伤害PVE装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy18LevelRand1to65",
		"GetItemBy18LevelRand66to85",
		"GetItemBy18LevelRand86to115",
		"GetItemBy18LevelRand116to145",
		"GetItemBy18LevelRand145to175"  
	)                           
end	
function GetItemBy18LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 2, 19)                             
end                                          
function GetItemBy18LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 2, 19)                             
end                                          
function GetItemBy18LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 2, 19)                             
end                                          
function GetItemBy18LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 2, 19)                             
end                                          
function GetItemBy18LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 2, 19)                             
end	
function GetCourseItemPhysicsAimPVE(player)--获得外功命中伤害PVE装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy19LevelRand1to65",
		"GetItemBy19LevelRand66to85",
		"GetItemBy19LevelRand86to115",
		"GetItemBy19LevelRand116to145",
		"GetItemBy19LevelRand145to175"  
	)                           
end	
function GetItemBy19LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 1, 15)                             
end                                          
function GetItemBy19LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 1, 15)                             
end                                          
function GetItemBy19LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 1, 15)                             
end                                          
function GetItemBy19LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 1, 15)                             
end                                          
function GetItemBy19LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 1, 15)                             
end	
function GetCourseItemDefend(player)	--获得防御装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetCourseItemDefendBase"].. "\n" ..					--防御基础装
		LEVELUP_STRING_TABLE["GetCourseItemDefendAgainst"].. "\n" ..  		--防御抗性装		    
		LEVELUP_STRING_TABLE["GetCourseItemDefendParry"], --防御招架装
		--  LEVELUP_STRING_TABLE["GetCourseItemDefendAgainstOne"],						--防御单抗装       		           		 
		"GetCourseItemDefendBase",
		"GetCourseItemDefendAgainst",
		"GetCourseItemDefendParry"
		--	"GetCourseItemDefendAgainstOne"
	)
end 
function GetCourseItemDefendBase(player)--获得基础防御装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy20LevelRand1to65",
		"GetItemBy20LevelRand66to85",
		"GetItemBy20LevelRand86to115",
		"GetItemBy20LevelRand116to145",
		"GetItemBy20LevelRand145to175"  
	)                           
end	
function GetItemBy20LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 3, 9)                             
end                                          
function GetItemBy20LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 3, 9)                             
end                                          
function GetItemBy20LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 3, 9)                             
end                                          
function GetItemBy20LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 3, 9)                             
end                                          
function GetItemBy20LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 3, 9)                             
end	

function GetCourseItemDefendAgainst(player)--获得防御抗性装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy21LevelRand1to65",
		"GetItemBy21LevelRand66to85",
		"GetItemBy21LevelRand86to115",
		"GetItemBy21LevelRand116to145",
		"GetItemBy21LevelRand145to175"  
	)                           
end	
function GetItemBy21LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 3, 16)                             
end                                          
function GetItemBy21LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 3, 16)                             
end                                          
function GetItemBy21LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 3, 16)                             
end                                          
function GetItemBy21LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 3, 16)                             
end                                          
function GetItemBy21LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 3, 16)                             
end		

function GetCourseItemDefendParry(player)--获得防御招架装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy22LevelRand1to65",
		"GetItemBy22LevelRand66to85",
		"GetItemBy22LevelRand86to115",
		"GetItemBy22LevelRand116to145",
		"GetItemBy22LevelRand145to175"  
	)                           
end	
function GetItemBy22LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 3, 5)                             
end                                          
function GetItemBy22LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 3, 5)                             
end                                          
function GetItemBy22LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 3, 5)                             
end                                          
function GetItemBy22LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 3, 5)                             
end                                          
function GetItemBy22LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 3, 5)                             
end		

--function GetCourseItemDefendAgainstOne(player)
--		player.OpenWindow(TARGET.PLAYER, player.dwID,
--		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
--		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
--	  LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
--	  LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
--	  LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"],										-- 获得品质等级为 145-175装备
--    "GetItemBy23LevelRand1to65",
--		"GetItemBy23LevelRand66to85",
--		"GetItemBy23LevelRand86to115",
--		"GetItemBy23LevelRand116to145",
--		"GetItemBy23LevelRand145to175"  
--		)                           
--end	
--function GetItemBy23LevelRand1to65(player)
--		 GetCourseItem1(player,player.nLevel,0,3,17)
--		 GetCourseItem1(player,player.nLevel,0,3,18)                               
--end                                          
--function GetItemBy23LevelRand66to85(player)   
--		 GetCourseItem2(player,player.nLevel,0,3,17)
--		 GetCourseItem2(player,player.nLevel,0,3,18)                               
--end                                          
--function GetItemBy23LevelRand86to115(player)  
--		 GetCourseItem3(player,player.nLevel,0,3,17)
--		 GetCourseItem3(player,player.nLevel,0,3,18)                             
--end                                          
--function GetItemBy23LevelRand116to145(player) 
--		 GetCourseItem4(player,player.nLevel,0,3,17)
--		 GetCourseItem4(player,player.nLevel,0,3,18)                             
--end                                          
--function GetItemBy23LevelRand145to175(player) 
--		 GetCourseItem5(player,player.nLevel,0,3,17)
--		 GetCourseItem5(player,player.nLevel,0,3,18)                             
--end		
function GetCourseItemHeal(player)	  --获得治疗装备
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetCourseItemHealBase"].. "\n" ..					--治疗基础装
		LEVELUP_STRING_TABLE["GetCourseItemHealFatalPVE"].. "\n" ..			--治疗会心PVE装
		LEVELUP_STRING_TABLE["GetCourseItemHealFatalPVP"].. "\n" ..  		--治疗会心PVP装
		LEVELUP_STRING_TABLE["GetCourseItemHealAbiPVP"].. "\n" ..				--治疗持续PVP装
		LEVELUP_STRING_TABLE["GetCourseItemHealAbiPVE"].. "\n" ..				--治疗持续PVE装   
		LEVELUP_STRING_TABLE["GetCourseItemHealMeasurePVE"].. "\n" ..		--治疗量PVE装
		LEVELUP_STRING_TABLE["GetCourseItemHealMeasurePVP"], --治疗量PVP装
		"GetCourseItemHealBase",
		"GetCourseItemHealFatalPVE",
		"GetCourseItemHealFatalPVP",
		"GetCourseItemHealAbiPVP",
		"GetCourseItemHealAbiPVE",
		"GetCourseItemHealMeasurePVE",
		"GetCourseItemHealMeasurePVP"		
	)
end  
function GetCourseItemHealBase(player)
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy24LevelRand1to65",
		"GetItemBy24LevelRand66to85",
		"GetItemBy24LevelRand86to115",
		"GetItemBy24LevelRand116to145",
		"GetItemBy24LevelRand145to175"  
	)                           
end	
function GetItemBy24LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 4, 1)                             
end                                          
function GetItemBy24LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 4, 1)                             
end                                          
function GetItemBy24LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 4, 1)                             
end                                          
function GetItemBy24LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 4, 1)                             
end                                          
function GetItemBy24LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 4, 1)                             
end			

function GetCourseItemHealFatalPVE(player)
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy25LevelRand1to65",
		"GetItemBy25LevelRand66to85",
		"GetItemBy25LevelRand86to115",
		"GetItemBy25LevelRand116to145",
		"GetItemBy25LevelRand145to175"  
	)                           
end	
function GetItemBy25LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 4, 4)                             
end                                          
function GetItemBy25LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 4, 4)                             
end                                          
function GetItemBy25LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 4, 4)                             
end                                          
function GetItemBy25LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 4, 4)                             
end                                          
function GetItemBy25LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 4, 4)                             
end			

function GetCourseItemHealFatalPVP(player)
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy26LevelRand1to65",
		"GetItemBy26LevelRand66to85",
		"GetItemBy26LevelRand86to115",
		"GetItemBy26LevelRand116to145",
		"GetItemBy26LevelRand145to175"  
	)                           
end	
function GetItemBy26LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 4, 20)                             
end                                          
function GetItemBy26LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 4, 20)                             
end                                          
function GetItemBy26LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 4, 20)                             
end                                          
function GetItemBy26LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 4, 20)                             
end                                          
function GetItemBy26LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 4, 20)                             
end			

function GetCourseItemHealAbiPVP(player)
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy27LevelRand1to65",
		"GetItemBy27LevelRand66to85",
		"GetItemBy27LevelRand86to115",
		"GetItemBy27LevelRand116to145",
		"GetItemBy27LevelRand145to175"  
	)                           
end	
function GetItemBy27LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 4, 21)                             
end                                          
function GetItemBy27LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 4, 21)                             
end                                          
function GetItemBy27LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 4, 21)                             
end                                          
function GetItemBy27LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 4, 21)                             
end                                          
function GetItemBy27LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 4, 21)                             
end			

function GetCourseItemHealAbiPVE(player)
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy28LevelRand1to65",
		"GetItemBy28LevelRand66to85",
		"GetItemBy28LevelRand86to115",
		"GetItemBy28LevelRand116to145",
		"GetItemBy28LevelRand145to175"  
	)                           
end	
function GetItemBy28LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 4, 10)                             
end                                          
function GetItemBy28LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 4, 10)                             
end                                          
function GetItemBy28LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 4, 10)                             
end                                          
function GetItemBy28LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 4, 10)                             
end                                          
function GetItemBy28LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 4, 10)                             
end			
function GetCourseItemHealMeasurePVE(player)
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy29LevelRand1to65",
		"GetItemBy29LevelRand66to85",
		"GetItemBy29LevelRand86to115",
		"GetItemBy29LevelRand116to145",
		"GetItemBy29LevelRand145to175"  
	)                           
end	
function GetItemBy29LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 4, 6)                             
end                                          
function GetItemBy29LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 4, 6)                             
end                                          
function GetItemBy29LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 4, 6)                             
end                                          
function GetItemBy29LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 4, 6)                             
end                                          
function GetItemBy29LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 4, 6)                             
end			

function GetCourseItemHealMeasurePVP(player)
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetItemByLevelRand1to65"].. "\n" .. 						-- 获得品质等级为 1-65   装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand66to85"].. "\n" ..						-- 获得品质等级为 66-85  装备		
		LEVELUP_STRING_TABLE["GetItemByLevelRand86to115"].. "\n" ..						-- 获得品质等级为 86-115 装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand116to145"].. "\n" ..					-- 获得品质等级为 116-145装备
		LEVELUP_STRING_TABLE["GetItemByLevelRand145to175"], -- 获得品质等级为 145-175装备
		"GetItemBy30LevelRand1to65",
		"GetItemBy30LevelRand66to85",
		"GetItemBy30LevelRand86to115",
		"GetItemBy30LevelRand116to145",
		"GetItemBy30LevelRand145to175"  
	)                           
end	
function GetItemBy30LevelRand1to65(player)
	GetCourseItem1(player, player.nLevel, 0, 4, 13)                             
end                                          
function GetItemBy30LevelRand66to85(player)   
	GetCourseItem2(player, player.nLevel, 0, 4, 13)                             
end                                          
function GetItemBy30LevelRand86to115(player)  
	GetCourseItem3(player, player.nLevel, 0, 4, 13)                             
end                                          
function GetItemBy30LevelRand116to145(player) 
	GetCourseItem4(player, player.nLevel, 0, 4, 13)                             
end                                          
function GetItemBy30LevelRand145to175(player) 
	GetCourseItem5(player, player.nLevel, 0, 4, 13)                             
end			
function GetCourseItemSet(player)	  --获得套装
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["GetCourseItemSetKL"].. "\n" ..  			--获得昆仑套装   
		LEVELUP_STRING_TABLE["GetCourseItemSetDZ"].. "\n" ..  			--获得刀宗套装  
		LEVELUP_STRING_TABLE["GetCourseItemSetS0HQM"].. "\n" ..  		--获得S0浩气盟套装
		LEVELUP_STRING_TABLE["GetCourseItemSetS0ERG"].. "\n" ..  		--获得S0恶人谷套装
		LEVELUP_STRING_TABLE["GetCourseItemSetS05HQM"].. "\n" ..		--获得S0.5浩气盟套装
		LEVELUP_STRING_TABLE["GetCourseItemSetS05ERG"].. "\n" ..		--获得S0.5恶人谷套装
		LEVELUP_STRING_TABLE["GetCourseItemSetT0HQM"].. "\n" ..  		--获得T0浩气盟套装
		LEVELUP_STRING_TABLE["GetCourseItemSetT0ERG"].. "\n" ..  		--获得T0恶人谷套装
		LEVELUP_STRING_TABLE["GetCourseItemSetT1"].. "\n" ..      	--获得T1套装
		LEVELUP_STRING_TABLE["GetCourseItemSetT2"].. "\n" ..				--获得T2套装
		LEVELUP_STRING_TABLE["GetCourseItemSetT3"], --获得T3套装  
		"GetCourseItemSetKL",
		"GetCourseItemSetDZ",
		"GetCourseItemSetS0HQM",
		"GetCourseItemSetS0ERG",
		"GetCourseItemSetS05HQM",
		"GetCourseItemSetS05ERG",
		"GetCourseItemSetT0HQM",
		"GetCourseItemSetT0ERG",
		"GetCourseItemSetT1",
		"GetCourseItemSetT2",
		"GetCourseItemSetT3"  
	)
end  
function GetCourseItemSetKL(player)	
	GetCourseItem0(player, player.nLevel, 1, 4, 13)
	GetCourseItem0(player, player.nLevel, 1, 1, 14)  
	GetCourseItem0(player, player.nLevel, 1, 2, 14)                       
end
function GetCourseItemSetDZ(player)	
	GetCourseItem0(player, player.nLevel, 2, 4, 13)
	GetCourseItem0(player, player.nLevel, 2, 1, 12)  
	GetCourseItem0(player, player.nLevel, 2, 2, 12)                                
end 
function GetCourseItemSetS0HQM(player)	
	GetCourseItem0(player, player.nLevel, 3, 4, 13)
	GetCourseItem0(player, player.nLevel, 3, 1, 14)  
	GetCourseItem0(player, player.nLevel, 3, 2, 14)                             
end 
function GetCourseItemSetS0ERG(player)	
	GetCourseItem0(player, player.nLevel, 4, 4, 13)
	GetCourseItem0(player, player.nLevel, 4, 1, 14)  
	GetCourseItem0(player, player.nLevel, 4, 2, 14)   
end 
function GetCourseItemSetS05HQM(player)	
	GetCourseItem0(player, player.nLevel, 5, 4, 13)
	GetCourseItem0(player, player.nLevel, 5, 1, 14)  
	GetCourseItem0(player, player.nLevel, 5, 2, 14)                             
end
function GetCourseItemSetS05ERG(player)	
	GetCourseItem0(player, player.nLevel, 6, 4, 13)
	GetCourseItem0(player, player.nLevel, 6, 1, 14)  
	GetCourseItem0(player, player.nLevel, 6, 2, 14)                              
end 
function GetCourseItemSetT0HQM(player)	
	GetCourseItem0(player, player.nLevel, 7, 2, 11)
	GetCourseItem0(player, player.nLevel, 7, 2, 8)  
	GetCourseItem0(player, player.nLevel, 7, 1, 8)
	GetCourseItem0(player, player.nLevel, 7, 1, 11)                               
end 
function GetCourseItemSetT0ERG(player)	
	GetCourseItem0(player, player.nLevel, 8, 2, 11)
	GetCourseItem0(player, player.nLevel, 8, 2, 8)  
	GetCourseItem0(player, player.nLevel, 8, 1, 8)
	GetCourseItem0(player, player.nLevel, 8, 1, 11)                         
end
function GetCourseItemSetT1(player)	
	GetCourseItem0(player, player.nLevel, 9, 4, 6)
	GetCourseItem0(player, player.nLevel, 9, 3, 16)  
	GetCourseItem0(player, player.nLevel, 9, 3, 9)
	GetCourseItem0(player, player.nLevel, 9, 2, 11)
	GetCourseItem0(player, player.nLevel, 9, 1, 11)                             
end 
function GetCourseItemSetT2(player)	
	GetCourseItem0(player, player.nLevel, 10, 4, 10)
	GetCourseItem0(player, player.nLevel, 10, 4, 6)  
	GetCourseItem0(player, player.nLevel, 10, 4, 4)
	GetCourseItem0(player, player.nLevel, 10, 3, 9)
	GetCourseItem0(player, player.nLevel, 10, 3, 5)
	GetCourseItem0(player, player.nLevel, 10, 2, 15)
	GetCourseItem0(player, player.nLevel, 10, 1, 15)                                
end 
function GetCourseItemSetT3(player)	
	GetCourseItem0(player, player.nLevel, 11, 4, 10)
	GetCourseItem0(player, player.nLevel, 11, 3, 16)  
	GetCourseItem0(player, player.nLevel, 11, 3, 5)
	GetCourseItem0(player, player.nLevel, 11, 2, 19)
	GetCourseItem0(player, player.nLevel, 11, 1, 19)                         
end 
--function GetCourseItemMagicDamage(player)	--内功伤害装备
--	GetCourseItem(player,player.nLevel,1,1,1)
--	GetCourseItem(player,player.nLevel,1,1,3)
--	GetCourseItem(player,player.nLevel,2,1,1)
--	GetCourseItem(player,player.nLevel,2,1,3)
--	GetCourseItem(player,player.nLevel,3,1,1)
--	GetCourseItem(player,player.nLevel,3,1,3)
--	GetCourseItem(player,player.nLevel,5,1,1)
--	GetCourseItem(player,player.nLevel,5,1,3)		
--end
--
--function GetCourseItemMagicBase(player)	--内功基础装备
--	GetCourseItem(player,player.nLevel,1,1,0)
--	GetCourseItem(player,player.nLevel,2,1,0)
--	GetCourseItem(player,player.nLevel,3,1,0)
--	GetCourseItem(player,player.nLevel,5,1,0)
--end
--
--function GetCourseItemPhysicsDamage(player)	--外功伤害装备
--	GetCourseItem(player,player.nLevel,1,2,1)
--	GetCourseItem(player,player.nLevel,1,2,3)
--	GetCourseItem(player,player.nLevel,4,2,1)
--	GetCourseItem(player,player.nLevel,4,2,3)
--end
--
--function GetCourseItemPhysicsBase(player)	--外功基础装备
--	GetCourseItem(player,player.nLevel,1,2,0)
--	GetCourseItem(player,player.nLevel,4,2,0)
--end
--
--function GetCourseItemDefend(player)	--防御装备
--	GetCourseItem(player,player.nLevel,3,4,6)
--	GetCourseItem(player,player.nLevel,4,4,6)
--end
--
--function GetCourseItemHeal(player)	--治疗装备
--	GetCourseItem(player,player.nLevel,2,3,4)
--	GetCourseItem(player,player.nLevel,2,3,5)
--	GetCourseItem(player,player.nLevel,5,3,4)
--	GetCourseItem(player,player.nLevel,5,3,5)
--end
--
--
--
--
--function GetCourseItemCYMagicDamage(player)	--纯阳内功伤害装备
--	GetCourseItem(player,player.nLevel,1,1,1)
--	GetCourseItem(player,player.nLevel,1,1,3)
--end
--
--function GetCourseItemCYMagicBase(player)	--纯阳内功基础装备
--	GetCourseItem(player,player.nLevel,1,1,0)
--end
--
--function GetCourseItemCYPhysicsDamage(player)	--纯阳外功伤害装备
--	GetCourseItem(player,player.nLevel,1,2,1)
--	GetCourseItem(player,player.nLevel,1,2,3)
--end
--
--function GetCourseItemCYPhysicsBase(player)		--纯阳外功基础装备
--	GetCourseItem(player,player.nLevel,1,2,0)
--end
--
--function GetCourseItemQXMagicDamage(player)	--七秀内功伤害装备
--	GetCourseItem(player,player.nLevel,2,1,1)
--	GetCourseItem(player,player.nLevel,2,1,3)
--	
--end
--
--function GetCourseItemQXMagicBase(player)	--七秀内功基础装备
--	GetCourseItem(player,player.nLevel,2,1,0)
--end
--
--function GetCourseItemQXTherapy(player)	--七秀治疗装备
--	GetCourseItem(player,player.nLevel,2,3,5)
--end
--
--function GetCourseItemQXTherapyReplenish(player)		--七秀治疗回复装备
--	GetCourseItem(player,player.nLevel,2,3,4)
--end
--
--function GetCourseItemWHMagicDamage(player)	--万花内功伤害装备
--	GetCourseItem(player,player.nLevel,5,1,1)
--	GetCourseItem(player,player.nLevel,5,1,3)
--	
--end
--
--function GetCourseItemWHMagicBase(player)	--万花内功基础装备
--	GetCourseItem(player,player.nLevel,5,1,0)
--end
--
--function GetCourseItemWHTherapy(player)	--万花治疗装备
--	GetCourseItem(player,player.nLevel,5,3,5)
--end
--
--function GetCourseItemWHTherapyReplenish(player)		--万花治疗回复装备
--	GetCourseItem(player,player.nLevel,5,3,4)
--end
--
--function GetCourseItemSLMagicDamage(player)	--少林内功伤害装备
--	GetCourseItem(player,player.nLevel,3,1,1)
--	GetCourseItem(player,player.nLevel,3,1,3)
--	
--end
--
--function GetCourseItemSLMagicBase(player)	--少林内功基础装备
--	GetCourseItem(player,player.nLevel,3,1,0)
--end
--
--function GetCourseItemSLDefence(player)	--少林防御装备
--	GetCourseItem(player,player.nLevel,3,4,6)
--end
--
--function GetCourseItemTCPhysicsDamage(player)	--天策外功伤害装备
--	GetCourseItem(player,player.nLevel,4,2,1)
--	GetCourseItem(player,player.nLevel,4,2,3)
--	
--end
--
--function GetCourseItemTCPhysicsBase(player)		--天策外功基础装备
--	GetCourseItem(player,player.nLevel,4,2,0)
--end
--
--function GetCourseItemTCDefence(player)	--天策防御装备
--	GetCourseItem(player,player.nLevel,4,4,6)
--end


function GetPackageAndHorse(player)
	player.AddItem(8, 30)
	player.AddItem(8, 30)
	player.AddItem(8, 30)
	player.AddItem(8, 30)
	player.AddItem(8, 32)
	player.AddItem(8, 508)
	player.AddMoney(0, 0, 1000000)
	player.AddItem(6, 366)
	player.AddItem(6, 614)
	player.AddItem(6, 484)
	player.AddItem(6, 730)
	player.AddItem(6, 256)
	player.AddItem(6, 4012)
	player.AddItem(6, 2836)
	player.AddItem(6, 5183)
	for i = 1, #tHorseEnchant do
		player.AddItem(5, tHorseEnchant[i])
	end
	LearnSkillByLevel(player, 605, 1)
end

function GetNextCourse(player)
	if player.nLevel == 80 then 
		player.SendSystemMessage(GetEditorString(1, 9453))
	else
		GetStandardCourse(player, player.nLevel + 1)
	end
end

function GetStandardCourse1(player)
	GetStandardCourse(player, 1)
end
function GetStandardCourse5(player)
	GetStandardCourse(player, 5)
end
function GetStandardCourse10(player)
	GetStandardCourse(player, 10)
end
function GetLevelCourse15(player)
	GetStandardCourse(player, 15)
end
function GetStandardCourse16(player)
	GetStandardCourse(player, 16)
end
function GetStandardCourse20(player)
	GetStandardCourse(player, 20)
end
function GetStandardCourse25(player)
	GetStandardCourse(player, 25)
end
function GetStandardCourse30(player)
	GetStandardCourse(player, 30)
end

function GetStandardCourse32(player)
	GetStandardCourse(player, 32)
end
function GetStandardCourse35(player)
	GetStandardCourse(player, 35)
end
function GetStandardCourse40(player)
	GetStandardCourse(player, 40)
end
function GetStandardCourse45(player)
	GetStandardCourse(player, 45)
end
function GetStandardCourse50(player)
	GetStandardCourse(player, 50)
end
function GetStandardCourse55(player)
	GetStandardCourse(player, 55)
end
function GetStandardCourse60(player)
	GetStandardCourse(player, 60)
end
function GetStandardCourse65(player)
	GetStandardCourse(player, 65)
end
function GetStandardCourse70(player)
	GetStandardCourse(player, 70)
end
function GetStandardCourse75(player)
	GetStandardCourse(player, 75)
end
function GetStandardCourse80(player)
	GetStandardCourse(player, 80)
end
--
function TransportKD(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(10, 12359, 34035, 1048812)
end

function TransportLD(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(9, 41742, 85306, 1075915)
end

-- 
function TransportLY(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(8, 62065, 21190, 1083904)
end



-- 以下是测试用部分，传送到纯阳地图，以及一些能力初始化
function TransportCY(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(7, 43563, 3855, 1119171)
	if player.GetItemAmount(6, 887) == 0 then
		player.AddItem(6, 887, 1)
	end
	player.AddItem(7, 1355)
	player.AddItem(7, 1360)
	player.AddItem(7, 1637)
	player.AddItem(7, 1375)
	player.AddItem(7, 1642)	
end

--
function TransportCA(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(15, 28737, 44684, 1063680)
end

-- 
function TransportTC(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(11, 60340, 8951, 1049599)
end      
--
function TransportWH(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(2, 85293, 72597, 1169238)
end

function TransportSL(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(5, 7456, 13673, 1048919)
end
--
function TransportFB(player, nTargetType, nTargetID, nIndex)
--	-- 进入副本前需要设置一个进入点坐标, 用来在副本异常等时候把玩家T出副本
--	player.SetLastEntry(5, 1, 27502, 82386, 1157149, 70)
	player.SwitchMap(5, 28383, 82135, 1157120)
end

-- 以下是测试用部分，传送到金水地图，以及一些能力初始化
function TransportJS(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(13, 63803, 63202, 1050257)
end
--
function TransportFH(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(12, 7639, 37449, 1082238)
end

function TransportQX(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(16, 23080, 8801, 1056979)
end	
--
function TransportWY(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(16, 31513, 34242, 1057024)
end
--
function TransportYZ(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(6, 46432, 31106, 1049216)
end
--
function TransportKWF(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(7, 80331, 57237, 1158272)
end

function TransportNPS(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(22, 90522, 70909, 1120663)
end
--
function TransportDXC(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(1, 17222, 24486, 1052545)
end
--
function TransportTGF(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(2, 38142, 17638, 1080064)
end
--
function TransportSCZ(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(11, 55187, 69660, 1059392)
end
--
function TransportDHG(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(12, 44918, 10881, 1120640)
end
--
function TransportKL(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(30, 55968, 6019, 1053184)
end

function TransportBL(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(100, 100, 100, 100)
end

function TransportWL(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(101, 100, 100, 100)
end

function TransportWD(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(102, 100, 100, 100)
end

function TransportRT(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(103, 100, 100, 100)
end

function TransportHL(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(104, 100, 100, 100)
end

function TransportCS(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(105, 100, 100, 100)
end

function TransportFW(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(106, 100, 100, 100)
end

function GetTrain(player)
	player.AddTrainNoLimit(20000)
end

function ResetVenationForFree(player)			--免费重置经脉
	player.AddMoney(0, 0, CalcResetCost(player))
	ResetVenation(player)
end

function DeleteAllItem(player)   --删除除自身装备以外的所有的装备 
	for i = 1, INVENTORY_INDEX.TOTAL - 1 do
		for j = 0, player.GetBoxSize(i) - 1 do
			local item = player.GetItem(i, j)
			if item then
				if item.nGenre == 0  and item.dwIndex < 7000 and item.nSub ~= EQUIPMENT_SUB.PACKAGE and item.dwTabType ~= EQUIPMENT_SUB.HORSE then
					--print("i is "..i..". j is "..j..".\n")
					player.DestroyItem(i, j)
				end
			end
		end
	end
end

function RepairAllItem(player)   --修理所有的装备 
	for i = 0, INVENTORY_INDEX.TOTAL - 1 do
		for j = 0, player.GetBoxSize(i) - 1 do
			local item = player.GetItem(i, j)
			if item and item.NeedRepair() then
				player.SetItemCurrentDurability(i, j, item.nMaxDurability)
			end
		end
	end
end

function CallWeaponShop(player)				--call稻香村武器商店
	local scene = player.GetScene()
	local npc = scene.CreateNpc(17, player.nX + 100, player.nY + 100, player.nZ, 0, 4800)
	npc.SetDisappearFrames(16 * 300, false)
	npc = scene.CreateNpc(3325, player.nX-100, player.nY-100, player.nZ, 0, 4800)
	npc.SetDisappearFrames(16 * 300, false)
end

function ResetCD(player)
	LearnSkillByLevel(player, 613, 1)
	player.CastSkill(613, 1)
end

--ADD隐身BUFF
function AddBuffInvisible(player)
	player.AddBuff(1, 99, 108, 1, 100, 9000);
end

function ProfessionLevelUpOEM(player)

	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["CJLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["SNLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["SSLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["PRLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["FRLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["DZLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["YSLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["YDLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["FXLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["DXLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["ZJLevelUpOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["ReFullThewAndStamOEM"].. "\n" ..
		LEVELUP_STRING_TABLE["ForgetProfessionOEM"],
		"CJLevelUpOEM",
		"SNLevelUpOEM",
		"SSLevelUpOEM",
		"PRLevelUpOEM",
		"FRLevelUpOEM",
		"DZLevelUpOEM",
		"YSLevelUpOEM",
		"YDLevelUpOEM",
		"FXLevelUpOEM",
		"DXLevelUpOEM",
		"ZJLevelUpOEM",
		"ReFullThewAndStamOEM",
		"ForgetProfessionOEM"
	)
end


function CJLevelUpOEM(player)
	if player.IsProfessionLearnedByCraftID(1) then
	
	else
		player.LearnProfession(1)
	end
	if player.GetItemByIndex(5, 191) == nil then		--判断玩家是否已经拥有该item
		player.AddItem(5, 191)
	end	
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["Level10"].. "\n" ..
		LEVELUP_STRING_TABLE["Level15"].. "\n" ..
		LEVELUP_STRING_TABLE["Level16"].. "\n" ..
		LEVELUP_STRING_TABLE["Level20"].. "\n" ..
		LEVELUP_STRING_TABLE["Level25"].. "\n" ..
		LEVELUP_STRING_TABLE["Level30"].. "\n" ..
		LEVELUP_STRING_TABLE["Level32"].. "\n" ..
		LEVELUP_STRING_TABLE["Level35"].. "\n" ..
		LEVELUP_STRING_TABLE["Level40"].. "\n" ..
		LEVELUP_STRING_TABLE["Level45"].. "\n" ..
		LEVELUP_STRING_TABLE["Level50"].. "\n" ..
		LEVELUP_STRING_TABLE["Level55"].. "\n" ..
		LEVELUP_STRING_TABLE["Level60"].. "\n" ..
		LEVELUP_STRING_TABLE["Level65"].. "\n" ..
		LEVELUP_STRING_TABLE["Level70"],
		"GetProfession1Course10",
		"GetProfession1Course15",
		"GetProfession1Course16",
		"GetProfession1Course20",
		"GetProfession1Course25",
		"GetProfession1Course30",
		"GetProfession1Course32",
		"GetProfession1Course35",
		"GetProfession1Course40",
		"GetProfession1Course45",
		"GetProfession1Course50",
		"GetProfession1Course55",
		"GetProfession1Course60",
		"GetProfession1Course65",
		"GetProfession1Course70"
	)
end

function GetProfession1Course10(player)
	GetProfession1Course(player, 10)
end
function GetProfession1Course15(player)
	GetProfession1Course(player, 15)
end
function GetProfession1Course16(player)
	GetProfession1Course(player, 16)
end
function GetProfession1Course20(player)
	GetProfession1Course(player, 20)
end
function GetProfession1Course25(player)
	GetProfession1Course(player, 25)
end
function GetProfession1Course30(player)
	GetProfession1Course(player, 30)
end
function GetProfession1Course32(player)
	GetProfession1Course(player, 32)
end
function GetProfession1Course35(player)
	GetProfession1Course(player, 35)
end
function GetProfession1Course40(player)
	GetProfession1Course(player, 40)
end
function GetProfession1Course45(player)
	GetProfession1Course(player, 45)
end
function GetProfession1Course50(player)
	GetProfession1Course(player, 50)
end
function GetProfession1Course55(player)
	GetProfession1Course(player, 55)
end
function GetProfession1Course60(player)
	GetProfession1Course(player, 60)
end
function GetProfession1Course65(player)
	GetProfession1Course(player, 65)
end
function GetProfession1Course70(player)
	GetProfession1Course(player, 70)
end
function GetProfession1Course75(player)
	GetProfession1Course(player, 75)
end
function GetProfession1Course80(player)
	GetProfession1Course(player, 80)
end
function SNLevelUpOEM(player)
	if player.IsProfessionLearnedByCraftID(2) then
	
	else
		player.LearnProfession(2)
	end
	if player.GetItemByIndex(5, 193) == nil then		--判断玩家是否已经拥有该item
		player.AddItem(5, 193)
	end
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["Level10"].. "\n" ..
		LEVELUP_STRING_TABLE["Level15"].. "\n" ..
		LEVELUP_STRING_TABLE["Level16"].. "\n" ..
		LEVELUP_STRING_TABLE["Level20"].. "\n" ..
		LEVELUP_STRING_TABLE["Level25"].. "\n" ..
		LEVELUP_STRING_TABLE["Level30"].. "\n" ..
		LEVELUP_STRING_TABLE["Level32"].. "\n" ..
		LEVELUP_STRING_TABLE["Level35"].. "\n" ..
		LEVELUP_STRING_TABLE["Level40"].. "\n" ..
		LEVELUP_STRING_TABLE["Level45"].. "\n" ..
		LEVELUP_STRING_TABLE["Level50"].. "\n" ..
		LEVELUP_STRING_TABLE["Level55"].. "\n" ..
		LEVELUP_STRING_TABLE["Level60"].. "\n" ..
		LEVELUP_STRING_TABLE["Level65"].. "\n" ..
		LEVELUP_STRING_TABLE["Level70"].. "\n" ..
		LEVELUP_STRING_TABLE["Level75"],
		--LEVELUP_STRING_TABLE["Level80"],
		"GetProfession2Course10",
		"GetProfession2Course15",
		"GetProfession2Course16",
		"GetProfession2Course20",
		"GetProfession2Course25",
		"GetProfession2Course30",
		"GetProfession2Course32",
		"GetProfession2Course35",
		"GetProfession2Course40",
		"GetProfession2Course45",
		"GetProfession2Course50",
		"GetProfession2Course55",
		"GetProfession2Course60",
		"GetProfession2Course65",
		"GetProfession2Course70",
		"GetProfession2Course75"
		--"GetProfession2Course80"
	)
end

function GetProfession2Course10(player)
	GetProfession2Course(player, 10)
end
function GetProfession2Course15(player)
	GetProfession2Course(player, 15)
end
function GetProfession2Course16(player)
	GetProfession2Course(player, 16)
end
function GetProfession2Course20(player)
	GetProfession2Course(player, 20)
end
function GetProfession2Course25(player)
	GetProfession2Course(player, 25)
end
function GetProfession2Course30(player)
	GetProfession2Course(player, 30)
end
function GetProfession2Course32(player)
	GetProfession2Course(player, 32)
end
function GetProfession2Course35(player)
	GetProfession2Course(player, 35)
end
function GetProfession2Course40(player)
	GetProfession2Course(player, 40)
end
function GetProfession2Course45(player)
	GetProfession2Course(player, 45)
end
function GetProfession2Course50(player)
	GetProfession2Course(player, 50)
end
function GetProfession2Course55(player)
	GetProfession2Course(player, 55)
end
function GetProfession2Course60(player)
	GetProfession2Course(player, 60)
end
function GetProfession2Course65(player)
	GetProfession2Course(player, 65)
end
function GetProfession2Course70(player)
	GetProfession2Course(player, 70)
end
function GetProfession2Course75(player)
	GetProfession2Course(player, 75)
end
function GetProfession2Course80(player)
	GetProfession2Course(player, 80)
end

function SSLevelUpOEM(player)
	if player.IsProfessionLearnedByCraftID(3) then
	
	else
		player.LearnProfession(3)
	end
	if player.GetItemByIndex(5, 196) == nil then		--判断玩家是否已经拥有该item
		player.AddItem(5, 196)
	end
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["Level10"].. "\n" ..
		LEVELUP_STRING_TABLE["Level15"].. "\n" ..
		LEVELUP_STRING_TABLE["Level16"].. "\n" ..
		LEVELUP_STRING_TABLE["Level20"].. "\n" ..
		LEVELUP_STRING_TABLE["Level25"].. "\n" ..
		LEVELUP_STRING_TABLE["Level30"].. "\n" ..
		LEVELUP_STRING_TABLE["Level32"].. "\n" ..
		LEVELUP_STRING_TABLE["Level35"].. "\n" ..
		LEVELUP_STRING_TABLE["Level40"].. "\n" ..
		LEVELUP_STRING_TABLE["Level45"].. "\n" ..
		LEVELUP_STRING_TABLE["Level50"].. "\n" ..
		LEVELUP_STRING_TABLE["Level55"].. "\n" ..
		LEVELUP_STRING_TABLE["Level60"].. "\n" ..
		LEVELUP_STRING_TABLE["Level65"].. "\n" ..
		LEVELUP_STRING_TABLE["Level70"].. "\n" ..
		LEVELUP_STRING_TABLE["Level75"],
		--LEVELUP_STRING_TABLE["Level80"],
		"GetProfession3Course10",
		"GetProfession3Course15",
		"GetProfession3Course16",
		"GetProfession3Course20",
		"GetProfession3Course25",
		"GetProfession3Course30",
		"GetProfession3Course32",
		"GetProfession3Course35",
		"GetProfession3Course40",
		"GetProfession3Course45",
		"GetProfession3Course50",
		"GetProfession3Course55",
		"GetProfession3Course60",
		"GetProfession3Course65",
		"GetProfession3Course70",
		"GetProfession3Course75"
		--"GetProfession3Course80"
	)
end

function GetProfession3Course10(player)
	GetProfession3Course(player, 10)
end
function GetProfession3Course15(player)
	GetProfession3Course(player, 15)
end
function GetProfession3Course16(player)
	GetProfession3Course(player, 16)
end
function GetProfession3Course20(player)
	GetProfession3Course(player, 20)
end
function GetProfession3Course25(player)
	GetProfession3Course(player, 25)
end
function GetProfession3Course30(player)
	GetProfession3Course(player, 30)
end
function GetProfession3Course32(player)
	GetProfession3Course(player, 32)
end
function GetProfession3Course35(player)
	GetProfession3Course(player, 35)
end
function GetProfession3Course40(player)
	GetProfession3Course(player, 40)
end
function GetProfession3Course45(player)
	GetProfession3Course(player, 45)
end
function GetProfession3Course50(player)
	GetProfession3Course(player, 50)
end
function GetProfession3Course55(player)
	GetProfession3Course(player, 55)
end
function GetProfession3Course60(player)
	GetProfession3Course(player, 60)
end
function GetProfession3Course65(player)
	GetProfession3Course(player, 65)
end
function GetProfession3Course70(player)
	GetProfession3Course(player, 70)
end
function GetProfession3Course75(player)
	GetProfession3Course(player, 75)
end
function GetProfession3Course80(player)
	GetProfession3Course(player, 80)
end

function PRLevelUpOEM(player)
	if player.IsProfessionLearnedByCraftID(4) then
	
	else
		player.LearnProfession(4)
	end
	if player.GetItemByIndex(5, 3094) == nil then		--判断玩家是否已经拥有该itme
		player.AddItem(5, 3094)
	end
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["Level10"].. "\n" ..
		LEVELUP_STRING_TABLE["Level15"].. "\n" ..
		LEVELUP_STRING_TABLE["Level16"].. "\n" ..
		LEVELUP_STRING_TABLE["Level20"].. "\n" ..
		LEVELUP_STRING_TABLE["Level25"].. "\n" ..
		LEVELUP_STRING_TABLE["Level30"].. "\n" ..
		LEVELUP_STRING_TABLE["Level32"].. "\n" ..
		LEVELUP_STRING_TABLE["Level35"].. "\n" ..
		LEVELUP_STRING_TABLE["Level40"].. "\n" ..
		LEVELUP_STRING_TABLE["Level45"].. "\n" ..
		LEVELUP_STRING_TABLE["Level50"].. "\n" ..
		LEVELUP_STRING_TABLE["Level55"].. "\n" ..
		LEVELUP_STRING_TABLE["Level60"].. "\n" ..
		LEVELUP_STRING_TABLE["Level65"].. "\n" ..
		LEVELUP_STRING_TABLE["Level70"].. "\n" ..
		LEVELUP_STRING_TABLE["Level75"],
		--LEVELUP_STRING_TABLE["Level80"],
		"GetProfession3Course10",
		"GetProfession3Course15",
		"GetProfession3Course16",
		"GetProfession3Course20",
		"GetProfession3Course25",
		"GetProfession3Course30",
		"GetProfession3Course32",
		"GetProfession3Course35",
		"GetProfession3Course40",
		"GetProfession3Course45",
		"GetProfession3Course50",
		"GetProfession3Course55",
		"GetProfession3Course60",
		"GetProfession3Course65",
		"GetProfession3Course70",
		"GetProfession3Course75"
		--"GetProfession3Course80"
	)
end

function GetProfession4Course10(player)
	GetProfession4Course(player, 10)
end
function GetProfession4Course15(player)
	GetProfession4Course(player, 15)
end
function GetProfession4Course16(player)
	GetProfession4Course(player, 16)
end
function GetProfession4Course20(player)
	GetProfession4Course(player, 20)
end
function GetProfession4Course25(player)
	GetProfession4Course(player, 25)
end
function GetProfession4Course30(player)
	GetProfession4Course(player, 30)
end
function GetProfession4Course32(player)
	GetProfession4Course(player, 32)
end
function GetProfession4Course35(player)
	GetProfession4Course(player, 35)
end
function GetProfession4Course40(player)
	GetProfession4Course(player, 40)
end
function GetProfession4Course45(player)
	GetProfession4Course(player, 45)
end
function GetProfession4Course50(player)
	GetProfession4Course(player, 50)
end
function GetProfession4Course55(player)
	GetProfession4Course(player, 55)
end
function GetProfession4Course60(player)
	GetProfession4Course(player, 60)
end
function GetProfession4Course65(player)
	GetProfession4Course(player, 65)
end
function GetProfession4Course70(player)
	GetProfession4Course(player, 70)
end
function GetProfession4Course75(player)
	GetProfession4Course(player, 75)
end
function GetProfession4Course80(player)
	GetProfession4Course(player, 80)
end

function FRLevelUpOEM(player)
	if player.IsProfessionLearnedByCraftID(5) then
	
	else
		player.LearnProfession(5)
	end
	if player.GetItemByIndex(5, 195) == nil then		--判断玩家是否已经拥有该itme
		player.AddItem(5, 195)
	end
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["Level10"].. "\n" ..
		LEVELUP_STRING_TABLE["Level15"].. "\n" ..
		LEVELUP_STRING_TABLE["Level16"].. "\n" ..
		LEVELUP_STRING_TABLE["Level20"].. "\n" ..
		LEVELUP_STRING_TABLE["Level25"].. "\n" ..
		LEVELUP_STRING_TABLE["Level30"].. "\n" ..
		LEVELUP_STRING_TABLE["Level32"].. "\n" ..
		LEVELUP_STRING_TABLE["Level35"].. "\n" ..
		LEVELUP_STRING_TABLE["Level40"].. "\n" ..
		LEVELUP_STRING_TABLE["Level45"].. "\n" ..
		LEVELUP_STRING_TABLE["Level50"].. "\n" ..
		LEVELUP_STRING_TABLE["Level55"].. "\n" ..
		LEVELUP_STRING_TABLE["Level60"].. "\n" ..
		LEVELUP_STRING_TABLE["Level65"].. "\n" ..
		LEVELUP_STRING_TABLE["Level70"].. "\n" ..
		LEVELUP_STRING_TABLE["Level75"],
		--LEVELUP_STRING_TABLE["Level80"],
		"GetProfession3Course10",
		"GetProfession3Course15",
		"GetProfession3Course16",
		"GetProfession3Course20",
		"GetProfession3Course25",
		"GetProfession3Course30",
		"GetProfession3Course32",
		"GetProfession3Course35",
		"GetProfession3Course40",
		"GetProfession3Course45",
		"GetProfession3Course50",
		"GetProfession3Course55",
		"GetProfession3Course60",
		"GetProfession3Course65",
		"GetProfession3Course70",
		"GetProfession3Course75"
		--"GetProfession3Course80"
	)
end

function GetProfession5Course10(player)
	GetProfession5Course(player, 10)
end
function GetProfession5Course15(player)
	GetProfession5Course(player, 15)
end
function GetProfession5Course16(player)
	GetProfession5Course(player, 16)
end
function GetProfession5Course20(player)
	GetProfession5Course(player, 20)
end
function GetProfession5Course25(player)
	GetProfession5Course(player, 25)
end
function GetProfession5Course30(player)
	GetProfession5Course(player, 30)
end
function GetProfession5Course32(player)
	GetProfession5Course(player, 32)
end
function GetProfession5Course35(player)
	GetProfession5Course(player, 35)
end
function GetProfession5Course40(player)
	GetProfession5Course(player, 40)
end
function GetProfession5Course45(player)
	GetProfession5Course(player, 45)
end
function GetProfession5Course50(player)
	GetProfession5Course(player, 50)
end
function GetProfession5Course55(player)
	GetProfession5Course(player, 55)
end
function GetProfession5Course60(player)
	GetProfession5Course(player, 60)
end
function GetProfession5Course65(player)
	GetProfession5Course(player, 65)
end
function GetProfession5Course70(player)
	GetProfession5Course(player, 70)
end
function GetProfession5Course75(player)
	GetProfession5Course(player, 75)
end
function GetProfession5Course80(player)
	GetProfession5Course(player, 80)
end
function DZLevelUpOEM(player)
	if player.IsProfessionLearnedByCraftID(6) then
	
	else
		player.LearnProfession(6)
	end
	if player.GetItemByIndex(5, 192) == nil then		--判断玩家是否已经拥有该itme
		player.AddItem(5, 192)
	end
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["Level10"].. "\n" ..
		LEVELUP_STRING_TABLE["Level15"].. "\n" ..
		LEVELUP_STRING_TABLE["Level16"].. "\n" ..
		LEVELUP_STRING_TABLE["Level20"].. "\n" ..
		LEVELUP_STRING_TABLE["Level25"].. "\n" ..
		LEVELUP_STRING_TABLE["Level30"].. "\n" ..
		LEVELUP_STRING_TABLE["Level32"].. "\n" ..
		LEVELUP_STRING_TABLE["Level35"].. "\n" ..
		LEVELUP_STRING_TABLE["Level40"].. "\n" ..
		LEVELUP_STRING_TABLE["Level45"].. "\n" ..
		LEVELUP_STRING_TABLE["Level50"].. "\n" ..
		LEVELUP_STRING_TABLE["Level55"].. "\n" ..
		LEVELUP_STRING_TABLE["Level60"].. "\n" ..
		LEVELUP_STRING_TABLE["Level65"].. "\n" ..
		LEVELUP_STRING_TABLE["Level70"].. "\n" ..
		LEVELUP_STRING_TABLE["Level75"],
		--LEVELUP_STRING_TABLE["Level80"],
		"GetProfession3Course10",
		"GetProfession3Course15",
		"GetProfession3Course16",
		"GetProfession3Course20",
		"GetProfession3Course25",
		"GetProfession3Course30",
		"GetProfession3Course32",
		"GetProfession3Course35",
		"GetProfession3Course40",
		"GetProfession3Course45",
		"GetProfession3Course50",
		"GetProfession3Course55",
		"GetProfession3Course60",
		"GetProfession3Course65",
		"GetProfession3Course70",
		"GetProfession3Course75"
		--"GetProfession3Course80"
	)
end

function GetProfession6Course10(player)
	GetProfession6Course(player, 10)
end
function GetProfession6Course15(player)
	GetProfession6Course(player, 15)
end
function GetProfession6Course16(player)
	GetProfession6Course(player, 16)
end
function GetProfession6Course20(player)
	GetProfession6Course(player, 20)
end
function GetProfession6Course25(player)
	GetProfession6Course(player, 25)
end
function GetProfession6Course30(player)
	GetProfession6Course(player, 30)
end
function GetProfession6Course32(player)
	GetProfession6Course(player, 32)
end
function GetProfession6Course35(player)
	GetProfession6Course(player, 35)
end
function GetProfession6Course40(player)
	GetProfession6Course(player, 40)
end
function GetProfession6Course45(player)
	GetProfession6Course(player, 45)
end
function GetProfession6Course50(player)
	GetProfession6Course(player, 50)
end
function GetProfession6Course55(player)
	GetProfession6Course(player, 55)
end
function GetProfession6Course60(player)
	GetProfession6Course(player, 60)
end
function GetProfession6Course65(player)
	GetProfession6Course(player, 65)
end
function GetProfession6Course70(player)
	GetProfession6Course(player, 70)
end
function GetProfession6Course75(player)
	GetProfession6Course(player, 75)
end
function GetProfession6Course80(player)
	GetProfession6Course(player, 80)
end

function YSLevelUpOEM(player)
	if player.IsProfessionLearnedByCraftID(7) then
	
	else
		player.LearnProfession(7)
	end
	if player.GetItemByIndex(5, 194) == nil then		--判断玩家是否已经拥有该itme
		player.AddItem(5, 194)
	end
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["Level10"].. "\n" ..
		LEVELUP_STRING_TABLE["Level15"].. "\n" ..
		LEVELUP_STRING_TABLE["Level16"].. "\n" ..
		LEVELUP_STRING_TABLE["Level20"].. "\n" ..
		LEVELUP_STRING_TABLE["Level25"].. "\n" ..
		LEVELUP_STRING_TABLE["Level30"].. "\n" ..
		LEVELUP_STRING_TABLE["Level32"].. "\n" ..
		LEVELUP_STRING_TABLE["Level35"].. "\n" ..
		LEVELUP_STRING_TABLE["Level40"].. "\n" ..
		LEVELUP_STRING_TABLE["Level45"].. "\n" ..
		LEVELUP_STRING_TABLE["Level50"].. "\n" ..
		LEVELUP_STRING_TABLE["Level55"].. "\n" ..
		LEVELUP_STRING_TABLE["Level60"].. "\n" ..
		LEVELUP_STRING_TABLE["Level65"].. "\n" ..
		LEVELUP_STRING_TABLE["Level70"].. "\n" ..
		LEVELUP_STRING_TABLE["Level75"],
		--LEVELUP_STRING_TABLE["Level80"],
		"GetProfession3Course10",
		"GetProfession3Course15",
		"GetProfession3Course16",
		"GetProfession3Course20",
		"GetProfession3Course25",
		"GetProfession3Course30",
		"GetProfession3Course32",
		"GetProfession3Course35",
		"GetProfession3Course40",
		"GetProfession3Course45",
		"GetProfession3Course50",
		"GetProfession3Course55",
		"GetProfession3Course60",
		"GetProfession3Course65",
		"GetProfession3Course70",
		"GetProfession3Course75"
		--"GetProfession3Course80"
	)
end

function GetProfession7Course10(player)
	GetProfession7Course(player, 10)
end
function GetProfession7Course15(player)
	GetProfession7Course(player, 15)
end
function GetProfession7Course16(player)
	GetProfession7Course(player, 16)
end
function GetProfession7Course20(player)
	GetProfession7Course(player, 20)
end
function GetProfession7Course25(player)
	GetProfession7Course(player, 25)
end
function GetProfession7Course30(player)
	GetProfession7Course(player, 30)
end
function GetProfession7Course32(player)
	GetProfession7Course(player, 32)
end
function GetProfession7Course35(player)
	GetProfession7Course(player, 35)
end
function GetProfession7Course40(player)
	GetProfession7Course(player, 40)
end
function GetProfession7Course45(player)
	GetProfession7Course(player, 45)
end
function GetProfession7Course50(player)
	GetProfession7Course(player, 50)
end
function GetProfession7Course55(player)
	GetProfession7Course(player, 55)
end
function GetProfession7Course60(player)
	GetProfession7Course(player, 60)
end
function GetProfession7Course65(player)
	GetProfession7Course(player, 65)
end
function GetProfession7Course70(player)
	GetProfession7Course(player, 70)
end
function GetProfession7Course75(player)
	GetProfession7Course(player, 75)
end
function GetProfession7Course80(player)
	GetProfession7Course(player, 80)
end
function YDLevelUpOEM(player)
	local nLevel, nExp = player.GetProfessionLevel(8)
	if nLevel < 10 then
		player.LearnProfession(8)
	end
	if player.GetItemByIndex(5, 3535) == nil then		--判断玩家是否已经拥有该itme
		player.AddItem(5, 3535)
	end
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["Level10"].. "\n" ..
		LEVELUP_STRING_TABLE["Level15"].. "\n" ..
		LEVELUP_STRING_TABLE["Level16"].. "\n" ..
		LEVELUP_STRING_TABLE["Level20"].. "\n" ..
		LEVELUP_STRING_TABLE["Level25"].. "\n" ..
		LEVELUP_STRING_TABLE["Level30"].. "\n" ..
		LEVELUP_STRING_TABLE["Level32"].. "\n" ..
		LEVELUP_STRING_TABLE["Level35"].. "\n" ..
		LEVELUP_STRING_TABLE["Level40"].. "\n" ..
		LEVELUP_STRING_TABLE["Level45"].. "\n" ..
		LEVELUP_STRING_TABLE["Level50"].. "\n" ..
		LEVELUP_STRING_TABLE["Level55"].. "\n" ..
		LEVELUP_STRING_TABLE["Level60"].. "\n" ..
		LEVELUP_STRING_TABLE["Level65"].. "\n" ..
		LEVELUP_STRING_TABLE["Level70"].. "\n" ..
		LEVELUP_STRING_TABLE["Level75"],
		--LEVELUP_STRING_TABLE["Level80"],
		"GetProfession3Course10",
		"GetProfession3Course15",
		"GetProfession3Course16",
		"GetProfession3Course20",
		"GetProfession3Course25",
		"GetProfession3Course30",
		"GetProfession3Course32",
		"GetProfession3Course35",
		"GetProfession3Course40",
		"GetProfession3Course45",
		"GetProfession3Course50",
		"GetProfession3Course55",
		"GetProfession3Course60",
		"GetProfession3Course65",
		"GetProfession3Course70",
		"GetProfession3Course75"
		--"GetProfession3Course80"
	)
end

function GetProfession8Course10(player)
	GetProfession8Course(player, 10)
end
function GetProfession8Course15(player)
	GetProfession8Course(player, 15)
end
function GetProfession8Course16(player)
	GetProfession8Course(player, 16)
end
function GetProfession8Course20(player)
	GetProfession8Course(player, 20)
end
function GetProfession8Course25(player)
	GetProfession8Course(player, 25)
end
function GetProfession8Course30(player)
	GetProfession8Course(player, 30)
end
function GetProfession8Course32(player)
	GetProfession8Course(player, 32)
end
function GetProfession8Course35(player)
	GetProfession8Course(player, 35)
end
function GetProfession8Course40(player)
	GetProfession8Course(player, 40)
end
function GetProfession8Course45(player)
	GetProfession8Course(player, 45)
end
function GetProfession8Course50(player)
	GetProfession8Course(player, 50)
end
function GetProfession8Course55(player)
	GetProfession8Course(player, 55)
end
function GetProfession8Course60(player)
	GetProfession8Course(player, 60)
end
function GetProfession8Course65(player)
	GetProfession8Course(player, 65)
end
function GetProfession8Course70(player)
	GetProfession8Course(player, 70)
end
function GetProfession8Course75(player)
	GetProfession8Course(player, 75)
end
function GetProfession8Course80(player)
	GetProfession8Course(player, 80)
end
function FXLevelUpOEM(player)
	local nLevel, nExp = player.GetProfessionLevel(9)
	if nLevel < 10 then
		player.LearnProfession(9)
	end
	if player.GetItemByIndex(5, 3535) == nil then		--判断玩家是否已经拥有该itme
		player.AddItem(5, 3535)
	end
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["Level10"].. "\n" ..
		LEVELUP_STRING_TABLE["Level15"].. "\n" ..
		LEVELUP_STRING_TABLE["Level16"].. "\n" ..
		LEVELUP_STRING_TABLE["Level20"].. "\n" ..
		LEVELUP_STRING_TABLE["Level25"].. "\n" ..
		LEVELUP_STRING_TABLE["Level30"].. "\n" ..
		LEVELUP_STRING_TABLE["Level32"].. "\n" ..
		LEVELUP_STRING_TABLE["Level35"].. "\n" ..
		LEVELUP_STRING_TABLE["Level40"].. "\n" ..
		LEVELUP_STRING_TABLE["Level45"].. "\n" ..
		LEVELUP_STRING_TABLE["Level50"].. "\n" ..
		LEVELUP_STRING_TABLE["Level55"].. "\n" ..
		LEVELUP_STRING_TABLE["Level60"].. "\n" ..
		LEVELUP_STRING_TABLE["Level65"].. "\n" ..
		LEVELUP_STRING_TABLE["Level70"].. "\n" ..
		LEVELUP_STRING_TABLE["Level75"],
		--LEVELUP_STRING_TABLE["Level80"],
		"GetProfession3Course10",
		"GetProfession3Course15",
		"GetProfession3Course16",
		"GetProfession3Course20",
		"GetProfession3Course25",
		"GetProfession3Course30",
		"GetProfession3Course32",
		"GetProfession3Course35",
		"GetProfession3Course40",
		"GetProfession3Course45",
		"GetProfession3Course50",
		"GetProfession3Course55",
		"GetProfession3Course60",
		"GetProfession3Course65",
		"GetProfession3Course70",
		"GetProfession3Course75"
		--"GetProfession3Course80"
	)
end

function GetProfession9Course10(player)
	GetProfession9Course(player, 10)
end
function GetProfession9Course15(player)
	GetProfession9Course(player, 15)
end
function GetProfession9Course16(player)
	GetProfession9Course(player, 16)
end
function GetProfession9Course20(player)
	GetProfession9Course(player, 20)
end
function GetProfession9Course25(player)
	GetProfession9Course(player, 25)
end
function GetProfession9Course30(player)
	GetProfession9Course(player, 30)
end
function GetProfession9Course32(player)
	GetProfession9Course(player, 32)
end
function GetProfession9Course35(player)
	GetProfession9Course(player, 35)
end
function GetProfession9Course40(player)
	GetProfession9Course(player, 40)
end
function GetProfession9Course45(player)
	GetProfession9Course(player, 45)
end
function GetProfession9Course50(player)
	GetProfession9Course(player, 50)
end
function GetProfession9Course55(player)
	GetProfession9Course(player, 55)
end
function GetProfession9Course60(player)
	GetProfession9Course(player, 60)
end
function GetProfession9Course65(player)
	GetProfession9Course(player, 65)
end
function GetProfession9Course70(player)
	GetProfession9Course(player, 70)
end
function GetProfession9Course75(player)
	GetProfession9Course(player, 75)
end
function GetProfession9Course80(player)
	GetProfession9Course(player, 80)
end
function DXLevelUpOEM(player)
	local nLevel, nExp = player.GetProfessionLevel(10)
	if nLevel < 10 then
		player.LearnProfession(10)
	end
	if player.GetItemByIndex(5, 3535) == nil then		--判断玩家是否已经拥有该itme
		player.AddItem(5, 3535)
	end
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["Level10"].. "\n" ..
		LEVELUP_STRING_TABLE["Level15"].. "\n" ..
		LEVELUP_STRING_TABLE["Level16"].. "\n" ..
		LEVELUP_STRING_TABLE["Level20"].. "\n" ..
		LEVELUP_STRING_TABLE["Level25"].. "\n" ..
		LEVELUP_STRING_TABLE["Level30"].. "\n" ..
		LEVELUP_STRING_TABLE["Level32"].. "\n" ..
		LEVELUP_STRING_TABLE["Level35"].. "\n" ..
		LEVELUP_STRING_TABLE["Level40"].. "\n" ..
		LEVELUP_STRING_TABLE["Level45"].. "\n" ..
		LEVELUP_STRING_TABLE["Level50"].. "\n" ..
		LEVELUP_STRING_TABLE["Level55"].. "\n" ..
		LEVELUP_STRING_TABLE["Level60"].. "\n" ..
		LEVELUP_STRING_TABLE["Level65"].. "\n" ..
		LEVELUP_STRING_TABLE["Level70"].. "\n" ..
		LEVELUP_STRING_TABLE["Level75"],
		--LEVELUP_STRING_TABLE["Level80"],
		"GetProfession3Course10",
		"GetProfession3Course15",
		"GetProfession3Course16",
		"GetProfession3Course20",
		"GetProfession3Course25",
		"GetProfession3Course30",
		"GetProfession3Course32",
		"GetProfession3Course35",
		"GetProfession3Course40",
		"GetProfession3Course45",
		"GetProfession3Course50",
		"GetProfession3Course55",
		"GetProfession3Course60",
		"GetProfession3Course65",
		"GetProfession3Course70",
		"GetProfession3Course75"
		--"GetProfession3Course80"
	)
end

function GetProfession10Course10(player)
	GetProfession10Course(player, 10)
end
function GetProfession10Course15(player)
	GetProfession10Course(player, 15)
end
function GetProfession10Course16(player)
	GetProfession10Course(player, 16)
end
function GetProfession10Course20(player)
	GetProfession10Course(player, 20)
end
function GetProfession10Course25(player)
	GetProfession10Course(player, 25)
end
function GetProfession10Course30(player)
	GetProfession10Course(player, 30)
end
function GetProfession10Course32(player)
	GetProfession10Course(player, 32)
end
function GetProfession10Course35(player)
	GetProfession10Course(player, 35)
end
function GetProfession10Course40(player)
	GetProfession10Course(player, 40)
end
function GetProfession10Course45(player)
	GetProfession10Course(player, 45)
end
function GetProfession10Course50(player)
	GetProfession10Course(player, 50)
end
function GetProfession10Course55(player)
	GetProfession10Course(player, 55)
end
function GetProfession10Course60(player)
	GetProfession10Course(player, 60)
end
function GetProfession10Course65(player)
	GetProfession10Course(player, 65)
end
function GetProfession10Course70(player)
	GetProfession10Course(player, 70)
end
function GetProfession10Course75(player)
	GetProfession10Course(player, 75)
end
function GetProfession10Course80(player)
	GetProfession10Course(player, 80)
end
function ZJLevelUpOEM(player)
	local nLevel, nExp = player.GetProfessionLevel(11)
	if nLevel < 10 then
		player.LearnProfession(11)
	end
	if player.GetItemByIndex(5, 3535) == nil then		--判断玩家是否已经拥有该itme
		player.AddItem(5, 3535)
	end
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["Level10"].. "\n" ..
		LEVELUP_STRING_TABLE["Level15"].. "\n" ..
		LEVELUP_STRING_TABLE["Level16"].. "\n" ..
		LEVELUP_STRING_TABLE["Level20"].. "\n" ..
		LEVELUP_STRING_TABLE["Level25"].. "\n" ..
		LEVELUP_STRING_TABLE["Level30"].. "\n" ..
		LEVELUP_STRING_TABLE["Level32"].. "\n" ..
		LEVELUP_STRING_TABLE["Level35"].. "\n" ..
		LEVELUP_STRING_TABLE["Level40"].. "\n" ..
		LEVELUP_STRING_TABLE["Level45"].. "\n" ..
		LEVELUP_STRING_TABLE["Level50"].. "\n" ..
		LEVELUP_STRING_TABLE["Level55"].. "\n" ..
		LEVELUP_STRING_TABLE["Level60"].. "\n" ..
		LEVELUP_STRING_TABLE["Level65"].. "\n" ..
		LEVELUP_STRING_TABLE["Level70"].. "\n" ..
		LEVELUP_STRING_TABLE["Level75"],
		--LEVELUP_STRING_TABLE["Level80"],
		"GetProfession3Course10",
		"GetProfession3Course15",
		"GetProfession3Course16",
		"GetProfession3Course20",
		"GetProfession3Course25",
		"GetProfession3Course30",
		"GetProfession3Course32",
		"GetProfession3Course35",
		"GetProfession3Course40",
		"GetProfession3Course45",
		"GetProfession3Course50",
		"GetProfession3Course55",
		"GetProfession3Course60",
		"GetProfession3Course65",
		"GetProfession3Course70",
		"GetProfession3Course75"
		--"GetProfession3Course80"
	)
end

function GetProfession11Course10(player)
	GetProfession11Course(player, 10)
end
function GetProfession11Course15(player)
	GetProfession11Course(player, 15)
end
function GetProfession11Course16(player)
	GetProfession11Course(player, 16)
end
function GetProfession11Course20(player)
	GetProfession11Course(player, 20)
end
function GetProfession11Course25(player)
	GetProfession11Course(player, 25)
end
function GetProfession11Course30(player)
	GetProfession11Course(player, 30)
end
function GetProfession11Course32(player)
	GetProfession11Course(player, 32)
end
function GetProfession11Course35(player)
	GetProfession11Course(player, 35)
end
function GetProfession11Course40(player)
	GetProfession11Course(player, 40)
end
function GetProfession11Course45(player)
	GetProfession11Course(player, 45)
end
function GetProfession11Course50(player)
	GetProfession11Course(player, 50)
end
function GetProfession11Course55(player)
	GetProfession11Course(player, 55)
end
function GetProfession11Course60(player)
	GetProfession11Course(player, 60)
end
function GetProfession11Course65(player)
	GetProfession11Course(player, 65)
end
function GetProfession11Course70(player)
	GetProfession11Course(player, 70)
end
function GetProfession11Course75(player)
	GetProfession11Course(player, 75)
end
function GetProfession11Course80(player)
	GetProfession11Course(player, 80)
end
function ReFullThewAndStamOEM(player)
	player.nCurrentThew = player.nMaxThew
	player.nCurrentStamina = player.nMaxStamina
	player.SendSystemMessage(GetEditorString(2, 8042))
end

function ForgetProfessionOEM(player)
	for i = 1, 11 do
		local nLevel, nExp = player.GetProfessionLevel(i)
		if nLevel > 10 then
			player.ForgetProfession(i)
		end
	end
	player.SendSystemMessage(GetEditorString(2, 8041))
end

function CallCraftShop(player)				--call生活技能材料商店
	player.OpenWindow(TARGET.PLAYER, player.dwID,
		LEVELUP_STRING_TABLE["PRtiaoweiNpc"].. "\n" ..
		LEVELUP_STRING_TABLE["PRshucaiNpc"].. "\n" ..
		LEVELUP_STRING_TABLE["FRcailiaoNpc"].. "\n" ..
		LEVELUP_STRING_TABLE["YScailiaoNpc"].. "\n" ..
		LEVELUP_STRING_TABLE["YDcailiaoNpc"].. "\n" ..
		LEVELUP_STRING_TABLE["DZcailiaoNpc"].. "\n" ..
		LEVELUP_STRING_TABLE["ZahuoNpc"].. "\n" ..
		LEVELUP_STRING_TABLE["JiuNpc"],
		"GetPRtiaoweiNpc",
		"GetPRshucaiNpc",
		"GetFRcailiaoNpc",
		"GetYScailiaoNpc",
		"GetYDcailiaoNpc",
		"GetDZcailiaoNpc",
		"GetZahuoNpc",
		"GetJiuNpc"
	)
end

function GetPRtiaoweiNpc(player)
	local scene = player.GetScene()
	local PRtiaoweiNpc = scene.CreateNpc(3107, player.nX + 100, player.nY + 100, player.nZ, 0, 4800)
	PRtiaoweiNpc.SetDisappearFrames(16 * 300, false)
	local PRDoodad = scene.CreateDoodad(183, player.nX + 200, player.nY + 200, player.nZ, 0, 4800)
	PRDoodad.SetDisappearFrames(16 * 300, false)
end

function GetPRshucaiNpc(player)
	local scene = player.GetScene()
	local PRshucaiNpc = scene.CreateNpc(3119, player.nX + 0, player.nY + 100, player.nZ, 0, 4800)
	PRshucaiNpc.SetDisappearFrames(16 * 300, false)
	local PRDoodad = scene.CreateDoodad(183, player.nX + 100, player.nY + 200, player.nZ, 0, 4800)
	PRDoodad.SetDisappearFrames(16 * 300, false)
end

function GetFRcailiaoNpc(player)
	local scene = player.GetScene()
	local FRcailiaoNpc = scene.CreateNpc(3109, player.nX-100, player.nY + 100, player.nZ, 0, 4800)
	FRcailiaoNpc.SetDisappearFrames(16 * 300, false)
	local FRDoodad = scene.CreateDoodad(342, player.nX-0, player.nY + 200, player.nZ, 0, 4800)
	FRDoodad.SetDisappearFrames(16 * 300, false)
end

function GetYScailiaoNpc(player)
	local scene = player.GetScene()
	local YScailiaoNpc = scene.CreateNpc(3120, player.nX + 100, player.nY-100, player.nZ, 0, 4800)
	YScailiaoNpc.SetDisappearFrames(16 * 300, false)
	local YSDoodad = scene.CreateDoodad(344, player.nX + 200, player.nY-0, player.nZ, 0, 4800)
	YSDoodad.SetDisappearFrames(16 * 300, false)
end

function GetYDcailiaoNpc(player)
	local scene = player.GetScene()
	local YDcailiaoNpc = scene.CreateNpc(3118, player.nX + 0, player.nY-100, player.nZ, 0, 4800)
	YDcailiaoNpc.SetDisappearFrames(16 * 300, false)
end

function GetDZcailiaoNpc(player)
	local scene = player.GetScene()
	local DZcailiaoNpc = scene.CreateNpc(3699, player.nX-100, player.nY-100, player.nZ, 0, 4800)
	DZcailiaoNpc.SetDisappearFrames(16 * 300, false)
	local DZDoodad = scene.CreateDoodad(343, player.nX + 20, player.nY + 20, player.nZ, 0, 4800)
	DZDoodad.SetDisappearFrames(16 * 300, false)
end

function GetZahuoNpc(player)
	local scene = player.GetScene()
	local ZahuoNpc = scene.CreateNpc(3728, player.nX + 100, player.nY + 0, player.nZ, 0, 4800)
	ZahuoNpc.SetDisappearFrames(16 * 300, false)
end

function GetJiuNpc(player)
	local scene = player.GetScene()
	local JiuNpc = scene.CreateNpc(3535, player.nX-100, player.nY + 0, player.nZ, 0, 4800)
	JiuNpc.SetDisappearFrames(16 * 300, false)
end

function TransportParty1(player)
	TransportParty(player, 1)
end

function TransportParty2(player)
	TransportParty(player, 2)
end

function TransportParty3(player)
	TransportParty(player, 3)
end

function TransportParty4(player)
	TransportParty(player, 4)
end

function TransportParty(player, nOrder)
	local tParty = player.GetPartyMemberList()
	for k, v in pairs(tParty) do
		if v == player.dwID then
			nOrder = nOrder + 1
		else
			if k == nOrder then
				local partyplayer = GetPlayer(v)
				if partyplayer then		
					local scene = player.GetScene()
					local partyscene = partyplayer.GetScene()
					if scene.dwMapID == partyscene.dwMapID and scene.szMapCopyIndex == partyscene.szMapCopyIndex then
						player.SetPosition(partyplayer.nX, partyplayer.nY, partyplayer.nZ)
						return
					else
						player.SwitchMap(partyscene.dwMapID, partyscene.szMapCopyIndex, partyplayer.nX, partyplayer.nY, partyplayer.nZ)
						return 
					end
				end
			end
		end
	end
	--队伍里没有这么多人
	player.SendSystemMessage(GetEditorString(2, 8040))
end

function CallBattleField(player)
	local scene = player.GetScene()
	if scene then
		scene.CreateNpc(5097, player.nX, player.nY, player.nZ, 0, -1)
	end
end

tVenationSkillTable = 
{
	{dwSkillID = 60, RandVenationID = 1}, --任脉基础点
	{dwSkillID = 62, RandVenationID = 1},
	{dwSkillID = 63, RandVenationID = 1},
	{dwSkillID = 64, RandVenationID = 1},
	{dwSkillID = 65, RandVenationID = 1},
	{dwSkillID = 66, RandVenationID = 1},
	{dwSkillID = 67, RandVenationID = 1},
	{dwSkillID = 68, RandVenationID = 1},
	{dwSkillID = 69, RandVenationID = 1},
	{dwSkillID = 70, RandVenationID = 1},
	{dwSkillID = 71, RandVenationID = 1},
	{dwSkillID = 72, RandVenationID = 1},
	{dwSkillID = 73, RandVenationID = 1},
	{dwSkillID = 74, RandVenationID = 1},
	{dwSkillID = 75, RandVenationID = 1},
	{dwSkillID = 76, RandVenationID = 1},

	{dwSkillID = 60, RandVenationID = 3}, --任脉基础点
	{dwSkillID = 77, RandVenationID = 3},
	{dwSkillID = 78, RandVenationID = 3},
	{dwSkillID = 79, RandVenationID = 3},
	{dwSkillID = 80, RandVenationID = 3},
	{dwSkillID = 1196, RandVenationID = 3},
	{dwSkillID = 82, RandVenationID = 3},
	{dwSkillID = 83, RandVenationID = 3},
	{dwSkillID = 84, RandVenationID = 3},
	{dwSkillID = 85, RandVenationID = 3},
	{dwSkillID = 86, RandVenationID = 3},
	{dwSkillID = 87, RandVenationID = 3},
	{dwSkillID = 88, RandVenationID = 3},
	{dwSkillID = 89, RandVenationID = 3},
	{dwSkillID = 90, RandVenationID = 3},
	
	{dwSkillID = 91, RandVenationID = 4}, --督脉基础点
	{dwSkillID = 92, RandVenationID = 4},
	{dwSkillID = 95, RandVenationID = 4},
	{dwSkillID = 99, RandVenationID = 4},
	{dwSkillID = 112, RandVenationID = 4},
	{dwSkillID = 115, RandVenationID = 4},
	
	{dwSkillID = 91, RandVenationID = 5}, --督脉基础点
	{dwSkillID = 93, RandVenationID = 5},
	{dwSkillID = 96, RandVenationID = 5},
	{dwSkillID = 97, RandVenationID = 5},
	{dwSkillID = 110, RandVenationID = 5},
	{dwSkillID = 113, RandVenationID = 5},
	{dwSkillID = 116, RandVenationID = 5},

	{dwSkillID = 91, RandVenationID = 6}, --督脉基础点
	{dwSkillID = 94, RandVenationID = 6},
	{dwSkillID = 98, RandVenationID = 6},
	{dwSkillID = 111, RandVenationID = 6},
	{dwSkillID = 114, RandVenationID = 6},
	{dwSkillID = 117, RandVenationID = 6},
	
	{dwSkillID = 118, RandVenationID = 7}, --带脉基础点
	{dwSkillID = 120, RandVenationID = 7},
	{dwSkillID = 126, RandVenationID = 7},
	{dwSkillID = 128, RandVenationID = 7},
	{dwSkillID = 153, RandVenationID = 7},
	{dwSkillID = 155, RandVenationID = 7},
	                                  
	{dwSkillID = 118, RandVenationID = 8}, --带脉基础点
	{dwSkillID = 119, RandVenationID = 8},
	{dwSkillID = 121, RandVenationID = 8},
	{dwSkillID = 122, RandVenationID = 8},
	{dwSkillID = 123, RandVenationID = 8},
	{dwSkillID = 124, RandVenationID = 8},
	{dwSkillID = 127, RandVenationID = 8},
	{dwSkillID = 129, RandVenationID = 8},
	{dwSkillID = 154, RandVenationID = 8},

	{dwSkillID = 156, RandVenationID = 9}, --冲脉基础点
	{dwSkillID = 158, RandVenationID = 9},
	{dwSkillID = 163, RandVenationID = 9},
	{dwSkillID = 165, RandVenationID = 9},
	{dwSkillID = 167, RandVenationID = 9},
	{dwSkillID = 169, RandVenationID = 9},
	                                  
	{dwSkillID = 156, RandVenationID = 10}, --冲脉基础点
	{dwSkillID = 157, RandVenationID = 10},
	{dwSkillID = 159, RandVenationID = 10},
	{dwSkillID = 160, RandVenationID = 10},
	{dwSkillID = 161, RandVenationID = 10},
	{dwSkillID = 162, RandVenationID = 10},
	{dwSkillID = 164, RandVenationID = 10},
	{dwSkillID = 166, RandVenationID = 10},
	{dwSkillID = 168, RandVenationID = 10},


};

function LearnVenation(player, RandVenetionID	)			--按照环通编号打通经脉。
	for i = 1, table.getn(tVenationSkillTable) do
		if RandVenetionID == tVenationSkillTable[i].RandVenationID then
			local dwSkillID = tVenationSkillTable[i].dwSkillID
			local nSkillLevel = player.GetSkillLevel(dwSkillID)

			for j = 1, 5 do 
				player.LearnSkill(dwSkillID);
			end 
		end
	end	
end

function LearnVenation_1(player)
	LearnVenation(player, 1)
end

function LearnVenation_2(player)
	LearnVenation(player, 1)
end

function LearnVenation_3(player)
	LearnVenation(player, 3)
end

function LearnVenation_4(player)
	LearnVenation(player, 4)
end

function LearnVenation_5(player)
	LearnVenation(player, 5)
end

function LearnVenation_6(player)
	LearnVenation(player, 6)
end

function LearnVenation_7(player)
	LearnVenation(player, 7)
end

function LearnVenation_8(player)
	LearnVenation(player, 8)
end

function LearnVenation_9(player)
	LearnVenation(player, 9)
end

function LearnVenation_10(player)
	LearnVenation(player, 10)
end


--玩家等级和技能的历程获得,输入等级,可获得人物经验和所有应当学会的技能
function GetStandardCourse(player, nCourseLevel)
	local ntSkillRealizationSize = table.getn(tSkillRealization)
	local ntSkillSeriesSize = table.getn(tSkillSeries)
	local nPlayerLevel = player.nLevel
	table.sort(tSkillRealization, Rank) --调用函数为tSkillRealization表从小到大排序
	--增加玩家经验至指定级别
	if nPlayerLevel < nCourseLevel then 
--		player.SetMaxLevel(nCourseLevel)
		for j = nPlayerLevel, nCourseLevel - 1 do
			player.AddExp(tExp[j].nExp)
		end
	end	
	
	if nCourseLevel > player.nLevel then
		nCourseLevel = player.nLevel 
	end

	--学习所有套路
	for i = 1, ntSkillSeriesSize do
		local nSkillSeriesLearned = player.GetSkillLevel(tSkillSeries[i].dwSkillSeriesID)
		if nSkillSeriesLearned == 0 then
			player.LearnSkill(tSkillSeries[i].dwSkillSeriesID)
		end
	end
	--增加玩家技能至指定级别
	--学习各套路下技能
	for i = 1, ntSkillRealizationSize do 
		if nCourseLevel < tSkillRealization[i].nLevelUpPlayerLevel then
			break
		end
		
		local nSkillDiscrepancy = tSkillRealization[i].nSkillLevel - player.GetSkillLevel(tSkillRealization[i].dwSkillID)
		if nSkillDiscrepancy > 0 then 
			for j = 1, nSkillDiscrepancy do 
				player.LearnSkill(tSkillRealization[i].dwSkillID)
			end
		end
	end
	--学习藏剑秘籍
	for i = 545, 632 do
		player.AddSkillRecipe(i, 1)
		player.ActiveSkillRecipe(i, 1)
	end	
	--学习纯阳秘籍
	for i = 10, 117 do
		player.AddSkillRecipe(i, 1)
		player.ActiveSkillRecipe(i, 1)
	end	
	--学习七秀秘籍
	for i = 131, 207 do
		player.AddSkillRecipe(i, 1)
		player.ActiveSkillRecipe(i, 1)
	end	
	--学习少林秘籍
	for i = 218, 325 do
		player.AddSkillRecipe(i, 1)
		player.ActiveSkillRecipe(i, 1)
	end	
	--学习唐门秘籍
	for i = 819, 913 do
		player.AddSkillRecipe(i, 1)
		player.ActiveSkillRecipe(i, 1)
	end
	--学习天策秘籍
	for i = 326, 413 do
		player.AddSkillRecipe(i, 1)
		player.ActiveSkillRecipe(i, 1)
	end
	--学习万花秘籍	
	for i = 414, 501 do
		player.AddSkillRecipe(i, 1)
		player.ActiveSkillRecipe(i, 1)
	end
	--学习五毒秘籍
	for i = 718, 805 do
		player.AddSkillRecipe(i, 1)
		player.ActiveSkillRecipe(i, 1)
	end
	--学习明教秘籍
	for i = 984, 1071 do
		player.AddSkillRecipe(i, 1)
		player.ActiveSkillRecipe(i, 1)
	end
end



--function Getitembylevel(player, nSetID,nKf,nKfTypeCtm,i)
--	--local nLevelDis = 5		--默认等级差为5
--	--if nKfType == 3 then
--	--nLevelDis = 10
--	--end
--	--if nKfType == 4 then
--	--nLevelDis = 15
--	--end	
--	--for i = 1 ,ntCourseItemSize do
--	--local nTemLevelDis = nCourseLevel -tCourseItem[i].nLevel 
--		
--		--if nTemLevelDis >= -4 and nTemLevelDis < nLevelDis then	--判断等级差
--		print(78787878787878)
--		if nSetID == tCourseItem[i].nSetID then-- 判断套装
--			--	if nSchool == tCourseItem[i].nSchool then		--判断门派
--			if nKf == tCourseItem[i].nKf then		--判断类型
--				--print(tCourseItem[i].nKf)
--				if nKfTypeCtm == tCourseItem[i].nKfTypeCtm then		--判断细分类型	
--						--print( tCourseItem[i].nKfTypeCtm)
--					if player.GetItemByIndex(tCourseItem[i].nItemTabType , tCourseItem[i].nID) == nil then		--判断玩家是否已经拥有该itme
--						player.AddItem(tCourseItem[i].nItemTabType , tCourseItem[i].nID)
--					end
--				--end
--				end
--			end
--		end
--end


--玩家获得当前级别相搭配的装备,分别满足多个门派和不同作用需求
--获得装备与人物等级差向下兼容级别数目
--内功 (基础) (PVE) 5级
--内功 (治疗) 10级
--外功 (基础)(PVE) 5级
--外功 (防御) 15级
--nKfType分配		
--通用 0 纯阳 1 七秀 2 少林 3 天策 4 万花 5
--内1 外2 治3 防4
--基础0 伤害命中1 特殊2 伤害暴击3 治疗持续4 治疗力5 防御基础6 防御闪避7 防御拆招8 防御抗性9
--nKfType - 基础通用0 伤害1 会心2 治疗3 防御4
function GetCourseItem1(player, nCourseLevel, nSetID, nKf, nKfTypeCtm)
--function GetCourseItem(player,nCourseLevel,nSetID,nSchool,nKf,nKfTypeCtm)
	local ntCourseItemSize = table.getn(tCourseItem)  --不包含品质(紫色,白色),不包含门派(通用,--)
	for i = 1, ntCourseItemSize do
		--print(55555555555555)
		--print(tCourseItem[i].nItemTabType.."--"..tCourseItem[i].nID.."等级="..tCourseItem[i].nLevel.."路线="..tCourseItem[i].nKfTypeCtm)
		if tCourseItem[i].nLevel >= 1 and tCourseItem[i].nLevel <= 65  and tCourseItem[i].nLevel >= player.nLevel then
			if nSetID == tCourseItem[i].nSetID then-- 判断套装
				--	if nSchool == tCourseItem[i].nSchool then		--判断门派
				if nKf == tCourseItem[i].nKf then		--判断类型
					--print(tCourseItem[i].nKf)
					if nKfTypeCtm == tCourseItem[i].nKfTypeCtm then		--判断细分类型	
						--print( tCourseItem[i].nKfTypeCtm)
						if player.GetItemByIndex(tCourseItem[i].nItemTabType, tCourseItem[i].nID) == nil then		--判断玩家是否已经拥有该itme
							player.AddItem(tCourseItem[i].nItemTabType, tCourseItem[i].nID)
						end
					end
				end
			end 	
		end
	end
end
function GetCourseItem2(player, nCourseLevel, nSetID, nKf, nKfTypeCtm)
--function GetCourseItem(player,nCourseLevel,nSetID,nSchool,nKf,nKfTypeCtm)
	local ntCourseItemSize = table.getn(tCourseItem)  --不包含品质(紫色,白色),不包含门派(通用,--)
	for i = 1, ntCourseItemSize do
		if tCourseItem[i].nLevel >= 66 and tCourseItem[i].nLevel <= 85  and tCourseItem[i].nLevel >= player.nLevel then 
			--Getitembylevel(player, nSetID,nKf,nKfTypeCtm,i)
			if nSetID == tCourseItem[i].nSetID then-- 判断套装
				--	if nSchool == tCourseItem[i].nSchool then		--判断门派
				if nKf == tCourseItem[i].nKf then		--判断类型
					--print(tCourseItem[i].nKf)
					if nKfTypeCtm == tCourseItem[i].nKfTypeCtm then		--判断细分类型	
						--print( tCourseItem[i].nKfTypeCtm)
						if player.GetItemByIndex(tCourseItem[i].nItemTabType, tCourseItem[i].nID) == nil then		--判断玩家是否已经拥有该itme
							player.AddItem(tCourseItem[i].nItemTabType, tCourseItem[i].nID)
						end
					end
				end
			end
		end
	end
end
function GetCourseItem3(player, nCourseLevel, nSetID, nKf, nKfTypeCtm)
--function GetCourseItem(player,nCourseLevel,nSetID,nSchool,nKf,nKfTypeCtm)
	local ntCourseItemSize = table.getn(tCourseItem)  --不包含品质(紫色,白色),不包含门派(通用,--)
	for i = 1, ntCourseItemSize do
		if tCourseItem[i].nLevel >= 86 and tCourseItem[i].nLevel <= 115  and tCourseItem[i].nLevel >= player.nLevel then 
			--Getitembylevel(player, nSetID,nKf,nKfTypeCtm,i)
			if nSetID == tCourseItem[i].nSetID then-- 判断套装
				--	if nSchool == tCourseItem[i].nSchool then		--判断门派
				if nKf == tCourseItem[i].nKf then		--判断类型
					--print(tCourseItem[i].nKf)
					if nKfTypeCtm == tCourseItem[i].nKfTypeCtm then		--判断细分类型	
						--print( tCourseItem[i].nKfTypeCtm)
						if player.GetItemByIndex(tCourseItem[i].nItemTabType, tCourseItem[i].nID) == nil then		--判断玩家是否已经拥有该itme
							player.AddItem(tCourseItem[i].nItemTabType, tCourseItem[i].nID)
						end
					end
				end
			end
		end
	end
end
function GetCourseItem4(player, nCourseLevel, nSetID, nKf, nKfTypeCtm)
--function GetCourseItem(player,nCourseLevel,nSetID,nSchool,nKf,nKfTypeCtm)
	local ntCourseItemSize = table.getn(tCourseItem)  --不包含品质(紫色,白色),不包含门派(通用,--)
	for i = 1, ntCourseItemSize do
		if tCourseItem[i].nLevel >= 116 and tCourseItem[i].nLevel <= 145  and tCourseItem[i].nLevel >= player.nLevel then 
			--Getitembylevel(player, nSetID,nKf,nKfTypeCtm,i)
			if nSetID == tCourseItem[i].nSetID then-- 判断套装
				--	if nSchool == tCourseItem[i].nSchool then		--判断门派
				if nKf == tCourseItem[i].nKf then		--判断类型
					--print(tCourseItem[i].nKf)
					if nKfTypeCtm == tCourseItem[i].nKfTypeCtm then		--判断细分类型	
						--print( tCourseItem[i].nKfTypeCtm)
						if player.GetItemByIndex(tCourseItem[i].nItemTabType, tCourseItem[i].nID) == nil then		--判断玩家是否已经拥有该itme
							player.AddItem(tCourseItem[i].nItemTabType, tCourseItem[i].nID)
						end
					end
				end
			end
		end
	end
end
function GetCourseItem5(player, nCourseLevel, nSetID, nKf, nKfTypeCtm)
--function GetCourseItem(player,nCourseLevel,nSetID,nSchool,nKf,nKfTypeCtm)
	local ntCourseItemSize = table.getn(tCourseItem)  --不包含品质(紫色,白色),不包含门派(通用,--)
	for i = 1, ntCourseItemSize do
		if tCourseItem[i].nLevel >= 146 and tCourseItem[i].nLevel <= 175 and tCourseItem[i].nLevel >= player.nLevel then 
			--Getitembylevel(player, nSetID,nKf,nKfTypeCtm,i)
			if nSetID == tCourseItem[i].nSetID then-- 判断套装
				--	if nSchool == tCourseItem[i].nSchool then		--判断门派
				if nKf == tCourseItem[i].nKf then		--判断类型
					--print(tCourseItem[i].nKf)
					if nKfTypeCtm == tCourseItem[i].nKfTypeCtm then		--判断细分类型	
						--print( tCourseItem[i].nKfTypeCtm)
						if player.GetItemByIndex(tCourseItem[i].nItemTabType, tCourseItem[i].nID) == nil then		--判断玩家是否已经拥有该itme
							player.AddItem(tCourseItem[i].nItemTabType, tCourseItem[i].nID)
						end
					end
				end
			end
		end
	end
end
function GetCourseItem0(player, nCourseLevel, nSetID, nKf, nKfTypeCtm, nItemTabType)
	local ntCourseItemSize = table.getn(tCourseItem)  --不包含品质(紫色,白色),不包含门派(通用,--)
	for i = 1, ntCourseItemSize do
		if nSetID == tCourseItem[i].nSetID then	-- 判断套装
			if nKf == tCourseItem[i].nKf then			--判断类型
				--print(tCourseItem[i].nKf)
				if nKfTypeCtm == tCourseItem[i].nKfTypeCtm then		--判断细分类型	
					--print( tCourseItem[i].nKfTypeCtm)
					if player.GetItemByIndex(tCourseItem[i].nItemTabType, tCourseItem[i].nID) == nil then		--判断玩家是否已经拥有该itme
						player.AddItem(tCourseItem[i].nItemTabType, tCourseItem[i].nID)
					end
				end
			end
		end
	end
end
----[[
----local nLevelDis = 5		--默认等级差为5
----if nKfType == 3 then
----nLevelDis = 10
----end
----if nKfType == 4 then
----nLevelDis = 15
----end	
----for i = 1 ,ntCourseItemSize do
----local nTemLevelDis = nCourseLevel -tCourseItem[i].nLevel 
--	
--	--if nTemLevelDis >= -4 and nTemLevelDis < nLevelDis then	--判断等级差
--		if nSetID == tCourseItem[i].nSetID then-- 判断套装
--		--	if nSchool == tCourseItem[i].nSchool then		--判断门派
--				if nKf == tCourseItem[i].nKf then		--判断类型
--			--print(tCourseItem[i].nKf)
--					if nKfTypeCtm == tCourseItem[i].nKfTypeCtm then		--判断细分类型	
--					--print( tCourseItem[i].nKfTypeCtm)
--						 if player.GetItemByIndex(tCourseItem[i].nItemTabType , tCourseItem[i].nID) == nil then		--判断玩家是否已经拥有该itme
--					 	player.AddItem(tCourseItem[i].nItemTabType , tCourseItem[i].nID)
--					 	end
--			--end
--				end
--			end
--		end
--	end
--end
--]]

--		--1-10级只给装备5个基础武器
--	if nCourseLevel < 10 then
--		for i = 0 ,4 do
--			if player.GetItemByIndex(6,100+i) ==nil then
--				player.AddItem(6,100+i,1)
--			end
--		end
--	end


--		--10级之后
--	if nCourseLevel > 9  then
--		for i = 1 , ntCourseWeaponSize do
--			if nCourseLevel < tCourseWeapon[i].nLevel then
--				break
--			end
--			if nCourseLevel - tCourseWeapon[i].nLevel < 5 then
--				if player.GetItemByIndex(tCourseWeapon[i].nType , tCourseWeapon[i].dwID) == nil then
--					player.AddItem(tCourseWeapon[i].nType , tCourseWeapon[i].dwID)
--				end
--			end
--		end
--		for i = 1, ntCourseArmorSize do
--			if nCourseLevel < tCourseArmor[i].nLevel then
--				break
--			end 
--			if nCourseLevel - tCourseArmor[i].nLevel < 5 then
--				if player.GetItemByIndex(tCourseArmor[i].nType , tCourseArmor[i].dwID) == nil then
--					player.AddItem(tCourseArmor[i].nType , tCourseArmor[i].dwID)
--				end
--			end
--		end
--	end


--玩家生活技能的历程获得,输入等级,可获得生活技能经验和对应等级应当学会的生活技能
function GetProfession1Course(player, nCourseLevel)
	local nProfessionID = 1
	local nPlayerLevel = player.nLevel
	local nPlayerLevel, nExp = player.GetProfessionLevel(nProfessionID)
	local nMaxLevel = player.GetProfessionMaxLevel(nProfessionID) or 0

	--增加生活技能经验至指定级别
	if nCourseLevel < 30 then
		player.SetMaxProfessionLevel(nProfessionID, 30)
	elseif nCourseLevel < 50 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 50)
	elseif nCourseLevel < 71 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 70)
	end

	for j = nPlayerLevel, nCourseLevel do
		player.AddProfessionProficiency(nProfessionID, tCollectionExp[j].Exp)
		--local k = tCollectionExp[j].Exp
		--print("Level is "..j..".	nCourseLevel is "..nCourseLevel..". Exp is "..k..".\n")
	end
end

function GetProfession2Course(player, nCourseLevel)
	local nProfessionID = 2
	local nPlayerLevel = player.nLevel
	local nPlayerLevel, nExp = player.GetProfessionLevel(nProfessionID)
	local nMaxLevel = player.GetProfessionMaxLevel(nProfessionID)
	--增加生活技能经验至指定级别
	if nCourseLevel < 30 then
		player.SetMaxProfessionLevel(nProfessionID, 30)
	elseif nCourseLevel < 50 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 50)
	elseif nCourseLevel < 71 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 70)
	end
	for j = nPlayerLevel, nCourseLevel do
		player.AddProfessionProficiency(nProfessionID, tCollectionExp[j].Exp)
	end
end

function GetProfession3Course(player, nCourseLevel)
	local nProfessionID = 3
	local nPlayerLevel = player.nLevel
	local nPlayerLevel, nExp = player.GetProfessionLevel(nProfessionID)
	local nMaxLevel = player.GetProfessionMaxLevel(nProfessionID)
	--增加生活技能经验至指定级别
	if nCourseLevel < 30 then
		player.SetMaxProfessionLevel(nProfessionID, 30)
	elseif nCourseLevel < 50 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 50)
	elseif nCourseLevel < 71 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 70)
	end
	for j = nPlayerLevel, nCourseLevel  do
		player.AddProfessionProficiency(nProfessionID, tCollectionExp[j].Exp)
	end
end

function GetProfession4Course(player, nCourseLevel)
	local nProfessionID = 4
	local nPlayerLevel = player.nLevel
	local nPlayerLevel, nExp = player.GetProfessionLevel(nProfessionID)
	local nMaxLevel = player.GetProfessionMaxLevel(nProfessionID)
	local ntLearnRecipeSize = table.getn(tLearnRecipe)
	--增加生活技能经验至指定级别
	if nCourseLevel < 30 then
		player.SetMaxProfessionLevel(nProfessionID, 30)
	elseif nCourseLevel < 50 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 50)
	elseif nCourseLevel < 71 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 70)
	end
	for j = nPlayerLevel, nCourseLevel  do
		player.AddProfessionProficiency(nProfessionID, tManufactureExp[j].Exp)
	end
	
	for k = 1, ntLearnRecipeSize do
		if	nCourseLevel > tLearnRecipe[k].Level and tLearnRecipe[k].ProfessionID == nProfessionID then
			local bLearned = player.IsRecipeLearned(tLearnRecipe[k].ProfessionID, tLearnRecipe[k].RecipeID)
			if not bLearned then
				player.LearnRecipe(tLearnRecipe[k].ProfessionID, tLearnRecipe[k].RecipeID)
			end
		end
	end
	
end

function GetProfession5Course(player, nCourseLevel)
	local nProfessionID = 5
	local nPlayerLevel = player.nLevel
	local nPlayerLevel, nExp = player.GetProfessionLevel(nProfessionID)
	local nMaxLevel = player.GetProfessionMaxLevel(nProfessionID)
	local ntLearnRecipeSize = table.getn(tLearnRecipe)
	--增加生活技能经验至指定级别
	if nCourseLevel < 30 then
		player.SetMaxProfessionLevel(nProfessionID, 30)
	elseif nCourseLevel < 50 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 50)
	elseif nCourseLevel < 71 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 70)
	end
	for j = nPlayerLevel, nCourseLevel  do
		player.AddProfessionProficiency(nProfessionID, tManufactureExp[j].Exp)
	end
	
	for k = 1, ntLearnRecipeSize do
		if	nCourseLevel > tLearnRecipe[k].Level and tLearnRecipe[k].ProfessionID == nProfessionID then
			local bLearned = player.IsRecipeLearned(tLearnRecipe[k].ProfessionID, tLearnRecipe[k].RecipeID)
			if not bLearned then
				player.LearnRecipe(tLearnRecipe[k].ProfessionID, tLearnRecipe[k].RecipeID)
			end
		end
	end
	
end

function GetProfession6Course(player, nCourseLevel)
	local nProfessionID = 6
	local nPlayerLevel = player.nLevel
	local nPlayerLevel, nExp = player.GetProfessionLevel(nProfessionID)
	local nMaxLevel = player.GetProfessionMaxLevel(nProfessionID)
	local ntLearnRecipeSize = table.getn(tLearnRecipe)
	--增加生活技能经验至指定级别
	if nCourseLevel < 30 then
		player.SetMaxProfessionLevel(nProfessionID, 30)
	elseif nCourseLevel < 50 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 50)
	elseif nCourseLevel < 71 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 70)
	end
	for j = nPlayerLevel, nCourseLevel  do
		player.AddProfessionProficiency(nProfessionID, tManufactureExp[j].Exp)
	end
	for k = 1, ntLearnRecipeSize do
		if	nCourseLevel > tLearnRecipe[k].Level and tLearnRecipe[k].ProfessionID == nProfessionID then
			local bLearned = player.IsRecipeLearned(tLearnRecipe[k].ProfessionID, tLearnRecipe[k].RecipeID)
			if not bLearned then
				player.LearnRecipe(tLearnRecipe[k].ProfessionID, tLearnRecipe[k].RecipeID)
			end
		end
	end
end

function GetProfession7Course(player, nCourseLevel)
	local nProfessionID = 7
	local nPlayerLevel = player.nLevel
	local nPlayerLevel, nExp = player.GetProfessionLevel(nProfessionID)
	local nMaxLevel = player.GetProfessionMaxLevel(nProfessionID)
	local ntLearnRecipeSize = table.getn(tLearnRecipe)
	--增加生活技能经验至指定级别
	if nCourseLevel < 30 then
		player.SetMaxProfessionLevel(nProfessionID, 30)
	elseif nCourseLevel < 50 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 50)
	elseif nCourseLevel < 71 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 70)
	end
	for j = nPlayerLevel, nCourseLevel  do
		player.AddProfessionProficiency(nProfessionID, tManufactureExp[j].Exp)
	end
	for k = 1, ntLearnRecipeSize do
		if	nCourseLevel > tLearnRecipe[k].Level and tLearnRecipe[k].ProfessionID == nProfessionID then
			local bLearned = player.IsRecipeLearned(tLearnRecipe[k].ProfessionID, tLearnRecipe[k].RecipeID)
			if not bLearned then
				player.LearnRecipe(tLearnRecipe[k].ProfessionID, tLearnRecipe[k].RecipeID)
			end
		end
	end
end

function GetProfession8Course(player, nCourseLevel)
	local nProfessionID = 8
	local nPlayerLevel = player.nLevel
	local nPlayerLevel, nExp = player.GetProfessionLevel(nProfessionID)
	local nMaxLevel = player.GetProfessionMaxLevel(nProfessionID)
	--增加生活技能经验至指定级别
	if nCourseLevel < 30 then
		player.SetMaxProfessionLevel(nProfessionID, 30)
	elseif nCourseLevel < 50 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 50)
	elseif nCourseLevel < 71 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 70)
	end
	for j = nPlayerLevel, nCourseLevel  do
		player.AddProfessionProficiency(nProfessionID, tReadExp[j].Exp)
	end
end

function GetProfession9Course(player, nCourseLevel)
	local nProfessionID = 9
	local nPlayerLevel = player.nLevel
	local nPlayerLevel, nExp = player.GetProfessionLevel(nProfessionID)
	local nMaxLevel = player.GetProfessionMaxLevel(nProfessionID)
	--增加生活技能经验至指定级别
	if nCourseLevel < 30 then
		player.SetMaxProfessionLevel(nProfessionID, 30)
	elseif nCourseLevel < 50 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 50)
	elseif nCourseLevel < 71 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 70)
	end
	for j = nPlayerLevel, nCourseLevel  do
		player.AddProfessionProficiency(nProfessionID, tReadFoxueExp[j].Exp)
	end
end

function GetProfession10Course(player, nCourseLevel)
	local nProfessionID = 10
	local nPlayerLevel = player.nLevel
	local nPlayerLevel, nExp = player.GetProfessionLevel(nProfessionID)
	local nMaxLevel = player.GetProfessionMaxLevel(nProfessionID)
	--增加生活技能经验至指定级别
	if nCourseLevel < 30 then
		player.SetMaxProfessionLevel(nProfessionID, 30)
	elseif nCourseLevel < 50 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 50)
	elseif nCourseLevel < 71 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 70)
	end
	for j = nPlayerLevel, nCourseLevel  do
		player.AddProfessionProficiency(nProfessionID, tReadDaoxueExp[j].Exp)
	end
end

function GetProfession11Course(player, nCourseLevel)
	local nProfessionID = 11
	local nPlayerLevel = player.nLevel
	local nPlayerLevel, nExp = player.GetProfessionLevel(nProfessionID)
	local nMaxLevel = player.GetProfessionMaxLevel(nProfessionID)
	--增加生活技能经验至指定级别
	if nCourseLevel < 30 then
		player.SetMaxProfessionLevel(nProfessionID, 30)
	elseif nCourseLevel < 50 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 50)
	elseif nCourseLevel < 71 and nMaxLevel < nCourseLevel then
		player.SetMaxProfessionLevel(nProfessionID, 70)
	end
	for j = nPlayerLevel, nCourseLevel  do
		player.AddProfessionProficiency(nProfessionID, tReadZajiExp[j].Exp)
	end
end

--玩家等级和技能的历程获得,输入等级,可获得人物经验和该职业所有应当学会的技能
function LevelUpAsYouWish(player, nCourseLevel)
	local nPlayerLevel = player.nLevel
	--增加玩家经验至指定级别
	if nPlayerLevel < nCourseLevel then 
		player.SetMaxLevel(nCourseLevel)
		for j = nPlayerLevel, nCourseLevel - 1 do
			player.AddExp(tExp[j].nExp)
		end
	end
end	

function GetStandardCourseByForce(player, nCourseLevel)
	local ntSkillRealizationSize = table.getn(tSkillRealization)
	local ntSkillSeriesSize = table.getn(tSkillSeries)
	local nPlayerLevel = player.nLevel
	
	if nCourseLevel > player.nLevel then
		nCourseLevel = player.nLevel 
	end

	--学习所有套路
	for i = 1, ntSkillSeriesSize do
		local nSkillSeriesLearned = player.GetSkillLevel(tSkillSeries[i].dwSkillSeriesID)
		if nSkillSeriesLearned == 0 and  (tSkillSeries[i].nSchoolType == player.dwForceID or tSkillSeries[i].nSchoolType == 0) then
			player.LearnSkill(tSkillSeries[i].dwSkillSeriesID)
		end
	end
	--增加玩家技能至指定级别
	--学习各套路下技能
	for i = 1, ntSkillRealizationSize do 
		if nCourseLevel < tSkillRealization[i].nLevelUpPlayerLevel then
			break
		end
		if tSkillRealization[i].nForceID == player.dwForceID or tSkillRealization[i].nForceID == 0 then
			local nSkillDiscrepancy = tSkillRealization[i].nSkillLevel - player.GetSkillLevel(tSkillRealization[i].dwSkillID)
			if nSkillDiscrepancy > 0 then 
				for j = 1, nSkillDiscrepancy do 
					player.LearnSkill(tSkillRealization[i].dwSkillID)
				end
			end
		end
	end	
end

function GetNpcBangHui(player)
	local scene = player.GetScene()
	local BangHuiNpc = scene.CreateNpc(5745, player.nX-100, player.nY + 0, player.nZ, 0, 4800)
	local BangHuiCangKuNpc = scene.CreateNpc(1494, player.nX-100, player.nY + 100, player.nZ, 0, 4800)
	BangHuiNpc.SetDisappearFrames(16 * 300, false)
	BangHuiCangKuNpc.SetDisappearFrames(16 * 300, false)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com