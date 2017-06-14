---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/北冥剑气_六合独尊.lua
-- 更新时间:	2015/10/14 21:35:08
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/北冥剑气_六合独尊.lua
-- 更新时间:	2013/5/8 17:23:44
-- 更新用户:	taoli
-- 脚本说明:

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 110, nDamageRand = 4}, -- Level 1
	{nAddRage = 0, nCostRage = 0, nDamageBase = 170, nDamageRand = 7}, -- Level 2
	{nAddRage = 0, nCostRage = 0, nDamageBase = 240, nDamageRand = 10}, -- Level 3
	{nAddRage = 0, nCostRage = 0, nDamageBase = 270, nDamageRand = 14}, -- Level 4
	{nAddRage = 0, nCostRage = 0, nDamageBase = 310, nDamageRand = 17}, -- Level 5
	{nAddRage = 0, nCostRage = 0, nDamageBase = 370, nDamageRand = 20}, -- Level 6
	{nAddRage = 0, nCostRage = 0, nDamageBase = 400, nDamageRand = 24}, -- Level 7
	{nAddRage = 0, nCostRage = 0, nDamageBase = 420, nDamageRand = 27}, -- Level 8
	{nAddRage = 0, nCostRage = 0, nDamageBase = 440, nDamageRand = 30}, -- Level 9
	{nAddRage = 0, nCostRage = 0, nDamageBase = 460, nDamageRand = 34}, -- Level 10
	{nAddRage = 0, nCostRage = 0, nDamageBase = 480, nDamageRand = 37}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 500, nDamageRand = 40}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 520, nDamageRand = 44}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 540, nDamageRand = 47}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 560, nDamageRand = 50}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 580, nDamageRand = 54}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 600, nDamageRand = 57}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 620, nDamageRand = 60}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 640, nDamageRand = 64}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 670, nDamageRand = 67}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 703, nDamageRand = 71}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 737, nDamageRand = 74}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 770, nDamageRand = 77}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 804, nDamageRand = 81}, -- Level 24
	{nAddRage = 0, nCostRage = 0, nDamageBase = 837, nDamageRand = 84}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 871, nDamageRand = 87}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 904, nDamageRand = 91}, -- Level 27
	{nAddRage = 0, nCostRage = 0, nDamageBase = 938, nDamageRand = 94}, -- Level 28
	{nAddRage = 0, nCostRage = 0, nDamageBase = 971, nDamageRand = 97}, -- Level 29
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1005, nDamageRand = 101}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1038, nDamageRand = 104}, -- Level 31
};

--设置武功技能级别相关数值vxx
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageBase / 10, -- 属性值1
		0																-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageRand, -- 属性值1
		0																-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- 魔法属性
		0, -- 属性值1
		0																-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/纯阳/北冥剑气_六合独尊.lua", -- 连协技
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		15209, -- 连协技
		dwSkillLevel
		);	
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- 设置Buff
	--skill.BindBuff(1, 555, 1);						-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);

	----------------- 经验升级相关 ---------------------------------------------
	--skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 708 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 708 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 708 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 708 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 708;	-- 技能消耗的内力
	end

	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0;					-- 技能施放的最小距离
	skill.nMaxRadius = 15 * LENGTH_BASE;					-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 6;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	skill.nMinChannelInterval = 1;-- 通道技间隔时间
	skill.nChannelInterval = 16; 				-- 通道技间隔时间
	skill.nChannelFrame = 16 * 5;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 打断相关 -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;		-- 技能被打断的概率.基数1024
	--skill.nBreakRate			= PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	----------------- 武器伤害相关 ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	for i = 1, 4 do
		if player.GetBuff(9965, i) then
			player.DelBuff(9965, i)
		end

		if player.GetBuff(9966, i) then
			player.DelBuff(9966, i)
		end
	end

	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	local buff
	if player.GetSkillLevel(5826) == 1 then
		--回复半格气
		player.CastSkill(14996, 1)
		target.AddBuff(dwSkillSrcID, player.nLevel, 5655, 1, 1)
		buff = target.GetBuff(5655, 1)
		if not buff then
			return
		end
		if buff.nStackNum == 3 then
			target.AddBuff(dwSkillSrcID, player.nLevel, 749, 1, 1)
			target.DelBuff(5655, 1)
			target.DelBuff(5655, 1)
			target.DelBuff(5655, 1)
		end
	end

	if player.GetSkillLevel(5819) == 1 then
		if player.GetBuff(9966, 3) then
			player.AddBuff(player.dwID, player.nLevel, 9965, 4)
		elseif player.GetBuff(9966, 2) then
			player.AddBuff(player.dwID, player.nLevel, 9965, 3)
		elseif player.GetBuff(9966, 1) then
			player.AddBuff(player.dwID, player.nLevel, 9965, 2)
		else
			player.AddBuff(player.dwID, player.nLevel, 9965, 1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com