---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_������_���ջ��ᷴ��.lua
-- ����ʱ��:	2014/2/11 17:31:41
-- �����û�:	zhouyixiao1
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(0, 99, 7469, 1, 2) --���ͷ�����
	player.AddBuff(0, 99, 7514, 1, 2) --���ͷ�����
	local nNum = Random(1, 10000)
	local Tiaoshu = 0
	local BJbuff = player.GetBuff(7467, 1)
	local z_stime = 20 * 62.5  --1֡����62.5����
	local tData = 
	{
		[1] = {{nSkillID = 8802, nSkillLevel = 1, szHotKey = "ACTIONBAR1_BUTTON1", szText = GetEditorString(6, 169), nTotalTime = z_stime, fPosX = 0.43, fPosY = 0.8}},--��ת
		[2] = {{nSkillID = 8803, nSkillLevel = 1, szHotKey = "ACTIONBAR1_BUTTON2", szText = GetEditorString(6, 169), nTotalTime = z_stime, fPosX = 0.57, fPosY = 0.8}},--�ַ�ת��ת

	}
	if not player.GetBuff(7468, 1) then  --�����ε�����ʾ
		if nNum <= 5000 then
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[1], true)
			player.AddBuff(0, 99, 7468, 1, 10) --�����ٴε���
			player.AddBuff(0, 99, 7710, 1, 1) --��ʧ��
		else
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[2], true)
			player.AddBuff(0, 99, 7468, 1, 10)--�����ٴε���
			player.AddBuff(0, 99, 7711, 1, 1) --��ʧ��
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com