---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_ɡ�Ҽ�5.lua
-- ����ʱ��:	2013/3/4 11:18:29
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 11009 or player.dwBackItemIndex == 13759 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 184)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com