---------------------------------------------------------------------->
-- 脚本名称:	scripts/Include/OnEnterSceneCommon/过地图脚本_奇遇相关.lua
-- 更新时间:	2017/3/20 11:57:31
-- 更新用户:	zhengfeng6
-- 脚本说明:
----------------------------------------------------------------------<
--[[Include("scripts/Map/跟宠系统/include/七秀兔子_data.lua")
Include("scripts/Map/世界奇遇/平生心愿/include/平生心愿_data.lh")
Include("scripts/Map/世界奇遇/艺人奇遇/include/乱世舞姬_data.lua")
Include("scripts/Map/世界奇遇/绿林奇遇/include/Data.lua")
Include("scripts/Map/世界奇遇/护佑苍生/include/护佑苍生_data.lua")
Include("scripts/Map/世界奇遇/天涯无归/include/天涯无归_data.lua")
Include("scripts/Map/世界奇遇/梅花桩/include/梅花桩排名.lua")
Include("scripts/Map/世界奇遇/include/炼狱厨神_data.lua")
Include("scripts/Map/世界奇遇/宠物奇缘奇遇/include/捉妖记_data.lua")--【鱼头】
Include("scripts/Map/世界奇遇/宠物奇缘奇遇/include/红衣歌_data.lua")--【鱼头】
Include("scripts/Map/世界奇遇/宠物奇缘奇遇/include/枫林酒_data.lua")--【鱼头】
Include("scripts/Map/世界奇遇/宠物奇缘奇遇/include/孩童书_data.lua")--【鱼头】
Include("scripts/Map/世界奇遇/宠物奇缘奇遇/include/归乡路_data.lua")--【鱼头】
Include("scripts/Map/世界奇遇/宠物奇缘奇遇/include/胜负局_data.lua")--【鱼头】
Include("scripts/Map/世界奇遇/宠物奇缘奇遇/include/清茗经_data.lua")--【鱼头】
Include("scripts/Map/世界奇遇/include/三尺青锋_data.lua")
Include("scripts/Map/世界奇遇/茶馆奇缘/include/茶馆奇缘_Data.lua")
Include("scripts/Map/世界奇遇/黑白路/include/黑白路_Data.lua")
Include("scripts/Map/世界奇遇/include/寻宝_data.lua")
Include("scripts/Map/世界奇遇/include/阴阳两界_data.lua")
Include("scripts/Map/帮会领地/include/TongDungeonRaid.lh")--]]

Include("scripts/Include/OnEnterSceneCommon/Player_EnterSceneCommon_Include.lua")

