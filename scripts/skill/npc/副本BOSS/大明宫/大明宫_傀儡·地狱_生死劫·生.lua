
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
	if scene.dwMapID == 164 then
		if player.nCurrentLife > player.nMaxLife * 0.98 then
			player.AddBuff(0, 99, 5972, 1)
			for i = 1, 6 do
				if player.GetBuff(5596, i) then
					player.DelBuff(5596, i)
				end
			end
		end
	else
		if player.nCurrentLife > player.nMaxLife * 0.98 then
			player.AddBuff(0, 99, 5972, 2)
			for i = 1, 6 do
				if player.GetBuff(5596, i) then
					player.DelBuff(5596, i)
				end
			end
		end
	end
	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com