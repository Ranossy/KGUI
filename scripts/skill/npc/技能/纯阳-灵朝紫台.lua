------------------------------------------------
-- �ļ���    :  ����-�鳯��̨.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2008-07-08
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ����NPC�ű�
------------------------------------------------


-- NPC�ű�, �Ի��¼�����
function OnDialogue(npc, player)
	player.OpenWindow(TARGET.NPC, npc.dwID,
		npc.GetAutoDialogString(player.dwID)
	);
end;

-- ����NPC�����ű�
function OnDeath(npc, killer)
	
end;

-- ����
function OnNpcRevive(npc)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com