-- 此函数运行时间已到20MS，不可添加
function OnEnterSceneCommon_Adventure0(player, scene)
	if not scene then
		scene = player.GetScene()		
	end
	local nStartIndex = BeginTimeStat()
	-- 正文开始
	--清茗经奇遇阶段处理------------
	if player.GetAdventureFlag(608) and not player.GetAdventureFlag(629) then  --scripts/Map/世界奇遇/宠物奇缘奇遇/event/清茗经_山树亭饮茶.lua
		player.SetAdventureFlag(629, true)
	end
	--竹马情奇遇阶段处理------------
	if player.GetAdventureFlag(1076) and not player.GetAdventureFlag(1077) then --scripts/Map/世界奇遇/宠物奇缘奇遇/npc/竹马情_向万景.lua
		player.SetAdventureFlag(1077, true)
	end
	--荆轲刺奇遇阶段处理------------
	if player.GetAdventureFlag(1038) and not player.GetAdventureFlag(1039) then --scripts/Map/世界奇遇/宠物奇缘奇遇/npc/荆轲刺_林暮昭.lua
		player.SetAdventureFlag(1039, true)
	end
	--青草歌奇遇阶段处理------------
	if player.GetAdventureFlag(1236) and not player.GetAdventureFlag(1253) then  --scripts/Map/世界奇遇/宠物奇缘奇遇/npc/青草歌_长老.lua
		player.SetAdventureFlag(1253, true)
	end
	----兽王佩奇遇阶段处理--------
	if player.GetAdventureFlag(1126) and not player.GetAdventureFlag(1127) then
		player.SetAdventureFlag(1127, true)
	end

	if player.GetAdventureFlag(1168) and not player.GetAdventureFlag(1169) then
		player.SetAdventureFlag(1169, true)
	end

	if player.GetAdventureFlag(1170) and not player.GetAdventureFlag(1171) then
		player.SetAdventureFlag(1171, true)
	end
	--艺人奇遇
	g_QYArtis.Artis_qiyuNPC(player, scene)
	--绿林奇遇
	tRobAdventure.CreateNpcEnterMap(scene, player)

	-- 奇遇轻功试练模式，跨地图取消
	if player.IsHaveBuff(10070, 0) then
		player.DelBuff(7838, 1)
	end

	-- 奇遇天涯无归
	Adventure_GirlInWind.OnEnterScene(player, scene)
	-- 奇遇梅花桩
	tMaiHuaZhuangRank.CreateNpcAndDooadEnterMap(player)

	--宠物奇遇，《清茗经》
	Adventure_QINGMINGJING.OnEnterScene(player, scene)
	--宠物奇遇，《胜负局》
	Adventure_SHENGFUJU.OnEnterScene(player, scene)
	--宠物奇遇，《归乡路》
	Adventure_GUIXIANGLU.OnEnterScene(player, scene)
	--宠物奇遇，《孩童书》
	Adventure_HAITONGSHU.OnEnterScene(player, scene)
	--宠物奇遇，《枫林酒》
	Adventure_FENGLINJIU.OnEnterScene(player, scene)
	--宠物奇遇，《红衣歌》
	Adventure_HONGYIGE.OnEnterScene(player, scene)
	--宠物奇遇，《捉妖记》
	Adventure_ZHUOYAOJI.OnEnterScene(player, scene)

	-- 奇遇·三山四海
	g_QYTreasureHunt.CreateNpcEnterMap(player)
	if scene.dwMapID ~= 189 and scene.dwMapID ~= 190 then -- 删除藏宝洞主人标记，只有主人才有机会触发奇遇·三山四海
		player.DelBuff(9139, 1)
	end
	if player.IsHaveBuff(9161, 1) and not player.GetAdventureFlag(1) then -- 开启奇遇剧情
		player.SetTimer(16 * 15, "scripts/Map/世界奇遇/npc/寻宝_玉儿邻居.lua", 0, 0);
	end

	TongDungeonRaid.OnPlayerEnterScene(player, scene)
	-- 奇遇·黑白路
	Adventure_BWRoad.OnEnterScene(player, scene)

	g_QYWeapon.CreateNpcError(player, scene)
	QiZhouNian_JiangHuHuaShan(player)  --七周年江湖画扇掉落
	g_QYYinYang.NPCcreat(player, scene)  --创建奇遇阴阳两界NPC
	g_QYBiaoShi.NPCcreat(player, scene)  --创建护佑苍生NPC
	if scene.dwMapID == 273 or scene.dwMapID == 272 then
		g_QYSpicyFish.Condition(player)  --炼狱水煮鱼添加BUFF
	end
	if scene.dwMapID == 74 or scene.dwMapID == 108 then
		g_QYSpicyFish.NPCcreat(player, scene)
	end
	--茶馆奇缘
	Adventure_TeaHouseAdventure.OnEnterScene(player, scene)

	tQiXiu_Rabbit.CreateNpcEnterMap(player, scene)

		--平生心愿
	Adventure_ReadBookAdventure.OnEnterScene(player, scene)
	
	-- 正文结束
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

function QiZhouNian_JiangHuHuaShan(player)
	local GV = GetGameVersion()
	if not GV then
		return
	end
	local nTime = GetCurrentTime()
	local nStartTime = DateToTime(2011, 8, 27, 7, 0, 0)  --周年庆起始时间
	local nEndTime = DateToTime(2011, 9, 14, 7, 0, 0)  --周年庆结束时间
	if GV.VersionLineName == "zhcn" then --国内版本
		nStartTime = DateToTime(2016, 8, 28, 7, 0, 0)  --周年庆起始时间
		nEndTime = DateToTime(2016, 9, 12, 7, 0, 0)  --周年庆结束时间
	end
	if nStartTime >= nTime or nTime >= nEndTime then
		return  -- 时间限制
	end
	local nBuff_Time = nEndTime - nTime
	if not player.IsHaveBuff(11104, 1) then
		player.AddBuff(0, 99, 11104, 1, nBuff_Time)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com