---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/套路及子技能/苍云_风雷引_盾抛.lua
-- 更新时间:	2014/11/19 17:37:27
-- 更新用户:	zhouyixiao2
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 20, nDamageRand = 20 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 30, nDamageRand = 30 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 40, nDamageRand = 40 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 50, nDamageRand = 50 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 60, nDamageRand = 60 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 70, nDamageRand = 70 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 80, nDamageRand = 80 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 90, nDamageRand = 90 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 100, nDamageRand = 100 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 110, nDamageRand = 110 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 120, nDamageRand = 120 * 0.1, nCostMana = 0}, --level 11
	{nDamageBase = 130, nDamageRand = 130 * 0.1, nCostMana = 0}, --level 12
	{nDamageBase = 140, nDamageRand = 140 * 0.1, nCostMana = 0}, --level 13
	{nDamageBase = 150, nDamageRand = 150 * 0.1, nCostMana = 0}, --level 14
	{nDamageBase = 160, nDamageRand = 160 * 0.1, nCostMana = 0}, --level 15
	{nDamageBase = 170, nDamageRand = 170 * 0.1, nCostMana = 0}, --level 16
	{nDamageBase = 180, nDamageRand = 180 * 0.1, nCostMana = 0}, --level 17
	{nDamageBase = 190, nDamageRand = 190 * 0.1, nCostMana = 0}, --level 18
	{nDamageBase = 200, nDamageRand = 200 * 0.1, nCostMana = 0}, --level 19
	{nDamageBase = 210, nDamageRand = 210 * 0.1, nCostMana = 0}, --level 20
	{nDamageBase = 220, nDamageRand = 220 * 0.1, nCostMana = 0}, --level 21
	{nDamageBase = 230, nDamageRand = 230 * 0.1, nCostMana = 0}, --level 22
	{nDamageBase = 240, nDamageRand = 240 * 0.1, nCostMana = 0}, --level 23
	{nDamageBase = 250, nDamageRand = 250 * 0.1, nCostMana = 0}, --level 24
	{nDamageBase = 260, nDamageRand = 260 * 0.1, nCostMana = 0}, --level 25
	{nDamageBase = 270, nDamageRand = 270 * 0.1, nCostMana = 0}, --level 26
	{nDamageBase = 280, nDamageRand = 280 * 0.1, nCostMana = 0}, --level 27
	{nDamageBase = 290, nDamageRand = 290 * 0.1, nCostMana = 0}, --level 28
	{nDamageBase = 300, nDamageRand = 300 * 0.1, nCostMana = 0}, --level 29
	{nDamageBase = 310, nDamageRand = 310 * 0.1, nCostMana = 0}, --level 30
	{nDamageBase = 320, nDamageRand = 320 * 0.1, nCostMana = 0}, --level 31
	{nDamageBase = 330, nDamageRand = 330 * 0.1, nCostMana = 0}, --level 32
	{nDamageBase = 350, nDamageRand = 350 * 0.1, nCostMana = 0}, --level 33
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
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
		0,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_MOVE,
		103,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_MOVE,
		102,
		1						--1是自己，0是目标
	);

	--[[skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_KNOCKED_OFF_PARABOLA,
		335,
		4
	);--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/苍云/套路及子技能/苍云_风雷引_盾抛.lua",
		0
	);

	--[[skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/装备/烟花筒_爆竹_击飞.lua",
		0
	);	--]]

	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--苍云盾墙
	skill.AddSlowCheckSelfBuff(8441, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);	--盾毅标记
	skill.AddSlowCheckDestOwnBuff(8467, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 盾毅标记
	--skill.AddSlowCheckSelfOwnBuff(8441, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 盾毅标记
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	skill.nNeedPoseState = 2
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
	--  skill.BindBuff(1, 5160, 1);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 829);	--技能普通CD
	--skill.SetNormalCoolDown(2, 804);	--技能普通CD
	skill.SetCheckCoolDown(1, 804);	--只检查不走的CD
	skill.SetCheckCoolDown(2, 16);	--只检查不走的CD
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

	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
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
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius = 8 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 1;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	if dwSkillLevel < 5 then
		skill.nChannelInterval = 16;
	elseif dwSkillLevel < 33 then
		skill.nChannelInterval = 16 + (dwSkillLevel - 4) * 3;
	else
		skill.nChannelInterval = 100;     -- 通道技间隔时间
	end
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
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

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if not player then
		return SKILL_RESULT_CODE.FAILED
	end
	local TargetType, TargetID = player.GetTarget()
	if TargetType == TARGET.NO_TARGET then
		return SKILL_RESULT_CODE.FAILED
	end

	local target
	if TargetType == TARGET.PLAYER then
		target = GetPlayer(TargetID)
	elseif TargetType == TARGET.NPC then
		target = GetNpc(TargetID)
	end

	if not target then
		return SKILL_RESULT_CODE.FAILED
	end

	player.TurnToCharacter(target.dwID)

	if target.nImmuneSkillMoveCount == 0 then
		target.TurnToCharacter(player.dwID)
		--player.AdjustPlayerDistance(target.dwID,128)
	end
	player.DelBuff(8441, 1)
	local nTarget
	if IsPlayer(dwCharacterID) then
		nTarget = GetPlayer(dwCharacterID)
	--	nTarget.SetTimer(32, "scripts/skill/苍云/套路及子技能/苍云_风雷引_盾抛.lua", nTarget.dwID, 0)
	else
		nTarget = GetNpc(dwCharacterID)
	end

	if nTarget.nImmuneSkillMoveCount == 0 then
		nTarget.BeHitted(player.dwID, 13069, 1, 30)
		nTarget.AddBuff(0, 99, 8566, 1, 4)
	end
	player.AddBuff(0, 99, 8483, 1, 2)

	--player.AddBuff(0, 99, 7338, 1) --锁操作
	--player.DoAction(dwCharacterID, 12112) --冲上天空的动作
end
--function OnTimer(player, nParam1, nParam2)
	--local nTarget = GetPlayer(nParam1)
	--if not nTarget then
		--return
	--end
	--nTarget.DoAction(0, 55163)
--end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com