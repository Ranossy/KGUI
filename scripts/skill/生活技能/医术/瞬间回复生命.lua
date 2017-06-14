--�����ҽ������
--���
--08.03.24
--�޸���ֵ������
--09.06.05

-----------------------�����ķָ���----------------------------------------------------

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

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--����Buff---------	
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
	
--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

	skill.SetNormalCoolDown(1, 76);
	skill.SetNormalCoolDown(2, 133);
	
--������������-------
  
	--��������
	-- skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
	--�����뾶��Ҳ���ǹ�������Ч����
	-- skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
	-- skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
	--����֡��
	--skill.nPrepareFrames    = PRE_FRAMES;
	--�ӵ��ٶ�
	-- skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
	--����ϵĸ���
	--  skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
	return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--npc: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(npc, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if IsPlayer(npc.dwID) and npc.dwShapeShiftID ~= 0 then
		return SKILL_RESULT_CODE.FAILED
	end
	return nPreResult;
end



 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com