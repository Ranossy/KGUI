------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2014-7-14
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Map/ACT_��ֵ�/include/��ֵ�.lua")
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end	
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "Hotkey_EnableMoveBack", false)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.SetDynamicSkillGroup(0)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "Hotkey_EnableMoveBack", true)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com