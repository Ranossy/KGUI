---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������/�ͷŻ���.lua
-- ����ʱ��:	2014/9/3 16:35:19
-- �����û�:	renjei1
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	print("skillllllllllllllllll")
	local npcBoss = GetNpc(dwCharacterID)
	if not npcBoss then
		return
	end
	npcBoss.CastSkill(13029, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com