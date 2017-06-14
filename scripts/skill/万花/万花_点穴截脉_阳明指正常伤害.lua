---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_点穴截脉_阳明指正常伤害.lua
-- 更新时间:	2015/9/27 21:25:16
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 38, nDamageRand = 5, }, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 44, nDamageRand = 5, }, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, nDamageRand = 5, }, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, nDamageRand = 5, }, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 59, nDamageRand = 5, }, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 63, nDamageRand = 5, }, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 69, nDamageRand = 5, }, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 71, nDamageRand = 5, }, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73, nDamageRand = 5, }, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 75, nDamageRand = 10, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 77, nDamageRand = 11, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 79, nDamageRand = 12, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 81, nDamageRand = 13, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 83, nDamageRand = 14, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 85, nDamageRand = 15, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 86, nDamageRand = 16, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 90, nDamageRand = 17, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 94, nDamageRand = 18, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 98, nDamageRand = 19, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 102, nDamageRand = 20, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 105, nDamageRand = 21, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 110, nDamageRand = 22, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 115, nDamageRand = 23, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 120, nDamageRand = 24, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125, nDamageRand = 25, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 135, nDamageRand = 26, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 145, nDamageRand = 27, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 155, nDamageRand = 28, }, -- Level 28
};

tPit =
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageBase * (1 - tPit[dwSkillLevel].nReducePercent), -- 属性值1
		0																-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageRand * (1 - tPit[dwSkillLevel].nReducePercent), -- 属性值1
		0																-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- 魔法属性
		0, -- 属性值1
		0																-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 花间AP加成
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1116,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- 魔法属性
		2726, -- 属性值1
		1																	-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_点穴截脉_阳明指正常伤害.lua",
		0
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetPublicCoolDown(16);						-- 公共CD 1.5秒
	--skill.SetNormalCoolDown(1, 175);
	--skill.SetCheckCoolDown(1, 444)
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostRage		= 0;									-- 技能消耗的怒气
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
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nMinPrepareFrames = 1;
	--skill.nPrepareFrames = 28;				-- 吟唱帧数  09年6月27改为32 ——CBG
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 48 * 1.365*1.2;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (48 + (dwSkillLevel - 9) * 4) * 1.365*1.2
	else
		skill.nChannelInterval = 130 * 1.365*1.2;     -- 通道技间隔时间
	end

	--skill.nChannelInterval = 130; 				-- 通道技间隔时间
	--skill.nMinChannelInterval = 1;
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 85;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 目标血量需求 ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- 血量最小值>=
	--skill.TargetLifePercentMax	= 100;			-- 血量最大值<=

	----------------- 打断相关 -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
end

