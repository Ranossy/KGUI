------------------------------------------------
-- �ļ���    :  ��_����ع��_��������.lua
-- ������    :  ����
-- ����ʱ��  :  2009-3-04
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  ������_��
-- ����Ч��  :  ��������ع��dot������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{	


};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;
	
	if skill.dwSkillID == 3037 or skill.dwSkillID == 285 or skill.dwSkillID == 13847 or skill.dwSkillID == 1862 or skill.dwSkillID == 3086 or skill.dwSkillID == 6135 or skill.dwSkillID == 6141 then
		skill.SetBuffRecipe(1, 27, 1);
	elseif skill.dwSkillID == 286 then
		skill.SetBuffRecipe(1, 28, 1);
	elseif skill.dwSkillID == 2893 then
		skill.SetBuffRecipe(1, 89, 1);
	elseif skill.dwSkillID == 2894 then
		skill.SetBuffRecipe(1, 90, 1);
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