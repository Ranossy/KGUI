---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/Ŵ�׸���ʾ.lua
-- ����ʱ��:	2012-7-11 18:12:17
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	if target.GetItemAmount(5, 11422) == 0 then
		target.DelGroupBuff(3579, 1)
		return
	end
	local tbuff = target.GetBuff(3579, 1)
	if tbuff.nStackNum == 6 or tbuff.nStackNum == 10 then
		RemoteCallToClient(target.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(4, 451), 10)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com