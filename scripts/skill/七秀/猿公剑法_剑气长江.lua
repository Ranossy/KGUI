---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/猿公剑法_剑气长江.lua
-- 更新时间:	2017/3/15 19:15:09
-- 更新用户:	chenchen6-pc
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  kingbeyond
-- 创建时间  :  2009-3-13
-- 技能效果  :  单体阴性伤害切10%伤害给队友回内
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nLunarDamage = 21, nLunarDamageRand = 33 * 2 * 0.04, nCostMana = 30 },
	{nLunarDamage = 76, nLunarDamageRand = 41 * 2 * 0.04, nCostMana = 50 },
	{nLunarDamage = 80, nLunarDamageRand = 50 * 2 * 0.04, nCostMana = 67 },
	{nLunarDamage = 81, nLunarDamageRand = 58 * 2 * 0.04, nCostMana = 93 },
	{nLunarDamage = 84, nLunarDamageRand = 67 * 2 * 0.04, nCostMana = 111},
	{nLunarDamage = 255 * 2 * 0.98, nLunarDamageRand = 75 * 2 * 0.04, nCostMana = 130},
	{nLunarDamage = 264 * 2 * 0.98, nLunarDamageRand = 84 * 2 * 0.04, nCostMana = 149},
	{nLunarDamage = 272 * 2 * 0.98, nLunarDamageRand = 92 * 2 * 0.04, nCostMana = 167},
	{nLunarDamage = 281 * 2 * 0.98, nLunarDamageRand = 101 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 289 * 2 * 0.98, nLunarDamageRand = 109 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 298 * 2 * 0.98, nLunarDamageRand = 118 * 2 * 0.04, nCostMana = 30 },
	{nLunarDamage = 306 * 2 * 0.98, nLunarDamageRand = 126 * 2 * 0.04, nCostMana = 50 },
	{nLunarDamage = 325 * 2 * 0.98, nLunarDamageRand = 135 * 2 * 0.04, nCostMana = 67 },
	{nLunarDamage = 323 * 2 * 0.98, nLunarDamageRand = 143 * 2 * 0.04, nCostMana = 93 },
	{nLunarDamage = 332 * 2 * 0.98, nLunarDamageRand = 152 * 2 * 0.04, nCostMana = 111},
	{nLunarDamage = 340 * 2 * 0.98, nLunarDamageRand = 160 * 2 * 0.04, nCostMana = 130},
	{nLunarDamage = 349 * 2 * 0.98, nLunarDamageRand = 169 * 2 * 0.04, nCostMana = 149},
	{nLunarDamage = 357 * 2 * 0.98, nLunarDamageRand = 177 * 2 * 0.04, nCostMana = 167},
	{nLunarDamage = 366 * 2 * 0.98, nLunarDamageRand = 186 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 374 * 2 * 0.98, nLunarDamageRand = 194 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 383 * 2 * 0.98, nLunarDamageRand = 203 * 2 * 0.04, nCostMana = 30 },
	{nLunarDamage = 391 * 2 * 0.98, nLunarDamageRand = 211 * 2 * 0.04, nCostMana = 50 },
	{nLunarDamage = 400 * 2 * 0.98, nLunarDamageRand = 220 * 2 * 0.04, nCostMana = 67 },
	{nLunarDamage = 408 * 2 * 0.98, nLunarDamageRand = 228 * 2 * 0.04, nCostMana = 93 },
	{nLunarDamage = 417 * 2 * 0.98, nLunarDamageRand = 237 * 2 * 0.04, nCostMana = 111},
	{nLunarDamage = 425 * 2 * 0.98, nLunarDamageRand = 245 * 2 * 0.04, nCostMana = 130},
	{nLunarDamage = 434 * 2 * 0.98, nLunarDamageRand = 254 * 2 * 0.04, nCostMana = 149},
	{nLunarDamage = 442 * 2 * 0.98, nLunarDamageRand = 262 * 2 * 0.04, nCostMana = 167},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	----七秀伤害阵法第五重
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		787,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nLunarDamage * 0.2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nLunarDamageRand * 0.5,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);
--[[   	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
        ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
        "skill/七秀/七秀_七诀剑气.lua", 	-- 连协技
        0
    );--]]

	--2011年4月18日添加剑气长江消耗剑舞2层.张豪
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/名动四方_去除剑舞.lua",
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/名动四方_去除剑舞.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/名动四方_去除剑舞.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/七秀_玳弦急曲_点爆.lua",
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/猿公剑法_剑气长江.lua",
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.ACCUMULATE, -- 魔法属性
 - 3, -- 属性值1
		0														-- 属性值2
	);

	for i = 1, 3 do
		for j = 1, 3 do
			skill.AddAttribute(
				ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
				ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
				6213,
				i
			);
		end
	end

	skill.AddAttribute(														--70橙武技能
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3083,
		1
	);

	skill.AddAttribute(														--80橙武技能
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3047,
		1
	);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	skill.AddSlowCheckSelfBuff(5866, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	--公共CD
	skill.SetNormalCoolDown(1, 123);	--自身CD10秒
	skill.SetCheckCoolDown(1, 444);
	--skill.nDamageToManaForParty = 51;	-- 伤害的5%转为自身回内

	--skill.AddSlowCheckSelfBuff(409, 3, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 472 * 0.2 * 0.9 * 0.8;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 472 * 0.4 * 0.9 * 0.8;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 472 * 0.6 * 0.9 * 0.8;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 472 * 0.8 * 0.9 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 472 * 0.9 * 0.8;	-- 技能消耗的内力
	end
	--------------- 设置杂项参数 ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 128; 									--施放角度

	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 64 * 1.1 * 1.2 * 1.1;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (64 + (dwSkillLevel - 9) * 4) * 1.1 * 1.2 * 1.1
	else
		skill.nChannelInterval = 152 * 1.1 * 1.2 * 1.1;     -- 通道技间隔时间
	end

	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧

	skill.nBreakRate = 1024;									--被打断的概率,默认1024表示一定被打断

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	if player.GetBuff(1383, 2) or player.GetBuff(8528, 1) then
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(50)
	end
	-- if player.IsAchievementAcquired(49) and player.IsAchievementAcquired(50) and player.IsAchievementAcquired(51) and player.IsAchievementAcquired(52) and player.IsAchievementAcquired(53) and player.IsAchievementAcquired(54) then
	-- player.AcquireAchievement(70)
	-- end
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
	--5%的易伤效果
	if player.GetSkillLevel(14705) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 7683, 1)
	end

	--元君添加会心
	if target.nCurrentLife <= target.nMaxLife * 0.5 then
		if player.GetSkillLevel(6561) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6418, 1, 1)
		end
	end

	local nLevel = player.GetSkillLevel(537)
	if not nLevel then
		return
	end
	--[[
	local lv = player.GetSkillLevel(561)
	if not lv then
		return
	end

	if player.GetSkillLevel(5860) == 1 then
		player.CastSkill(9114, lv)
	end
	--]]
	--[[
	if player.GetBuff(1383, 2) or player.GetBuff(8528, 1) then
		for i = 1, 3 do
			player.CastSkill(6213, 1)
		end
	end
	--]]
	--[[
	if player.GetSkillLevel(6571) == 1 then
		if not player.GetBuff(6421, 1) then
			if player.GetBuff(409, nLevel) and player.GetBuff(409, nLevel).nStackNum <= 1 then
				for i = 1, 10 do
					player.AddBuff(player.dwID, player.nLevel, 409, nLevel)
				end
				player.AddBuff(0,99,6432,1)
				player.AddBuff(0, 99, 6421, 1)  -- 内置CD
			end
			if player.GetBuff(409, nLevel + 7) and player.GetBuff(409, nLevel+7).nStackNum <= 1 then
				for i = 1, 10 do
					player.AddBuff(player.dwID, player.nLevel, 409, nLevel+7)
				end
				player.AddBuff(0,99,6432,1)
				player.AddBuff(0, 99, 6421, 1)
			end
			if player.GetBuff(409, nLevel + 14) and player.GetBuff(409, nLevel+14).nStackNum <= 1 then
				for i = 1, 10 do
					player.AddBuff(player.dwID, player.nLevel, 409, nLevel+14)
				end
				player.AddBuff(0,99,6432,1)
				player.AddBuff(0,99,6421,1)
			end
			player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
			player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
		end
	end
	--]]
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com