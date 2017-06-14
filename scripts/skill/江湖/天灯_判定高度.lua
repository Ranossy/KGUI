
------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2014-4-3
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetBuff(7707, 1) then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local item = player.GetEquippedHorse()
	if item and item.dwIndex == 11106 then
		return
	end	
	if player.GetBuff(7712, 1) then
		if player.nHorseSprintPower < 318 then
			player.DelBuff(244,4)
		end
		return
	end
	if player.nHorseSprintPower == 0 then
		player.DelBuff(244,4)
	end	
	if player.nZ > scene.nHeightAvg * 64 +13000 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 4518), 3)
	end
	if player.nZ > scene.nHeightAvg * 64 +15000 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 4516), 1)
		player.DelBuff(244, 4)
	end
	local height, type = player.GetAltitude()
	if height and height > 28000 and player.nVelocityZ > 0 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 4518), 3)
	end
	if type and type == 1 and height <= -2560 then
		player.DelBuff(244,4)
	end
	if height and height > 30000 and player.nVelocityZ > 0 then
		if not player.GetBuff(7707, 1) then
			player.AddBuff(0, 99, 7707, 1)			
		end
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 4319), 3)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com