---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�����/�鼮/�������_�鼮.lua
-- ����ʱ��:	2015/6/18 17:18:57
-- �����û�:	mantong2
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Map/��������/include/�������_data.lua")
function OnReadPage(player)
	local bBookMemorized = player.IsBookMemorized(218, 1)
	local bQYPhase = player.GetAdventureFlag(g_QYWeapon.nQYValue + 5)	--��һ��������ʼ
	local bQYPhase1 = player.GetAdventureFlag(g_QYWeapon.nQYValue + 6)	--��һ����������
	if not bQYPhase1 and bQYPhase then
		if player.CanAddItem(5, 23862) == ITEM_RESULT_CODE.SUCCESS then
			player.AddItem(5, 23862, 1)
			player.SendSystemMessage(GetEditorString(7, 7086))
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 7086), 4)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com