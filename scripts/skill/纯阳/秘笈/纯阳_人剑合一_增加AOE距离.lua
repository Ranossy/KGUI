---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/����_�˽���һ_����AOE����.lua
-- ����ʱ��:	2013/10/23 10:46:21
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��������.lua
-- ������    :  ����
-- ����ʱ��  :  2009-01-21
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

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	
	if skill.dwSkillID == 589 or skill.dwSkillID == 1115 then
		if SkillRecipeID == 57 then			-- �洫��ҳ
			skill.nAreaRadius = skill.nAreaRadius + 51
		elseif SkillRecipeID == 58 then		-- ��ƪ
			skill.nAreaRadius = skill.nAreaRadius + 64
		elseif SkillRecipeID == 59 then		-- ����
			skill.nAreaRadius = skill.nAreaRadius + 77
		end
	end
	
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