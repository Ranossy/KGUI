function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.GetBuff(5672, 1) then
		local num = player.GetBuff(5672, 1).nLeftActiveCount
		RemoteCallToClient(player.dwID, "OnActivityTipUpdate", 16, 0, {num - 1})
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com