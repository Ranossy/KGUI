------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2012-10-18
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------


--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
	local playerID = npc.GetCustomInteger4(0)
	local cPlayer = GetPlayer(playerID)
	if not cPlayer then
		return
	end
	npc.SetCustomBoolean(8, false)
	cPlayer.Die()
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com