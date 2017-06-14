---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/挂件_虎仔寻珍味.lua
-- 更新时间:	2017/3/17 16:16:21
-- 更新用户:	ZHANGYAN0-PC
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

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
		"skill/装备/挂件相关/挂件_虎仔寻珍味.lua",
		0
	);

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16); -- 公共CD 1.5秒

	skill.SetNormalCoolDown(1, 1188); -- 寻珍味CD技能普通CD

	----------------- 经验升级相关 ---------------------------------------------
	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE; -- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE; -- 技能施放的最大距离
	----------------- 作用范围 -------------------------------------------------
	-- skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	-- skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	-- skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256; -- 攻击范围的扇形角度范围
	-- skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	-- skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult) -- 判断玩家的状态，以判断是否可以发出技能
	if player.dwBackItemIndex ~= 20987 and player.dwBackItemIndex ~= 20988 then--增加限时版判断
		return SKILL_RESULT_CODE.FAILED
	end

	if player.dwModelID ~= 0 then -- 检查是不是换装了
		return SKILL_RESULT_CODE.FAILED
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
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.dwBackItemIndex ~= 20987 and player.dwBackItemIndex ~= 20988 then--增加限时版判断
		return
	end

	player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseNewPetSkillPanel")
	-- 召唤宠物
	player.GetScene().CreateFellowPet(56172, player.nX + 30, player.nY + 30, player.nZ + 30, 0, - 1, player.dwID)
	if player.dwFellowPetID == 0 then
		return
	end
	local npc = GetNpc(player.dwFellowPetID)
	if npc then
		npc.SetDisappearFrames(16 * 60 * 10)

		player.SetTimer(60 * 10 * GLOBAL.GAME_FPS, "scripts/skill/装备/挂件相关/挂件_虎仔寻珍味.lua", 0, 0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	if player.dwBackItemIndex == 20987 or player.dwBackItemIndex == 20988 then--增加限时版判断
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 382)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com