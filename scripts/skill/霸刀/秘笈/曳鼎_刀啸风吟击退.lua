---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ե�/����/ҷ��_��Х��������.lua
-- ����ʱ��:	2016/9/12 20:50:30
-- �����û�:	XIAXIANBO
-- �ű�˵��:
----------------------------------------------------------------------<
--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{
	{ CriticalPecent = 200},

};

--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)
	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	if skill.dwSkillID == 16610 or skill.dwSkillID == 16611 or skill.dwSkillID == 16612 or skill.dwSkillID == 16613 or skill.dwSkillID == 16614 or skill.dwSkillID == 16811 or skill.dwSkillID == 16913 or skill.dwSkillID == 16914 or skill.dwSkillID == 16915 or skill.dwSkillID == 16916 or skill.dwSkillID == 16917 or skill.dwSkillID == 16918 then
		--print(skill.dwSkillID)
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_REPULSED,
			13, --����ʱ��(֡)
			0
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