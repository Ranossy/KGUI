------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-4-9
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------


--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npc = scene.GetNpcByNickName("kuilei_ren")
	if not npc then
		return
	end
	local nDistance = GetCharacterDistance(player.dwID, npc.dwID)
	if scene.dwMapID == 164 then
		if nDistance < 640 then
			if player.GetBuff(5568, 1) then
				if player.GetBuff(5568, 1).nStackNum < 11 then
					if player.nCurrentLife > 1500 then
						player.nCurrentLife = player.nCurrentLife - 1500
					else
						player.Die()
					end
				elseif player.GetBuff(5568, 1).nStackNum < 21 then
					if player.nCurrentLife > 2500 then
						player.nCurrentLife = player.nCurrentLife - 2500
					else
						player.Die()
					end
				else
					if player.nCurrentLife > 3500 then
						player.nCurrentLife = player.nCurrentLife - 3500
					else
						player.Die()
					end
				end
			end
		else
			if player.GetBuff(5568, 1) then
				if player.GetBuff(5568, 1).nStackNum < 11 then
					if player.nCurrentLife > 1000 then
						player.nCurrentLife = player.nCurrentLife - 1000
					else
						player.Die()
					end
				elseif player.GetBuff(5568, 1).nStackNum < 21 then
					if player.nCurrentLife > 2000 then
						player.nCurrentLife = player.nCurrentLife - 2000
					else
						player.Die()
					end
				else
					if player.nCurrentLife > 3000 then
						player.nCurrentLife = player.nCurrentLife - 3000
					else
						player.Die()
					end
				end
			end
		end
	else
		if nDistance < 640 then
			if player.GetBuff(5568, 1) then
				if player.GetBuff(5568, 1).nStackNum < 6 then
					if player.nCurrentLife > 8000 then
						player.nCurrentLife = player.nCurrentLife - 8000
					else
						player.Die()
					end
				elseif player.GetBuff(5568, 1).nStackNum < 10 then
					if player.nCurrentLife > 10500 then
						player.nCurrentLife = player.nCurrentLife - 10500
					else
						player.Die()
					end
				else
					if player.nCurrentLife > 14000 then
						player.nCurrentLife = player.nCurrentLife - 14000
					else
						player.Die()
					end
				end
			end
		else
			if player.GetBuff(5568, 1) then
				if player.GetBuff(5568, 1).nStackNum < 6 then
					if player.nCurrentLife > 6500 then
						player.nCurrentLife = player.nCurrentLife - 6500
					else
						player.Die()
					end
				elseif player.GetBuff(5568, 1).nStackNum < 10 then
					if player.nCurrentLife > 9000 then
						player.nCurrentLife = player.nCurrentLife - 9000
					else
						player.Die()
					end
				else
					if player.nCurrentLife > 12000 then
						player.nCurrentLife = player.nCurrentLife - 12000
					else
						player.Die()
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