--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
		RemoteCallToClient(player.dwID, "On_Trial_Screen_Black")
		RemoteCallToClient(player.dwID, "EnableColorShift", false)
		player.SetPosition(56148, 40356, 1053504)
		player.DelBuff(6584,1)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com