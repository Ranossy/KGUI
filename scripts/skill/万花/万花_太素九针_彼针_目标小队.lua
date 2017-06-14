---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_太素九针_彼针_目标小队.lua
-- 更新时间:	2015/9/13 22:07:28
-- 更新用户:	mengxiangfei11
-- 脚本说明:

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapyBase = 104, nTherapyRand = 10, nCostMana = 0}, --level 1
	{nTherapyBase = 129, nTherapyRand = 13, nCostMana = 0}, --level 2
	{nTherapyBase = 154, nTherapyRand = 15, nCostMana = 0}, --level 3
	{nTherapyBase = 179, nTherapyRand = 18, nCostMana = 0}, --level 4
	{nTherapyBase = 204, nTherapyRand = 20, nCostMana = 0}, --level 5
	{nTherapyBase = 229, nTherapyRand = 23, nCostMana = 0}, --level 6
	{nTherapyBase = 254, nTherapyRand = 25, nCostMana = 0}, --level 7
	{nTherapyBase = 279, nTherapyRand = 28, nCostMana = 0}, --level 8
	{nTherapyBase = 304, nTherapyRand = 30, nCostMana = 0}, --level 9
	{nTherapyBase = 329, nTherapyRand = 33, nCostMana = 0}, --level 10
	{nTherapyBase = 354, nTherapyRand = 35, nCostMana = 0}, --level 5
	{nTherapyBase = 379, nTherapyRand = 38, nCostMana = 0}, --level 6
	{nTherapyBase = 404, nTherapyRand = 40, nCostMana = 0}, --level 7
	{nTherapyBase = 429, nTherapyRand = 43, nCostMana = 0}, --level 8
	{nTherapyBase = 454, nTherapyRand = 45, nCostMana = 0}, --level 9
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_THERAPY, -- 魔法属性
		tSkillData[dwSkillLevel].nTherapyBase / 3, --属性值1
		0							--属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND, -- 魔法属性
		tSkillData[dwSkillLevel].nTherapyRand / 3, --属性值1
		0							--属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_THERAPY, -- 魔法属性
		0, --属性值1
		0							--属性值2
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
		"skill/万花/万花_太素九针_彼针_目标小队.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/彼针处理瞬发buff.lua",
		0
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(3829, 10, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(2659, 2, SKILL_COMPARE_FLAG.EQUAL);     --检查比较Caster自己已学习的技能ID和等级
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 499);	--技能普通CD;
	skill.SetCheckCoolDown(1, 444)
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	if dwSkillLevel <= 3 then
		skill.nCostManaBasePercent = 375 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 375 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 9 then
		skill.nCostManaBasePercent = 375 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 375 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 375;	-- 技能消耗的内力
	end
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
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 15 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nMinPrepareFrames = 1;
	skill.nPrepareFrames = 24;				-- 吟唱帧数
	if dwSkillLevel < 15 then
		skill.nChannelInterval = 30 + dwSkillLevel * 3
	else
		skill.nChannelInterval = 82;     -- 通道技间隔时间
	end

	--skill.nChannelInterval = 82; 				-- 通道技间隔时间
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
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
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
function Apply(dwCharacterID, dwSrcID)
	local player = GetPlayer(dwSrcID)
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
	
	--player.DelBuff(6266, 1)
	local lv = player.GetSkillLevel(101)
	--彼针挂hot
	if player.GetSkillLevel(5781) == 1 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(6105, 1, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(6105, 1, TARGET.NPC, dwCharacterID)
		end
	end

	--彼针刷新握针
	if player.GetSkillLevel(6773) == 1 then
		--print(1111)
		local nlev = player.GetSkillLevel(101)
		if nlev ~= 0 and target.GetBuffByOwner(631, nlev, player.dwID) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(14665, nlev, TARGET.PLAYER, dwCharacterID)	--刷新握针
			else
				player.CastSkill(14665, nlev, TARGET.NPC, dwCharacterID)	--刷新握针
			end
		end
	end

	--彼针命中低血量目标额外30%治疗效果
	if player.GetSkillLevel(14666) == 1 then
		local nlev = player.GetSkillLevel(14664)
		if nlev ~= 0 then
			--player.CastSkill(14667, nlev, player.GetSkillTarget())
			if IsPlayer(dwCharacterID) then
				player.CastSkill(14667, nlev, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(14667, nlev, TARGET.NPC, dwCharacterID)
			end
		end
	end
	
	--[[
	if player.GetSkillLevel(5781) == 1 and not player.GetBuff(8514, 1) then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(6105, 1, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(6105, 1, TARGET.NPC, dwCharacterID)
		end
		--给自身添加一个延迟buff,延迟buff结束后才会调用8514内置CDbuff
		player.AddBuff(player.dwID,player.nLevel,8516,1)
	end
	--]]
	--处理AOE情况删除技能时间
	--player.AddBuff(player.dwID,player.nLevel,8507,1)
	ModityCDToUI(player, 14664, 0, 0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com