---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/����/���_�Ʒ�_���ӳ���ʱ��.lua
-- ����ʱ��:	2013/6/5 11:20:55
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����-���_�Ʒ�_���ӳ���ʱ��.lua
-- ������    :  	
-- ����ʱ��  :  2009-01-17
-- ��;(ģ��):  �书����
-- �书����  :  ͨ��
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData = 
{	
	{},
	
};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local nRecipeLevel = SkillRecipeLevel;
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	if skill.dwSkillID == 407 then
		skill.SetBuffRecipe(1, 23, 1);
	end

	if skill.dwSkillID == 401 or skill.dwSkillID == 3782 or skill.dwSkillID == 6521 then
		skill.SetBuffRecipe(1, 112, 1); --������Ѫ
		--skill.SetBuffRecipe(2, 108, 1); --����661���ɵ����Ʒ�
	end

	if skill.dwSkillID == 9283 then
		skill.SetBuffRecipe(1, 108, 1); --����661���ɵ����Ʒ�
	elseif skill.dwSkillID == 9284 then
		skill.SetBuffRecipe(1, 125, 1); --����7969�ɵ����Ʒ�
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