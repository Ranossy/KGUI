------------------------------------------------
-- �ļ���    :  DefaultBuff.lua
-- ������    :  WangTao
-- ����ʱ��  :  2008-03-28
-- ��;(ģ��):  BUFF����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  Ĭ�ϵ�BUFF�ű�
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
    	character.CastSkill(508,nBuffLevel)       -- ����������
    end
end;
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com