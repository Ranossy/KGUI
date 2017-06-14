--生活技能医术技能
--吴娟
--08.03.24
--修改数值韩正春
--09.06.05

-----------------------华丽的分割线----------------------------------------------------

tSkillData = 
{
	{nAddHealth = 150 },--level 1
	{nAddHealth = 500 },--level 2
	{nAddHealth = 800},--level 3
	{nAddHealth = 1000},--level 4
	{nAddHealth = 1200},--level 5
	{nAddHealth = 1400},--level 6
	{nAddHealth = 1600},--level 7
	{nAddHealth = 1800},--level 8
	{nAddHealth = 2000},--level 9
	{nAddHealth = 2200},--level 10
	{nAddHealth = 2500},--level 11
	{nAddHealth = 3000},--level 12
	{nAddHealth = 5000},--level 13
	{nAddHealth = 5500},--level 14
	
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能相关数值
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--设置Buff---------	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.THERAPY_POWER_PERCENT,
		-1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		tSkillData[dwSkillLevel].nAddHealth,
		0
	);
	
--设置cool down------

--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab----------------

	skill.SetNormalCoolDown(1, 76);
	skill.SetNormalCoolDown(2, 133);
	
--设置其他参数-------
  
	--内力消耗
	-- skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
	--攻击半径，也就是攻击的有效距离
	-- skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
	-- skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
	--吟唱帧数
	--skill.nPrepareFrames    = PRE_FRAMES;
	--子弹速度
	-- skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
	--被打断的概率
	--  skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
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