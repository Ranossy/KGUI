------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-9-5
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetBuff(6716, 1) then
		if player.GetBuff(6716, 1).nStackNum == 99 then
			player.Die()
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(6, 267), 10)
			player.AcquireAchievement(3901)
		end	
		if player.nCurrentLife < player.nMaxLife * 0.01 * player.GetBuff(6716, 1).nStackNum then
			player.Die()
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(6, 267), 10)
			player.AcquireAchievement(3901)
		else
			player.nCurrentLife = player.nCurrentLife - player.nMaxLife * 0.01 * player.GetBuff(6716, 1).nStackNum
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com