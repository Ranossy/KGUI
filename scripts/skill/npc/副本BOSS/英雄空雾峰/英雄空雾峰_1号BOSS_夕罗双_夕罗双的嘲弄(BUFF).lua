------------------------------------------------
-- �ļ���    :  Ӣ�ۿ����_1��BOSS_Ϧ��˫_Ϧ��˫�ĳ�Ū(BUFF).lua
-- ������    :  CBG	
-- ����ʱ��  :  2009-9-8
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ���
-- ����Ч��  :  ��֪����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return 
	end
	local scene = player.GetScene()
	if not scene then
		return 
	end
	local BOSS = scene.GetNpcByNickName("xiluoshuang")
	if not BOSS then
		return 
	end
    if nLeftFrame > 0 then -- ����������
	local sum = Random(100)
	if sum >= 50 then
		local npc = scene.CreateNpc(5884, 16517, 22181, 0, 0, 240)
		if not npc then
			return
		end
		npc.DelBuff(1168,1)
		BOSS.CopyThreatList(npc.dwID)
	else
		local npc = scene.CreateNpc(5884, 15705, 24025, 0, 0, 240)
		if not npc then
			return
		end
		npc.DelBuff(1168,1)
		BOSS.CopyThreatList(npc.dwID)
  	end
    end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com