---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/猿公剑法_剑主天地.lua
-- 更新时间:	2017/3/15 18:15:49
-- 更新用户:	chenchen6-pc
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  纯阳_技能事件_知北游.lua
-- 创建人    :  kingbeyond
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  技能事件
-- 技能名称  :  知北游
-- 技能效果  :  知北游的事件技能，被击时触发，对攻击者释放一个伤害技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nLunarDamage = 80 * 0.95, nLunarDamageRand = 68 * 0.1, nCostMana = 62 },
	{nLunarDamage = 90 * 0.95, nLunarDamageRand = 77 * 0.1, nCostMana = 68 },
	{nLunarDamage = 100 * 0.95, nLunarDamageRand = 86 * 0.1, nCostMana = 74 },
	{nLunarDamage = 110 * 0.95, nLunarDamageRand = 95 * 0.1, nCostMana = 80 },
	{nLunarDamage = 115 * 0.95, nLunarDamageRand = 104 * 0.1, nCostMana = 86 },
	{nLunarDamage = 120 * 0.95, nLunarDamageRand = 113 * 0.1, nCostMana = 92 },
	{nLunarDamage = 125 * 0.95, nLunarDamageRand = 122 * 0.1, nCostMana = 98},
	{nLunarDamage = 131 * 0.95, nLunarDamageRand = 131 * 0.1, nCostMana = 104},
	{nLunarDamage = 140 * 0.95, nLunarDamageRand = 140 * 0.1, nCostMana = 110},
	{nLunarDamage = 149 * 0.95, nLunarDamageRand = 149 * 0.1, nCostMana = 116},
	{nLunarDamage = 158 * 0.95, nLunarDamageRand = 158 * 0.1, nCostMana = 122},
	{nLunarDamage = 167 * 0.95, nLunarDamageRand = 167 * 0.1, nCostMana = 128},
	{nLunarDamage = 176 * 0.95, nLunarDamageRand = 176 * 0.1, nCostMana = 62 },
	{nLunarDamage = 185 * 0.95, nLunarDamageRand = 185 * 0.1, nCostMana = 68 },
	{nLunarDamage = 194 * 0.95, nLunarDamageRand = 194 * 0.1, nCostMana = 74 },
	{nLunarDamage = 203 * 0.95, nLunarDamageRand = 203 * 0.1, nCostMana = 80 },
	{nLunarDamage = 212 * 0.95, nLunarDamageRand = 212 * 0.1, nCostMana = 86 },
	{nLunarDamage = 221 * 0.95, nLunarDamageRand = 221 * 0.1, nCostMana = 92 },
	{nLunarDamage = 230 * 0.95, nLunarDamageRand = 230 * 0.1, nCostMana = 98},
	{nLunarDamage = 239 * 0.95, nLunarDamageRand = 239 * 0.1, nCostMana = 104},
	{nLunarDamage = 248 * 0.95, nLunarDamageRand = 248 * 0.1, nCostMana = 110},
	{nLunarDamage = 257 * 0.95, nLunarDamageRand = 257 * 0.1, nCostMana = 116},
	{nLunarDamage = 266 * 0.95, nLunarDamageRand = 266 * 0.1, nCostMana = 122},
	{nLunarDamage = 275 * 0.95, nLunarDamageRand = 275 * 0.1, nCostMana = 128},
	{nLunarDamage = 284 * 0.95, nLunarDamageRand = 284 * 0.1, nCostMana = 62 },
	{nLunarDamage = 293 * 0.95, nLunarDamageRand = 293 * 0.1, nCostMana = 68 },
	{nLunarDamage = 302 * 0.95, nLunarDamageRand = 302 * 0.1, nCostMana = 74 },
	{nLunarDamage = 311 * 0.95, nLunarDamageRand = 311 * 0.1, nCostMana = 80 },
	{nLunarDamage = 320 * 0.95, nLunarDamageRand = 320 * 0.1, nCostMana = 86 },
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nLunarDamage / 2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nLunarDamageRand / 2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/七秀/猿公剑法_剑主天地.lua", --属性值1
		0															--属性值2
	);
	--for i = 1, 3 do
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
	--"skill/七秀/名动四方_去除剑舞.lua",
	--0
	--);
	--[[
	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
	ATTRIBUTE_TYPE.ACCUMULATE, -- 魔法属性
	1, -- 属性值1
	0														-- 属性值2
	);
	--]]
	--skill.AddAttribute(														--70橙武技能
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--6213,
	--1
	--);

	--end

	--skill.BindBuff(1, 523, 1)--减速BUFF，12秒

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	--公共CD1.5秒
	skill.SetNormalCoolDown(1, 191);	--公共CD1.5秒
	skill.SetCheckCoolDown(1, 444);
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 270 * 0.2 * 0.9;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 270 * 0.4 * 0.9;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 270 * 0.6 * 0.9;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 270 * 0.8 * 0.9;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 270 * 0.9;	-- 技能消耗的内力
	end
	--------------- 设置杂项参数 ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 128; 									--施放角度

	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒

	if dwSkillLevel < 10 then
		skill.nChannelInterval = 36 * 1.5;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = (36 + (dwSkillLevel - 9) * 3) * 1.5
	else
		skill.nChannelInterval = 96 * 1.5;     -- 通道技间隔时间
	end

	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	--skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断

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
end
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

	--减速效果
	--[[
	if player.GetSkillLevel(5857) == 1 then
		if player.IsSkillRecipeActive(153, 1) then
			--65%效果
			target.AddBuff(player.dwID, player.nLevel, 9777, 4)
		else
			--55%效果
			target.AddBuff(player.dwID, player.nLevel, 9777, 2)
		end
	else
	--]]
	if player.IsSkillRecipeActive(153, 1) then
		target.AddBuff(player.dwID, player.nLevel, 9777, 4)  		--65%减速效果

		--剑主天地回复剑舞
		for i = 1, 3 do
			player.CastSkill(13438, 1)
		end
	else
		--50%减速效果
		target.AddBuff(player.dwID, player.nLevel, 9777, 1)
	end

	--锁足效果
	if player.GetSkillLevel(6848) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5793, 1, 1)
	end
	--[[if player.GetSkillLevel(6847) == 1 then
		player.CastSkill(3016, 1)
		player.CastSkill(3016, 1)
		player.AddBuff(dwSkillSrcID,player.nLevel,6384,1,1)
	end--]]

	--[[剑主天地回复剑舞
	if player.GetSkillLevel(5857) == 1 then
		for i = 1, 3 do
			player.CastSkill(13438, 1)
		end
	end
	--]]

	--[[小队叠加破防
	if player.GetSkillLevel(14713) == 1 then
		player.CastSkill(14714, 1)
	end
--]]
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com