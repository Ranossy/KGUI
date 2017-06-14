------------------------------------------------
-- �ļ���    : �����������Խű�
-- ������    : CBG
-- ����ʱ��  : 2010-07-26
-- ��;(ģ��): ����
-- ��������  : ����ϵ
-- ��������  : 
-- ����Ч��  : 
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


tSkillData =
{
	{nBase = 1,  nSpunk = 2,  nStrength = 2,  nAgility = 2,  nVitality = 2 },		
	{nBase = 2,  nSpunk = 4,  nStrength = 4,  nAgility = 4,  nVitality = 4 },		
	{nBase = 3,  nSpunk = 6,  nStrength = 6,  nAgility = 6,  nVitality = 6 },		
	{nBase = 4,  nSpunk = 8,  nStrength = 8,  nAgility = 8,  nVitality = 8 },		
	{nBase = 5,  nSpunk = 10, nStrength = 10, nAgility = 10, nVitality = 10},				
};          
            
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	          
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.BASE_POTENTIAL_ADD,
		tSkillData[dwSkillLevel].nBase,
		0       
	);
	
    return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == 1 then
		 player.AcquireAchievement(109)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com