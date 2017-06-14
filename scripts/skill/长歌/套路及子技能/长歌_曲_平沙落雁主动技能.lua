---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/长歌_曲_平沙落雁主动技能.lua
-- 更新时间:	2016/11/18 16:03:54
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Include/ClearCoolID.lh")

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
		ATTRIBUTE_TYPE.MODIFY_THREAT, -- 增加一点仇恨
		1,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/长歌/套路及子技能/长歌_曲_平沙落雁主动技能.lua", -- 属性值1
		0											-- 属性值2
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(9506, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	skill.AddSlowCheckSelfBuff(9322, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
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
	--skill.BindBuff(1, 9322, 1);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 978);	--技能普通CD
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
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
	skill.nCostManaBasePercent = 1000;	-- 技能消耗的内力
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
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 48;				-- 吟唱帧数
	skill.nMinPrepareFrames = 1;				-- 急速效果最小吟唱帧数：默认是-1，吟唱不受急速影响。大于等于0则受急速影响，最小读条时间为填的值
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nMinChannelInterval	= -1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nMinChannelFrame	= -1; 				-- 通常配合急速最小间隔时间使用。使得通道技能整体加速。如果这个填-1，间隔不是-1，高急速可以多1跳
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
	--skill.nWeaponDamagePercent = 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult) -- 判断玩家的状态，以判断是否可以发出技能
	local target = player.GetSelectCharacter()
	if not target then
		return SKILL_RESULT_CODE.FAILED
	end
	if not target or target.GetBuff(7049, 1)or target.GetBuff(10864, 1) or target.GetBuff(10472, 1) or target.GetBuff(7525, 1) or target.GetBuff(7525, 2) or target.GetBuff(7561, 1) or target.GetBuff(7561, 2) or target.GetBuff(9982, 1) or target.GetBuff(10224, 1) or target.GetBuff(10225, 1) or target.GetBuff(9506, 1) or target.GetBuff(4964, 2) or target.GetBuff(11594, 0) or target.nMoveState == MOVE_STATE.ON_AUTO_FLY or target.dwShapeShiftID ~= 0 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 161), 4)
		return SKILL_RESULT_CODE.FAILED
	end
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then

		player.AddBuff(player.dwID, player.nLevel, 10791, 1)
	end
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	--print(33333333)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--print(111111)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	player.DelBuff(10791, 1)
	--print(222222)
	--记录CD
	target.Stop()
	target.BackupCoolDown()
	--重置目标CD
	for i = 1, #tCoolID do	--清除CD
		if tCoolID[i] ~= 37 and tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --不重置内功切换和轮回决
			target.ClearCDTime(tCoolID[i])
		end
	end
	
	--这一部分功能已经在skill.lh中注释掉了，由程序功能直接满足
--[[
	local SkillCDTable = {
		[10003] = {257, 261, 258, 236, 252, 260},
		[10002] = {257, 261, 258, 236, 252, 260},
		[10021] = {132, 100, 136, 182, 2645, 14965, 228, 141, 14639},
		[10028] = {132, 100, 136, 141, 2663, 14963, 140, 14664},
		[10026] = {413, 412, 433, 418, 2628, 15158, 423, 425},
		[10062] = {413, 412, 433, 418, 2628, 15115, 423, 425},
		[10175] = {3702, 2226, 2227, 2218, 15121, 2216, 2228, 2212, 2215, 2214},
		[10225] = {3103, 3114, 3094, 3112, 3090, 3089},
		[10224] = {3103, 3114, 3094, 3112, 3090, 3089},
		[10144] = {1589, 1656, 1668, 1649, 1645, 1663, 1596},
		[10145] = {1589, 1656, 1668, 1649, 1645, 1663, 1596},
		[10242] = {3973, 3974, 3975, 3978, 3968, 3977, 3969, 3970},
		[10014] = {371, 6911, 355, 2681, 313, 370, 305, 2674},
		[10015] = {372, 355, 2681, 313, 366, 310, 2690},
		[10080] = {557, 569, 555, 550, 574, 568},
		[10081] = {557, 558, 573, 550, 574, 568, 544},
		[10176] = {3702, 2226, 2957, 2230, 2235, 6688, 2228, 2216},
		[10243] = {3973, 3981, 3985, 3984, 3968, 3971, 3969, 3970, 3980},
		[10390] = {13067, 13042, 13070, 15196, 13040, 13072, 13049, 13424},
		[10447] = {14082, 14232, 14081, 14076, 14074, 14075},
		[10448] = {14082, 14073, 14081, 14076, 14074, 14075}
	}

	local targetKungfuID = nil
	if target.GetKungfuMount() ~= nil then
		targetKungfuID = target.GetKungfuMount().dwSkillID
	end

	for k, v in pairs(SkillCDTable) do
		if k == targetKungfuID then
			for _, SkillID in pairs(v) do
				if target.GetBuff(9322, 1) then
					if SkillID == 14074 then
						ModityCDToUI(target, SkillID, 14223, 0)
					elseif SkillID == 14075 then
						ModityCDToUI(target, SkillID, 14224, 0)
					else
						ModityCDToUI(target, SkillID, 0, 0)
					end
				else
					ModityCDToUI(target, SkillID, 0, 0)
				end
			end
		end
	end
--]]
	if target.IsDueling(dwSkillSrcID) == 0 and target.dwFirstAttackPlayer == 0 then
		--print(666)
		target.dwFirstAttackPlayer = dwSkillSrcID
	end

	player.BeginControlPlayer(target.dwID)

	--停止冲刺中的目标，防止高度异常摔死
	if target.nMoveState == MOVE_STATE.ON_DASH then
		target.Stop()
	end

	--ModityCDToUI(target, 257, 0, 0)

	--[[
	player.AddBuff(target.dwID, target.nLevel, 10173, 1)
	target.AddBuff(target.dwID, target.nLevel, 10174, 1)
	--]]
	if target.GetBuff(10471, 1) then
		player.AddBuff(target.dwID, target.nLevel, 10173, 1, 6)
		target.AddBuff(target.dwID, target.nLevel, 10174, 1, 6)
		local nbuff = target.GetBuff(10174, 1)
		if nbuff then
			nbuff.nCustomValue = 2
		end
	else
		--print(111111)
		player.AddBuff(target.dwID, target.nLevel, 10173, 1, 12)
		target.AddBuff(target.dwID, target.nLevel, 10174, 1, 12)
		local nbuff = target.GetBuff(10174, 1)
		if nbuff then
			nbuff.nCustomValue = 1
		end
	end

	local nbuff = player.GetBuff(10173, 1)
	if nbuff then
		nbuff.nCustomValue = target.nCurrentMana

		ModityCDToUI(player, 14232, 0, 0)
	end

	--[[
	--复活目标后立刻重置目标CD
	for i = 1, #tCoolID do	--清除CD
		if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --不重置内功切换
			target.ClearCDTime(tCoolID[i])
		end
	end
	--记录CD
	player.BackupCoolDown()

	--回复CD
	player.RestoreCoolDown()
	--]]
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com