---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/test/����Ҽ�����״̬buff.lua
-- ����ʱ��:	2013/11/13 10:00:15
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if nLeftFrame ~= 0 then
		player.CastSkill(8563, 1)
		player.RemovePendent(10959)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com