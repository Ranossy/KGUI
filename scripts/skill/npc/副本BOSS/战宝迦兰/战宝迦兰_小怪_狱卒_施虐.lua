------------------------------------------------
-- 文件名    :  战宝迦兰_小怪_狱卒_施虐.lua
-- 创建人    :  李凯	
-- 创建时间  :  2009-6-23
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  : 施虐
-- 技能效果  :  使得目标受到毒性伤害2000点，并损耗内力1500点。
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 90     *0.8, nDamageRand = 90    *0.4, nReduceMana = -67    ,nCostMana = 0},		--level 1
	{nDamageBase = 123    *0.8, nDamageRand = 123   *0.4, nReduceMana = -92    ,nCostMana = 0},		--level 2
	{nDamageBase = 209    *0.8, nDamageRand = 209   *0.4, nReduceMana = -157   ,nCostMana = 0},		--level 3
	{nDamageBase = 300    *0.8, nDamageRand = 300   *0.4, nReduceMana = -225   ,nCostMana = 0},		--level 4
	{nDamageBase = 436    *0.8, nDamageRand = 436   *0.4, nReduceMana = -327   ,nCostMana = 0},		--level 5
	{nDamageBase = 572    *0.8, nDamageRand = 572   *0.4, nReduceMana = -429   ,nCostMana = 0},		--level 6
	{nDamageBase = 788    *0.8, nDamageRand = 788   *0.4, nReduceMana = -591   ,nCostMana = 0},		--level 7
	{nDamageBase = 939    *0.8, nDamageRand = 939   *0.4, nReduceMana = -704   ,nCostMana = 0},		--level 8
	{nDamageBase = 1091   *0.8, nDamageRand = 1091  *0.4, nReduceMana = -818   ,nCostMana = 0},		--level 9
	{nDamageBase = 1242   *0.8, nDamageRand = 1242  *0.4, nReduceMana = -932   ,nCostMana = 0},		--level 10
	{nDamageBase = 1394   *0.8, nDamageRand = 1394  *0.4, nReduceMana = -1045  ,nCostMana = 0},		--level 11
	{nDamageBase = 1545   *0.8, nDamageRand = 1545  *0.4, nReduceMana = -1159  ,nCostMana = 0},		--level 12
	{nDamageBase = 1697   *0.8, nDamageRand = 1697  *0.4, nReduceMana = -1273  ,nCostMana = 0},		--level 13
	{nDamageBase = 1848   *0.8, nDamageRand = 1848  *0.4, nReduceMana = -1386  ,nCostMana = 0},		--level 14
	{nDamageBase = 2000   *0.8, nDamageRand = 2000  *0.4, nReduceMana = -1500  ,nCostMana = 0},		--level 15
	{nDamageBase = 2232   *0.8, nDamageRand = 2232  *0.4, nReduceMana = -1674  ,nCostMana = 0},		--level 16
	{nDamageBase = 2283   *0.8, nDamageRand = 2283  *0.4, nReduceMana = -1712  ,nCostMana = 0},		--level 17
	{nDamageBase = 2334   *0.8, nDamageRand = 2334  *0.4, nReduceMana = -1750  ,nCostMana = 0},		--level 18
	{nDamageBase = 2384   *0.8, nDamageRand = 2384  *0.4, nReduceMana = -1788  ,nCostMana = 0},		--level 19
	{nDamageBase = 2435   *0.8, nDamageRand = 2435  *0.4, nReduceMana = -1826  ,nCostMana = 0},		--level 20
	{nDamageBase = 2485   *0.8, nDamageRand = 2485  *0.4, nReduceMana = -1864  ,nCostMana = 0},		--level 21
	{nDamageBase = 2536   *0.8, nDamageRand = 2536  *0.4, nReduceMana = -1902  ,nCostMana = 0},		--level 22
	{nDamageBase = 2586   *0.8, nDamageRand = 2586  *0.4, nReduceMana = -1940  ,nCostMana = 0},		--level 23
	{nDamageBase = 2637   *0.8, nDamageRand = 2637  *0.4, nReduceMana = -1978  ,nCostMana = 0},		--level 24
	{nDamageBase = 2687   *0.8, nDamageRand = 2687  *0.4, nReduceMana = -2016  ,nCostMana = 0},		--level 25
	{nDamageBase = 2738   *0.8, nDamageRand = 2738  *0.4, nReduceMana = -2053  ,nCostMana = 0},		--level 26
	{nDamageBase = 2788   *0.8, nDamageRand = 2788  *0.4, nReduceMana = -2091  ,nCostMana = 0},		--level 27
	{nDamageBase = 2839   *0.8, nDamageRand = 2839  *0.4, nReduceMana = -2129  ,nCostMana = 0},		--level 28
	{nDamageBase = 2890   *0.8, nDamageRand = 2890  *0.4, nReduceMana = -2167  ,nCostMana = 0},		--level 29
	{nDamageBase = 7000   *0.8, nDamageRand = 7000  *0.4, nReduceMana = -2205  ,nCostMana = 0},		--level 30
};                

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;


   	----------------- 魔法属性 -------------------------------------------------

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		  ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,
		  tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		  0											
   		);
   		
   	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,
			tSkillData[dwSkillLevel].nDamageRand * 0.14, 
			0
			);	
   		
   	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,
			0, 
			0
	);	
   		
   		
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		  ATTRIBUTE_TYPE.CURRENT_MANA,
		  tSkillData[dwSkillLevel].nReduceMana, 
		  0											
   		);
    
	----------------- 技能施放Buff需求 ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
  --skill.BindBuff(1,1213,1);		-- 设置1号位Buff
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
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 128;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 5				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- 吟唱帧数
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
    skill.nBrokenRate         = 0 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
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