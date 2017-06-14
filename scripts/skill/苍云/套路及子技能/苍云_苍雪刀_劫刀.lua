---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/套路及子技能/苍云_苍雪刀_劫刀.lua
-- 更新时间:	2014/9/12 21:39:21
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/套路及子技能/苍云_苍雪刀_劫刀.lua
-- 更新时间:	2014/9/9 14:07:57
-- 更新用户:	mengxiangfei
-- 脚本说明:
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 120, nDamageRand = 80*0.1, nCostMana = 0}, --level 1
	{nDamageBase = 150, nDamageRand = 90*0.1, nCostMana = 0}, --level 2
	{nDamageBase = 180, nDamageRand = 100*0.1, nCostMana = 0}, --level 3
	{nDamageBase = 210, nDamageRand = 110*0.1, nCostMana = 0}, --level 4
	{nDamageBase = 230, nDamageRand = 120*0.1, nCostMana = 0}, --level 5
	{nDamageBase = 250, nDamageRand = 130*0.1, nCostMana = 0}, --level 6
	{nDamageBase = 270, nDamageRand = 140*0.1, nCostMana = 0}, --level 7
	{nDamageBase = 290, nDamageRand = 150*0.1, nCostMana = 0}, --level 8
	{nDamageBase = 310, nDamageRand = 160*0.1, nCostMana = 0}, --level 9
	{nDamageBase = 330, nDamageRand = 170*0.1, nCostMana = 0}, --level 10
	{nDamageBase = 350, nDamageRand = 120*0.1, nCostMana = 0}, --level 11
	{nDamageBase = 370, nDamageRand = 130*0.1, nCostMana = 0}, --level 12
	{nDamageBase = 390, nDamageRand = 140*0.1, nCostMana = 0}, --level 13
	{nDamageBase = 400, nDamageRand = 150*0.1, nCostMana = 0}, --level 14
	{nDamageBase = 410, nDamageRand = 160*0.1, nCostMana = 0}, --level 15
	{nDamageBase = 420, nDamageRand = 170*0.1, nCostMana = 0}, --level 16
	{nDamageBase = 430, nDamageRand = 180*0.1, nCostMana = 0}, --level 17
	{nDamageBase = 440, nDamageRand = 190*0.1, nCostMana = 0}, --level 18
	{nDamageBase = 450, nDamageRand = 200*0.1, nCostMana = 0}, --level 19
	{nDamageBase = 460, nDamageRand = 210*0.1, nCostMana = 0}, --level 20
	{nDamageBase = 470, nDamageRand = 220*0.1, nCostMana = 0}, --level 21
	{nDamageBase = 480, nDamageRand = 230*0.1, nCostMana = 0}, --level 22
	{nDamageBase = 490, nDamageRand = 240*0.1, nCostMana = 0}, --level 23
	{nDamageBase = 500, nDamageRand = 250*0.1, nCostMana = 0}, --level 24
	{nDamageBase = 510, nDamageRand = 260*0.1, nCostMana = 0}, --level 25
	{nDamageBase = 520, nDamageRand = 270*0.1, nCostMana = 0}, --level 26
	{nDamageBase = 530, nDamageRand = 280*0.1, nCostMana = 0}, --level 27
	{nDamageBase = 550, nDamageRand = 290*0.1, nCostMana = 0}, --level 28
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase / 5,
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
		0,
		0
	);
	--血怒buff期间耗怒回血效果
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/苍云/套路及子技能/苍云_苍雪刀_劫刀.lua",
		0
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--B_8265为判定玩家是否在盾墙状态,盾墙状态无法施展技能
	skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级

	--需要擎刀姿态
	skill.nNeedPoseState = 1

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
	skill.SetNormalCoolDown(1, 796);	--技能普通CD
	skill.SetNormalCoolDown(2, 804);	--连击1秒
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
	skill.nCostRage = 10
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
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nMinPrepareFrames  	= -1;				-- 急速效果最小吟唱帧数：默认是-1，吟唱不受急速影响。大于等于0则受急速影响，最小读条时间为填的值
	--skill.nMinChannelInterval	= -1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 20*1.1;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (20 + (dwSkillLevel - 9) * 7)*1.1;
	else
		skill.nChannelInterval = 160*1.1;     -- 通道技间隔时间
	end
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

	----------------- 打退打断落马相关 -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	skill.nBreakRate = 0;		-- 打断目标施法的概率,基数1024

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
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	--[[
	--删除绝返降低消耗效果
	if player.GetSkillLevel(13090) == 1 then
		if player.GetBuff(9053, 1) then
			player.DelBuff(9053, 1)
		end
	end
	--]]
	--劫刀消耗25点怒气，有奇穴13073 赤心 回血
	local lv = player.GetSkillLevel(13040)
	local nRageCost = 10
	if player.IsSkillRecipeActive(1836, 1) then
		nRageCost = nRageCost - 5
	end
	local nReplishLife = 0.001
	
	if player.GetSkillLevel(13073) == 1 and lv ~= 0 and (player.GetBuff(8244, lv) or player.GetBuff(8245, lv)) then
		if player.nCurrentLife <= player.nMaxLife * (1-nReplishLife * nRageCost) then
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
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com