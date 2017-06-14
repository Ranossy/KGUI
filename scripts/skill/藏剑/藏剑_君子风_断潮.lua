---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_君子风_断潮.lua
-- 更新时间:	2014/6/29 16:39:44
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_君子风_断潮.lua
-- 创建人    :  zhangqi
-- 创建时间  :  2010-01-27
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  君子风
-- 技能名称  :  断潮
-- 技能效果  :  一剑斩断钱塘潮，可见剑法高深。
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 20, nDamage = 14 * 0.95, nDamageRand = 14 * 0.1, nThreat = 259 * 2 }, -- Level 1
	{nAddRage = 0, nCostRage = 20, nDamage = 23 * 0.95, nDamageRand = 23 * 0.1, nThreat = 389 * 2 }, -- Level 2
	{nAddRage = 0, nCostRage = 20, nDamage = 31 * 0.95, nDamageRand = 31 * 0.1, nThreat = 518 * 2 }, -- Level 3
	{nAddRage = 0, nCostRage = 20, nDamage = 39 * 0.95, nDamageRand = 39 * 0.1, nThreat = 648 * 2 }, -- Level 4
	{nAddRage = 0, nCostRage = 20, nDamage = 47 * 0.95, nDamageRand = 47 * 0.1, nThreat = 778 * 2 }, -- Level 5
	{nAddRage = 0, nCostRage = 20, nDamage = 54 * 0.95, nDamageRand = 54 * 0.1, nThreat = 907 * 2 }, -- Level 6
	{nAddRage = 0, nCostRage = 20, nDamage = 62 * 0.95, nDamageRand = 62 * 0.1, nThreat = 1037 * 2 }, -- Level 7
	{nAddRage = 0, nCostRage = 20, nDamage = 70 * 0.95, nDamageRand = 70 * 0.1, nThreat = 1166 * 2 }, -- Level 8
	{nAddRage = 0, nCostRage = 20, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1, nThreat = 1296 * 2 }, -- Level 9
	{nAddRage = 0, nCostRage = 20, nDamage = 86 * 0.95, nDamageRand = 86 * 0.1, nThreat = 1426 * 2 }, -- Level 10
	{nAddRage = 0, nCostRage = 20, nDamage = 94 * 0.95, nDamageRand = 94 * 0.1, nThreat = 259 * 2 }, -- Level 11
	{nAddRage = 0, nCostRage = 20, nDamage = 103 * 0.95, nDamageRand = 103 * 0.1, nThreat = 389 * 2 }, -- Level 12
	{nAddRage = 0, nCostRage = 20, nDamage = 111 * 0.95, nDamageRand = 111 * 0.1, nThreat = 518 * 2 }, -- Level 13
	{nAddRage = 0, nCostRage = 20, nDamage = 129 * 0.95, nDamageRand = 129 * 0.1, nThreat = 648 * 2 }, -- Level 14
	{nAddRage = 0, nCostRage = 20, nDamage = 137 * 0.95, nDamageRand = 137 * 0.1, nThreat = 778 * 2 }, -- Level 15
	{nAddRage = 0, nCostRage = 20, nDamage = 144 * 0.95, nDamageRand = 144 * 0.1, nThreat = 907 * 2 }, -- Level 16
	{nAddRage = 0, nCostRage = 20, nDamage = 152 * 0.95, nDamageRand = 152 * 0.1, nThreat = 1037 * 2 }, -- Level 17

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = 17;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1722,
		1
	);
	skill.AddAttribute(														--2010.07.27添加橙武技能
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1883,
		1
		);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,
		363,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/藏剑/藏剑_君子风_断潮.lua",
		0
	);
	--skill.nBaseThreat = tSkillData[dwSkillLevel].nThreat;
	----------------- 设置CoolDown --------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 383);
	skill.AddSlowCheckSelfBuff(1722, 1, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 160;
	elseif dwSkillLevel < 14 then
		skill.nChannelInterval = 160;
	elseif dwSkillLevel < 17 then
		skill.nChannelInterval = 160
	else
		skill.nChannelInterval = 160; 				-- 通道技间隔时间
	end
	--skill.nChannelInterval = 160;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;
	skill.nWeaponDamagePercent = 2048;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒

	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
	--	skill.nTargetCountLimit	= 1;
	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	-- if skill.dwLevel == 10 then
	-- player.AcquireAchievement(1363)
	-- end
end
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetSkillLevel(9289) == 1 then
		player.ClearCDTime(363)
	end
	--if player.GetSkillLevel(9287) == 1 then
	--player.AddBuff(player.dwID,player.nLevel,7971,1)
	--end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com