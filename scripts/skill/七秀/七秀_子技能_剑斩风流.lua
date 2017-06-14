---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/七秀_子技能_剑斩风流.lua
-- 更新时间:	2015/6/16 20:57:58
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  七秀_子技能_剑斩风流.lua
-- 创建人    :  张豪
-- 创建时间  :  2011-04-16
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :  内功
-- 武功套路  :  猿公剑法
-- 技能名称  :  剑斩风流
-- 技能效果  :  强力的斩杀
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 120 * 0.98, nDamageRand = 94 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 125 * 0.98, nDamageRand = 102 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 130 * 0.98, nDamageRand = 110 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 135 * 0.98, nDamageRand = 118 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 140 * 0.98, nDamageRand = 126 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 145 * 0.98, nDamageRand = 134 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 150 * 0.98, nDamageRand = 142 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 155 * 0.98, nDamageRand = 150 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 160 * 0.98, nDamageRand = 158 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 166 * 0.98, nDamageRand = 166 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 174 * 0.98, nDamageRand = 174 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 182 * 0.98, nDamageRand = 182 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 190 * 0.98, nDamageRand = 190 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 198 * 0.98, nDamageRand = 198 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 206 * 0.98, nDamageRand = 206 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 214 * 0.98, nDamageRand = 214 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 222 * 0.98, nDamageRand = 222 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 230 * 0.98, nDamageRand = 230 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamage/2,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/2,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/七秀_子技能_剑斩风流.lua",
		0
	);
	--skill.BindBuff(1, 2838, 2);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(1, 436);

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	--skill.nWeaponDamagePercent	= 2048;
	skill.nMinRadius = 0 * LENGTH_BASE;											--技能施放最小半径
	skill.nMaxRadius = 8 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	skill.nAreaRadius = 8 * LENGTH_BASE;		-- 技能作用半径
	--skill.nPrepareFrames    = 24;										--吟唱帧数,16帧等于1秒
	skill.nBulletVelocity = 0;
	skill.nChannelInterval = 112 * 1.1*1.1;										--子弹速度,点/帧
	--skill.nBreakRate	= 1024;									--打断施法概率

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local lv = player.GetSkillLevel(2707)
	if player.GetSkillLevel(5868) == 1 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(6207, lv,TARGET.PLAYER,dwCharacterID)
			player.CastSkill(9346, lv, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(6207, lv,TARGET.NPC,dwCharacterID)
			player.CastSkill(9346, lv, TARGET.NPC, dwCharacterID)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com