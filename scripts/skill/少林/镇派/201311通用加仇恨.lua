---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/201311ͨ�üӳ��.lua
-- ����ʱ��:	2013/11/20 11:50:45
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  Τ�����Ƶ���.lua
-- ������    :  CBG
-- ����ʱ��  :  2011-04-02
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
	local nPDLevel = skill.dwLevel
	if skill.dwSkillID == 232 then
		skill.nBaseThreat = skill.nBaseThreat + 6000;
	end
	if skill.dwSkillID == 233 then
		skill.nBaseThreat = skill.nBaseThreat + 12000
	end
	if skill.dwSkillID == 211 then
		skill.nBaseThreat = skill.nBaseThreat + 3000
	end
	if skill.dwSkillID == 212 then
		skill.nBaseThreat = skill.nBaseThreat + 6000
	end
	if skill.dwSkillID == 213 then
		skill.nBaseThreat = skill.nBaseThreat + 9000
	end
	if skill.dwSkillID == 235 then
		skill.nBaseThreat = skill.nBaseThreat + 15000
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