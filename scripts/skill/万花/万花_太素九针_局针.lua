---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_太素九针_局针.lua
-- 更新时间:	2017/3/16 10:37:06
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nTherapyBase = 103, nTherapyRand = 10, nCostMana = 21 * 1.2},
	{ nTherapyBase = 116, nTherapyRand = 12, nCostMana = 33 * 1.2},
	{ nTherapyBase = 128, nTherapyRand = 13, nCostMana = 50 * 1.2},
	{ nTherapyBase = 141, nTherapyRand = 14, nCostMana = 64 * 1.2},
	{ nTherapyBase = 153, nTherapyRand = 15, nCostMana = 77 * 1.2},
	{ nTherapyBase = 166, nTherapyRand = 17, nCostMana = 91 * 1.2},
	{ nTherapyBase = 178, nTherapyRand = 18, nCostMana = 104 * 1.2},
	{ nTherapyBase = 191, nTherapyRand = 19, nCostMana = 104 * 1.2},
	{ nTherapyBase = 203, nTherapyRand = 20, nCostMana = 104 * 1.2},
	{ nTherapyBase = 216, nTherapyRand = 22, nCostMana = 21 * 1.2},
	{ nTherapyBase = 228, nTherapyRand = 23, nCostMana = 33 * 1.2},
	{ nTherapyBase = 241, nTherapyRand = 24, nCostMana = 50 * 1.2},
	{ nTherapyBase = 253, nTherapyRand = 25, nCostMana = 64 * 1.2},
	{ nTherapyBase = 266, nTherapyRand = 27, nCostMana = 77 * 1.2},
	{ nTherapyBase = 278, nTherapyRand = 28, nCostMana = 91 * 1.2},
	{ nTherapyBase = 291, nTherapyRand = 29, nCostMana = 104 * 1.2},
	{ nTherapyBase = 303, nTherapyRand = 30, nCostMana = 104 * 1.2},
	{ nTherapyBase = 316, nTherapyRand = 32, nCostMana = 104 * 1.2},
	{ nTherapyBase = 328, nTherapyRand = 33, nCostMana = 21 * 1.2},
	{ nTherapyBase = 341, nTherapyRand = 34, nCostMana = 33 * 1.2},
	{ nTherapyBase = 353, nTherapyRand = 35, nCostMana = 50 * 1.2},
	{ nTherapyBase = 366, nTherapyRand = 37, nCostMana = 64 * 1.2},
	{ nTherapyBase = 378, nTherapyRand = 38, nCostMana = 77 * 1.2},
	{ nTherapyBase = 391, nTherapyRand = 39, nCostMana = 91 * 1.2},
	{ nTherapyBase = 403, nTherapyRand = 40, nCostMana = 104 * 1.2},
	{ nTherapyBase = 416, nTherapyRand = 42, nCostMana = 104 * 1.2},
	{ nTherapyBase = 428, nTherapyRand = 43, nCostMana = 104 * 1.2},
	{ nTherapyBase = 441, nTherapyRand = 44, nCostMana = 104 * 1.2},
	{ nTherapyBase = 453, nTherapyRand = 45, nCostMana = 104 * 1.2},
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
	{ nReducePercent = 0},
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_THERAPY, -- 魔法属性
		tSkillData[dwSkillLevel].nTherapyBase * (1 - tPit[dwSkillLevel].nReducePercent) / 3, --属性值1
		0																--属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND, -- 魔法属性
		tSkillData[dwSkillLevel].nTherapyRand * (1 - tPit[dwSkillLevel].nReducePercent) / 3, --属性值1
		0																--属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_THERAPY, -- 魔法属性
		0, --属性值1
		0																--属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 清瞬发buff
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		722,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_太素九针_局针.lua",
		0
	);
	--治疗非自身,额外产生治疗
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		16049,
		dwSkillLevel
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 126, 1)			-- 设置Buff  dwSkillLevel：注意与等级一致
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(1, 592, 1);				-- 设置Hot

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
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力：注意跟技能等级一致
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 245 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 245 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 245 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 245 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 245;	-- 技能消耗的内力
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
	skill.nMinPrepareFrames = 1;
	skill.nPrepareFrames = 24;				-- 吟唱帧数
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 48 * 1.1;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = (48 + (dwSkillLevel - 9) * 1) * 1.1
	else
		skill.nChannelInterval = 80 * 1.1;     -- 通道技间隔时间
	end

	--skill.nChannelInterval = 72; 				-- 通道技间隔时间
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

	if player.GetSkillLevel(5787) == 1 then
		if not player.GetBuff(6267, 1) then
			player.AddBuff(dwSkillSrcID, player.nLevel, 6265, 1, 1)
			if player.GetBuff(6265, 1).nStackNum == 3 then
				for i = 1, 2 do
					player.AddBuff(dwSkillSrcID, player.nLevel, 6266, 1, 1)
				end
				player.DelBuff(6265, 1)
				player.DelBuff(6265, 1)
				player.DelBuff(6265, 1)
				player.AddBuff(dwSkillSrcID, player.nLevel, 6267, 1, 1)
			end
		end
	end

	if player.GetSkillLevel(5786) == 1 then
		--player.AddBuff(dwCharacterID, player.nLevel, 6253, 1, 1)
		--if player.GetBuff(6253, 1).nStackNum == 5 then
		if not player.GetBuff(6252, 1) then
			player.AddBuff(dwCharacterID, player.nLevel, 10739, 1, 1)
			--player.AddBuff(dwCharacterID, player.nLevel, 6252, 1, 1)
		end
		--end
	end
	--[[
	if player.GetSkillLevel(5795) == 1 and target.nCurrentLife <= target.nMaxLife * 0.35 and not player.GetBuff(10097, 1) then
		local nlev = player.GetSkillLevel(101)
		if nlev ~= 0 and target.GetBuffByOwner(631,nlev,player.dwID) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(9015, 1, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(9015, 1, TARGET.NPC, dwCharacterID)
			end
			player.AddBuff(player.dwID, player.nLevel, 10097, 1)
		end
	end
	--]]
	--局针对自身的额外效果
	local nlev = player.GetSkillLevel(137)
	if player.GetSkillLevel(9325) == 1 then
		player.CastSkill(9326, nlev)

		--延长握针\述怀跳数
		if IsPlayer(dwCharacterID) then
			player.CastSkill(9328, 1, TARGET.PLAYER, target.dwID)
			player.CastSkill(9329, 1, TARGET.PLAYER, target.dwID)
		else
			player.CastSkill(9328, 1, TARGET.NPC, target.dwID)
			player.CastSkill(9329, 1, TARGET.NPC, target.dwID)
		end
	end
end
--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com