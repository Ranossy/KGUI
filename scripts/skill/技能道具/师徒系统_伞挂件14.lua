---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_ɡ�Ҽ�14.lua
-- ����ʱ��:	2015/7/28 15:36:01
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 13914 or player.dwBackItemIndex == 19256 then

		--���⴦��ɴ��
		local scene = player.GetScene()
		local npcX = scene.GetNpcByNickName("ss_yt150813_" .. player.dwID)
		if npcX then
			return
		end

		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 277)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com