------------------------------------------------
-- �ļ���    :  �������ľ���Ů洲��졷�ֳ���ƪ.lua
-- ������    :  zhengkaifeng
-- ����ʱ��  :  2011-05-08
-- ��;(ģ��):  �书����
-- �书����  :  �嶾
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  Ч������ʱ������2��
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

	local nRecipeLevel	= SkillRecipeLevel;
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

	skill.SetBuffRecipe(1, 92, 1);
	
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