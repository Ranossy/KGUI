------------------------------------------------
-- �ļ���    : �����������Խű�
-- ������    : �º���
-- ����ʱ��  : 2008-07-08
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
--	{nBase = 1000 },		
--	{nBase = 1000 },		
--	{nBase = 1000 },		
--	{nBase = 1000 },		
--	{nBase = 1000 },		
	
};          
            
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
--	local dwSkillLevel = skill.dwLevel;
	          
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.BASE_VENATION_COF,
--		tSkillData[dwSkillLevel].nBase,
--		0       
--	);
	
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.MAX_MANA_ADDITIONAL,
--		tSkillData[dwSkillLevel].nMP,
--		0
--	);
	



   
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
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com