------------------------------------------------
-- �ļ���    :  DefaultBuff.lua
-- ������    :  CBG
-- ����ʱ��  :  2011-03-27
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
    local pet = GetNpc(nCharacterID)
    if not pet then
    	return
    end
    local player = GetPlayer(pet.dwEmployer)
    if not player then
    	return
    end
    if pet.nCurrentLife < 2 then 
	player.AddBuff(0,99,112,7)
    end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com