------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2012-8-28
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local scene = cPlayer.GetScene()
	if not scene then
	return	
	end
	local cNpc = scene.GetNpcByNickName("mylj_zongkong")
	if not cNpc then 
		return
	end
	cNpc.FireAIEvent(2002, 0, dwCharacterID)
	cNpc.CastSkill(4466,1)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com