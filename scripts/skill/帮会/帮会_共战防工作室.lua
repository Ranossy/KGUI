---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_��ս��������.lua
-- ����ʱ��:	2016/10/10 19:05:58
-- �����û�:	qinfupi
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local buffGongzhanID = 3219	--��սbuff
	local buffDongjieID = 11493	--��ս����buff����è��̫��
	local player = GetPlayer(dwCharacterID)
	
	if player.bFarmerLimit or player.bNewFarmerFlag then
		if(player.GetBuff(buffGongzhanID,10)) then
			local nCount = player.GetBuff(buffGongzhanID,10).nLeftActiveCount	--������buffÿ�������ͬ����ʣ������ת��
			player.DelBuff(buffGongzhanID, 10)
			player.AddBuff(player.dwID,player.nLevel, buffDongjieID,1,nCount)
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(11, 1826), 4)
		end
	else
		if(player.GetBuff(buffDongjieID,1)) then
			local nCount = player.GetBuff(buffDongjieID,1).nLeftActiveCount		--������buffÿ�������ͬ����ʣ������ת��
			player.DelBuff(buffDongjieID, 1)
			player.AddBuff(player.dwID,player.nLevel, buffGongzhanID,10,nCount)
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(11, 1825), 4)
		end
	end	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com