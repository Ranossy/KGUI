------------------------------------------------
-- �ļ���    :  DefaultBuff.lua
-- ������    :  CBG
-- ����ʱ��  :  2011-04-16
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
    	local npc = GetNpc(nCharacterID)
	if not npc then 
    	        return
	end
	if nLeftFrame > 0 then
		npc.AddBuff(0, 99, 2755, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com