---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/�趬_������3������Ч��.lua
-- ����ʱ��:	2015/8/12 19:35:03
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{
	{nBuffRecipeID = 86},
	{nBuffRecipeID = 87}
};

--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)
	--print(111111)
	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	--skill.nChannelFrame	= 80;	 			-- ͨ��������ʱ�䣬��λ֡��
	skill.nChannelFrame = skill.nChannelFrame + skill.nChannelInterval * 3;
	--print(skill.nChannelInterval)
	--print(skill.nChannelFrame)
	--print("------------------------------")
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