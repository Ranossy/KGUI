---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/丐帮/丐帮_亢龙有悔.lua
-- 更新时间:	2017/3/21 21:35:43
-- 更新用户:	chenchen6-pc
-- 脚本说明:
----------------------------------------------------------------------<

------------------------------------------------
-- 创建人   :  CBG
-- 创建时间	:  2013-03-12
-- 效果备注	:  默认的技能脚本
------------------------------------------------

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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/丐帮/丐帮_亢龙有悔.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_MOVE,
		39,
		1						--1是自己，0是目标
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		5528,
		dwSkillLevel						--1是自己，0是目标
	);
	for i = 1, 7 do
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CAST_SKILL,
			6866,
			i						--根据内力造成不同伤害
		);
	end
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	--skill.SetDelaySubSkill(9, 5528, dwSkillLevel)
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
	--skill.BindBuff(1, 6200, 1);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(590);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--技能普通CD
	skill.SetCheckCoolDown(1, 16);	--只检查不走的CD
	skill.SetNormalCoolDown(1, 603);
	skill.SetCheckCoolDown(2, 444)
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	skill.nCostManaMaxPercent = 0.3 * 1024;					-- 技能消耗的内力
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 6 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
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

	skill.nWeaponDamagePercent = 0; -- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	if not player then
		return SKILL_RESULT_CODE.FAILED
	end
	if player.GetSkillLevel(6857) == 1 then
		--if player.nCurrentMana / player.nMaxMana > 0.4 then
		--player.AddBuff(0, 99, 6400, 1)
		--end
		--if player.nCurrentMana / player.nMaxMana > 0.5 then
		--player.AddBuff(0, 99, 6400, 1)
		--end
		--if player.nCurrentMana / player.nMaxMana > 0.6 then
		--player.AddBuff(0, 99, 6400, 1)
		--end
		--if player.nCurrentMana / player.nMaxMana > 0.7 then
		--player.AddBuff(0, 99, 6400, 1)
		--end
		--if player.nCurrentMana / player.nMaxMana > 0.8 then
		--player.AddBuff(0, 99, 6400, 1)
		--end
		--if player.nCurrentMana / player.nMaxMana > 0.9 then
		--player.AddBuff(0, 99, 6400, 1)
		--end
		--if player.nCurrentMana == player.nMaxMana then
		--player.AddBuff(0, 99, 6400, 1)
		--end
		player.AddBuff(0, 99, 6400, 1)
	end
	--player.AddBuff(player.dwID, player.nLevel, 5754, 1, 18)
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3445)
	end
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
	--[[
	--每消耗10%内力调息时间降低1秒
	if player.GetSkillLevel(14629) == 1 then
		local nCount = math.floor(player.nCurrentMana / player.nMaxMana * 10, 1) + 5
		for i = 1, nCount do
			player.CastSkill(14817, 1)
		end
	end
	--]]
	--龙啸不消耗内力
	if player.GetSkillLevel(14626) ~= 1 then
		player.nCurrentMana = 0
	end

	player.AddBuff(player.dwID, player.nLevel, 5754, 1, 18)
	--[[
	if player.GetSkillLevel(6830) == 1 then
		player.DelGroupBuff(5996, 1)
		player.DelGroupBuff(5996, 2)
		player.DelGroupBuff(5996, 3)
		player.DelGroupBuff(5996, 4)
		player.AddBuff(0, 99, 6200, 1)
	end
	--]]
	player.SetTimer(1, "scripts/skill/丐帮/丐帮_亢龙有悔.lua", 0, 0)

	if player.GetSkillLevel(6857) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 6386, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end

	local nBuff = player.GetBuff(9169, 1)
	local nNum = 0
	if nBuff then
		nNum = nNum + nBuff.nStackNum
	end

	--减伤
	if player.GetSkillLevel(6830) == 1 then
		player.DelGroupBuff(5996, 1)
		player.DelGroupBuff(5996, 2)
		player.DelGroupBuff(5996, 3)
		player.DelGroupBuff(5996, 4)
		local nCount = 6 + nNum
		player.AddBuff(0, 99, 6200, 1, nCount)
	else
		player.AddBuff(0, 99, 6200, 1, 6)
	end
	--命中目标回血
	if player.GetSkillLevel(6830) == 1 then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.05 * nNum
	end

	--[[注释效果命中一个目标回复10%内力
	if player.GetSkillLevel(14626) == 1 then
		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.1 * nNum
	end
	--]]

	--[[
	--命中一个目标调息时间降低2秒
	if player.GetSkillLevel(14631) == 1 then
		local nbuff_mark = player.GetBuff(9720, 1)
		if nbuff_mark then
			--print(2222222)
			local nTime = nbuff_mark.nStackNum
			--print(nTime)
			for i = 1, nTime do
				player.CastSkill(14632,1)
			end
		end
	end
	--]]

	--删除计数buff
	player.DelGroupBuff(9169, 1)

	ModityCDToUI(player, 5267, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com