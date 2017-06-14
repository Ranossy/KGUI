---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/霸刀/双能量脱战自动平衡.lua
-- 更新时间:	2016/9/18 21:16:26
-- 更新用户:	XIAXIANBO
-- 脚本说明:
----------------------------------------------------------------------<

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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/霸刀/双能量脱战自动平衡.lua",
		0
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
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
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--技能普通CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
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
	--skill.nCostManaBasePercent = 0;							-- 技能消耗的内力百分比
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 这里为true时,表示全部消耗豆点
	--skill.nNeedAccumulateCount = 0;				-- 技能需要气点的个数，当skill.bIsAccumulate	= true时生效
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离
	--skill.nMaxRadius		= 0 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	--skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nMinPrepareFrames  	= -1;				-- 急速效果最小吟唱帧数：默认是-1，吟唱不受急速影响。大于等于0则受急速影响，最小读条时间为填的值
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nMinChannelInterval	= -1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nMinChannelFrame	= -1; 				-- 通常配合急速最小间隔时间使用。使得通道技能整体加速。如果这个填-1，间隔不是-1，高急速可以多1跳
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
	--skill.bInstantChannel = false;				-- 通道技能是否立刻造成一次伤害
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
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	--注意，buff跳数为0.5s一跳，基于这个间隔来计数，buff跳数不能修改
	local nbuff = player.GetBuff(10919, 1)
	if nbuff then
		local nbuffNum = nbuff.nCustomValue
		local ReviveTime = false
		local CostTime = false
		local CostTime_qixue = false
		local nChange = 1

		if player.GetSkillLevel(16746) == 1 and nbuffNum % 2 == 1 then
			CostTime_qixue = true
		end

		if nbuffNum % 2 == 1 then
			ReviveTime = true
		end

		if nbuffNum == 5 then
			CostTime = true
		end

		if nbuffNum == 5 then
			nbuff.nCustomValue = 0
		else
			nbuff.nCustomValue = nbuff.nCustomValue + 1
		end

		
		if player.GetSkillLevel(16977) == 1 then
			nChange = 2
		end

		if player.bFightState == true then
			if player.GetBuff(10814, 1) then
				if ReviveTime then
					player.nCurrentRage = player.nCurrentRage + math.min(nChange, player.nMaxRage - player.nCurrentRage)
					player.nCurrentSunEnergy = player.nCurrentSunEnergy + math.min(nChange, player.nMaxSunEnergy - player.nCurrentSunEnergy)
				end
				--[[
				--S_16476奇穴双刀不自动消耗能量
				if CostTime and player.GetSkillLevel(16746) ~= 1 then
					player.nCurrentEnergy = player.nCurrentEnergy - math.min(1, player.nCurrentEnergy)
				end
				--]]
				--废弃奇穴
				if CostTime_qixue and not player.IsHaveBuff(11207, 1) then
					player.nCurrentEnergy = player.nCurrentEnergy + math.min(2, player.nMaxEnergy - player.nCurrentEnergy)
				end

			elseif player.IsHaveBuff(10815, 1) then
				if ReviveTime then
					player.nCurrentEnergy = player.nCurrentEnergy + math.min(nChange, player.nMaxEnergy - player.nCurrentEnergy)
					player.nCurrentSunEnergy = player.nCurrentSunEnergy + math.min(nChange, player.nMaxSunEnergy - player.nCurrentSunEnergy)
				end
				--[[
				if CostTime then
					player.nCurrentRage = player.nCurrentRage - math.min(1, player.nCurrentRage)
				end
				--]]
			elseif player.IsHaveBuff(10816, 1) then
				if ReviveTime then
					player.nCurrentEnergy = player.nCurrentEnergy + math.min(nChange, player.nMaxEnergy - player.nCurrentEnergy)
					player.nCurrentRage = player.nCurrentRage + math.min(nChange, player.nMaxRage - player.nCurrentRage)
				end
				--[[
				if CostTime then
					player.nCurrentSunEnergy = player.nCurrentSunEnergy - math.min(1, player.nCurrentSunEnergy)
				end
				--]]
			else
				if ReviveTime then
					player.nCurrentEnergy = player.nCurrentEnergy + math.min(nChange, player.nMaxEnergy - player.nCurrentEnergy)
					player.nCurrentRage = player.nCurrentRage + math.min(nChange, player.nMaxRage - player.nCurrentRage)
					player.nCurrentSunEnergy = player.nCurrentSunEnergy + math.min(nChange, player.nMaxSunEnergy - player.nCurrentSunEnergy)
				end
			end
		else
			if ReviveTime then
				player.nCurrentEnergy = player.nCurrentEnergy + math.min(5, player.nMaxEnergy - player.nCurrentEnergy)
				player.nCurrentSunEnergy = player.nCurrentSunEnergy + math.min(5, player.nMaxSunEnergy - player.nCurrentSunEnergy)
				player.nCurrentRage = player.nCurrentRage + math.min(5, player.nMaxRage - player.nCurrentRage)
			end
		end
	end
	--[[
	--霸刀姿态释放需求Buff
	---大刀姿态需求
	if player.nMoveState ~= MOVE_STATE.ON_DEATH and player.nCurrentRage >= 10 then
		if not player.GetBuff(11162, 1)then
			player.AddBuff(player.dwID, player.nLevel, 11162, 1)
		end
	else
		if player.GetBuff(11162, 1) then
			player.DelBuff(11162, 1)
		end
	end
	---双刀姿态需求
	if player.nMoveState ~= MOVE_STATE.ON_DEATH and player.nCurrentEnergy >= 10 then
		if not player.GetBuff(11163, 1)then
			player.AddBuff(player.dwID, player.nLevel, 11163, 1)
		end
	else
		if player.GetBuff(11163, 1) then
			player.DelBuff(11163, 1)
		end
	end
	---鞘刀姿态需求
	if player.nMoveState ~= MOVE_STATE.ON_DEATH and player.nCurrentSunEnergy >= 10 then
		if not player.GetBuff(11164, 1)then
			player.AddBuff(player.dwID, player.nLevel, 11164, 1)
		end
	else
		if player.GetBuff(11164, 1) then
			player.DelBuff(11164, 1)
		end
	end
	--]]
	---势孤奇穴判定
	if player.GetSkillLevel(16816) == 1 and player.IsHaveBuff(10814,1) and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		if not player.IsHaveBuff(11251, 1) then
			player.AddBuff(player.dwID, player.nLevel, 11251, 1)
		end
	else
		if player.IsHaveBuff(11251, 1) then
			player.DelBuff(11251, 1)
		end
	end

	if player.GetSkillLevel(16817) == 1 then
		---冷川奇穴判定,B_11253内置CD，B_11252实际免死效果，B_9933折叶效果，避免和折叶免死冲突
		if not player.IsHaveBuff(11253, 1) and not player.IsHaveBuff(11252, 1) and not player.IsHaveBuff(9933, 1)then
			player.AddBuff(player.dwID, player.nLevel, 11252, 1)
		end
		---防止和折叶不死冲突
		if player.IsHaveBuff(11252, 1) and player.IsHaveBuff(9933, 1) then
			player.DelBuff(11252, 1)
		end
		
		---触发双刀假死，添加内置CD
		if player.nCurrentLife <= player.nMaxLife * 0.01 and not player.IsHaveBuff(11253, 1) and player.nMoveState ~= MOVE_STATE.ON_DEATH and player.bFightState == true then
			player.DelBuff(11252, 1)
			player.AddBuff(player.dwID, player.nLevel, 11253, 1)
			player.nCurrentLife = player.nMaxLife * 0.1
			if player.IsHaveBuff(10814, 1) then
				player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.005 * player.nCurrentEnergy
				player.nCurrentEnergy = 0
			elseif player.IsHaveBuff(10815, 1) then
				player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.005 * player.nCurrentRage
				player.nCurrentRage = 0
			elseif player.IsHaveBuff(10816, 1) then
				player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.005 * player.nCurrentSunEnergy
				player.nCurrentSunEnergy = 0
			end
		end
	end
	
	---双刀触发重烟，技能调息加快
	if player.GetSkillLevel(16893) == 1 and player.IsHaveBuff(10815, 1) then
		if not player.IsHaveBuff(11249, 1) then
			player.AddBuff(player.dwID, player.nLevel, 11249, 1)
		end
	else
		if player.IsHaveBuff(11249, 1)then
			player.DelBuff(11249, 1)
		end
	end

	
	local nSpeedLev = 1
	if player.GetSkillLevel(16731) == 1 then
		nSpeedLev = 2
		if player.IsHaveBuff(11381, 1) then
			player.DelGroupBuff(11381, 1)
		end
	else
		if player.IsHaveBuff(11381, 2) then
			player.DelGroupBuff(11381, 2)
		end
	end
	--双刀正常状态添加跑速效果
	if player.IsHaveBuff(10814, 1) and player.bOnHorse == false and player.bSprintFlag == false then
		if not player.IsHaveBuff(11381, nSpeedLev) then
			player.AddBuff(player.dwID, player.nLevel, 11381, nSpeedLev)
		end
	elseif player.IsHaveBuff(11381, nSpeedLev) then
		player.DelGroupBuff(11381, nSpeedLev)
	end

	---雾晓奇穴效果，触发额外Miss效果。
	if player.GetSkillLevel(16731) == 1 and player.IsHaveBuff(10814, 1) and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		if not player.IsHaveBuff(11200, 1) then
			player.AddBuff(player.dwID, player.nLevel, 11200, 1)
		end
	else
		player.DelBuff(11200, 1)
	end
end
	
--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com