------------------------------------------------
-- ������   :  zhengkaifeng
-- ����ʱ��	:  2009-09-22
-- Ч����ע	:  ����������㴺�໤��
------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nBuffLevel = player.GetSkillLevel(132)
	player.AddBuff(0,99,122,nBuffLevel,0)
	player.AddBuff(0,99,122,nBuffLevel,0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com