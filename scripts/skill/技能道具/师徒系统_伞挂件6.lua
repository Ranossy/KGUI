---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_ɡ�Ҽ�5.lua
-- ����ʱ��:	2013/3/4 11:18:29
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 10185 or player.dwBackItemIndex == 11013 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 153)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com