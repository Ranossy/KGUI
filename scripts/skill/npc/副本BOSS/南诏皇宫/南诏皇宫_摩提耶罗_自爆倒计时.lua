------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2012-9-19
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cNpc = GetNpc(dwCharacterID)
	if not cNpc then
		return
	end
	cNpc.Stand()
	cNpc.CastSkill(4349,1)
	cNpc.SetDisappearFrames(8,0) 
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com