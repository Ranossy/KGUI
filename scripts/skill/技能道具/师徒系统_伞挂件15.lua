---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_ɡ�Ҽ�15.lua
-- ����ʱ��:	2015/11/27 15:14:50
-- �����û�:	FENGMENGJIE
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 16872 then

		--���⴦��ɴ��
		local scene = player.GetScene()
		local npc = scene.GetNpcByNickName("hm_fxf1127_" .. player.dwID)
		if npc then
			return
		end

		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 315)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com