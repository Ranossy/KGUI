
------------------------------------------------
-- �ļ���    :  ����÷��׮_�������Buff_���������.lua
-- ������    :  ֩��
-- ����ʱ��  :  2010-04-27
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	if not IsPlayer(nCharacterID) then
        return
    end
    local player = GetPlayer(nCharacterID)
    if not player then
    	return
    end
	player.AddBuff(0, 99, 1851, 1, 1)  --����������buff
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com