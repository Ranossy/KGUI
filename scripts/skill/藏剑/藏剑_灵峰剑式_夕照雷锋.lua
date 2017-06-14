---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_灵峰剑式_夕照雷锋.lua
-- 更新时间:	2015/9/12 12:43:23
-- 更新用户:	mengxiangfei11
-- 脚本说明:

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 20, nDamageBase = 45, nDamageRand = 5}, -- Level 1
	{nAddRage = 0, nCostRage = 20, nDamageBase = 73, nDamageRand = 8}, -- Level 2
	{nAddRage = 0, nCostRage = 20, nDamageBase = 101, nDamageRand = 10}, -- Level 3
	{nAddRage = 0, nCostRage = 20, nDamageBase = 129, nDamageRand = 13}, -- Level 4
	{nAddRage = 0, nCostRage = 20, nDamageBase = 157, nDamageRand = 16}, -- Level 5
	{nAddRage = 0, nCostRage = 20, nDamageBase = 185, nDamageRand = 19}, -- Level 6
	{nAddRage = 0, nCostRage = 20, nDamageBase = 213, nDamageRand = 22}, -- Level 7
	{nAddRage = 0, nCostRage = 20, nDamageBase = 241, nDamageRand = 24}, -- Level 8
	{nAddRage = 0, nCostRage = 20, nDamageBase = 269, nDamageRand = 27}, -- Level 9
	{nAddRage = 0, nCostRage = 20, nDamageBase = 297, nDamageRand = 30}, -- Level 10
	{nAddRage = 0, nCostRage = 20, nDamageBase = 325, nDamageRand = 33}, -- Level 11
	{nAddRage = 0, nCostRage = 20, nDamageBase = 353, nDamageRand = 36}, -- Level 12
	{nAddRage = 0, nCostRage = 20, nDamageBase = 381, nDamageRand = 38}, -- Level 13
	{nAddRage = 0, nCostRage = 20, nDamageBase = 409, nDamageRand = 41}, -- Level 14
	{nAddRage = 0, nCostRage = 20, nDamageBase = 437, nDamageRand = 44}, -- Level 15
	{nAddRage = 0, nCostRage = 20, nDamageBase = 465, nDamageRand = 47}, -- Level 16
	{nAddRage = 0, nCostRage = 20, nDamageBase = 493, nDamageRand = 50}, -- Level 17
	{nAddRage = 0, nCostRage = 20, nDamageBase = 521, nDamageRand = 52}, -- Level 18
	{nAddRage = 0, nCostRage = 20, nDamageBase = 549, nDamageRand = 55}, -- Level 19
	{nAddRage = 0, nCostRage = 20, nDamageBase = 577, nDamageRand = 58}, -- Level 20
	{nAddRage = 0, nCostRage = 20, nDamageBase = 605, nDamageRand = 61}, -- Level 21
	{nAddRage = 0, nCostRage = 20, nDamageBase = 633, nDamageRand = 64}, -- Level 22
	{nAddRage = 0, nCostRage = 20, nDamageBase = 661, nDamageRand = 66}, -- Level 23
	{nAddRage = 0, nCostRage = 20, nDamageBase = 689, nDamageRand = 69}, -- Level 24
	{nAddRage = 0, nCostRage = 20, nDamageBase = 717, nDamageRand = 72}, -- Level 25
	{nAddRage = 0, nCostRage = 20, nDamageBase = 745, nDamageRand = 75}, -- Level 26
	{nAddRage = 0, nCostRage = 20, nDamageBase = 773, nDamageRand = 78}, -- Level 27
	{nAddRage = 0, nCostRage = 20, nDamageBase = 801, nDamageRand = 80}, -- Level 28
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2896,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2897,
		dwSkillLevel
	);
	--释放AOE子技能
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/藏剑/藏剑_灵峰剑式_夕照雷锋.lua",
		0
	);
--硬直子技能
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--1739,
	--1
	--);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);
	--skill.SetNormalCoolDown(1, 335);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostRage = 20;

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 72;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 8 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nWeaponDamagePercent = 2048;
	skill.nPrepareFrames = 24;										--吟唱帧数,16帧等于1秒
	skill.nMinPrepareFrames = 1;
	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	----------------- 打退打断落马相关 -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		player.AddBuff(0, 99, 2027, 1)
		return nPreResult
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3837)
	end
	--满级新手指引任务
	local nQuestIndex = player.GetQuestIndex(13254)
	local nQuestPhase = player.GetQuestPhase(13254)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
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
	if player.GetSkillLevel(5960) == 1 then
		local nlev = player.GetSkillLevel(1600)
		if nlev ~= 0 then
			target.AddBuff(player.dwID, player.nLevel, 9706, 1)
			--player.CastSkill(14611, nlev, player.GetSkillTarget())
			player.CastSkillXYZ(14611, nlev, target.nX, target.nY, target.nZ)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com