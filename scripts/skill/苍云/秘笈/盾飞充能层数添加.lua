---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/�ܷɳ��ܲ������.lua
-- ����ʱ��:	2014/10/22 16:31:37
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_���_����Ч��.lua
-- ������    :  zhanghao
-- ����ʱ��  :  2011-04-14
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  ����
-- �书��·  :
-- ��������  :  ��������
-- ����Ч��  :
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{

};

--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)
	skill.SetNormalCoolDown(1, 823);	--������ͨCD
	

	--skill.SetBuffRecipe(1,tSkillRecipeData[nRecipeLevel].nBuffRecipeID,1);
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