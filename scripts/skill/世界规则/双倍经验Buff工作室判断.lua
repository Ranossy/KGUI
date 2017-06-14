---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�������/˫������Buff�������ж�.lua
-- ����ʱ��:	2014/8/15 16:16:03
-- �����û�:	zhengkaifeng
-- �ű�˵��:
----------------------------------------------------------------------<

-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local nBuffID = 2864
	local nBuffLevel = 1
	local nFlagBuffID = 8194
	local nFlagBuffLevel = 1

	local buff = player.GetBuff(nBuffID, nBuffLevel)		-- ˫������Buff
	if not buff then
		return
	end
	
	local buff_Flag = player.GetBuff(nFlagBuffID, nFlagBuffLevel)		-- ���صı��Buff
	if player.bNewFarmerFlag then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 7617), 4)
		player.SendSystemMessage(GetEditorString(6, 7618))
		player.DelBuff(nBuffID, nBuffLevel)		-- ���ʣ���˫������Buff
		return
	end

	if player.nLevel >= 20 and (player.bFarmerLimit or player.bNewFarmerFlag) then
		local nRate = Random(10000)
		if nRate <= 8000 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 7617), 4)
			player.SendSystemMessage(GetEditorString(6, 7618))
			player.DelBuff(nBuffID, nBuffLevel)		-- ���ʣ���˫������Buff
			player.AddBuff(0, 99, nFlagBuffID, nFlagBuffLevel, 1)		-- ������صı��Buff
			return
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com