---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�ɶ�����Ѩ��ǿ.lua
-- ����ʱ��:	2013/4/27 11:06:53
-- �����û�:	taoli
-- �ű�˵��:	
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	local lv = player.GetSkillLevel(3984) 
	if player.GetSkillLevel(6004) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 4244, lv + 4, 1)
	end

	ModityCDToUI(player, 3984, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com