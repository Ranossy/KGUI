---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_百花拂穴手_钟林毓秀.lua
-- 更新时间:	2013/6/2 23:05:52
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_百花拂穴手_钟林毓秀.lua
-- 创建人    :  曾焕强	
-- 创建时间  :  2008-8-12
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  1.5秒吟唱
-- 武功套路  :  点穴截脉
-- 技能名称  :  少明指
-- 技能效果  :  远程中性持续内伤，持续18秒
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 199}, -- Level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 265}, -- Level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 332}, -- Level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 4  
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 5
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 199}, -- Level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 265}, -- Level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 332}, -- Level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 4  
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 5
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 199}, -- Level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 265}, -- Level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 332}, -- Level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 4  
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 5
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 199}, -- Level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 265}, -- Level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 332}, -- Level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 4  
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 5
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 199}, -- Level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 265}, -- Level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 332}, -- Level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 398}, -- Level 4  
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
-- 	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		286,
--		dwSkillLevel
--		);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		285,
		dwSkillLevel
	);
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- 魔法属性
		2726, -- 属性值1
		1																	-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_百花拂穴手_钟林毓秀.lua",
		0
	);	
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 674, dwSkillLevel);			-- 设置Buff
	--skill.BindBuff(1, tSkillData[dwSkillLevel].nDotID, tSkillData[dwSkillLevel].nDotLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	skill.SetPublicCoolDown(16);						-- 公共CD 1.5秒
	--skill.SetNormalCoolDown(1, 175);
	skill.SetCheckCoolDown(1, 444);
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
	if dwSkillLevel <= 5 then
		skill.nCostManaBasePercent = 279 * 0.2*0.85;	-- 技能消耗的内力
	elseif dwSkillLevel <= 10 then
		skill.nCostManaBasePercent = 279*0.4*0.85;	-- 技能消耗的内力
	elseif dwSkillLevel <= 15 then
		skill.nCostManaBasePercent = 279*0.6*0.85;	-- 技能消耗的内力
	elseif dwSkillLevel <= 20 then
		skill.nCostManaBasePercent = 279*0.8*0.85;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 279*0.85;	-- 技能消耗的内力
	end
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
	skill.nAngleRange = 128;				-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	skill.nMinPrepareFrames = 1;
	skill.nPrepareFrames = 32;				-- 吟唱帧数
	--skill.nChannelInterval	= 16; 				-- 通道技间隔时间 
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 85;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 目标血量需求 ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- 血量最小值>=
	--skill.TargetLifePercentMax	= 100;			-- 血量最大值<=
    
	----------------- 打断相关 -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;	-- 技能被打断的概率.基数1024
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


function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(43)
	end
	-- if player.IsAchievementAcquired(43) and player.IsAchievementAcquired(44) and player.IsAchievementAcquired(45) and player.IsAchievementAcquired(46) and player.IsAchievementAcquired(47) and player.IsAchievementAcquired(48) then
		-- player.AcquireAchievement(69)
	-- end
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

	--通用删除瞬发buff
	if player.GetBuff(412, 1) then
		--删水月
		player.DelBuff(412, 1)
	elseif player.GetBuff(932, 1) then
		--删阵法迅涌
		player.DelBuff(932, 1)
	end
	
	target.AddBuff(player.dwID, player.nLevel, 5695, 1, 1)
	if player.GetSkillLevel(5766) == 1 then
		if player.GetBuff(2719, 1) then
			player.CastSkillXYZ(6138, 1, target.nX, target.nY, target.nZ)
		end
	end
	--[[
	if player.GetSkillLevel(5771) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 6258, 1, 1)
	end
	--]]
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com