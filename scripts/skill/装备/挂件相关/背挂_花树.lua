---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_花树.lua
-- 更新时间:	2015/11/4 10:58:39
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/江湖百态/艺人/include/艺人_表现判断1.lua")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 10
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

 ----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/装备/挂件相关/背挂_花树.lua",
		0
	);

	skill.SetPublicCoolDown(16); -- 公共CD 1.5秒
	skill.SetPublicCoolDown(1009); -- 862	736

	skill.nMinRadius = 0 * LENGTH_BASE; -- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE; -- 技能施放的最大距离
	skill.nAngleRange = 256; -- 攻击范围的扇形角度范围
	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult) -- 判断玩家的状态，以判断是否可以发出技能
 -------------------------------------------------------
 -- 【玩家表现相关判断】BY鱼头

 -- 判断道具的表现ID
 -- dwRepresentID = player.GetRepresentID(nRepresentIndex)
 -- EQUIPMENT_REPRESENT.FACE_EXTEND		--面
 -- EQUIPMENT_REPRESENT.BACK_EXTEND   	--背
 -- EQUIPMENT_REPRESENT.WAIST_EXTEND   	--腰
 -- EQUIPMENT_REPRESENT.L_SHOULDER_EXTEND	--左肩
 -- EQUIPMENT_REPRESENT.R_SHOULDER_EXTEND	--左肩
 -- EQUIPMENT_REPRESENT.BACK_CLOAK_EXTEND	--背（披风）
 -- EQUIPMENT_REPRESENT.CHEST_STYLE			--外装

 -- 检查是不是装了挂件，判断道具ID
 -- 背部道具用 player.dwBackItemIndex
 -- 面部道具用 player.dwFaceItemIndex
 -- 腰部道具用 player.dwWaistItemIndex
	------------------------------------------------------------
	if ArtistActionCheck(player, 16801) then
		return nPreResult
	end
	
	if player.dwBackItemIndex ~= 16801 then
		return false
	end
	--]]
 -- 检查换装
	if player.dwModelID ~= 0 then
		return false
	end
 -- 检查状态
	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		return false
	end
 -- 检查战斗
	if player.bFightState then
		return false
	end
 -- 检查乘骑
	if player.bOnHorse then
		return false
	end

	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if not CustomFunction.CheckPlayerForRepresentApply(player) then
		return
	end
	--	
	if player.GetSingleRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND) == 300 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
	end
	--]]
	local scene = player.GetScene()
	if not scene then
		return
	end
	
--	local dwAngel = (player.nFaceDirection * 360 / 256) / 180 * 3.14159265
--	local nX_goto = player.nX + 1 * 64 * math.cos(dwAngel)
--	local nY_goto = player.nY + 1 * 64 * math.sin(dwAngel)    	

	local szName_doodad = "hs_d20151104_" .. player.dwID
	
	local doodad1 = scene.GetDoodadByNickName(szName_doodad)
	if not doodad1 then
		----------中秋场景doodad不贴地后坐标处理-------------
		local doodad0 = scene.CreateDoodad(5832, player.nX + 50, player.nY + 50, player.nZ, player.nFaceDirection, szName_doodad)
		---------------------------------------------------------------
		if doodad0 then
			doodad0.SetDisappearFrames(33 * GLOBAL.GAME_FPS, 0)
		end
	end
	
	local szName_npc = "hs_n20151104_" .. player.dwID
	
	local npc1 = scene.GetNpcByNickName(szName_npc)
	if not npc1 then
		scene.CreateNpc(48199, player.nX+20, player.nY+20, player.nZ+500, player.nFaceDirection + 94, 30  * GLOBAL.GAME_FPS, szName_npc)
	end
	
	player.SetTimer(32 * GLOBAL.GAME_FPS, "scripts/skill/装备/挂件相关/背挂_花树.lua", 0, 0)	
	--player.DoAction(player.dwID, 13291) -- 动作ID
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	if player.dwBackItemIndex == 16801 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 300)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com