------------------------------------------------
-- ������    :  zhx
-- ����ʱ��  :  20111208
------------------------------------------------

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	if player.nCurrentLife / player.nMaxLife < 0.15 then
		if  not player.GetBuff(7913,1) then 
			player.nCurrentLife = player.nMaxLife
		end
		player.DelBuff(3607,17)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com