---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_�ùⲽ1.lua
-- ����ʱ��:	2013/6/4 2:57:58
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.DoAction(0, 11461)
	player.PlaySfx(235, player.nX, player.nY, player.nZ-100)
	if player.GetSkillLevel(5990) == 1 then
		player.CastSkill(6734, 1)
		if player.GetKungfuMount().dwSkillID == 10243 then
			player.CastSkill(6180,1)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com