---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/����/��_����ָ_����debuff.lua
-- ����ʱ��:	2013/5/9 23:26:37
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_����ָ_����debuff.lua
-- ������    :  ����
-- ����ʱ��  :  2009-1-20
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  ������_��
-- ����Ч��  :  ��������ָdot������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData = 
{	


};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	if skill.dwSkillID == 189 or skill.dwSkillID == 3037 or skill.dwSkillID == 180 or skill.dwSkillID == 13849 or skill.dwSkillID == 13847 or skill.dwSkillID == 1862 or skill.dwSkillID == 3086 or skill.dwSkillID == 6134 or skill.dwSkillID == 6135  or skill.dwSkillID == 6140 or skill.dwSkillID == 6141 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_BUFF,
			886,
			1
		);
	end
	return true;
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