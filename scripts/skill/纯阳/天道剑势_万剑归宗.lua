---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/天道剑势_万剑归宗.lua
-- 更新时间:	2013-6-7 0:48:39
-- 更新用户:	xiedixun1
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天道剑势_万剑归宗.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  天道剑势
-- 技能名称  :  万剑归宗
-- 技能效果  :  长剑加身，周身挥舞，对自身一定范围内的目标造成外功伤害..
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 67, nDamageRand = 7}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 103, nDamageRand = 10}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 138, nDamageRand = 14}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 174, nDamageRand = 17}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 209, nDamageRand = 21}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 245, nDamageRand = 24}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 280, nDamageRand = 28}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 316, nDamageRand = 31}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 351, nDamageRand = 35}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 387, nDamageRand = 38}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 422, nDamageRand = 42}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 458, nDamageRand = 46}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 493, nDamageRand = 49}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 529, nDamageRand = 53}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 564, nDamageRand = 56}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 600, nDamageRand = 60}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 635, nDamageRand = 63}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 671, nDamageRand = 67}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 706, nDamageRand = 70}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 742, nDamageRand = 74}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 777, nDamageRand = 78}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 813, nDamageRand = 81}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 848, nDamageRand = 85}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 884, nDamageRand = 88}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 919, nDamageRand = 92}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 955, nDamageRand = 95}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 990, nDamageRand = 99}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1026, nDamageRand = 102}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1061, nDamageRand = 106}, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1097, nDamageRand = 109}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1132, nDamageRand = 113}, -- Level 31	
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/10,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/10,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		1,
		0
		);
	--没奇穴需求目标受控状态
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2298,
		dwSkillLevel
		);
	--]]
	--[[
	--有奇穴不需求目标受控状态
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14808,
		dwSkillLevel
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/纯阳/天道剑势_万剑归宗.lua", -- 属性值1
		0														-- 属性值2
	);
	--skill.BindBuff(1, 2291, 2)	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	--公共CD
	skill.SetNormalCoolDown(1, 83);	--公共CD
	skill.SetCheckCoolDown(1, 444);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 494*0.1;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 494*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 494*0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 494*0.7;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 494;	-- 技能消耗的内力
	end
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 24;
	elseif dwSkillLevel < 31 then
		skill.nChannelInterval = 24 + (dwSkillLevel - 9) * 3; 
	else
		skill.nChannelInterval = 100;
	end
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 50 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度
	skill.nAreaRadius = 6 * LENGTH_BASE;
	skill.nTargetCountLimit = 6;
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	--skill.nBreakRate        = 1024;									--打断的概率,默认1024表示一定打断
       
	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local nlev = player.GetSkillLevel(311)

	if nlev ~= 0 then
		--[[
		if player.GetSkillLevel(14806) == 1 then
			player.CastSkill(14977, 1)	--判定人数AOE技能
	
			local nbuff_mark = player.GetBuff(9939, 1)
			if nbuff_mark and nbuff_mark.nStackNum == 1 then
				player.CastSkill(14976, nlev)	--提高25%的伤害
			else
				player.CastSkill(14975, nlev)	--正常AOE伤害
			end
		else
			player.CastSkill(14975, nlev)	--正常AOE伤害
		end
		--]]
		player.CastSkill(14975, nlev)	--正常AOE伤害
	end
	--[[
	--万剑锁足
	if player.GetSkillLevel(5804) == 1 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(6087, 1, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(6087, 1, TARGET.NPC, dwCharacterID)
		end
	end
	--]]
	--[[
	--降低调息时间
	if player.GetSkillLevel(14806) == 1 then
		player.CastSkill(14807, 1)
	end
	--]]
end

function UnApply(dwCharacterID)
	--print("哈哈, FOR TEST;(UnApply)")
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com