---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_ɡ�Ҽ�_��Ӱ.lua
-- ����ʱ��:	2017/5/19 2:16:22
-- �����û�:	ZHANGYAN0-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 19466 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 395)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com