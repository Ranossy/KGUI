------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-1-25
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
    local player = GetPlayer(nCharacterID)
    if not player then
    	return
    end

	if nLeftFrame > 0 then
		player.CastSkill(5243, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com