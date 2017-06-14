---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_秀水剑法_九溪弥烟通道AOE.lua
-- 更新时间:	2015/10/5 18:48:35
-- 更新用户:	mengxiangfei11
-- 脚本说明:
--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 15, nDamageRand = 6}, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 17, nDamageRand = 6}, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 19, nDamageRand = 6}, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 20, nDamageRand = 6}, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 21, nDamageRand = 6}, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 22, nDamageRand = 6}, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 23, nDamageRand = 6}, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 24, nDamageRand = 6}, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 25, nDamageRand = 6}, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 26, nDamageRand = 6}, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 27, nDamageRand = 6}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 28, nDamageRand = 6}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 29, nDamageRand = 6}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 30, nDamageRand = 6}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 31, nDamageRand = 6}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 32, nDamageRand = 6}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 33, nDamageRand = 6}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 34, nDamageRand = 6}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 35, nDamageRand = 6}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 36, nDamageRand = 6}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 37, nDamageRand = 6}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 38, nDamageRand = 8}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 39, nDamageRand = 8}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 40, nDamageRand = 8}, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 41, nDamageRand = 8}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 42, nDamageRand = 8}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 43, nDamageRand = 10}, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 44, nDamageRand = 10}, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamageBase = 45, nDamageRand = 10}, -- Level 29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 46, nDamageRand = 10}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 47, nDamageRand = 10}, -- Level 31
	{nAddRage = 0, nCostRage = 10, nDamageBase = 48, nDamageRand = 10}, -- Level 32

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--[[
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
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		15060,
		dwSkillLevel
		);	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/藏剑/藏剑_秀水剑法_九溪弥烟通道AOE.lua",
		0
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 333);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

	-----------------技能施放技能需求-------------------------------------------
	skill.AddCheckSelfLearntSkill(14603, 1, SKILL_COMPARE_FLAG.EQUAL);    --检查比较Caster自己已学习的技能ID和等级
	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 5 then
		skill.nChannelInterval = 16 * 1.1;
	elseif dwSkillLevel < 32 then
		skill.nChannelInterval = (16 + (dwSkillLevel - 4) * 1) * 1.1
	else
		skill.nChannelInterval = 48 * 1.1;     -- 通道技间隔时间
	end
	--skill.nChannelInterval	= 48;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	skill.nAreaRadius = 6 * LENGTH_BASE;
	skill.nWeaponDamagePercent = 0;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒

	skill.nChannelInterval	= 16; 				-- 通道技间隔时间
	skill.nMinChannelInterval	= 1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	skill.nChannelFrame		= 80;	 			-- 通道技持续时间，单位帧数
	skill.nMinChannelFrame	= 1; 				-- 通常配合急速最小间隔时间使用。使得通道技能整体加速。如果这个填-1，间隔不是-1，高急速可以多1跳

	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBeatBackRate = 0 * PERCENT_BASE;							-- 技能被打退的概率,默认1024
	skill.nBrokenRate = 0 * PERCENT_BASE;								--被打断的概率,默认1024表示一定被打断
	skill.nTargetCountLimit = 10;
	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		player.AddBuff(0, 99, 1950, 1) --不能跳跃
		player.AddBuff(0, 99, 1856, 1)	--免控
		return nPreResult
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	player.AddBuff(player.dwID, player.nLevel, 1950, 1)
	player.AddBuff(player.dwID, player.nLevel, 1856, 1)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com