---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������/������_����_��������.lua
-- ����ʱ��:	2013/5/30 14:30:42
-- �����û�:	wangpengfei1
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	if npc.nCurrentLife > npc.nMaxLife * 0.99 then
		npc.nCurrentLife = npc.nMaxLife
	else
		npc.nCurrentLife = npc.nMaxLife * 0.005 + npc.nCurrentLife
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com