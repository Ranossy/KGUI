---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/长歌_音_羽_治疗.lua
-- 更新时间:	2017/5/17 16:36:51
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/长歌_音_羽_治疗.lua
-- 更新时间:	2015/8/10 13:00:03
-- 更新用户:	mengxiangfei11
-- 脚本说明:
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	--无奇穴、目标正常移动状态
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14354,
		dwSkillLevel
	);
	--无奇穴、目标受控状态
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14355,
		dwSkillLevel
	);
	--有奇穴、无buff、正常状态
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14356,
		dwSkillLevel
	);
	--有奇穴、无buff、受控状态
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14513,
		dwSkillLevel
	);
	--有奇穴、有buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14514,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.ACCUMULATE, -- 魔法属性
		1, -- 属性值1
		0														-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/长歌/套路及子技能/长歌_音_羽_治疗.lua",
		0
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(9506, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级

	-----------------技能施放姿态需求(苍云)----------------------------------------
	--skill.nNeedPoseState = 1    --检查姿态，1为擎刀姿态，2为擎盾姿态

	----------------技能伤害给小队回血------------------------------------------

	--skill.nDamageToLifeForParty = 0	--技能伤害给小队成员百分比回血

	-----------------技能渐变相关-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --技能伤害渐变百分比，1024为100%，正数为增加，负数为减少。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --对第一个搜索到的目标施放子技能。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --对第二个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --对第三个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --对第四个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --对第五个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --对第六个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --对第七个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --对第八个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --对第九个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --对第十个搜索到的目标施放子技能。

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 895);	--技能普通CD
	skill.SetCheckCoolDown(1, 444);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能是否可在吟唱中施放 -------------------------------------------------
	--skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true

	----------------- 技能消耗 -------------------------------------------------
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 300 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 300 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 300 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 300 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 300;	-- 技能消耗的内力
	end
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.nNeedAccumulateCount = 0;				-- 技能需要气点的个数，当skill.bIsAccumulate	= true时生效
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 6 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 1;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nMinChannelInterval = 1;-- 通道技间隔时间
	--skill.nChannelInterval = 16; 				-- 通道技间隔时间
	--skill.nChannelFrame = 48;	 			-- 通道技持续时间，单位帧数
	--skill.nMinChannelFrame = 1
	--skill.nBulletVelocity = 0;				-- 子弹速度，单位 点/帧

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
	--skill.nWeaponDamagePercent = 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

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
	if skill.dwLevel == skill.dwMaxLevel and not player.IsAchievementAcquired(4652) then
		player.AcquireAchievement(4652)
	end
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	local nType
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
		nType = TARGET.PLAYER
	else
		target = GetNpc(dwCharacterID)
		nType = TARGET.NPC
	end
	if not target then
		return
	end

	--站立下连续攻击换动作
	if player.GetBuff(10161, 1) then
		player.DelBuff(10161, 1)
		player.CastSkill(15170, 1)
	elseif player.GetBuff(10160, 1) then
		player.DelBuff(10160, 1)
		player.AddBuff(player.dwID, player.nLevel, 10161, 1)
		player.CastSkill(15169, 1)
	else
		player.AddBuff(player.dwID, player.nLevel, 10160, 1)
		player.CastSkill(15168, 1)
	end

	--羽增加徵的跳数，1级buff增加一跳，二级buff增加2跳(完成)。
	if player.GetSkillLevel(14353) == 1 then
		if player.GetSkillLevel(14437) == 1 then
			if not player.GetBuff(9503, 3) then
				if not player.GetBuff(9503, 2) then
					if not player.GetBuff(9503, 1) then
						player.AddBuff(player.dwID, player.nLevel, 9503, 1)
					else
						player.DelBuff(9503, 1)
						player.AddBuff(player.dwID, player.nLevel, 9503, 2)
					end
				else
					player.DelBuff(9503, 2)
					player.AddBuff(player.dwID, player.nLevel, 9503, 3)
				end
			else
				player.AddBuff(player.dwID, player.nLevel, 9503, 3)
			end
		else
			if not player.GetBuff(9439, 3) then
				if not player.GetBuff(9439, 2) then
					if not player.GetBuff(9439, 1) then
						player.AddBuff(player.dwID, player.nLevel, 9439, 1)
					else
						player.DelBuff(9439, 1)
						player.AddBuff(player.dwID, player.nLevel, 9439, 2)
					end
				else
					player.DelBuff(9439, 2)
					player.AddBuff(player.dwID, player.nLevel, 9439, 3)
				end
			else
				player.AddBuff(player.dwID, player.nLevel, 9439, 3)
			end
		end
	end

	--羽后的免控效果(删除了)
	if player.GetSkillLevel(14281) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9354, 1)
	end

	--羽施展后徵治疗会心几率提高10%
	if player.GetSkillLevel(14439) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9496, 1)
	end

	--秘籍触发给受控目标一个一次性易伤效果(完成)
	if player.IsSkillRecipeActive(2104, 1) then
		player.CastSkill(14357, 1, player.GetSkillTarget())
	end

	--参连每个曲风叠加2%治疗基础能力(完成)
	if player.GetSkillLevel(14359) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9441, 1)
	end

	--鸣鸾羽吞噬目标身上所有自身hot
	if player.GetSkillLevel(14461) == 1 then
		local nleftCount_gong = 0
		local nleftCount_shang = 0
		local nleftCount_jue = 0
		local nConsume_lev = 0
		--找宫hot
		local gong_lev = player.GetSkillLevel(14303)
		if gong_lev ~= 0 then
			local gong_1 = target.GetBuffByOwner(9454, gong_lev, player.dwID)
			local gong_2 = target.GetBuffByOwner(9455, gong_lev, player.dwID)
			local gong_3 = target.GetBuffByOwner(9456, gong_lev, player.dwID)
			local gong_4 = target.GetBuffByOwner(9457, gong_lev, player.dwID)
			if gong_1 then
				nleftCount_gong = gong_1.nLeftActiveCount
			elseif gong_2 then
				nleftCount_gong = gong_2.nLeftActiveCount
			elseif gong_3 then
				nleftCount_gong = gong_3.nLeftActiveCount
			elseif gong_4 then
				nleftCount_gong = gong_4.nLeftActiveCount
			end
		end
		--找商hot
		local shang_lev = player.GetSkillLevel(14138)
		if shang_lev ~= 0 then
			local shang_1 = target.GetBuffByOwner(9459, shang_lev, player.dwID)
			local shang_2 = target.GetBuffByOwner(9460, shang_lev, player.dwID)
			local shang_3 = target.GetBuffByOwner(9461, shang_lev, player.dwID)
			local shang_4 = target.GetBuffByOwner(9462, shang_lev, player.dwID)
			if shang_1 then
				nleftCount_shang = shang_1.nLeftActiveCount
			elseif shang_2 then
				nleftCount_shang = shang_2.nLeftActiveCount
			elseif shang_3 then
				nleftCount_shang = shang_3.nLeftActiveCount
			elseif shang_4 then
				nleftCount_shang = shang_4.nLeftActiveCount
			end
		end
		--找角hot
		local jue_lev = player.GetSkillLevel(14139)
		if jue_lev ~= 0 then
			local jue_1 = target.GetBuffByOwner(9463, jue_lev, player.dwID)
			local jue_2 = target.GetBuffByOwner(9464, jue_lev, player.dwID)
			local jue_3 = target.GetBuffByOwner(9465, jue_lev, player.dwID)
			local jue_4 = target.GetBuffByOwner(9466, jue_lev, player.dwID)
			if jue_1 then
				nleftCount_jue = jue_1.nLeftActiveCount
			elseif jue_2 then
				nleftCount_jue = jue_2.nLeftActiveCount
			elseif jue_3 then
				nleftCount_jue = jue_3.nLeftActiveCount
			elseif jue_4 then
				nleftCount_jue = jue_4.nLeftActiveCount
			end
		end
		local newtable = {}
		if nleftCount_gong ~= 0 then
			newtable[#newtable + 1] = 1
		end

		if nleftCount_jue ~= 0 then
			newtable[#newtable + 1] = 2
		end

		if nleftCount_shang ~= 0 then
			newtable[#newtable + 1] = 3
		end
		if #newtable ~= 0 then
			local nRnd = math.random(1, #newtable)
			if newtable[nRnd] == 1 then
				if target.GetBuffByOwner(9454, gong_lev, player.dwID) then
					player.CastSkill(14389, gong_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9455, gong_lev, player.dwID) then
					player.CastSkill(14390, gong_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9456, gong_lev, player.dwID) then
					player.CastSkill(14391, gong_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9457, gong_lev, player.dwID) then
					player.CastSkill(14393, gong_lev, nType, target.dwID)
				end
			elseif newtable[nRnd] == 2 then
				if target.GetBuffByOwner(9463, jue_lev, player.dwID) then
					player.CastSkill(14399, jue_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9464, jue_lev, player.dwID) then
					player.CastSkill(14400, jue_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9465, jue_lev, player.dwID) then
					player.CastSkill(14401, jue_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9466, jue_lev, player.dwID) then
					player.CastSkill(14402, jue_lev, nType, target.dwID)
				end
			else
				if target.GetBuffByOwner(9459, shang_lev, player.dwID) then
					player.CastSkill(14395, shang_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9460, shang_lev, player.dwID) then
					player.CastSkill(14396, shang_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9461, shang_lev, player.dwID) then
					player.CastSkill(14397, shang_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9462, shang_lev, player.dwID) then
					player.CastSkill(14398, shang_lev, nType, target.dwID)
				end
			end
			player.CastSkill(14462, newtable[nRnd], nType, target.dwID)
		end
	end
	--消耗一层诗上效果
	--player.DelBuff(9329, 1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com