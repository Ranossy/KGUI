---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�����ӭ����˵�һ��.lua
-- ����ʱ��:	08/09/09 18:34:58
-- �����û�:	wujuan
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player)
	local nSkillLevel = player.GetSkillLevel(9004)
	
	if nSkillLevel == 0 then
		player.LearnSkill(9004)
		return false, true
	end
	if nSkillLevel >= 1 then
		player.SendSystemMessage(SKILL_STRING_TABLE[21111])
		return false, false
	end
	return false, false
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com