------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-10-7
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if not player then
		return
	end
	if (player.nX > 14529 and player.nX < 19351  and player.nY > 15031 and player.nY < 24626) or (player.nX > 14084 and player.nX < 19538 and player.nY > 40980 and player.nY < 51171) then
		if player.nMoveState == MOVE_STATE.ON_RUN or player.nMoveState == MOVE_STATE.ON_WALK then
			if not player.GetBuff(6930, 1) then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_YELLOW", GetEditorString(6, 820), 1)
			end
			local tPlayer = scene.GetAllPlayer()
			for i = 1, #tPlayer do
				local CPlayer = GetPlayer(tPlayer[i])
				if CPlayer and CPlayer.dwID ~= player.dwID then
					RemoteCallToClient(CPlayer.dwID, "OnOutputWarningMessage", "MSG_WARNING_YELLOW", GetEditorString(6, 934), 1)
				end
			end
			if not player.GetBuff(6929, 1) then
				player.AddBuff(0, 99, 6929, 1)
			end
		end
	end	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com