------------------------------------------------
-- �ļ���    :  DefaultBuff.lua
-- ������    :  CBG
-- ����ʱ��  :  2011-04-16
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
    	local pet = GetNpc(nCharacterID)
	if not pet then 
    	        return
	end
	local player = GetPlayer(pet.dwEmployer)
	if player and player.nMoveState ~= 16 then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.025
		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.075
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com