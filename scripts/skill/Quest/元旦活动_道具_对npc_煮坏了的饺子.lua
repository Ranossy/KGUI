------------------------------------------------
-- 文件名    :  英雄天子峰_1号boss_1号boss_四象轮回.lua
-- 创建人    :  扁担
-- 创建时间  :  2009-10-22
-- 用途(模块):  副本BOSS
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  吟唱混元伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 9720 * 0.8, nDamageRand = 9720 * 0.4, nCostMana = 0},		--level 1坑爹
	{nDamageBase = 13320 * 0.8, nDamageRand = 13320 * 0.4, nCostMana = 0},		--level 21坑爹
	{nDamageBase = 322241, nDamageRand = 166620, nCostMana = 0},		--level 3有用
	{nDamageBase = 32375 * 0.8, nDamageRand = 32375 * 0.4, nCostMana = 0},		--level 4坑爹
	{nDamageBase = 47104 * 0.8, nDamageRand = 47104 * 0.4, nCostMana = 0},		--level 5坑爹
	{nDamageBase = 322241*2, nDamageRand = 166620*2, nCostMana = 0},		--level 6有用
	{nDamageBase = 85070 * 0.8, nDamageRand = 85070 * 0.4, nCostMana = 0},		--level 71坑爹
	{nDamageBase = 101436 * 0.8, nDamageRand = 101436 * 0.4, nCostMana = 0},		--level 8坑爹
	{nDamageBase = 117801 * 0.8, nDamageRand = 117801 * 0.4, nCostMana = 0},		--level 9坑爹
	{nDamageBase = 134167 * 0.8, nDamageRand = 134167 * 0.4, nCostMana = 0},		--level 10坑爹
	{nDamageBase = 150533 * 0.8, nDamageRand = 150533 * 0.4, nCostMana = 0},		--level 11坑爹
	{nDamageBase = 166899 * 0.8, nDamageRand = 166899 * 0.4, nCostMana = 0},		--level 12坑爹
	{nDamageBase = 183265 * 0.8, nDamageRand = 183265 * 0.4, nCostMana = 0},		--level 13坑爹
	{nDamageBase = 199630 * 0.8, nDamageRand = 199630 * 0.4, nCostMana = 0},		--level 14坑爹
	{nDamageBase = 215996 * 0.8, nDamageRand = 215996 * 0.4, nCostMana = 0},		--level 15坑爹
	{nDamageBase = 241115 * 0.8, nDamageRand = 241115 * 0.4, nCostMana = 0},		--level 16坑爹
	{nDamageBase = 246575 * 0.8, nDamageRand = 246575 * 0.4, nCostMana = 0},		--level 17坑爹
	{nDamageBase = 252035 * 0.8, nDamageRand = 252035 * 0.4, nCostMana = 0},		--level 18坑爹
	{nDamageBase = 257495 * 0.8, nDamageRand = 257495 * 0.4, nCostMana = 0},		--level 19--以下皆坑爹
	{nDamageBase = 262955 * 0.8, nDamageRand = 262955 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 268414 * 0.8, nDamageRand = 268414 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 273874 * 0.8, nDamageRand = 273874 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 279334 * 0.8, nDamageRand = 279334 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 284794 * 0.8, nDamageRand = 284794 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 290254 * 0.8, nDamageRand = 290254 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 295714 * 0.8, nDamageRand = 295714 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 301173 * 0.8, nDamageRand = 301173 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 306633 * 0.8, nDamageRand = 306633 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 312093 * 0.8, nDamageRand = 312093 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 317553 * 0.8, nDamageRand = 317553 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 322241, nDamageRand = 166620, nCostMana = 0},		--level 31
};

-- 设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- 魔法属性 -------------------------------------------------
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
			0, 
			-1024
			);
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
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckDestBuff(1606, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

    ----------------- 设置Cool down --------------------------------------------
    --公共CD
    --skill.SetNormalCoolDown(1,16);							-- 公共CD 1.5秒
    --技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

   	----------------- 经验升级相关 ---------------------------------------------
   	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
    --skill.dwLevelUpExp	= 0;    				-- 升级经验
    --skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;
	skill.nThreatRevisePercent = 0

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;										-- 技能消耗生命值
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana		-- 技能消耗的内力
    --skill.nCostStamina	= 0;										-- 技能消耗的体力
    --skill.nCostItemType	= 0;										-- 技能消耗的物品类型
    --skill.nCostItemIndex	= 0;										-- 技能消耗的物品索引ID
    
    ----------------- 聚气相关 -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- 技能是否需要聚气
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- 链状技能相关 ---------------------------------------------
    --skill.nChainBranch	= 1;					--链状技能分支数
    --skill.nChainDepth		= 3;					--链状技能层数
    --链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
    ----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius		= 60 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 128;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 10 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 10;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
    --skill.nPrepareFrames  	= 3 * GAME_FPS;				-- 吟唱帧数
    --skill.nChannelInterval	= 0; 				-- 通道技间隔时间 
    --skill.nChannelFrame		  = 0;	 			-- 通道技持续时间，单位帧数 
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
    --skill.nBeatBackRate       = 0;		-- 技能被打退的概率,默认1024
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
	--player.CostItemInAllPackage(5, 5263, 1)
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