--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local Buff_ID = 2272
		local Buff_LV = 2
		local cPlayer = GetPlayer(dwCharacterID)
		if cPlayer then
			local scene = cPlayer.GetScene()
			if not scene then 
				return
			end
			local tPlayer = scene.GetAllPlayer()
			if tPlayer then
				for i = 1, #tPlayer do
					local thisPlayer = GetPlayer(tPlayer[i])
					if thisPlayer and  thisPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
						thisPlayer.AddBuff(0, 99, Buff_ID, Buff_LV)
					end
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com