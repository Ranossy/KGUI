------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2014-4-1
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------


--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID,dwSkillSrcID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.PlayCameraAnimation(0, 0)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com