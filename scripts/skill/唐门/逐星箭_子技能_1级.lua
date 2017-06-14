---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/唐门/逐星箭_子技能_1级.lua
-- 更新时间:	2013/11/16 0:43:07
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2011-8-16
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 50 * 0.95, nDamageRand = 33 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 53 * 0.95, nDamageRand = 35 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 56 * 0.95, nDamageRand = 38 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 60 * 0.95, nDamageRand = 40 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 63 * 0.95, nDamageRand = 43 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 66 * 0.95, nDamageRand = 45 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 69 * 0.95, nDamageRand = 48 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 70 * 0.95, nDamageRand = 50 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 72 * 0.95, nDamageRand = 53 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 74 * 0.95, nDamageRand = 55 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 76 * 0.95, nDamageRand = 58 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 78 * 0.95, nDamageRand = 60 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 80 * 0.95, nDamageRand = 63 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 82 * 0.95, nDamageRand = 65 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 84 * 0.95, nDamageRand = 68 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 86 * 0.95, nDamageRand = 70 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 88 * 0.95, nDamageRand = 73 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 90 * 0.95, nDamageRand = 75 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 92 * 0.95, nDamageRand = 78 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 94 * 0.95, nDamageRand = 80 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 96 * 0.95, nDamageRand = 83 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 98 * 0.95, nDamageRand = 85 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 100 * 0.95, nDamageRand = 88 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 102 * 0.95, nDamageRand = 90 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 104 * 0.95, nDamageRand = 93 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 106 * 0.95, nDamageRand = 95 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 108 * 0.95, nDamageRand = 98 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 110 * 0.95, nDamageRand = 100 * 0.1, nCostMana = 0}, --level 8
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/唐门/逐星箭_子技能_1级.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(3200, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff   

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 3202, dwSkillLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 468);	--技能普通CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
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
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- 吟唱帧数
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 50;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = 50 + (dwSkillLevel - 9) * 3
	else
		skill.nChannelInterval = 120; 
	end
	
	--skill.nChannelInterval = 120; 				-- 通道技间隔时间 
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 180;				-- 子弹速度，单位 点/帧
    
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
	skill.nWeaponDamagePercent = 1024;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
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
	local n1 = false
	local n2 = false
	local n3 = false
	local lv = player.GetSkillLevel(3101)
	if player.IsSkillRecipeActive(1666, 1) and player.GetSkillLevel(6733)==1 then
		player.CastSkill(8577,lv)
	end
	if player.IsSkillRecipeActive(1666, 1) and (player.GetSkillLevel(6733)~=1) then
		player.CastSkill(8575,lv)
	end
	if (not player.IsSkillRecipeActive(1666, 1)) and player.GetSkillLevel(6733)==1 then
		player.CastSkill(8576,lv)
	end
	if (not player.IsSkillRecipeActive(1666, 1)) and (player.GetSkillLevel(6733)~=1) then
		player.CastSkill(8574,lv)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com