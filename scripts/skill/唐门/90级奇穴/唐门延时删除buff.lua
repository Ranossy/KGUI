---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/������ʱɾ��buff.lua
-- ����ʱ��:	2013/5/16 11:09:56
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.DelGroupBuff(5784, 1)
	player.DelGroupBuff(5785, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com