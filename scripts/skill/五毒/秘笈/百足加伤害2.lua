---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/����/������˺�2.lua
-- ����ʱ��:	2013/5/9 21:07:02
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��ǧ�����֡���Ӱ���ֳ���ҳ.lua
-- ������    :  zhengkaifeng
-- ����ʱ��  :  2011-05-08
-- ��;(ģ��):  �书����
-- �书����  :  �嶾
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ͨ������Dot�����������˺�����ʱ��
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
	skill.nChannelInterval = skill.nChannelInterval * 1.1; 	

	
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