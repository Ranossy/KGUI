------------------------------------------------
--skill\Quest\˫���������.lua
------------------------------------------------


--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	--[[local tOldDoubleBuffID =  {
		355, 1289, 1290, 1435, 1587, 1591, 
		1620, 1627, 1703, 2070, 2558, 1262
	} 
	local dwNewBuffID = 2864  --ʱ����۵���BUFFID
	local nYanchangTiao = 1--]]
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/˫���������.lua", 0, 0)
	--[[for k, v in pairs(tOldDoubleBuffID) do
		local buff = player.GetBuff(v, 0)
		if not buff then
			print(k, v)
		end
		if buff then
			if v == 1262 then	-- ʦ�Ŵ���˫������
				nYanchangTiao = nYanchangTiao + math.floor(((buff.GetEndTime() - GetLogicFrameCount()) / 16 / 60) / 5) * buff.nStachNum
			else
				nYanchangTiao = nYanchangTiao + math.floor((buff.GetEndTime() - GetLogicFrameCount()) / 16 / 60)  --��BUFF��ʣ��ʱ�䣬��λ��
			end
			player.DelBuff(v, 0)
		end
	end

	player.AddBuff(0, 99, dwNewBuffID, 1, nYanchangTiao)--]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

local tOldDoubleBuffID =  {
	355, 1289, 1290, 1435, 1587, 1591, 
	1620, 1627, 1703, 2070, 2558, 1262
}
local strign_DoubleExpBuffExchange = GetEditorString(6, 7617)
local dwNewBuffID = 2864  --ʱ����۵���BUFFID
function OnTimer(player, nParam1, nParam2)
	local nYanchangTiao = 1
	for k, v in pairs(tOldDoubleBuffID) do
		local buff = player.GetBuff(v, 0)
		if buff then
			if v == 1262 then	-- ʦ�Ŵ���˫������
				nYanchangTiao = nYanchangTiao + math.floor(((buff.GetEndTime() - GetLogicFrameCount()) / 16 / 60) / 5) * buff.nStackNum
			else
				nYanchangTiao = nYanchangTiao + math.floor((buff.GetEndTime() - GetLogicFrameCount()) / 16 / 60)  --��BUFF��ʣ��ʱ�䣬��λ��
			end
			player.DelBuff(v, buff.nLevel)
		end
	end

	--local nFlagBuffID = 8194
	--local nFlagBuffLevel = 1
	--local buff_Flag = player.GetBuff(nFlagBuffID, nFlagBuffLevel)		-- ���صı��Buff
	--if buff_Flag then
	if	player.bNewFarmerFlag then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", strign_DoubleExpBuffExchange, 4)
		player.SendSystemMessage(strign_DoubleExpBuffExchange)
		return
	end
	
	player.AddBuff(0, 99, dwNewBuffID, 1, nYanchangTiao)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com