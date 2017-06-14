---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/长歌_音_变宫治疗.lua
-- 更新时间:	2015/8/10 19:15:28
-- 更新用户:	mengxiangfei11
-- 脚本说明:

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapy = 150 / 3 * 0.95, nTherapyRand = 150 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 187 / 3 * 0.95, nTherapyRand = 187 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 224 / 3 * 0.95, nTherapyRand = 224 / 3 * 0.1, nCostMana = 61 },
	{nTherapy = 261 / 3 * 0.95, nTherapyRand = 261 / 3 * 0.1, nCostMana = 88 },
	{nTherapy = 298 / 3 * 0.95, nTherapyRand = 298 / 3 * 0.1, nCostMana = 108},
	{nTherapy = 335 / 3 * 0.95, nTherapyRand = 335 / 3 * 0.1, nCostMana = 129},
	{nTherapy = 372 / 3 * 0.95, nTherapyRand = 372 / 3 * 0.1, nCostMana = 149},
	{nTherapy = 409 / 3 * 0.95, nTherapyRand = 409 / 3 * 0.1, nCostMana = 170},
	{nTherapy = 446 / 3 * 0.95, nTherapyRand = 446 / 3 * 0.1, nCostMana = 190},
	{nTherapy = 483 / 3 * 0.95, nTherapyRand = 483 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 520 / 3 * 0.95, nTherapyRand = 520 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 557 / 3 * 0.95, nTherapyRand = 557 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 594 / 3 * 0.95, nTherapyRand = 594 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 631 / 3 * 0.95, nTherapyRand = 631 / 3 * 0.1, nCostMana = 42 },
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	--正常治疗技能
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14360,
		dwSkillLevel
		);
	--[[
	--目标非自身给自身额外治疗效果
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14385,
		dwSkillLevel
	);
	--]]
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(9377, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	skill.AddSlowCheckSelfBuff(9506, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	--青霄飞羽期间没有高山流水曲状态则不能释放宫徵的标记buff
	skill.AddSlowCheckSelfBuff(9552, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(14361, 0, SKILL_COMPARE_FLAG.EQUAL);     --检查比较Caster自己已学习的技能ID和等级

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
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--技能普通CD
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
	--skill.nCostMana      	= 150;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 270 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 270 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 270 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 270 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 270;	-- 技能消耗的内力
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
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 28;				-- 吟唱帧数
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
	--[[
	player.AddBuff(player.dwID, player.nLevel, 9430, 1, 12)	--阳春白雪主动技能buff

	--删除阳春白雪被动增益触发效果
	for i = 1, 3 do
		player.DelBuff(9433, i)
		player.DelBuff(9434, i)
	end
	player.DelGroupBuff(10216, 1)
	player.DelGroupBuff(10217, 1)
	--]]
	if not player.GetBuff(9430, 1) then
		--print(6666)
		--删除阳春白雪被动增益触发效果
		for i = 1, 3 do
			player.DelBuff(9433, i)
			player.DelBuff(9434, i)
		end
		player.DelGroupBuff(10216, 1)
		player.DelGroupBuff(10217, 1)
		player.AddBuff(player.dwID, player.nLevel, 9430, 1, 12)	--阳春白雪主动技能buff
	else
		--print(7777)
		player.DelBuff(9430, 1)
	end
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		player.AddBuff(player.dwID, player.nLevel, 9430, 1, 12)	--阳春白雪主动技能buff
		return nPreResult;
	end
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	--local lv = skill.dwLevel

	--player.LearnSkillLevel(14300, lv, player.dwID)	--学习变宫治疗
	--player.LearnSkillLevel(14303, lv, player.dwID)	--学习宫治疗hot
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	--[[
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

	local nbuffCount = 0
	--商一组buff,应该是4个一组
	if target.GetBuffByOwner(9357, 1, player.dwID) or target.GetBuffByOwner(9358, 1, player.dwID) or target.GetBuffByOwner(9359, 1, player.dwID) or target.GetBuffByOwner(9360, 1, player.dwID) then
		nbuffCount = nbuffCount + 1
	end
	--角一组buff
	if target.GetBuffByOwner(9361, 1, player.dwID) or target.GetBuffByOwner(9362, 1, player.dwID) or target.GetBuffByOwner(9363, 1, player.dwID) or target.GetBuffByOwner(9364, 1, player.dwID) then
		nbuffCount = nbuffCount + 1
	end
	--宫一组buff
	if target.GetBuffByOwner(9373, 1, player.dwID) or target.GetBuffByOwner(9374, 1, player.dwID) or target.GetBuffByOwner(9375, 1, player.dwID) or target.GetBuffByOwner(9376, 1, player.dwID) then
		nbuffCount = nbuffCount + 1
	end
	--师襄根据目标属于自己buff数量动态加buff层数
	if player.GetSkillLevel(14282) == 1 then
		player.DelGroupBuff(9355, 1)
		if nbuffCount ~= 0 then
			for i = 1, nbuffCount do
				player.AddBuff(player.dwID, player.nLevel, 9355, 1)
			end
		end
	end

	--诗上，宫几率叠加标记buff
	if player.GetSkillLevel(14233) == 1 then
		local nRnd = Random(1, 10000)
		if nRnd <= 3500 then
			player.AddBuff(player.dwID, player.nLevel, 9329, 1)
		end
	end

	--冻泉，宫后叠加易伤
	if player.GetSkillLevel(14284) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 9356, 1)
	end

	--删除阳春白雪主动技能判定buff
	if player.GetBuff(9430, 1) then
		player.DelBuff(9430, 1)
	end

	--删除阳春白雪被动增益触发效果
	for i = 1, 3 do
		player.DelBuff(9433, i)
		player.DelBuff(9434, i)
	end
	--]]
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com