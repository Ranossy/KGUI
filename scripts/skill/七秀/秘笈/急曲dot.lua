---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/����dot.lua
-- ����ʱ��:	2013/5/31 15:09:43
-- �����û�:	taoli
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
	{nBuffRecipeID = 86},
	{nBuffRecipeID = 87}
};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	if skill.dwSkillID == 3009 or skill.dwSkillID == 9347 or skill.dwSkillID == 13986 or skill.dwSkillID == 13987 or skill.dwSkillID == 6207 or skill.dwSkillID == 9346 then
		skill.nChannelInterval = skill.nChannelInterval * 1.1
	end
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