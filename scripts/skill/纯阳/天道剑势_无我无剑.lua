---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/天道剑势_无我无剑.lua
-- 更新时间:	2014/7/3 19:31:48
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天道剑势_无我无剑.lua
-- 创建人    :  kingbeyond
-- 创建时间  :  2008-07-01
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  天道剑势
-- 技能名称  :  无我无剑
-- 技能效果  :  放气技能 造成单体伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 80, nDamageRand = 7}, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 154, nDamageRand = 15}, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 228, nDamageRand = 24}, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 302, nDamageRand = 32}, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 376, nDamageRand = 40}, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 450, nDamageRand = 48}, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 524, nDamageRand = 56}, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 598, nDamageRand = 65}, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 672, nDamageRand = 73}, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 746, nDamageRand = 81}, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 820, nDamageRand = 89}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 894, nDamageRand = 97}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 968, nDamageRand = 106}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1042, nDamageRand = 114}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1116, nDamageRand = 122}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1190, nDamageRand = 130}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1264, nDamageRand = 138}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1338, nDamageRand = 147}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1412, nDamageRand = 155}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1486, nDamageRand = 163}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1560, nDamageRand = 171}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1634, nDamageRand = 179}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1708, nDamageRand = 188}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1782, nDamageRand = 196}, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1856, nDamageRand = 204}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1930, nDamageRand = 212}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2004, nDamageRand = 220}, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2078, nDamageRand = 229}, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2152, nDamageRand = 237}, -- Level 29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2226, nDamageRand = 245}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2300, nDamageRand = 253}, -- Level 31
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2374, nDamageRand = 261}, -- Level 32
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2448, nDamageRand = 270}, -- Level 33
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2522, nDamageRand = 278}, -- Level 34
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2596, nDamageRand = 286}, -- Level 35
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						-- 属性作用模式
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
   		"skill/纯阳/天道剑势_无我无剑.lua",							--属性值1
   		0							--属性值2
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
	skill.SetPublicCoolDown(16);						-- 公共CD
	skill.SetCheckCoolDown(1, 444);
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;			-- 技能消耗的内力
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
	if dwSkillLevel <= 7 then
		skill.nCostManaBasePercent = 315*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 14 then
		skill.nCostManaBasePercent = 315*0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 21 then
		skill.nCostManaBasePercent = 315*0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 28 then
		skill.nCostManaBasePercent = 315*0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 315;	-- 技能消耗的内力
	end
	----------------- 聚气相关 -------------------------------------------------
	skill.bIsAccumulate = true;						-- 技能是否需要聚气
	skill.SetSubsectionSkill(1, 1, 383, dwSkillLevel)	-- 1点气
	skill.SetSubsectionSkill(2, 2, 386, dwSkillLevel)
	skill.SetSubsectionSkill(3, 3, 387, dwSkillLevel)
	skill.SetSubsectionSkill(4, 4, 388, dwSkillLevel)
	skill.SetSubsectionSkill(5, 5, 389, dwSkillLevel)	-- 5点气
	skill.SetSubsectionSkill(6, 6, 390, dwSkillLevel)
	skill.SetSubsectionSkill(7, 7, 391, dwSkillLevel)
	skill.SetSubsectionSkill(8, 8, 392, dwSkillLevel)
	skill.SetSubsectionSkill(9, 9, 393, dwSkillLevel)
	skill.SetSubsectionSkill(10, 10, 394, dwSkillLevel)	-- 10点气

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0;					-- 技能施放的最小距离
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024

	----------------- 武器伤害相关 ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(62)
	end
	--满级新手指引任务
	--local nQuestIndex = player.GetQuestIndex(13420)
	--local nQuestPhase = player.GetQuestPhase(13420)
	--if nQuestIndex and nQuestPhase == 1 then
		--player.SetQuestValue(nQuestIndex, 0, skill.dwLevel)
	--end
	-- if player.IsAchievementAcquired(61) and player.IsAchievementAcquired(62) and player.IsAchievementAcquired(63) and player.IsAchievementAcquired(64) and player.IsAchievementAcquired(65) and player.IsAchievementAcquired(66) and player.IsAchievementAcquired(67) then
	-- player.AcquireAchievement(72)
	-- end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--附魔效果，有S_9356的附魔并且在人剑后B_8007状态下生效
	if player.GetSkillLevel(9356) == 1 and player.GetBuff(8007, 1) then
		player.ClearCDTime(438)
	end

	if player.GetSkillLevel(15187) == 1 then
		local nbuff = player.GetBuff(10203, 1)
		if nbuff then
			--print(2222)
			player.ResetCD(983)
			local nCount = nbuff.nStackNum
			--print(nCount)
			for i = 1, 5-nCount do
				--print(1111111)
				player.CastSkill(15192, 1)
			end
		end
		
		for i = 1, 5 do
			player.DelBuff(10204, i)
		end

		player.DelGroupBuff(10203, 1)
		RemoteCallToClient(player.dwID, "ChangeSkillSurfaceNum", 15187, 0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com