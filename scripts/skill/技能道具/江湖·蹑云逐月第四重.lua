---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�������������µ�����.lua
-- ����ʱ��:	08/09/09 18:24:02
-- �����û�:	wujuan
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player)
	local nSkillLevel = player.GetSkillLevel(9003)
	
	if nSkillLevel == 0 then
	   player.LearnSkill(9003)
	   player.LearnSkill(9003)
	   player.LearnSkill(9003)
	   player.LearnSkill(9003)
	   return false, true
	end
	if nSkillLevel == 1 then
		player.LearnSkill(9003)
		player.LearnSkill(9003)
		player.LearnSkill(9003)
		return false, true
	end
	
	if nSkillLevel == 2 then
	    player.LearnSkill(9003)
	    player.LearnSkill(9003)
	    return false, true
	end

	if nSkillLevel == 3 then
		player.LearnSkill(9003)
		return false, true
	end	
	if nSkillLevel >= 4 then
		player.SendSystemMessage(SKILL_STRING_TABLE[21108])
		return false, false
	end
	return false, false
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com