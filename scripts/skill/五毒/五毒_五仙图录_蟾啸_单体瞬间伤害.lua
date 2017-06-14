---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/五毒/五毒_五仙图录_蟾啸.lua
-- 更新时间:	2013/5/7 14:14:18
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  CBG
-- 创建时间	:  2010-11-19
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125*0.95, 	nDamageRand = 125*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 132*0.95, 	nDamageRand = 132*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 139*0.95, 	nDamageRand = 139*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 146*0.95, 	nDamageRand = 146*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 153*0.95, 	nDamageRand = 153*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 160*0.95, 	nDamageRand = 160*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 167*0.95, 	nDamageRand = 167*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 174*0.95, 	nDamageRand = 174*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 181*0.95, 	nDamageRand = 181*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 188*0.95, 	nDamageRand = 188*0.1, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 195*0.95, 	nDamageRand = 195*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 202*0.95, 	nDamageRand = 202*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 209*0.95, 	nDamageRand = 209*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 216*0.95, 	nDamageRand = 216*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 223*0.95, 	nDamageRand = 223*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 230*0.95, 	nDamageRand = 230*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 237*0.95, 	nDamageRand = 237*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 244*0.95, 	nDamageRand = 244*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 251*0.95, 	nDamageRand = 251*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 258*0.95, 	nDamageRand = 258*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 265*0.95, 	nDamageRand = 265*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 272*0.95, 	nDamageRand = 272*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 279*0.95, 	nDamageRand = 279*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 286*0.95, 	nDamageRand = 286*0.1, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 293*0.95, 	nDamageRand = 293*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 300*0.95, 	nDamageRand = 300*0.1, }, -- Level 26
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,
		0,
		0
	);	
	
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- 女娲补天不能用
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 2295, dwSkillLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 385);
	--skill.SetCheckCoolDown(1, 444);

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
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius = 8 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit = 8;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 32;				-- 吟唱帧数
	if dwSkillLevel < 10 then
  		skill.nChannelInterval = 48*1.1;
 	elseif dwSkillLevel < 26 then
  		skill.nChannelInterval = (48 + (dwSkillLevel - 9) * 5)*1.1
  	else
  		skill.nChannelInterval =136*1.1;     -- 通道技间隔时间   
 	end
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
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
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
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
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com