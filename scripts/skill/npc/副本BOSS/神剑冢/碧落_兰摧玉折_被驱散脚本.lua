------------------------------------------------
-- ������   :  ����
-- ����ʱ��	:  2011-8-23
-- Ч����ע	:  80����
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
    local character;

    if IsPlayer(nCharacterID) then
        character = GetPlayer(nCharacterID);
    else
        character = GetNpc(nCharacterID);
    end

    if nLeftFrame == 0 then -- ����������ʣ��ʱ��Ϊ0
    else
    	local result = character.AddBuff(0,99,3189,1)      -- ����������
    end
end;

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com