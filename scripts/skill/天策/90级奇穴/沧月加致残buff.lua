---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/90����Ѩ/���¼��²�buff.lua
-- ����ʱ��:	2013/4/17 15:38:03
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	local buff = player.GetBuff(5639, 1)
	local splayer = GetPlayer(buff.nCustomValue)
	if nLeftFrame == 0 then
		player.AddBuff(splayer.dwID, splayer.nLevel, 540, 1, 1)
	end
	player.DelBuff(5639, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com