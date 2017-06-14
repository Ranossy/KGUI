--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	--print("test_H")
	local YX_SNY_Opposition = 5			--��������
	local YX_SNY_Neutrality = 3			--��������
	local YX_SNY_Friendly = 1			--���Ʒ���
	if not IsPlayer(dwCharacterID) then
		print("ERROR")
	else
		local cPlayer = GetPlayer(dwCharacterID)
		if cPlayer then
			local scene = cPlayer.GetScene()
			if scene then
				if scene.dwMapID ~= 121 then
					cPlayer.DelBuff(3071, 1)
				end
				local dwPQID = scene.GetCustomInteger4(SCENE_CUSTOM_VALUE_NAME.YX_SNY.PQ_dwID)
				local pq = GetPQ(dwPQID)
				if cPlayer.nBattleFieldSide == 0 then
					ChangePQValue(dwPQID, 0, YX_SNY_Friendly)
					if pq then
						pq.SetStatistics(cPlayer.dwID, PQ_STATISTICS_INDEX.SPECIAL_OP_1, YX_SNY_Friendly)
					end
				elseif  cPlayer.nBattleFieldSide == 1 then
					ChangePQValue(dwPQID, 1, YX_SNY_Opposition)
					if pq then
						pq.SetStatistics(cPlayer.dwID, PQ_STATISTICS_INDEX.SPECIAL_OP_1, YX_SNY_Opposition)
					end
				else
					print(GetEditorString(3, 9044))
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	--print("test_H_un")
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com