--�������⿡�ҽ��BUFF�༼��
--�º���
--08.03.19

--------------�Ҳ��Ƿָ���----------------------------------------------------

tSkillData = 
{
	{nAddThew = 7 },	--1
	{nAddThew = 7 },	--2
	{nAddThew = 7 },	--3
	{nAddThew = 7 },	--4
	{nAddThew = 7 },	--5
	{nAddThew = 10 },--6
	{nAddThew = 11 },--7
	{nAddThew = 15 },--8
	{nAddThew = 16 },--9
	{nAddThew = 18 },--10
	{nAddThew = 20 },--11
	{nAddThew = 22 },--12
	{nAddThew = 21 },--13
	{nAddThew = 24 },--14
	{nAddThew = 28 },--15
	{nAddThew = 32 },--16
	{nAddThew = 61 },--17
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--����Buff---------	

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_THEW,
		tSkillData[dwSkillLevel].nAddThew,
		0
	);
	
--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

	skill.SetNormalCoolDown(1, 132);
	skill.SetNormalCoolDown(2, 130);
	
--������������-------
  
	--��������
	-- skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
	--�����뾶��Ҳ���ǹ�������Ч����
	-- skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
	-- skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
	--����֡��
	skill.nPrepareFrames = PRE_FRAMES;
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
	return nPreResult;
end



 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com