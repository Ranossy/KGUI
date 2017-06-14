---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/生活技能/医术/瞬间回复内力.lua
-- 更新时间:	2015/11/2 15:33:31
-- 更新用户:	wangsongtao-pc
-- 脚本说明:
----------------------------------------------------------------------<
--生活技能医术技能
--吴娟
--08.03.24
--修改数值韩正春
--09.06.05

-----------------------华丽的分割线----------------------------------------------------

tSkillData =
{
	{nAddMana = 250},
	{nAddMana = 600},
	{nAddMana = 800},
	{nAddMana = 1000},
	{nAddMana = 1200},
	{nAddMana = 1600},
	{nAddMana = 1800},
	{nAddMana = 2000},
	{nAddMana = 2200},
	{nAddMana = 2500},
	{nAddMana = 3000}, --level 11
	{nAddMana = 7000}, --level 12
	{nAddMana = 9000}, --level 13

};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
--设置Buff---------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_MANA,
		tSkillData[dwSkillLevel].nAddMana,
		0
	);

--设置cool down------

--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab----------------

	skill.SetNormalCoolDown(1, 76);
	skill.SetNormalCoolDown(2, 133);

--设置其他参数-------

 -- 内力消耗
 -- skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
 -- 攻击半径，也就是攻击的有效距离
 -- skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
 -- skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange;
 -- 吟唱帧数
 -- skill.nPrepareFrames    = PRE_FRAMES;
 -- 子弹速度
 -- skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
 -- 被打断的概率
 -- skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;

	return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--npc: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(npc, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	if IsPlayer(npc.dwID) and npc.dwShapeShiftID ~= 0 then
		return SKILL_RESULT_CODE.FAILED
	end
	return nPreResult;
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com