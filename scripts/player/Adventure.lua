---------------------------------------------------------------------->
-- �ű�����:	scripts/player/Adventure.lua
-- ����ʱ��:	2015/6/24 10:23:14
-- �����û�:	linjiajia2
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Map/��������/ƽ����Ը/include/ƽ����Ը_data.lh")

-- player.SetAdventureFlag(1,true) �����������λֵʱ����
function OnSetAdventureFlagSuccess(player, nIndex, bValue, nParam)
	nParam = nParam or 0
	if nParam == 0 then -- Ĭ��Ϊ0ʱ������������ǰ��������� ��Ϊ0�����ã�ĳЩ��֧������ˢ�¸��ٽ���ʱ����0
		if bValue then 
			player.SetCustomUnsigned4(383, nIndex)
		end
	end
end

-- �����������ñ��� ���������������������ɺ�����nAdventureTaskIDΪtrue��
--	��ע�⣺����������ɺ󶼻���ô˺�����
-- nAdventureTaskID���������ĺ�����������ID��Ĭ��Ϊ0-��ʾ�ޣ�AfterAdventureTaskID��
-- nQuestkID: ����ID
function SetAdventureStateByQuest(player, nQuestkID, nAdventureTaskID)
	--����nAdventureTaskID��������������ģ�Ĭ��Ϊ0-��ʾ�ޣ�Ϊtrue, ���������󣬷�������������
	if nAdventureTaskID and nAdventureTaskID ~= 0 then 
		player.SetAdventureFlag(nAdventureTaskID, true)
	end
end

-- ����ǰ�ñ����ж�, ����ǰ���ж� ��
--	�������ȡǰ���ô˺���,PreAdventureTaskID==0 or nil�򲻵��ã�
-- nAdventureTaskID����������ǰ����������ID��PreAdventureTaskID��
-- nQuestkID: ����ID
function CheckAdventureStateByQuest(player, nQuestkID, nAdventureTaskID)
	if nAdventureTaskID and nAdventureTaskID ~= 0 then
		return	player.GetAdventureFlag(nAdventureTaskID)
	end
	return true
end

-- �Ķ���������
function OnReadDoodadFinished(player)
	Adventure_ReadBookAdventure.TryStartAdventure(player,100)	--�Ķ����Ķ�������1%���ʴ���
end

-- ���������������
function OnCopyFinished(player)
	Adventure_ReadBookAdventure.TryStartAdventure(player,0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com