---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/天道剑势_一剑封喉.lua
-- 更新时间:	2013/8/22 14:46:28
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天道剑势_一剑封喉.lua
-- 创建人    :  CBG
-- 创建时间  :  2011-04-14
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  天道剑势
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 556, nDamageRand = 40}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 639, nDamageRand = 46}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 722, nDamageRand = 52}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 805, nDamageRand = 58}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 888, nDamageRand = 64}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 971, nDamageRand = 70}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1054, nDamageRand = 76}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1137, nDamageRand = 82}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1220, nDamageRand = 88}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1303, nDamageRand = 94}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1386, nDamageRand = 100}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1469, nDamageRand = 106}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1552, nDamageRand = 112}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1635, nDamageRand = 118}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1718, nDamageRand = 124}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1801, nDamageRand = 130}, -- Level 16
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	--[[
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
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/纯阳/天道剑势_一剑封喉.lua",
		0														
	);   	
	--skill.BindBuff(1, 2291, 1)	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	--公共CD
	skill.SetNormalCoolDown(1, 438);	--公共CD
	skill.SetCheckCoolDown(1, 444);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
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
	if dwSkillLevel <= 3 then
		skill.nCostManaBasePercent = 290*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 290*0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 9 then
		skill.nCostManaBasePercent = 290*0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 290 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 290;	-- 技能消耗的内力
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
	skill.nMaxRadius = 12 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 10 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 10;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	-- skill.nChannelInterval	= 112; 				-- 通道技间隔时间 
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 目标血量需求 ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
	--skill.nTargetLifePercentMax	= 30;			-- 血量最大值<=
    
	----------------- 自身血量需求 ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
	--skill.nSelfLifePercentMax	= 20;				-- 血量最大值<=
    
	----------------- 打退打断落马相关 -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0
	
	----------------- 武器伤害相关 ---------------------------------------------
	skill.nWeaponDamagePercent = 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3831)
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
	if player.IsSkillRecipeActive(1592, 1) then
		player.AddBuff(dwCharacterID, player.nLevel, 6578, 1, 1)
	end
	local n = target.nCurrentLife / target.nMaxLife
	if player.GetSkillLevel(6456) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6099, 1, 1)
	end

	if player.GetSkillLevel(6482) == 1 then
		if n <= 0.5 then
			player.AddBuff(dwCharacterID, player.nLevel, 6100, 1, 1)
		end
	end

	--八荒归元一段伤害
	local lv = player.GetSkillLevel(2699)
	if lv ~= 0 then
		player.CastSkill(13853,lv,player.GetSkillTarget())
	end
	
	--附魔八荒无视目标血量发挥最大伤害
	if player.GetSkillLevel(9356) == 1 and player.GetBuff(8007, 1) then
		player.CastSkill(4954, 10)
		if player.GetSkillLevel(5822) == 1 then
			player.CastSkill(14809, 10)
			--[[
			for i = 46, 50 do
				player.CastSkill(9068, i)
			end
			--]]
			--return
		end
	else
		--S_5822是命中叠韧的额外伤害效果
		if 0.9 < n and n <= 1 then
			player.CastSkill(4954, 1)
			if player.GetSkillLevel(5822) == 1 then
				--[[
				for i = 1, 5 do
					player.CastSkill(9068, i)
				end
				--]]
				player.CastSkill(14809, 1)
				--return
			end
		end
		if 0.8 < n and n <= 0.9 then
			player.CastSkill(4954, 2)
			if player.GetSkillLevel(5822) == 1 then
				--[[
				for i = 6, 10 do
					player.CastSkill(9068, i)
				end
				--]]
				player.CastSkill(14809, 2)
				--return
			end
		end
		if 0.7 < n and n <= 0.8 then
			player.CastSkill(4954, 3)
			if player.GetSkillLevel(5822) == 1 then
				--[[
				for i = 11, 15 do
					player.CastSkill(9068, i)
				end
				--]]
				player.CastSkill(14809, 3)
				--return
			end
		end
		if 0.6 < n and n <= 0.7 then
			player.CastSkill(4954, 4)
			if player.GetSkillLevel(5822) == 1 then
				player.CastSkill(14809, 4)
				--[[
				for i = 16, 20 do
					player.CastSkill(9068, i)
				end
				--]]
				--return
			end
		end
		if 0.5 < n and n <= 0.6 then
			player.CastSkill(4954, 5)
			if player.GetSkillLevel(5822) == 1 then
				--[[
				for i = 21, 25 do
					player.CastSkill(9068, i)
				end
				--]]
				player.CastSkill(14809, 5)
				--return
			end
		end
		if 0.4 < n and n <= 0.5 then
			player.CastSkill(4954, 6)
			if player.GetSkillLevel(5822) == 1 then
				--[[
				for i = 30, 35 do
					player.CastSkill(9068, i)
				end
				--]]
				player.CastSkill(14809, 6)
				--return
			end
		end
		if 0.3 < n and n <= 0.4 then
			player.CastSkill(4954, 7)
			if player.GetSkillLevel(5822) == 1 then
				--[[
				for i = 36, 40 do
					player.CastSkill(9068, i)
				end
				--]]
				player.CastSkill(14809, 7)
				--return
			end
		end
		if 0.2 < n and n <= 0.3 then
			player.CastSkill(4954, 8)
			if player.GetSkillLevel(5822) == 1 then
				--[[
				for i = 41, 45 do
					player.CastSkill(9068, i)
				end
				--]]
				player.CastSkill(14809, 8)
				--return
			end
		end
		if 0.1 < n and n <= 0.2 then
			player.CastSkill(4954, 9)
			if player.GetSkillLevel(5822) == 1 then
				--[[
				for i = 41, 45 do
					player.CastSkill(9068, i)
				end
				--]]
				player.CastSkill(14809, 9)
				--return
			end
		end
		if 0 < n and n <= 0.1 then
			player.CastSkill(4954, 10)
			if player.GetSkillLevel(5822) == 1 then
				--[[
				for i = 46, 50 do
					player.CastSkill(9068, i)
				end
				--]]
				player.CastSkill(14809, 10)
				--return
			end
		end
	end

	--八荒爆叠韧
	if player.GetSkillLevel(6758) == 1 then
		if n < 0.4 then
			player.CastSkill(6761, 1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com