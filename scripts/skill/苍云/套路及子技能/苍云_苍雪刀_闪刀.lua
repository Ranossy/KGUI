---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/套路及子技能/苍云_苍雪刀_闪刀.lua
-- 更新时间:	2017/5/15 15:58:32
-- 更新用户:	chenchen6-pc
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 30, nDamageRand = 20 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 85, nDamageRand = 45 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 100, nDamageRand = 60 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 115, nDamageRand = 75 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 130, nDamageRand = 90 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 145, nDamageRand = 105 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 160, nDamageRand = 120 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 175, nDamageRand = 135 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 190, nDamageRand = 150 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 205, nDamageRand = 165 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 220, nDamageRand = 180 * 0.1, nCostMana = 0}, --level 11
	{nDamageBase = 235, nDamageRand = 195 * 0.1, nCostMana = 0}, --level 12
	{nDamageBase = 250, nDamageRand = 210 * 0.1, nCostMana = 0}, --level 13
	{nDamageBase = 265, nDamageRand = 225 * 0.1, nCostMana = 0}, --level 14
	{nDamageBase = 280, nDamageRand = 240 * 0.1, nCostMana = 0}, --level 15
	{nDamageBase = 295, nDamageRand = 255 * 0.1, nCostMana = 0}, --level 16
	{nDamageBase = 310, nDamageRand = 270 * 0.1, nCostMana = 0}, --level 17
	{nDamageBase = 340, nDamageRand = 300 * 0.1, nCostMana = 0}, --level 18
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		126,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/苍云/套路及子技能/苍云_苍雪刀_闪刀.lua",
		0
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff   --盾墙状态下标记buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级

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
	skill.SetNormalCoolDown(1, 806);	--技能普通CD
	skill.SetNormalCoolDown(2, 804);	--技能普通CD
	skill.SetNormalCoolDown(3, 836);	--隐刀0.5秒
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
	skill.nCostRage = 15

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
	skill.nMaxRadius = 15 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 1;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	if dwSkillLevel < 5 then
		skill.nChannelInterval = 45;
	elseif dwSkillLevel < 18 then
		skill.nChannelInterval = 45 + (dwSkillLevel - 4) * 8;
	else
		skill.nChannelInterval = 160;     -- 通道技间隔时间
	end
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nMinPrepareFrames  	= -1;				-- 急速效果最小吟唱帧数：默认是-1，吟唱不受急速影响。大于等于0则受急速影响，最小读条时间为填的值
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nMinChannelInterval	= -1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nMinChannelFrame	= -1; 				-- 通常配合急速最小间隔时间使用。使得通道技能整体加速。如果这个填-1，间隔不是-1，高急速可以多1跳
	skill.nBulletVelocity = 0;				-- 子弹速度，单位 点/帧

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
	skill.nNeedPoseState = 1
	----------------- 打退打断落马相关 -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0

	----------------- 武器伤害相关 ---------------------------------------------
	skill.nWeaponDamagePercent = 1024;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local nTarget
	if IsPlayer(dwCharacterID) then
		nTarget = GetPlayer(dwCharacterID)
	else
		nTarget = GetNpc(dwCharacterID)
	end
	player.AddBuff(0, 99, 8658, 1, 3) -- 冲刺换站定表现
--	player.AddBuff(0, 99, 8662, 1, 10) -- 冲刺换站定表现
	local LvSD = player.GetSkillLevel(13053)
	if LvSD ~= 0 then
		player.CastSkill(13453, LvSD, player.GetSkillTarget())   --释放闪刀的伤害技能，因为当前技能为冲刺，希望它必中
	end

	local lvXD = player.GetSkillLevel(13153)  --血刀
	if lvXD >= 1 then
		player.AddBuff(player.dwID, player.nLevel, 8274, 1, 4)  --闪刀更换为血刀的buff维持4秒
	end
	local lvYD = player.GetSkillLevel(13152)  --隐刀
	if  nTarget.GetBuffByOwner(8248, 1, player.dwID) then --虚弱
		if lvYD >= 1 then
			if not player.GetBuff(8270, 1) then
				player.AddBuff(player.dwID, player.nLevel, 8270, 1, 5)  --闪刀更换为隐刀的buff维持7秒
			end
		end
	end

-----------------------------------------------------血怒回血
	local lvxn = player.GetSkillLevel(13040)
	local nRageCost = 15
	local nReplishLife = 0.001

	if player.GetSkillLevel(13073) == 1 and lvxn ~= 0 and (player.GetBuff(8244, lvxn) or player.GetBuff(8245, lvxn))then
		if player.nCurrentLife <= player.nMaxLife * (1 - nReplishLife * nRageCost) then
			player.nCurrentLife = player.nCurrentLife + player.nMaxLife * nRageCost * nReplishLife
		else
			player.nCurrentLife = player.nMaxLife
		end
	end

	if player.GetSkillLevel(14840) == 1 then
		local nbuff = player.GetBuff(9890, 1)
		if nbuff then
			nbuff.nCustomValue = nbuff.nCustomValue + nRageCost
			for i = 1, 5 do
				if nbuff.nCustomValue >= 15 then
					nbuff.nCustomValue = nbuff.nCustomValue - 15
					player.nCurrentEnergy = player.nCurrentEnergy + 1
				else
					break
				end
			end
		end
	end
---------------------------------------------------
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com