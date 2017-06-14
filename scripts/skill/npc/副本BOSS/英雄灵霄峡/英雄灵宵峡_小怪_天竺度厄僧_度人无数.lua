------------------------------------------------
-- 文件名    :  英雄灵宵峡_小怪_天竺度厄僧_度人无数
-- 创建人    :  CBG	
-- 创建时间  :  2009-10-26
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  嗯
-- 技能名称  :  啊
-- 技能效果  :  你知道的
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 1615 * 0.8, nDamageRand = 1615 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 2221 * 0.8, nDamageRand = 2221 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 2649 * 0.8, nDamageRand = 2649 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 3076 * 0.8, nDamageRand = 3076 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 3503 * 0.8, nDamageRand = 3503 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 3931 * 0.8, nDamageRand = 3931 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 4358 * 0.8, nDamageRand = 4358 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 4785 * 0.8, nDamageRand = 4785 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 5213 * 0.8, nDamageRand = 5213 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 5640 * 0.8, nDamageRand = 5640 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 6296 * 0.8, nDamageRand = 6296 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 6438 * 0.8, nDamageRand = 6438 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 6581 * 0.8, nDamageRand = 6581 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 6723 * 0.8, nDamageRand = 6723 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 6866 * 0.8, nDamageRand = 6866 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 7009 * 0.8, nDamageRand = 7009 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 7151 * 0.8, nDamageRand = 7151 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 7294 * 0.8, nDamageRand = 7294 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 7436 * 0.8, nDamageRand = 7436 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 6500 * 0.8, nDamageRand = 6500 * 0.4, nCostMana = 0},		--level 25
};  
    
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
    
    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- 魔法属性 -------------------------------------------------

  	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * 0.14, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0, 
		0
	);                                                                     
                                                                                  

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_KNOCKED_DOWN,
		24,
        		0
    	);
	    ----------------- 技能施放Buff需求 ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(1400, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);-- 需求目标Buff
    
	    ----------------- BUFF相关 -------------------------------------------------
	skill.BindBuff(1,994,2);		-- 设置1号位Buff
	    --skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	    --skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	    --skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff
   
    ----------------- 设置Cool down --------------------------------------------
    --CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
    --skill.SetCoolDown(1, 16);						-- 公共CD 1.5秒
    --skill.SetCoolDown(CoolDownIndex, nCoolDownID);
   
   	----------------- 经验升级相关 ---------------------------------------------
   	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
    --skill.dwLevelUpExp	= 0;    				-- 升级经验
    --skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	 --skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius		= 25 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 50;					-- 攻击范围的扇形角度范围 
	skill.nAreaRadius		= 25 * LENGTH_BASE;		-- 技能作用半径 
	skill.nTargetCountLimit	= 10;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
    --skill.nPrepareFrames  	= 32;				-- 吟唱帧数
    --skill.nChannelInterval	= 0; 				-- 通道技间隔时间 
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
    --skill.nSelfLifePercentMin	= 0;			-- 血量最小值>=
    --skill.nSelfLifePercentMax	= 100;			-- 血量最大值<=
    
    ----------------- 打断相关 -------------------------------------------------
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
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