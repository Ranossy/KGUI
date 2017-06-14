---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/五毒/五毒_补天心经_圣手织天.lua
-- 更新时间:	2013/8/27 14:39:24
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  CBG
-- 创建时间	:  2011-1-6
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73 * 0.95, nDamageRand = 73 * 0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 86 * 0.95, nDamageRand = 86 * 0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 99 * 0.95, nDamageRand = 99 * 0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 112 * 0.95, nDamageRand = 112 * 0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125 * 0.95, nDamageRand = 125 * 0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 138 * 0.95, nDamageRand = 138 * 0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 151 * 0.95, nDamageRand = 151 * 0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 164 * 0.95, nDamageRand = 164 * 0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 177 * 0.95, nDamageRand = 177 * 0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 190 * 0.95, nDamageRand = 190 * 0.1, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 203 * 0.95, nDamageRand = 203 * 0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 216 * 0.95, nDamageRand = 216 * 0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 229 * 0.95, nDamageRand = 229 * 0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 242 * 0.95, nDamageRand = 242 * 0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 255 * 0.95, nDamageRand = 255 * 0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 268 * 0.95, nDamageRand = 268 * 0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 281 * 0.95, nDamageRand = 281 * 0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 294 * 0.95, nDamageRand = 294 * 0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 307 * 0.95, nDamageRand = 307 * 0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 320 * 0.95, nDamageRand = 320 * 0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 333 * 0.95, nDamageRand = 333 * 0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 346 * 0.95, nDamageRand = 346 * 0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 359 * 0.95, nDamageRand = 359 * 0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 372 * 0.95, nDamageRand = 372 * 0.1, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 385 * 0.95, nDamageRand = 385 * 0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 398 * 0.95, nDamageRand = 398 * 0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 411 * 0.95, nDamageRand = 411 * 0.1, }, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 424 * 0.95, nDamageRand = 424 * 0.1, }, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 437 * 0.95, nDamageRand = 437 * 0.1, }, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 450 * 0.95, nDamageRand = 450 * 0.1, }, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 463 * 0.95, nDamageRand = 463 * 0.1, }, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 476 * 0.95, nDamageRand = 476 * 0.1, }, -- Level 32 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 489 * 0.95, nDamageRand = 489 * 0.1, }, -- Level 33
	{nAddRage = 0, nCostRage = 10, nDamageBase = 502 * 0.95, nDamageRand = 502 * 0.1, }, -- Level 34
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/五毒/五毒_补天心经_圣手织天.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 2953, 1);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 454);	
	skill.SetCheckCoolDown(1, 444);

	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostManaBasePercent 	= 0.28;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
	if dwSkillLevel <= 7 then
		skill.nCostManaBasePercent = 902*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 14 then
		skill.nCostManaBasePercent = 902 * 0.4;
	elseif dwSkillLevel <= 21 then
		skill.nCostManaBasePercent = 902 * 0.6;
	elseif dwSkillLevel <= 28 then
		skill.nCostManaBasePercent = 902 * 0.8;
	else
		skill.nCostManaBasePercent = 902;
	end
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
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- 吟唱帧数
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 64;
	elseif dwSkillLevel < 34 then
		skill.nChannelInterval = 64 + (dwSkillLevel - 9) * 4
	else
		skill.nChannelInterval = 170;     -- 通道技间隔时间   
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
	--skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 0 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
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

	--这里降低调息时间会改变技能逻辑目标，后面使用一定要注意
	--命中气血值低于35%的目标，调息时间降低5秒
	if player.GetSkillLevel(14866) == 1 then
		if target.nCurrentLife <= target.nMaxLife * 0.5 then
			player.CastSkill(14895, 1)
			ModityCDToUI(player, 2957, 0, 0)
		end
	end

	local nlev = player.GetSkillLevel(2957)
	if player.GetSkillLevel(6668) == 1 and target.nCurrentLife <= target.nMaxLife * 0.7 then
		--目标50%血量以下额外30%会心
		if IsPlayer(dwCharacterID) then
			player.CastSkill(13426, nlev, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(13426, nlev, TARGET.NPC, dwCharacterID)
		end
	else
		--正常效果
		if IsPlayer(dwCharacterID) then
			player.CastSkill(13425, nlev, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(13425, nlev, TARGET.NPC, dwCharacterID)
		end
	end
	
	local m = 0
	local n = 0

	--奇穴加1秒
	if player.GetSkillLevel(6666) == 1 then
		m = m + 1
	end

	--秘籍加1秒
	if player.IsSkillRecipeActive(1696, 1) then
		m = m + 1
	end
	--套装增加1秒
	if player.IsSkillRecipeExist(1184, 1) then
		m = m + 1
	end
	
	if player.GetSkillLevel(6666) == 1 then
		n = n + 1
	end
	
	if not target.GetBuff(7734,1) then
		if m == 0 then
			target.AddBuff(dwSkillSrcID, player.nLevel, 2953, 1 + n)
		elseif m == 3 then
			target.AddBuff(dwSkillSrcID, player.nLevel, 8839, 1 + n)
		else
			target.AddBuff(dwSkillSrcID, player.nLevel, 6635 + m, 1 + n)
		end
	end
	
	if player.GetSkillLevel(6042) == 1 then
		player.CastSkillXYZ(6198, 1, target.nX, target.nY, target.nZ)
		player.PlaySfx(483, target.nX, target.nY, target.nZ + 500)
	end
	--圣手加免控和打断
	if player.GetSkillLevel(6043) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 5777, 1, 1)
	end

	ModityCDToUI(player, 2957, 0, 0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com