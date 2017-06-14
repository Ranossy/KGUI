---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/西河剑器_清音五岳_移动.lua
-- 更新时间:	2015/10/18 22:29:31
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 80 * 0.95, nDamageRand = 80 * 0.1, nCostMana = 42 },
	{nDamage = 91 * 0.95, nDamageRand = 91 * 0.1, nCostMana = 42 },
	{nDamage = 105 * 0.95, nDamageRand = 105 * 0.1, nCostMana = 42 },
	{nDamage = 115 * 0.95, nDamageRand = 115 * 0.1, nCostMana = 42 },
	{nDamage = 125 * 0.95, nDamageRand = 125 * 0.1, nCostMana = 42 },
	{nDamage = 137 * 0.95, nDamageRand = 137 * 0.1, nCostMana = 42 },
	{nDamage = 158 * 0.95, nDamageRand = 158 * 0.1, nCostMana = 42 },
	{nDamage = 163 * 0.95, nDamageRand = 163 * 0.1, nCostMana = 42 },
	{nDamage = 181 * 0.95, nDamageRand = 181 * 0.1, nCostMana = 42 },
	{nDamage = 202 * 0.95, nDamageRand = 202 * 0.1, nCostMana = 42 },
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false
	local dwSkillLevel = skill.dwLevel
	--目标区域伤害
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6234,
		dwSkillLevel
	);

	--记数buff,dot
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		2919,
		1
	);

	--记数buff2,溢伤
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		7796,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/七秀/玳弦急曲实际伤害.lua", --属性值1
		0															--属性值2
	);

	--AOE急曲dot
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3009,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		9347,
		dwSkillLevel
	);
	--[[
	--AOE易伤
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		9146,
		dwSkillLevel
		);
	--]]

	skill.AddSlowCheckSelfBuff(10121, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	
	--禁轻功
	skill.BindBuff(1, 562, 9);
	--减速
	skill.BindBuff(2, 3484, 1);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 404 * 0.2 * 0.9;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 404 * 0.4 * 0.9;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 404 * 0.6 * 0.9;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 404 * 0.8 * 0.9;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 404 * 0.9;	-- 技能消耗的内力
	end
	--------------- 设置杂项参数 ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      		= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0										-- 技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;						-- 技能施放最大半径
	skill.nAngleRange = 128; 									-- 施放角度

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- 吟唱帧数
	skill.nChannelInterval = 16; 			-- 通道技间隔时间
	skill.nChannelFrame = 48;			-- 通道技持续时间，单位帧数
	skill.nBulletVelocity = 0;					-- 子弹速度，单位 点/帧
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 1;
	skill.nBreakRate = 1024;					--被打断的概率,默认1024表示一定被打断
	skill.nMinChannelInterval = 1;     -- 通道技间隔时间
	skill.nMinChannelFrame = 1
	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nLevel = player.GetSkillLevel(537)
	if not nLevel then
		return
	end
	player.AddBuff(0, 99, 409, nLevel)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com