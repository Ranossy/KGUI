------------------------------------------------
-- 文件名    :  橙武_傲血战意_龙牙附致残.lua
-- 创建人    :  CBG
-- 创建时间  :  2010-05-08
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 20, nDamage = 14 * 0.95, nDamageRand = 14 * 0.1, nThreat = 259 * 2 }, -- Level 1 
	{nAddRage = 0, nCostRage = 20, nDamage = 23 * 0.95, nDamageRand = 23 * 0.1, nThreat = 389 * 2 }, -- Level 2 
	{nAddRage = 0, nCostRage = 20, nDamage = 31 * 0.95, nDamageRand = 31 * 0.1, nThreat = 518 * 2 }, -- Level 3 
	{nAddRage = 0, nCostRage = 20, nDamage = 39 * 0.95, nDamageRand = 39 * 0.1, nThreat = 648 * 2 }, -- Level 4 
	{nAddRage = 0, nCostRage = 20, nDamage = 47 * 0.95, nDamageRand = 47 * 0.1, nThreat = 778 * 2 }, -- Level 5 
	{nAddRage = 0, nCostRage = 20, nDamage = 54 * 0.95, nDamageRand = 54 * 0.1, nThreat = 907 * 2 }, -- Level 6 
	{nAddRage = 0, nCostRage = 20, nDamage = 62 * 0.95, nDamageRand = 62 * 0.1, nThreat = 1037 * 2 }, -- Level 7 
	{nAddRage = 0, nCostRage = 20, nDamage = 70 * 0.95, nDamageRand = 70 * 0.1, nThreat = 1166 * 2 }, -- Level 8 
	{nAddRage = 0, nCostRage = 20, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1, nThreat = 1296 * 2 }, -- Level 9 
	{nAddRage = 0, nCostRage = 20, nDamage = 86 * 0.95, nDamageRand = 86 * 0.1, nThreat = 1426 * 2 }, -- Level 10
	{nAddRage = 0, nCostRage = 20, nDamage = 94 * 0.95, nDamageRand = 94 * 0.1, nThreat = 259 * 2 }, -- Level 11 
	{nAddRage = 0, nCostRage = 20, nDamage = 103 * 0.95, nDamageRand = 103 * 0.1, nThreat = 389 * 2 }, -- Level 12 
	{nAddRage = 0, nCostRage = 20, nDamage = 111 * 0.95, nDamageRand = 111 * 0.1, nThreat = 518 * 2 }, -- Level 13 
	{nAddRage = 0, nCostRage = 20, nDamage = 129 * 0.95, nDamageRand = 129 * 0.1, nThreat = 648 * 2 }, -- Level 14 
	{nAddRage = 0, nCostRage = 20, nDamage = 137 * 0.95, nDamageRand = 137 * 0.1, nThreat = 778 * 2 }, -- Level 15 
	{nAddRage = 0, nCostRage = 20, nDamage = 144 * 0.95, nDamageRand = 144 * 0.1, nThreat = 907 * 2 }, -- Level 16 
	{nAddRage = 0, nCostRage = 20, nDamage = 152 * 0.95, nDamageRand = 152 * 0.1, nThreat = 1037 * 2 }, -- Level 17 
	
};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage, 
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1722, 
		2
	);	
	----------------- 技能施放Buff需求 ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	skill.AddSlowCheckSelfBuff(1722,	1,	BUFF_COMPARE_FLAG.EQUAL, 2, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff
    
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

    ----------------- 设置Cool down --------------------------------------------
    --CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
    --skill.SetNormalCoolDown(1, 361);						
    --skill.SetPublicCoolDown(16);	--公共CD
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
	skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
    --skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
 	skill.nChannelInterval	= 160;
	skill.nMinRadius	= 0* LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	skill.nWeaponDamagePercent	= 2048;
	skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
	
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