--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local Buff_ID = 2277
		local Buff_LV = 2
		local cPlayer = GetPlayer(dwCharacterID)
		if cPlayer then
			local scene = cPlayer.GetScene()
			local nPlayer = {}
			local tPlayer = scene.GetAllPlayer()
			if tPlayer then
				for i = 1, #tPlayer do
					local cPlayer = GetPlayer(tPlayer[i])
					if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
						nPlayer[#nPlayer + 1] = cPlayer.dwID
					end
				end
			end
			local nCount = Random(1, #nPlayer)
			local cThisPlayer = GetPlayer(nPlayer[nCount])
			if cThisPlayer and  cThisPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				cThisPlayer.AddBuff(0, 99, Buff_ID, Buff_LV)
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com