function OnSkillLevelUp(skill, player)
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

	--这个下面也会用到
	local lv_shangyang = player.GetSkillLevel(180)
	local lv_lancui = player.GetSkillLevel(190)
	local lv1 = player.GetSkillLevel(189)
	local nSkill = player.GetKungfuMount()

	--乱洒青荷阳明附带dot效果
	local buff_luansa = player.GetBuff(2719, 1)
	if buff_luansa then
		local nValue = buff_luansa.nCustomValue
		if nValue == 0 then
			if lv_lancui ~= 0 then
				--附带兰摧
				player.CastSkill(13848, lv_lancui, player.GetSkillTarget())
			end
			if lv1 ~= 0 then
				--附带钟林
				player.CastSkill(13847, lv1, player.GetSkillTarget())
			end
			if lv_shangyang ~= 0 then
				--附带商阳
				--player.CastSkill(13849, lv_shangyang, player.GetSkillTarget())
			end
		end
		buff_luansa.nCustomValue = buff_luansa.nCustomValue + 1
		if player.GetBuff(2719, 1) then
			player.DelBuff(2719,1)
		end
	end

	--寒碧阳明附带钟林
	if player.GetSkillLevel(5773) == 1 and lv1 ~= 0 then
		if not player.GetBuff(5697, 1) and (not buff_luansa or (buff_luansa and buff_luansa.nCustomValue > 1)) then --寒碧
			player.CastSkill(3037, lv1, player.GetSkillTarget())
		end
	end

	--阳明指重置芙蓉并蒂CD
	player.CastSkill(1121, 1)

	--附魔效果，阳明指叠快雪伤害标记
	if player.GetSkillLevel(9464) == 1 and nSkill ~= nil and nSkill.dwSkillID == 10021 then
		player.AddBuff(player.dwID, player.nLevel, 8085, 1)
		local nbuffcount = player.GetBuff(8085, 1).nStackNum
		if nbuffcount >= 5 then
			player.DelGroupBuff(8085, 1)
			--换图标buff
			if player.GetSkillLevel(5762) == 1 then
				--换为单体快雪
				player.AddBuff(player.dwID, player.nLevel, 8086, 1)
			else
				--换为群体快雪
				player.AddBuff(player.dwID, player.nLevel, 8087, 1)
			end
		end
	end

	--梦歌阳明指叠溢伤
	if player.GetSkillLevel(5764) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 6251, 1)
	end


	target.AddBuff(dwSkillSrcID, player.nLevel, 5698, 1, 1)
	local lv2 = player.GetSkillLevel(179)
	local t1, t2, t3, t4, t5, t6
	t1 = 0
	t2 = 0
	t3 = 0
	t4 = 0
	t5 = 0
	t6 = 0
	player.CastSkill(6126, 1, player.GetSkillTarget())
	if player.GetBuff(5850, 1) then
		t1 = 1
	end
	if not t1 == 1 then
		player.CastSkill(6127, 1, player.GetSkillTarget())
		if player.GetBuff(5850, 1) then
			t2 = 1
		end
	end
	player.CastSkill(6128, 1, player.GetSkillTarget())
	if player.GetBuff(5851, 1) then
		t3 = 1
	end
	player.CastSkill(6129, 1, player.GetSkillTarget())
	if player.GetBuff(5852, 1) then
		t4 = 1
	end
	if not t4 == 1 then
		player.CastSkill(6130, 1, player.GetSkillTarget())
		if player.GetBuff(5852, 1) then
			t5 = 1
		end
	end
	if (not t4 == 1) and (not t5 == 1) then
		player.CastSkill(6131, 1, player.GetSkillTarget())
		if player.GetBuff(5852, 1) then
			t6 = 1
		end
	end
	local sum = t1 + t2 + t3 + t4 + t5 + t6

	--阳明指命中有自身持续伤害效果的目标溅射持续伤害效果
	if player.GetSkillLevel(5774) == 1 then
		--溅射商阳
		--print(11111)
		if target.GetBuffByOwner(666, lv_shangyang, player.dwID) then
			--print(22222)
			--target.AddBuff(player.dwID, player.nLevel, 9725, 1)	--不刷新当前目标
			--print(player.CastSkill(14647, lv_shangyang, player.GetSkillTarget()))
			player.CastSkillXYZ(14647, lv_shangyang, target.nX, target.nY, target.nZ + 948)
		end

		--溅射兰摧
		if target.GetBuffByOwner(711, lv_lancui, player.dwID) then
			--target.AddBuff(player.dwID, player.nLevel, 9726, 1)	--不刷新当前目标
			--player.CastSkill(14648, lv_lancui, player.GetSkillTarget())
			player.CastSkillXYZ(14648, lv_lancui, target.nX, target.nY, target.nZ + 948)
		end

		--溅射钟林
		if target.GetBuffByOwner(714, lv1, player.dwID) then
			--target.AddBuff(player.dwID, player.nLevel, 9727, 1)	--不刷新当前目标
			--player.CastSkill(14649, lv1, player.GetSkillTarget())
			player.CastSkillXYZ(14649, lv1, target.nX, target.nY, target.nZ + 948)
		end
	end

	--花间沃土奇穴效果
	local lv = 0
	if t1 == 1 or t2 == 1 then
		lv = lv + 1
	end
	if t3 == 1 then
		lv = lv + 1
	end
	if t4 == 1 or t5 == 1 or t6 == 1 then
		lv = lv + 1
	end

	local i
	--[[
	if player.GetSkillLevel(5767) == 1 then
		for i = 1, sum do
			player.AddBuff(player.dwID, player.nLevel, 6255, 1, 1)
		end
	end
	--]]
	if player.GetSkillLevel(9477) == 1 then
		if player.GetBuff(8102, 1) then
			local nbuffnum = player.GetBuff(8102, 1).nStackNum
			player.CastSkill(9478, nbuffnum)
			player.DelGroupBuff(8102, 1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com