---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/天道剑势_道极承天.lua
-- 更新时间:	2015/10/24 14:24:14
-- 更新用户:	mengxiangfei11
-- 脚本说明:

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125, nDamageRand = 17}, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 77, nDamageRand = 21}, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 114, nDamageRand = 25}, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 151, nDamageRand = 28}, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 189, nDamageRand = 32}, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 226, nDamageRand = 36}, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 263, nDamageRand = 40}, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 301, nDamageRand = 43}, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 338, nDamageRand = 47}, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 375, nDamageRand = 51}, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 413, nDamageRand = 54}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 450, nDamageRand = 58}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 487, nDamageRand = 62}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 524, nDamageRand = 66}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 562, nDamageRand = 69}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 599, nDamageRand = 73}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 636, nDamageRand = 77}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 674, nDamageRand = 81}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 711, nDamageRand = 84}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 748, nDamageRand = 88}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 786, nDamageRand = 92}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 823, nDamageRand = 95}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 860, nDamageRand = 99}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 897, nDamageRand = 103}, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 935, nDamageRand = 107}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 972, nDamageRand = 110}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1009, nDamageRand = 114}, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1047, nDamageRand = 118}, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1084, nDamageRand = 122}, -- Level 29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1121, nDamageRand = 125}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1159, nDamageRand = 129}, -- Level 31
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1196, nDamageRand = 133}, -- Level 32
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1233, nDamageRand = 137}, -- Level 33
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageBase, -- 属性值1
		0																-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageRand, -- 属性值1
		0																--属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE, -- 魔法属性
		0, -- 属性值1
		0																-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.ACCUMULATE, -- 魔法属性
		2, -- 属性值1
		0																-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/纯阳/天道剑势_道极承天.lua", -- 属性值1
		0																-- 属性值2
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	skill.SetPublicCoolDown(16);		-- 公共CD
	--skill.SetNormalCoolDown(1, 173);		-- 2.5秒
	skill.SetCheckCoolDown(1, 444);
	skill.SetCheckCoolDown(1, 983);
	----------------- 经验升级相关 ---------------------------------------------
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
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
	skill.nCostManaBasePercent = 119;	-- 技能消耗的内力
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0;					-- 技能施放的最小距离
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	skill.nChannelInterval = 120 * 1.1;     -- 通道技间隔时间
	--skill.nChannelFrame		= 32;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate			= 0;					-- 打断目标施法的概率,基数1024

	----------------- 武器伤害相关 ---------------------------------------------
	skill.nWeaponDamagePercent = 1024;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	if not target then
		return
	end

	player.AddBuff(player.dwID, player.nLevel, 10203, 1)

	local nbuff = player.GetBuff(10203, 1)
	if nbuff then
		local nCount = nbuff.nStackNum
		for i = 1, 5 do
			player.DelBuff(10204, i)
		end

		player.AddBuff(player.dwID, player.nLevel, 10204, nCount)
		RemoteCallToClient(player.dwID, "ChangeSkillSurfaceNum", 15187, nCount)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)
	player.DelGroupBuff(10203, 1)
	for i = 1, 5 do
		player.DelBuff(10204, i)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com