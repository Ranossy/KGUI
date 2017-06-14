---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_太素九针_握针.lua
-- 更新时间:	2016/6/30 1:35:03
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_太素九针_握针.lua
-- 创建人    :  吴娟
-- 创建时间  :  2008-08-20
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  HOT技能
-- 武功套路  :  太素九针
-- 技能名称  :  握针
-- 技能效果  :  友方加血的HOT持续15秒
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 47},
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 65},
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 92},
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 112},
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 132},
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 152},
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 172},
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 192},
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 211},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_太素九针_握针.lua",
		0
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 126, dwSkillLevel)			-- 设置Buff  dwSkillLevel：注意与等级一致
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	skill.BindBuff(1, 631, dwSkillLevel);				-- 设置Hot

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444)
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	-- skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力：注意跟技能等级一致
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 390 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 390 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 390 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 390 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 390;	-- 技能消耗的内力
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
	skill.nMaxRadius = 20 * LENGTH_BASE;					-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 20 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 48 * 1.1;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = (48 + (dwSkillLevel - 9) * 1) * 1.1
	else
		skill.nChannelInterval = 77 * 1.1;     -- 通道技间隔时间
	end

	--skill.nChannelInterval = 77; 				-- 通道技间隔时间
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024

	----------------- 武器伤害相关 ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

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
		player.AcquireAchievement(47)
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
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end

	if player.GetSkillLevel(5783) == 1 then
		if IsPlayer(dwCharacterID) then
			target.AddBuff(dwSkillSrcID, player.nLevel, 6268, 1, 1)
		end
	end
	player.SetTimer(2, "scripts/skill/万花/万花_太素九针_握针.lua", dwCharacterID, 0)
	--[[
	if player.GetSkillLevel(5795) == 1 and target.nCurrentLife <= target.nMaxLife * 0.4 and not player.GetBuff(10097, 1) then
		local nlev = player.GetSkillLevel(101)
		if nlev ~= 0 and target.GetBuffByOwner(631, nlev, player.dwID) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(9015, 1, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(9015, 1, TARGET.NPC, dwCharacterID)
			end
			player.AddBuff(player.dwID, player.nLevel, 10097, 1)
		end
	end
	--]]
end
--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end

	local target = GetPlayer(nParam1)
	if not target then
		return
	end
	
	if player.GetSkillLevel(5795) == 1 and target.nCurrentLife <= target.nMaxLife * 0.4 and not player.GetBuff(10097, 1) then
		local nlev = player.GetSkillLevel(101)
		if nlev ~= 0 and target.GetBuffByOwner(631, nlev, player.dwID) then
			if IsPlayer(nParam1) then
				player.CastSkill(9015, 1, TARGET.PLAYER, nParam1)
			else
				player.CastSkill(9015, 1, TARGET.NPC, nParam1)
			end
			player.AddBuff(player.dwID, player.nLevel, 10097, 1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com