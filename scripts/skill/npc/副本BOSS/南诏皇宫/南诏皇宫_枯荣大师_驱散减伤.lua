------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2012-8-16
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	cPlayer.DelBuff(4255,1)
	cPlayer.DelBuff(4256,1)
	cPlayer.DelBuff(4257,1)
	cPlayer.DelBuff(4258,1)
	cPlayer.DelBuff(4259,1)
	cPlayer.DelBuff(4260,1)
	cPlayer.DelBuff(4255,2)
	cPlayer.DelBuff(4256,2)
	cPlayer.DelBuff(4257,2)
	cPlayer.DelBuff(4258,2)
	cPlayer.DelBuff(4259,2)
	cPlayer.DelBuff(4260,2)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com