------------------------------------------------
-- �ļ���    :  ��֮��˾_�������_DEBUFFʱ������������ű�
-- ������    :  zhx
-- ����ʱ��  :  20110407
-- ��;(ģ��):  PQ
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  DEBUFFʱ�����������,��BOSS��Ѫ
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
    local npc   
    if IsPlayer(nCharacterID) then
        npc = GetPlayer(nCharacterID)
    else
        return
    end
    local scene = npc.GetScene()
	local npc1 = scene.GetNpcByNickName("PQ_yuezhijisi11")
	if not npc1 then 
		return
	end
    if nLeftFrame == 0 then 
    else
    	npc1.nCurrentLife = npc1.nCurrentLife + 810000
    end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com