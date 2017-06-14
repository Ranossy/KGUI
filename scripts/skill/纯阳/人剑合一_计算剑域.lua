---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/人剑合一_计算剑域.lua
-- 更新时间:	2017/4/19 19:42:18
-- 更新用户:	xueyan3
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天道剑势_人剑合一.lua
-- 创建人    :  kingbeyond
-- 创建时间  :  2008-09-11
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 538, nDamageRand = 0}, -- Level 1
	{nAddRage = 0, nCostRage = 0, nDamageBase = 573, nDamageRand = 0}, -- Level 2
	{nAddRage = 0, nCostRage = 0, nDamageBase = 608, nDamageRand = 0}, -- Level 3
	{nAddRage = 0, nCostRage = 0, nDamageBase = 643, nDamageRand = 0}, -- Level 4
	{nAddRage = 0, nCostRage = 0, nDamageBase = 678, nDamageRand = 0}, -- Level 5
	{nAddRage = 0, nCostRage = 0, nDamageBase = 713, nDamageRand = 0}, -- Level 6
	{nAddRage = 0, nCostRage = 0, nDamageBase = 748, nDamageRand = 0}, -- Level 7
	{nAddRage = 0, nCostRage = 0, nDamageBase = 783, nDamageRand = 0}, -- Level 8
	{nAddRage = 0, nCostRage = 0, nDamageBase = 818, nDamageRand = 0}, -- Level 9
	{nAddRage = 0, nCostRage = 0, nDamageBase = 853, nDamageRand = 0}, -- Level 10
	{nAddRage = 0, nCostRage = 0, nDamageBase = 888, nDamageRand = 0}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 923, nDamageRand = 0}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 958, nDamageRand = 0}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 993, nDamageRand = 0}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1028, nDamageRand = 0}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1063, nDamageRand = 0}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1098, nDamageRand = 0}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1133, nDamageRand = 0}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1168, nDamageRand = 0}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1203, nDamageRand = 0}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1238, nDamageRand = 0}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1273, nDamageRand = 0}, -- Level 22
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
--[[玄门之后不再受到心剑两望收益
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/纯阳/判定气场类型.lua", -- 属性值1
		0															-- 属性值2
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/纯阳/人剑合一_计算剑域.lua", -- 属性值1
		0															-- 属性值2
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);				-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);				-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot
	skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetPublicCoolDown(16);						-- 公共CD 1.5秒
	--skill.SetNormalCoolDown(1, 196);						-- 196号CD10秒
	--skill.SetCheckCoolDown(1, 444);
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/6)*103;	-- 技能消耗的内力
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 5 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 30 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

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
	--skill.TargetLifePercentMin	= 0;			-- 血量最小值>=
	--skill.TargetLifePercentMax	= 100;			-- 血量最大值<=

	----------------- 自身血量需求 ---------------------------------------------
	--skill.SelfLifePercentMin	= 0;			-- 血量最小值>=
	--skill.SelfLifePercentMax	= 100;			-- 血量最大值<=

	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	--print("QQSSqqq")
	--[[
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end

  --  print("calc jianyu", npc.szName, player.szName)

	local npcjzfz = scene.GetNpcByNickName("jianzhen_xuanmen" .. player.dwID)
	if not npcjzfz then
		return
	end
	--print(tQichangNpcID[npc.dwTemplateID])
	--print(npc.szName)
	--print(npc.GetCustomBoolean(0))
--	local qixue_lev = player.GetSkillLevel(14833)
--	local lv = player.GetSkillLevel(588)

	if tQichangNpcID[npc.dwTemplateID] and tQichangNpcID[npc.dwTemplateID] == 1 and npc.GetCustomBoolean(0) then
		local jznum = npcjzfz.GetCustomUnsigned1(0)
		npcjzfz.SetCustomUnsigned4(1 + 4 * jznum, npc.dwID)
		npcjzfz.SetCustomUnsigned1(0, jznum + 1)
		--print(jznum+1)
	end
	--]]
	local playertarget = GetPlayer(dwCharacterID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if not playertarget then
		return
	end
	if playertarget.GetSkillLevel(17586) == 0 then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npcjzfz = scene.GetNpcByNickName("jianzhen_xuanmen" .. player.dwID)
	if not npcjzfz then
		return
	end
	local npcgas
	local jznum = 0
	for i = 1, 3 do
		npcgas = playertarget.GetGas(i - 1)
		if npcgas and npcgas.GetCustomBoolean(0) then
			jznum = npcjzfz.GetCustomUnsigned1(0)
			if jznum >= 7 then
				return
			end
			if GetCharacterDistance(player.dwID, npcgas.dwID) <= 20*64 then
				npcjzfz.SetCustomUnsigned4(1 + 4 * jznum, npcgas.dwID)
				npcjzfz.SetCustomUnsigned1(0, jznum + 1)
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com