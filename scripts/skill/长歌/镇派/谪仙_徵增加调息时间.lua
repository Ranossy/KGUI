---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/����_������2��Ŀ��.lua
-- ����ʱ��:	2015/8/6 11:56:56
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

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	skill.SetNormalCoolDown(1, 915);	--������ͨCD
	skill.SetCheckCoolDown(2, 923);	--ֻ��鲻�ߵ�CD,��ʼ����hot����һ��CD
	skill.SetCheckCoolDown(3, 924);	--ֻ��鲻�ߵ�CD,��ʼ����hot���Ӷ���CD
	--skill.SetCheckCoolDown(4, 925);	--ֻ��鲻�ߵ�CD,��ʼ����hot��������CD
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