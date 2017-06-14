---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/少林_罗汉棍法_普渡四方.lua
-- 更新时间:	2013/5/30 20:19:22
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  少林_罗汉棍法_普渡四方
-- 创建人    :  陈翰林
-- 创建时间  :  2008-07-18
-- 用途(模块):  武功技能
-- 武功门派  :  少林
-- 武功类型  :  外功
-- 武功套路  :  罗汉棍法
-- 技能名称  :  佛光初现
-- 技能效果  :  对目标造成外功伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 23, 	nDamageRand = 5}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 27, 	nDamageRand = 5}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 31, 	nDamageRand = 5}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 38, 	nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 43, 	nDamageRand = 5}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 50, 	nDamageRand = 5}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, 	nDamageRand = 5}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 58, 	nDamageRand = 5}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 123*0.5, 	nDamageRand = 10}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 133*0.5, 	nDamageRand = 10}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 143*0.5, 	nDamageRand = 10}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 153*0.5, 	nDamageRand = 10}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 163*0.5, 	nDamageRand = 10}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 173*0.5, 	nDamageRand = 10}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 183*0.5, 	nDamageRand = 10}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 193*0.5, 	nDamageRand = 10}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 203*0.5, 	nDamageRand = 10}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 213*0.5, 	nDamageRand = 15}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 223*0.5, 	nDamageRand = 15}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 233*0.5, 	nDamageRand = 15}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 243*0.5, 	nDamageRand = 15}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 253*0.5, 	nDamageRand = 15}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 263*0.5, 	nDamageRand = 15}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 273*0.5, 	nDamageRand = 15}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 283*0.5, 	nDamageRand = 15}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 293*0.5, 	nDamageRand = 15}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 303*0.5, 	nDamageRand = 15}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 313*0.5, 	nDamageRand = 15}, -- Level 28 
};
tPit = 
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
}   
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
	);
--增加100%武器伤害 
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
		-1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/少林/少林_罗汉棍法_普渡四方.lua", -- 属性值1
		0														-- 属性值2
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
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 60);
	skill.SetCheckCoolDown(1, 444);
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
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 184*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 184 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 184 * 0.6;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 184 * 0.8;
	else
		skill.nCostManaBasePercent = 184;
	end
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
	----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0;					-- 技能施放的最小距离 
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;					-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 16*1.1*1.15;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (16 + (dwSkillLevel - 9) * 6)*1.1*1.15
	else
		skill.nChannelInterval = 128*1.1*1.15;     -- 通道技间隔时间   
	end
	--skill.nChannelInterval = 128;	 			-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	nWeaponDamagePercent = 1024;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
	return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end


function OnSkillLevelUp(skill, player)
	--满级新手指引任务
	local nQuestIndex = player.GetQuestIndex(13246)
	local nQuestPhase = player.GetQuestPhase(13246)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
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

	if player.GetSkillLevel(16890) == 1 then
		local nLev = player.GetSkillLevel(232)
		if nLev ~= 0 then
			target.AddBuff(player.dwID, player.nLevel, 11295, 1)
			player.CastSkillXYZ(16892, nLev, target.nX, target.nY, target.nZ)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com