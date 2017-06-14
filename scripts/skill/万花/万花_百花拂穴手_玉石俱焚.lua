---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_百花拂穴手_玉石俱焚.lua
-- 更新时间:	2013/11/26 11:18:17
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_点穴截脉_玉石俱焚.lua
-- 创建人    :  南剑	
-- 创建时间  :  2008-8-12
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  瞬发技能
-- 武功套路  :  点穴截脉
-- 技能名称  :  玉石俱焚
-- 技能效果  :  近程中性内功伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 20, nDamageRand = 1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 22, nDamageRand = 1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 24, nDamageRand = 1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 28, nDamageRand = 2, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 30, nDamageRand = 2, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 32, nDamageRand = 2, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 34, nDamageRand = 3, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 36, nDamageRand = 3, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 38, nDamageRand = 3, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 40, nDamageRand = 4, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 42, nDamageRand = 4, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 44, nDamageRand = 4, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 46, nDamageRand = 5, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 48, nDamageRand = 5, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 50, nDamageRand = 5, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 52, nDamageRand = 6, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, nDamageRand = 6, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 56, nDamageRand = 6, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 58, nDamageRand = 7, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 60, nDamageRand = 7, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 62, nDamageRand = 7, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 64, nDamageRand = 8, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 66, nDamageRand = 8, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 68, nDamageRand = 8, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 69, nDamageRand = 9, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 72, nDamageRand = 9, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 75, nDamageRand = 9, }, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 78, nDamageRand = 10, }, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 81, nDamageRand = 10, }, -- Level 29 
};  

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_百花拂穴手_玉石俱焚.lua", -- 连协技
		0
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/90级奇穴/玉石判定dot层数.lua", -- 连协技
		0
	);
   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageBase, -- 属性值1
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
   	
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- 吞噬Buff
	--714, -- 属性值1
	--0																-- 属性值2
	--);
   	
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- 吞噬Buff
	--674, -- 属性值1
	--0																-- 属性值2
	--);
   	
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- 吞噬Buff
	--666, -- 属性值1
	--0																-- 属性值2
	--);
   	
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- 吞噬Buff
	--711, -- 属性值1
	--0																-- 属性值2
	--);
   		
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- 吞噬Buff
	--2738, -- 属性值1
	--0																-- 属性值2
	--);
   		
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- 吞噬Buff
	--2740, -- 属性值1
	--0																-- 属性值2
	--);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/七秀_七诀剑气.lua", -- 连协技
		0
	);
    
	skill.AddAttribute(														--70橙武
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3086,
		1
	);
	skill.AddAttribute(														--80橙武
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1862,
		1
	);
	skill.AddAttribute(														--90橙武
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3086,
		2
	);
	skill.AddAttribute(														--95橙武
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3086,
		3
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
	skill.SetPublicCoolDown(16);						-- 公共CD 1.5秒
	skill.SetNormalCoolDown(1, 176);
	skill.SetCheckCoolDown(1, 444)
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
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 609 *0.5 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 609*0.5 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 609*0.5 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 609*0.5 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 609*0.5;	-- 技能消耗的内力
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
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	skill.nChannelInterval = 64; 				-- 通道技间隔时间 
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
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
		player.AcquireAchievement(44)
	end
	-- if player.IsAchievementAcquired(43) and player.IsAchievementAcquired(44) and player.IsAchievementAcquired(45) and player.IsAchievementAcquired(46) and player.IsAchievementAcquired(47) and player.IsAchievementAcquired(48) then
	-- player.AcquireAchievement(69)
	-- end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local t1, t2, t3, t4, t5, t6
	t1 = 0
	t2 = 0
	t3 = 0
	t4 = 0
	t5 = 0
	t6 = 0
	local lv = 0
	local target
	--if player.GetSkillLevel(5752) == 1 then
	target = player.GetSelectCharacter()
	if not target then
		return
	end
	target.AddBuff(dwCharacterID, player.nLevel, 5691, 1)
	player.CastSkill(6126, 2)
	if player.GetBuff(5850, 1) then
		t1 = 1
	end
	if not t1 == 1 then
		player.CastSkill(6127, 2)
		if player.GetBuff(5850, 1) then
			t2 = 1
		end
	end
	player.CastSkill(6128, 2)
	if player.GetBuff(5851, 1) then
		t3 = 1
	end
	player.CastSkill(6129, 2)
	if player.GetBuff(5852, 1) then
		t4 = 1
	end
	if not t4 == 1 then
		player.CastSkill(6130, 2)
		if player.GetBuff(5852, 1) then
			t5 = 1
		end
	end
	if (not t4 == 1) and (not t5 == 1) then
		player.CastSkill(6131, 2)
		if player.GetBuff(5852, 1) then
			t6 = 1
		end
	end
	if t1 == 1 or t2 == 1 then
		lv = lv + 1
	end
	if t3 == 1 then
		lv = lv + 1
	end
	if t4 == 1 or t5 == 1 or t6 == 1 then
		lv = lv + 1
	end
	--[[
	--玉石AOE
	if player.GetSkillLevel(5752) == 1 then
		if lv ~= 0 then
			player.CastSkillXYZ(6133, lv, target.nX, target.nY, target.nZ)
			player.PlaySfx(473 + lv, target.nX, target.nY, target.nZ + 500)
		end
	end
	--]]
	
	--玉石后瞬发兰摧
	if player.GetSkillLevel(6682) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 6371, 1, 1)
	end

	--玉石自身提高AP
	--print(1111)
	if player.GetSkillLevel(16855) == 1 then
		--player.CastSkill(16856, 1)
		player.AddBuff(player.dwID, player.nLevel, 11269, 1)
	end

	--玉石后无视目标防御等级
	if player.GetSkillLevel(17510) == 1 then
		--player.CastSkill(16856, 1)
		player.AddBuff(player.dwID, player.nLevel, 11809, 1)
	end
	
	
	--[[
	if player.GetSkillLevel(5754) == 1 then
		if lv ~= 0 then
			for i = 1, lv * 3 do
				player.AddBuff(player.dwID, player.nLevel, 7691, 1)
			end
		end
	end
	--]]

	--焚玉叠加效果
	if player.GetSkillLevel(5754) == 1 then
		if lv ~= 0 then
			for i = 1, lv do
				player.AddBuff(player.dwID, player.nLevel, 9728, 1)
			end
		end
	end

	--吞噬一个持续效果35%几率定身4秒
	if player.GetSkillLevel(5751) == 1 then
		--print(222222)
		local nRnd = Random(1, 10000)
		local nChance = 3500 * lv
		--print(nRnd)
		--print(nChance)
		if nRnd <= nChance then
			--print(player.CastSkill(1127, 1, player.GetSkillTarget()))
			player.CastSkill(1127, 1)
		end
	end

	--玉石每吞噬一个dot，调息时间降低1.5秒
	if player.GetSkillLevel(6683) == 1 then
		if lv ~= 0 then
			for i = 1, lv do
				player.CastSkill(14652, 1)	--玉石调息时间降低1.5秒
				ModityCDToUI(player, 182, 0, 0)
			end
		end
	end

	--新玉石AOE并且吞噬目标身上持续伤害效果
	if player.GetSkillLevel(5752) == 1 then
		--target.AddBuff(player.dwID, player.nLevel, 9729, 1)	--不作用当前目标
		--player.CastSkill(14651, 1)	--目标范围AOE，吞噬持续伤害
		--print(11111)
		player.CastSkillXYZ(14651, 1, target.nX, target.nY, target.nZ + 948)
	end
	
	--[[
	--花间生息奇穴
	local nbuffcount = lv * 3
	local nbuffcount_1 = math.floor(lv*1.5)
	if player.GetSkillLevel(6686) == 1 then
		if target.GetBuff(9173, 1) then
			return
		elseif target.GetBuff(9172, 1) then
			if nbuffcount >= 4 then
				target.AddBuff(0, 99, 9175, 1, nbuffcount_1)
				target.DelBuff(9172, 1)
				target.AddBuff(0, 99, 9173, 1)
			else
				target.AddBuff(0, 99, 9175, 1, nbuffcount)
			end
		else
			target.AddBuff(0, 99, 9175, 1, nbuffcount)
			if nbuffcount >= 4 then
				target.AddBuff(0, 99, 9172, 1)
			end
		end
	end
	--]]
	ModityCDToUI(player, 182, 0, 0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com