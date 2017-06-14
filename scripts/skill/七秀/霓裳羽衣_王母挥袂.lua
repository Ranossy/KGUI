---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/霓裳羽衣_王母挥袂.lua
-- 更新时间:	2015/11/2 14:29:09
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  七秀_霓裳羽衣_王母挥袂.lua
-- 创建人    :  吴娟
-- 创建时间  :  2008-08-20
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :
-- 武功套路  :  霓裳羽衣
-- 技能名称  :  王母挥袂
-- 技能效果  :  远程大单体治疗，需要剑舞状态
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapy = 530 * 0.95, nTherapyRand = 530 * 0.1, nCostMana = 115 }, -- level 1
	{nTherapy = 662 * 0.95, nTherapyRand = 662 * 0.1, nCostMana = 166 }, -- level 2
	{nTherapy = 795 * 0.95, nTherapyRand = 795 * 0.1, nCostMana = 205 }, -- level 3
	{nTherapy = 927 * 0.95, nTherapyRand = 927 * 0.1, nCostMana = 243 }, -- level 4
	{nTherapy = 1060 * 0.95, nTherapyRand = 1060 * 0.1, nCostMana = 282 }, -- level 5
	{nTherapy = 1192 * 0.95, nTherapyRand = 1192 * 0.1, nCostMana = 321 }, -- level 6
	{nTherapy = 1325 * 0.95, nTherapyRand = 1325 * 0.1, nCostMana = 359 }, -- level 7
	{nTherapy = 1457 * 0.95, nTherapyRand = 1457 * 0.1, nCostMana = 398 }, -- level 8
	{nTherapy = 1623 * 0.95, nTherapyRand = 1623 * 0.1, nCostMana = 398 }, -- level 9
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

 ----------------- 魔法属性 -------------------------------------------------
 ---- 七秀治疗阵法第五重
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		530,
		1
	);

 -- skill.AddAttribute(
 -- ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
 -- ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
 -- 2976,
 -- dwSkillLevel
 -- );
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/七秀/霓裳羽衣_王母挥袂.lua", -- 属性值1
		0 -- 属性值2
	);
 -- for i = 1, 3 do
 -- skill.AddAttribute(
 -- ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
 -- ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
 -- "skill/七秀/名动四方_去除剑舞.lua",
 -- 0
 -- );
 -- skill.AddAttribute(
 -- ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
 -- ATTRIBUTE_TYPE.ACCUMULATE, -- 魔法属性
 --- 1, -- 属性值1
 -- 0														-- 属性值2
 -- );

 -- skill.AddAttribute(														--70橙武技能
 -- ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
 -- ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
 -- 6213,
 -- 1
 -- );

 -- end

 ----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL); -- 需求自身Buff
 -- skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

 ----------------- BUFF相关 -------------------------------------------------
 -- skill.BindBuff(1, 126, 1)			-- 设置Buff  dwSkillLevel：注意与等级一致
 -- skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
 -- skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
 -- skill.BindBuff(1, 592, 1);				-- 设置Hot

 ----------------- 设置Cool down --------------------------------------------
 -- CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	skill.SetPublicCoolDown(16); -- 公共CD1.5秒
	skill.SetNormalCoolDown(2, 188); -- 自身CD15秒
	skill.SetCheckCoolDown(1, 444);
 ----------------- 经验升级相关 ---------------------------------------------
 -- 注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
 -- skill.dwLevelUpExp	= 0;    				-- 升级经验
 -- skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
 -- skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

 ----------------- 技能消耗 -------------------------------------------------
 -- skill.nCostLife		= 0;					-- 技能消耗生命值
 -- skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力：注意跟技能等级一致
 -- skill.nCostRage		= 0;					-- 技能消耗的怒气
 -- skill.nCostStamina	= 0;					-- 技能消耗的体力
 -- skill.nCostItemType	= 0;					-- 技能消耗的物品类型
 -- skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 539 * 0.8 * 0.2; -- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 539 * 0.8 * 0.4; -- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 539 * 0.8 * 0.6; -- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 539 * 0.8 * 0.8; -- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 539 * 0.8; -- 技能消耗的内力
	end
 ----------------- 聚气相关 -------------------------------------------------
 -- skill.bIsAccumulate	= false;				-- 技能是否需要聚气
 -- skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

 ----------------- 链状技能相关 ---------------------------------------------
 -- skill.nChainBranch	= 1;					--链状技能分支数
 -- skill.nChainDepth		= 3;					--链状技能层数
 -- 链状技能的子技能用skill.SetSubsectionSkill()设定

 ----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0; -- 技能施放的最小距离
	skill.nMaxRadius = 20 * LENGTH_BASE; -- 技能施放的最大距离

 ----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256; -- 攻击范围的扇形角度范围
 -- skill.nAreaRadius		= 20 * LENGTH_BASE;		-- 技能作用半径
 -- skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

 ----------------- 时间相关 -------------------------------------------------
 -- skill.nPrepareFrames  	= 48;				-- 吟唱帧数
	skill.nChannelInterval = 150; -- 通道技间隔时间
 -- skill.nChannelFrame		= 48;	 			-- 通道技持续时间，单位帧数
 -- skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

 ----------------- 阵法相关 -------------------------------------------------
 -- skill.bIsFormationSkill	= false;			-- 是否阵眼技能
 -- skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
 -- skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

 ----------------- 打断相关 -------------------------------------------------
 -- skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
 -- skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024

 ----------------- 武器伤害相关 ---------------------------------------------
 -- nWeaponDamagePercent		= 0;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult) -- 判断玩家的状态，以判断是否可以发出技能
	if player.GetBuff(1383, 2) then
		return nPreResult;
	end
	local nLevel = player.GetSkillLevel(537)
	if player.GetBuff(409, nLevel) then
		local	nBuff = player.GetBuff(409, nLevel)
		local   stackNum = nBuff.nStackNum
		if stackNum < 4  then
			return false
		end
	end
	if player.GetBuff(409, nLevel + 7) then
		local	nBuff = player.GetBuff(409, nLevel + 7)
		local   stackNum = nBuff.nStackNum
		if stackNum < 4  then
			return false
		end
	end
	if player.GetBuff(409, nLevel + 14) then
		local	nBuff = player.GetBuff(409, nLevel + 14)
		local   stackNum = nBuff.nStackNum
		if stackNum < 4  then
			return false
		end
	end

	return nPreResult;
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
	local lv = player.GetSkillLevel(569)
	if player.GetSkillLevel(14730) == 1 and target.nCurrentLife <= target.nMaxLife * 0.4 and not player.GetBuff(9784, 1) then
		player.ClearCDTime(188)
		player.ClearCDTime(441)
		player.SetTimer(2, "scripts/skill/七秀/霓裳羽衣_王母挥袂.lua", 0, 0)
		player.AddBuff(player.dwID, player.nLevel, 9784, 1)
	end
	if player.GetSkillLevel(5875) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5794, 1, 1)
		player.CastSkillXYZ(6209, lv, target.nX, target.nY, target.nZ)
		player.PlaySfx(485, target.nX, target.nY, target.nZ + 500)
	end
	if player.GetSkillLevel(5881) == 1 then
		player.CastSkill(2931, 1)
	end
 -- if player.GetSkillLevel(5874) == 1 then
	if IsPlayer(dwCharacterID) then
		if player.GetSkillLevel(5874) == 1 then
			if target.nCurrentLife > target.nMaxLife * 0.4 then
				player.CastSkill(2976, lv, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(2977, lv, TARGET.PLAYER, dwCharacterID)
			end
		else
			player.CastSkill(2976, lv, TARGET.PLAYER, dwCharacterID)
		end
	else
		if player.GetSkillLevel(5874) == 1 then
			if target.nCurrentLife > target.nMaxLife * 0.4 then
				player.CastSkill(2976, lv, TARGET.NPC, dwCharacterID)
			else
				player.CastSkill(2977, lv, TARGET.NPC, dwCharacterID)
			end
		else
			player.CastSkill(2976, lv, TARGET.NPC, dwCharacterID)
		end
	end

 -- 王母命中气血值低于35%目标立刻重置技能调息
 	--[[
	if player.GetSkillLevel(14730) == 1 and target.nCurrentLife <= target.nMaxLife * 0.35 and not player.GetBuff(9784, 1) then
		player.ClearCDTime(188)
		player.ClearCDTime(441)
		player.AddBuff(player.dwID, player.nLevel, 9784, 1)
	end
	--]]
	ModityCDToUI(player, 569, 0, 0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
	player.ClearCDTime(188)
	player.ClearCDTime(441)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com