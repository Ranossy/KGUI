---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�������/̨����������ȡ�����ⷭ��.lua
-- ����ʱ��:	2014/10/29 11:54:15
-- �����û�:	zhengkaifeng
-- �ű�˵��:
----------------------------------------------------------------------<

-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local dwVIPBuffID = 8443
	local nVIPBuffLevel = 1
	local buff_VipTW = player.GetBuff(dwVIPBuffID, nVIPBuffLevel)
	if not buff_VipTW then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(6, 9068), 4)
		player.SendSystemMessage(GetEditorString(6, 9069))
		RemoteCallToClient(player.dwID, "On_Recharge_EndBigSubsidy")
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com