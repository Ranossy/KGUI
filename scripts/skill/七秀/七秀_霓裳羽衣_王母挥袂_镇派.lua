---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/七秀_霓裳羽衣_王母挥袂_镇派.lua
-- 更新时间:	2016/6/29 22:09:09
-- 更新用户:	XIAXIANBO
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  七秀_霓裳羽衣_王母挥袂_镇派.lua
-- 创建人    :  张豪
-- 创建时间  :  2011-04-16
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :
-- 武功套路  :  霓裳羽衣
-- 技能名称  :  王母挥袂
-- 技能效果  :  远程大单体治疗，需要剑舞状态
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapy = 516 * 0.95, nTherapyRand = 516 * 0.1, nCostMana = 115 }, -- level 1
	{nTherapy = 557 * 0.95, nTherapyRand = 557 * 0.1, nCostMana = 166 }, -- level 2
	{nTherapy = 598 * 0.95, nTherapyRand = 598 * 0.1, nCostMana = 205 }, -- level 3
	{nTherapy = 639 * 0.95, nTherapyRand = 639 * 0.1, nCostMana = 243 }, -- level 4
	{nTherapy = 680 * 0.95, nTherapyRand = 680 * 0.1, nCostMana = 282 }, -- level 5
	{nTherapy = 721 * 0.95, nTherapyRand = 721 * 0.1, nCostMana = 321 }, -- level 6
	{nTherapy = 762 * 0.95, nTherapyRand = 762 * 0.1, nCostMana = 359 }, -- level 7
	{nTherapy = 803 * 0.95, nTherapyRand = 803 * 0.1, nCostMana = 398 }, -- level 8
	{nTherapy = 844 * 0.95, nTherapyRand = 844 * 0.1, nCostMana = 398 }, -- level 9
	{nTherapy = 885 * 0.95, nTherapyRand = 885 * 0.1, nCostMana = 115 }, -- level 1
	{nTherapy = 926 * 0.95, nTherapyRand = 926 * 0.1, nCostMana = 166 }, -- level 2
	{nTherapy = 967 * 0.95, nTherapyRand = 967 * 0.1, nCostMana = 205 }, -- level 3
	{nTherapy = 1008 * 0.95, nTherapyRand = 1008 * 0.1, nCostMana = 243 }, --level 4
	{nTherapy = 1049 * 0.95, nTherapyRand = 1049 * 0.1, nCostMana = 282 }, --level 5
	{nTherapy = 1090 * 0.95, nTherapyRand = 1090 * 0.1, nCostMana = 321 }, --level 6
	{nTherapy = 1131 * 0.95, nTherapyRand = 1131 * 0.1, nCostMana = 359 }, --level 7
	{nTherapy = 1172 * 0.95, nTherapyRand = 1172 * 0.1, nCostMana = 398 }, --level 8
	{nTherapy = 1213 * 0.95, nTherapyRand = 1213 * 0.1, nCostMana = 398 }, --level 9
	{nTherapy = 1254 * 0.95, nTherapyRand = 1254 * 0.1, nCostMana = 115 }, --level 1
	{nTherapy = 1295 * 0.95, nTherapyRand = 1295 * 0.1, nCostMana = 166 }, --level 2
	{nTherapy = 1336 * 0.95, nTherapyRand = 1336 * 0.1, nCostMana = 205 }, --level 3
	{nTherapy = 1377 * 0.95, nTherapyRand = 1377 * 0.1, nCostMana = 243 }, --level 4
	{nTherapy = 1418 * 0.95, nTherapyRand = 1418 * 0.1, nCostMana = 282 }, --level 5
	{nTherapy = 1459 * 0.95, nTherapyRand = 1459 * 0.1, nCostMana = 321 }, --level 6
	{nTherapy = 1500 * 0.95, nTherapyRand = 1500 * 0.1, nCostMana = 359 }, --level 7
	{nTherapy = 1541 * 0.95, nTherapyRand = 1541 * 0.1, nCostMana = 398 }, --level 8
	{nTherapy = 1582 * 0.95, nTherapyRand = 1582 * 0.1, nCostMana = 398 }, --level 9
	{nTherapy = 1623 * 0.95, nTherapyRand = 1623 * 0.1, nCostMana = 398 }, --level 9
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	--[[ 移除原本会心加成的
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LUNAR_CRITICAL_STRIKE_BASE_RATE,
		2000,
		0
		);
	--]]

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nTherapy / 7,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nTherapyRand / 7,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0,
		0
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 126, 1)			-- 设置Buff  dwSkillLevel：注意与等级一致
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(1, 592, 1);				-- 设置Hot

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetPublicCoolDown(16);					--公共CD1.5秒
	skill.SetNormalCoolDown(1, 441);					--自身CD15秒

	skill.nTargetLifePercentMax = 40;			-- 血量最大值<=
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力：注意跟技能等级一致
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID

	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0;					-- 技能施放的最小距离
	skill.nMaxRadius = 22 * LENGTH_BASE;					-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 20 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 48;				-- 吟唱帧数
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 64 * 1.05 * 1.4;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (64 + (dwSkillLevel - 9) * 2) * 1.05 * 1.4
	else
		skill.nChannelInterval = 150 * 1.05 * 1.4;     -- 通道技间隔时间
	end
	--skill.nChannelFrame		= 48;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024

	----------------- 武器伤害相关 ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com