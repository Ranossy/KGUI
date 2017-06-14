---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/长歌_音_变徵_治疗.lua
-- 更新时间:	2015/8/10 19:20:47
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
	--执行脚本删除增加跳数的buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/长歌/套路及子技能/长歌_音_变徵_治疗.lua",
		0
		);
	--[[
	--下列技能顺序一定不能反(这里要包一层必中关系)
	--有奇穴子技能G
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14445,
		dwSkillLevel
	);
	--有奇穴子技能F
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14367,
		dwSkillLevel
	);
	--有奇穴子技能E
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14366,
		dwSkillLevel
	);
	--有奇穴子技能D
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14365,
		dwSkillLevel
	);
	--有奇穴子技能C
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14364,
		dwSkillLevel
	);
	--有奇穴子技能B
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14363,
		dwSkillLevel
		);
	--]]
	--无奇穴子技能A
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14362,
		dwSkillLevel
		);
	--奇穴每跳增加伤害判定子技能(叠加buff)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14530,
		1
		);
	--判定跳数回复豆
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14535,
		1
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(9377, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	skill.AddSlowCheckSelfBuff(9506, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	--青霄飞羽期间没有高山流水曲状态则不能释放宫徵的标记buff
	skill.AddSlowCheckSelfBuff(9552, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
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
	--技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 895);	--技能普通CD
	skill.SetCheckCoolDown(1, 444);	--只检查不走的CD
	skill.SetCheckCoolDown(2, 920);	--只检查不走的CD,初始吞噬hot增加一次CD
	skill.SetCheckCoolDown(3, 921);	--只检查不走的CD,初始吞噬hot增加二次CD
	--skill.SetCheckCoolDown(4, 922);	--只检查不走的CD,初始吞噬hot增加三次CD
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
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 163 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 163 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 163 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 163 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 163;	-- 技能消耗的内力
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
	skill.nAreaRadius = 20 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 1;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nMinPrepareFrames  	= -1;				-- 急速效果最小吟唱帧数：默认是-1，吟唱不受急速影响。大于等于0则受急速影响，最小读条时间为填的值
	skill.nChannelInterval = 16; 				-- 通道技间隔时间
	skill.nMinChannelInterval = 1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	skill.nChannelFrame = 48;	 			-- 通道技持续时间，单位帧数
	skill.nMinChannelFrame = 1; 				-- 通常配合急速最小间隔时间使用。使得通道技能整体加速。如果这个填-1，间隔不是-1，高急速可以多1跳
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
	skill.bInstantChannel = false;				-- 通道技能是否立刻造成一次伤害
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
	skill.nBeatBackRate = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	skill.nBrokenRate = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
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
	for i = 1, 5 do
		if player.GetBuff(9442 + i, 1) then
			player.DelBuff(9389 + i, 1)
		end
	end
	for i = 1, 5 do
		if player.GetBuff(9447 + i, 1) then
			player.DelBuff(9380 + i, 1)
		end
	end

	player.DelBuff(9500, 1)
	player.DelBuff(9501, 1)

	--阳春白雪被动触发效果
	for i = 1, 3 do
		player.DelBuff(9433, i)
		player.DelBuff(9434, i)
	end
	player.DelGroupBuff(10216, 1)
	player.DelGroupBuff(10217, 1)

	--删除增加治疗效果buff
	if player.GetBuff(9571, 1) then
		player.DelBuff(9571,1)
	end
	for i = 1, 6 do
		if player.GetBuff(9572, i) then
			player.DelBuff(9572, i)
		end
	end

	--打增加跳数的标记buff
	for i = 1, 3 do
		if player.GetBuff(9575, i) then
			player.DelBuff(9575, i)
		end
	end

	player.DelGroupBuff(9574, 1)
	
	if player.GetBuff(9503, 1) or player.GetBuff(9439, 1) then
		player.AddBuff(player.dwID, player.nLevel, 9575, 1)
	elseif player.GetBuff(9503, 2) or player.GetBuff(9439, 2) then
		player.AddBuff(player.dwID, player.nLevel, 9575, 2)
	elseif player.GetBuff(9503, 3) or player.GetBuff(9439, 3) then
		player.AddBuff(player.dwID, player.nLevel, 9575, 3)
	end
	
	--删除吞噬hot标记
	player.DelGroupBuff(9538, 1)
	
	player.AddBuff(player.dwID, player.nLevel, 9430, 1, 8)	--阳春白雪主动技能buff
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	--local lv = skill.dwLevel
	--player.LearnSkillLevel(14301, lv, player.dwID)	--学习变徵治疗
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
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	if not target then
		return
	end
	
	--删除自身的增加跳数的buff
	player.DelGroupBuff(9439, 1)
	player.DelGroupBuff(9439, 2)
	player.DelGroupBuff(9439, 3)
	--删除自身的增加跳数的buff
	player.DelGroupBuff(9503, 1)
	player.DelGroupBuff(9503, 2)
	player.DelGroupBuff(9503, 3)
	
	--诗上，徵15几率叠加标记buff
	if player.GetSkillLevel(17536) == 1 then
		local nRnd = Random(1, 10000)
		if nRnd <= 1500 and not player.GetBuff(9380, 1) then
			player.AddBuff(player.dwID, player.nLevel, 9329, 1)
			player.AddBuff(player.dwID, player.nLevel, 9380, 1)		--避免AOE到多个目标时，每跳多次计算概率
		end
	end
	--秘籍触发给目标20%加速效果
	if player.IsSkillRecipeActive(2088, 1) then
		target.AddBuff(player.dwID, player.nLevel, 9533, 1)
	end

	--云门奇穴徵吞噬目标hot增加调息时间
	if player.GetSkillLevel(14472) == 1 then
		--print(1111)
		local gong_lev = player.GetSkillLevel(14303)
		local shang_lev = player.GetSkillLevel(14138)
		local jue_lev = player.GetSkillLevel(14139)
		
		local gong_leftcount = 0
		local shang_leftcount = 0
		local jue_leftcount = 0
		
		if gong_lev ~= 0 then
			--print("gong_lev"..gong_lev)
			local gong_hot_1 = target.GetBuffByOwner(9454, gong_lev, player.dwID)
			local gong_hot_2 = target.GetBuffByOwner(9455, gong_lev, player.dwID)
			local gong_hot_3 = target.GetBuffByOwner(9456, gong_lev, player.dwID)
			local gong_hot_4 = target.GetBuffByOwner(9457, gong_lev, player.dwID)
			if gong_hot_1 then
				gong_leftcount = gong_hot_1.nLeftActiveCount
			elseif gong_hot_2 then
				gong_leftcount = gong_hot_2.nLeftActiveCount
			elseif gong_hot_3 then
				gong_leftcount = gong_hot_3.nLeftActiveCount
			elseif gong_hot_4 then
				gong_leftcount = gong_hot_4.nLeftActiveCount
			end
		end
		if shang_lev ~= 0 then
			--print("shang_lev"..shang_lev)
			local shang_hot_1 = target.GetBuffByOwner(9459, shang_lev, player.dwID)
			local shang_hot_2 = target.GetBuffByOwner(9460, shang_lev, player.dwID)
			local shang_hot_3 = target.GetBuffByOwner(9461, shang_lev, player.dwID)
			local shang_hot_4 = target.GetBuffByOwner(9462, shang_lev, player.dwID)
			if shang_hot_1 then
				shang_leftcount = shang_hot_1.nLeftActiveCount
			elseif shang_hot_2 then
				shang_leftcount = shang_hot_2.nLeftActiveCount
			elseif shang_hot_3 then
				shang_leftcount = shang_hot_3.nLeftActiveCount
			elseif shang_hot_4 then
				shang_leftcount = shang_hot_4.nLeftActiveCount
			end
		end
		if jue_lev ~= 0 then
			--print("jue_lev"..jue_lev)
			local jue_hot_1 = target.GetBuffByOwner(9463, jue_lev, player.dwID)
			local jue_hot_2 = target.GetBuffByOwner(9464, jue_lev, player.dwID)
			local jue_hot_3 = target.GetBuffByOwner(9465, jue_lev, player.dwID)
			local jue_hot_4 = target.GetBuffByOwner(9466, jue_lev, player.dwID)
			if jue_hot_1 then
				jue_leftcount = jue_hot_1.nLeftActiveCount
			elseif jue_hot_2 then
				jue_leftcount = jue_hot_2.nLeftActiveCount
			elseif jue_hot_3 then
				jue_leftcount = jue_hot_3.nLeftActiveCount
			elseif jue_hot_4 then
				jue_leftcount = jue_hot_4.nLeftActiveCount
			end
		end
		--print(gong_leftcount)
		--print(shang_leftcount)
		--print(jue_leftcount)
		local buff_mark = player.GetBuff(9538, 1)
		if (buff_mark and buff_mark.nStackNum < 2) or not buff_mark then
			--print(2222222222)
			if jue_leftcount ~= 0 and jue_leftcount >= gong_leftcount and jue_leftcount >= shang_leftcount then
				--吞噬角hot
				--print(333333333333333)
				player.CastSkill(14500, 1, player.GetSkillTarget())
				if not buff_mark then
					if player.GetSkillLevel(14352) == 1 then
						player.ResetCD(923)
					else
						player.ResetCD(920)
					end
				elseif buff_mark and buff_mark.nStackNum == 1 then
					if player.GetSkillLevel(14352) == 1 then
						player.ResetCD(924)
					else
						player.ResetCD(921)
					end
				end
				player.AddBuff(player.dwID, player.nLevel, 9538, 1)
			elseif shang_leftcount ~= 0 and shang_leftcount >= jue_leftcount and shang_leftcount >= gong_leftcount then
				--吞噬商hot
				--print(44444444444)
				player.CastSkill(14499, 1, player.GetSkillTarget())
				if not buff_mark then
					if player.GetSkillLevel(14352) == 1 then
						player.ResetCD(923)
					else
						player.ResetCD(920)
					end
				elseif buff_mark and buff_mark.nStackNum == 1 then
					if player.GetSkillLevel(14352) == 1 then
						player.ResetCD(924)
					else
						player.ResetCD(921)
					end
				end
				player.AddBuff(player.dwID, player.nLevel, 9538, 1)
			elseif gong_leftcount ~= 0 and gong_leftcount >= shang_leftcount and gong_leftcount >= jue_leftcount then
				--吞噬宫hot
				--print(5555555555555)
				player.CastSkill(14498, 1, player.GetSkillTarget())
				if not buff_mark then
					if player.GetSkillLevel(14352) == 1 then
						player.ResetCD(923)
					else
						player.ResetCD(920)
					end
				elseif buff_mark and buff_mark.nStackNum == 1 then
					if player.GetSkillLevel(14352) == 1 then
						player.ResetCD(924)
					else
						player.ResetCD(921)
					end
				end
				player.AddBuff(player.dwID, player.nLevel, 9538, 1)
			end
		end
	end

	player.AddBuff(player.dwID, player.nLevel, 9430, 1, 8)	--阳春白雪主动技能buff
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com