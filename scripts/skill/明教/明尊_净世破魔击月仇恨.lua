---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_������ħ���³��.lua
-- ����ʱ��:	2017/3/19 22:21:03
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :
-- ������    :  zhx
-- ����ʱ��  :  20120924
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

	if skill.dwSkillID == 4483 or  skill.dwSkillID == 4484 or  skill.dwSkillID == 4485 or  skill.dwSkillID == 4486 or  skill.dwSkillID == 4487 or  skill.dwSkillID == 4488 or  skill.dwSkillID == 4489 or  skill.dwSkillID == 4490 then	--�����9��
		skill.nBaseThreat = 315 + skill.dwLevel * 300 + 824 / 32 * skill.dwLevel;
	end

	if skill.dwSkillID == 4476 then	---�����9��
		skill.nBaseThreat = 105 + skill.dwLevel * 100 + 824 / 32 * skill.dwLevel;
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