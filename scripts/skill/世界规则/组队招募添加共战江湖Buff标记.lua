---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�������/�����ļ��ӹ�ս����Buff���.lua
-- ����ʱ��:	2014/10/22 22:28:03
-- �����û�:	zhengkaifeng
-- �ű�˵��:
----------------------------------------------------------------------<

-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local dwDropBuffID = 3219
	local nDropBuffLevel = 10
	local dwFlagBuffID = 8434
	local nFlagBuffLevel = 1
	local dwDelFlagBuffID = 8435
	local nDelFlagBuffLevel = 1

	local buff_Flag = player.GetBuff(dwFlagBuffID, nFlagBuffLevel)
	if not buff_Flag then
		return
	end

	local buff_Drop = player.GetBuff(dwDropBuffID, nDropBuffLevel)
	if not buff_Drop then
		return
	end

	local dwTeamID = player.dwTeamID
	local dwCorrectTeamID = buff_Flag.nCustomValue
	if not dwTeamID or dwTeamID == 0 or dwTeamID ~= dwCorrectTeamID then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 8810), 4)
		player.SendSystemMessage(GetEditorString(6, 8811))
		player.DelBuff(dwDropBuffID, nDropBuffLevel)
		player.DelBuff(dwFlagBuffID, nFlagBuffLevel)
		return		-- δ��ӻ��������ʱ����������ս
	end

	local dwPartyLeaderID = player.GetPartyLeaderID()
	if not dwPartyLeaderID or dwPartyLeaderID ~= dwCharacterID then
		local buff_DelFlag = player.GetBuff(dwDelFlagBuffID, nDelFlagBuffLevel)
		if not buff_DelFlag then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 8808), 4)
			player.SendSystemMessage(GetEditorString(6, 8812))
			player.AddBuff(0, 99, dwDelFlagBuffID, nDelFlagBuffLevel, 1)
			buff_DelFlag = player.GetBuff(dwDelFlagBuffID, nDelFlagBuffLevel)
			buff_DelFlag.nCustomValue = 1
		end
		local nDelCount = buff_DelFlag.nCustomValue
		if nDelCount >= 12 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 8808), 4)
			player.SendSystemMessage(GetEditorString(6, 8813))
			player.DelBuff(dwDropBuffID, nDropBuffLevel)
			player.DelBuff(dwFlagBuffID, nFlagBuffLevel)
			player.DelBuff(dwDelFlagBuffID, nDelFlagBuffLevel)
		else
			buff_DelFlag.nCustomValue = nDelCount + 1
		end
		return		-- �Ƕӳ�ʱ��������սBuff����ʱɾ����
	end
	
	local tMemberList = player.GetPartyMemberList()
	if #tMemberList < 15 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 8829), 4)
		player.SendSystemMessage(GetEditorString(6, 8830))
		player.DelBuff(dwDropBuffID, nDropBuffLevel)
		player.DelBuff(dwFlagBuffID, nFlagBuffLevel)
		return
	end
	for i = 1, #tMemberList do
		local dwMemberPlayerID = tMemberList[i]
		local MemberPlayer = GetPlayer(dwMemberPlayerID)
		if MemberPlayer and dwMemberPlayerID ~= dwCharacterID then
			local buff_MemberDrop = MemberPlayer.GetBuff(dwDropBuffID, nDropBuffLevel)
			local buff_MemberFlag = MemberPlayer.GetBuff(dwFlagBuffID, nFlagBuffLevel)
			if buff_MemberDrop and buff_MemberFlag then		-- ɾ���Ŷ���������Աͨ�������ļ��õĹ�սBuff
				RemoteCallToClient(MemberPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 8808), 4)
				MemberPlayer.SendSystemMessage(GetEditorString(6, 8809))
				MemberPlayer.DelBuff(dwDropBuffID, nDropBuffLevel)
				MemberPlayer.DelBuff(dwFlagBuffID, nFlagBuffLevel)
			end
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com