--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and IsPlayer(dwCharacterID) then
		local scene = player.GetScene()
		if scene then
			local npc = scene.GetNpcByNickName("boss")
			if npc then
				player.AddBuff(0, 99, 1946, 1)
				npc.CastSkill(1902, 1, TARGET.PLAYER, player.dwID)
			end
		end
	end
end
--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com