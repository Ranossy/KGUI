---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/ī���ܵ�_����_���ƻ���.lua
-- ����ʱ��:	2014/3/14 10:21:23
-- �����û�:	zhouyixiao1
-- �ű�˵��:	
----------------------------------------------------------------------<

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nNum = Random(1, 10000)
	local Tiaoshu = 0
	local BJbuff = player.GetBuff(7606, 1)
	local z_stime = 22 * 62.5  --1֡����62.5����

	local JHbuff = player.GetBuff(7606, 1)  --����ʣ���������ⵯ��������
	if JHbuff then
		if JHbuff.nLeftActiveCount <= 1 then
			return 
		end
	end
	------------------------------
	player.AddBuff(0, 99, 7610, 1, 2)  --��ʱ3�����ܾ����ͷ�
	player.AddBuff(0, 99, 7611, 1, 2)
	player.AddBuff(0, 99, 7623, 1, 2)
	------------------------------
	--player.AddBuff(0, 99, 7624, 1, 1)  --��ʧ�ܱ��
	--player.AddBuff(0, 99, 7625, 1, 1)	--��ʧ�ܱ��
	--player.AddBuff(0, 99, 7626, 1, 1)	--ǰʧ�ܱ��
	local tData = 
	{
		[1] = {{nSkillID = 8950, nSkillLevel = 1, szHotKey = "ACTIONBAR1_BUTTON1", szText = GetEditorString(6, 169), nTotalTime = z_stime, fPosX = 0.43, fPosY = 0.8}},--��ת
		[2] = {{nSkillID = 8952, nSkillLevel = 1, szHotKey = "ACTIONBAR1_BUTTON2", szText = GetEditorString(6, 169), nTotalTime = z_stime, fPosX = 0.5, fPosY = 0.8}}, --ǰ
		[3] = {{nSkillID = 8951, nSkillLevel = 1, szHotKey = "ACTIONBAR1_BUTTON3", szText = GetEditorString(6, 169), nTotalTime = z_stime, fPosX = 0.57, fPosY = 0.8}}, --�ҷ�ת

	}
	if nNum <= 3333 then
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[1], true)
		player.AddBuff(0, 99, 7624, 1, 1)  --��ʧ�ܱ��
	elseif  nNum > 3333 and nNum < 6666 then
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[2], true)
		player.AddBuff(0, 99, 7626, 1, 1)	--ǰʧ�ܱ��
	else
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[3], true)
		player.AddBuff(0, 99, 7625, 1, 1)	--��ʧ�ܱ��
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com