---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/����/���㳡��_��������.lua
-- ����ʱ��:	2014/9/24 21:35:18
-- �����û�:	zhangtianhui1
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��ѧ_����.lua
-- ������    :  �²���
-- ����ʱ��  :  2009-02-17
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �ؼ�
-- �书��·  :
-- ��������  :  ����
-- ����Ч��  :  ������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
};

--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill)

	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"Map/����/skill/��������.lua",
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

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com