---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/����/��Ӱ_��ѣ��1.lua
-- ����ʱ��:	2013/4/17 15:11:09
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��Ӱ_��ѣ��.lua
-- ������    :  zhanghao
-- ����ʱ��  :  2011-04-09
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  �������
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData = 
{
	{nActiveThreatCoefficient = 154},
	{nActiveThreatCoefficient = 307},
};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
			0,
			307
		);
	return
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com