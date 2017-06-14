---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/子技能_三才化生_9点气.lua
-- 更新时间:	2013/5/13 17:24:19
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  子技能_三才化生_9点气.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-12-11
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
	{nAddRage = 0, nCostRage = 10, nDamageBase = 24, 	nDamageRand = 0}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 26, 	nDamageRand = 0}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 28, 	nDamageRand = 0}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 29, 	nDamageRand = 0}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 31, 	nDamageRand = 0}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 33, 	nDamageRand = 0}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 35, 	nDamageRand = 0}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 37, 	nDamageRand = 0}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 38, 	nDamageRand = 0}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 40, 	nDamageRand = 0}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 42, 	nDamageRand = 0}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 44, 	nDamageRand = 0}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 46, 	nDamageRand = 0}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 47, 	nDamageRand = 0}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, 	nDamageRand = 0}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 51, 	nDamageRand = 0}, -- Level 16
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local nSubsection = 9;
    
	----------------- 魔法属性 -------------------------------------------------
   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageBase * nSubsection / 10, -- 属性值1
		0																-- 属性值2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- 魔法属性
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_SRC,
		3122,
		5
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/纯阳/子技能_三才化生_9点气.lua", -- 属性值1
		0															-- 属性值2
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- 设置Buff
	--skill.BindBuff(1, 2290, 5);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetPublicCoolDown(16);						--公共CD 1.5秒
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostRage		= 0;									-- 技能消耗的怒气
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
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	skill.nAreaRadius = 8 * LENGTH_BASE;		-- 技能作用半径 
	skill.nTargetCountLimit = 6;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	skill.nChannelInterval = 8 * nSubsection; 				-- 通道技间隔时间 
	--skill.nChannelFrame			= 0;	-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
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
	local target
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	if player.GetSkillLevel(5836) == 0 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 2290, 5, 1)
	end
	if player.GetSkillLevel(5841) == 0 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5901, 1, 18)
	else
		target.AddBuff(dwSkillSrcID, player.nLevel, 5901, 1, 9)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com