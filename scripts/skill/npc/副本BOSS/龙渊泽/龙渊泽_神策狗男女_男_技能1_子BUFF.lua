--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then 
		local scene = npc.GetScene()
		if scene then
			local Lv = 1
			if scene.dwMapID == 118 then
				Lv = 2
			elseif scene.dwMapID == 119 then
				Lv = 3
			elseif scene.dwMapID == 117 then
				Lv = 4
			end
			local dwID = npc.GetCustomUnsigned4(10)
			local cPlayer = GetPlayer(dwID)
			if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				npc.CastSkill(2792, Lv, TARGET.PLAYER, cPlayer.dwID)
				npc.CastSkill(2793, Lv, TARGET.PLAYER, cPlayer.dwID)
			end
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com