--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npcBOSS = scene.GetNpcByNickName("chiguo")
	if not npcBOSS then
		return
	end
	if player and IsPlayer(dwCharacterID) then
		player.AddBuff(npcBOSS.dwID, npcBOSS.nLevel, 2144, 3)
		player.AddBuff(0,99,4157,2)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com