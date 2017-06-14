---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/唐门/90级奇穴/唐门_90奇穴_追命箭_隐身.lua
-- 更新时间:	2017/4/8 22:51:36
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  张豪
-- 创建时间	:  2013-6-25
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 250 * 0.95, nDamageRand = 96 * 0.1, nCostMana = 0}, -- level 1
	{nDamageBase = 270 * 0.95, nDamageRand = 137 * 0.1, nCostMana = 0}, -- level 2
	{nDamageBase = 290 * 0.95, nDamageRand = 178 * 0.1, nCostMana = 0}, -- level 3
	{nDamageBase = 310 * 0.95, nDamageRand = 219 * 0.1, nCostMana = 0}, -- level 4
	{nDamageBase = 330 * 0.95, nDamageRand = 260 * 0.1, nCostMana = 0}, -- level 5
	{nDamageBase = 350 * 0.95, nDamageRand = 301 * 0.1, nCostMana = 0}, -- level 6
	{nDamageBase = 370 * 0.95, nDamageRand = 342 * 0.1, nCostMana = 0}, -- level 7
	{nDamageBase = 390 * 0.95, nDamageRand = 383 * 0.1, nCostMana = 0}, -- level 8
	{nDamageBase = 424 * 0.95, nDamageRand = 424 * 0.1, nCostMana = 0}, -- level 1
	{nDamageBase = 465 * 0.95, nDamageRand = 465 * 0.1, nCostMana = 0}, -- level 2
	{nDamageBase = 506 * 0.95, nDamageRand = 506 * 0.1, nCostMana = 0}, -- level 3
	{nDamageBase = 547 * 0.95, nDamageRand = 547 * 0.1, nCostMana = 0}, -- level 4
	{nDamageBase = 588 * 0.95, nDamageRand = 588 * 0.1, nCostMana = 0}, -- level 5
	{nDamageBase = 629 * 0.95, nDamageRand = 629 * 0.1, nCostMana = 0}, -- level 6
	{nDamageBase = 670 * 0.95, nDamageRand = 670 * 0.1, nCostMana = 0}, -- level 7
	{nDamageBase = 711 * 0.95, nDamageRand = 711 * 0.1, nCostMana = 0}, -- level 8
	{nDamageBase = 752 * 0.95, nDamageRand = 752 * 0.1, nCostMana = 0}, -- level 1
	{nDamageBase = 793 * 0.95, nDamageRand = 793 * 0.1, nCostMana = 0}, -- level 2
	{nDamageBase = 834 * 0.95, nDamageRand = 834 * 0.1, nCostMana = 0}, -- level 3
	{nDamageBase = 875 * 0.95, nDamageRand = 875 * 0.1, nCostMana = 0}, -- level 4
	{nDamageBase = 916 * 0.95, nDamageRand = 916 * 0.1, nCostMana = 0}, -- level 5
	{nDamageBase = 957 * 0.95, nDamageRand = 957 * 0.1, nCostMana = 0}, -- level 6
	{nDamageBase = 998 * 0.95, nDamageRand = 998 * 0.1, nCostMana = 0}, -- level 7
	{nDamageBase = 1039 * 0.95, nDamageRand = 1039 * 0.1, nCostMana = 0}, -- level 8
	{nDamageBase = 1080 * 0.95, nDamageRand = 1080 * 0.1, nCostMana = 0}, -- level 4
	{nDamageBase = 1121 * 0.95, nDamageRand = 1121 * 0.1, nCostMana = 0}, -- level 5
	{nDamageBase = 1162 * 0.95, nDamageRand = 1162 * 0.1, nCostMana = 0}, -- level 6
	{nDamageBase = 1203 * 0.95, nDamageRand = 1203 * 0.1, nCostMana = 0}, -- level 7
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
 - 1024
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase / 4,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand / 4,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);

	skill.AddAttribute(													--第五重外功阵法，施展追命箭，小队会心加5%
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3330,
		1
	);

	skill.AddAttribute(													--橙武效果
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3478,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/唐门/90级奇穴/追命箭群体.lua", -- 属性值1
		0														-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/唐门/90级奇穴/唐门_90奇穴_追命箭_正常.lua", -- 属性值1
		0														-- 属性值2
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
	--ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
	--"skill/唐门/唐门_弓弩_追命箭.lua", -- 属性值1
	--"skill/唐门/唐门_弓弩_追命箭.lua",
	--0														-- 属性值2
	--);
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(3203, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 463);	--技能普通CD
	--skill.SetCheckCoolDown(1, 444);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostEnergy = 40;									-- 技能消耗能量
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID

	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 30 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames = 48;				-- 吟唱帧数
	--skill.nMinPrepareFrames = 1;
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 100 * 1.1 * 1.1;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (100 + (dwSkillLevel - 9) * 6) * 1.1 * 1.1
	else
		skill.nChannelInterval = 272 * 1.1 * 1.1;     -- 通道技间隔时间
	end

	--skill.nChannelInterval = 224; 				-- 通道技间隔时间
	--skill.nMinChannelInterval	= 1;
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 240;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 目标血量需求 ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
	--skill.nTargetLifePercentMax	= 100;			-- 血量最大值<=

	----------------- 自身血量需求 ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
	--skill.nSelfLifePercentMax	= 100;				-- 血量最大值<=

	----------------- 打退打断落马相关 -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0

	----------------- 武器伤害相关 ---------------------------------------------
	skill.nWeaponDamagePercent = 3072;	-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	local lv = player.GetSkillLevel(3096)
	if player.GetSkillLevel(5722) == 1 then
		target.AddBuff(dwCharacterID, player.nLevel, 5782, 1, 1)
		player.CastSkill(6202, lv)
		--target.AddBuff(dwCharacterID, player.nLevel, 7659, 1, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com