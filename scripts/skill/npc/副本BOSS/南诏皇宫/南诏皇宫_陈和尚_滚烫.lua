------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2012-9-19
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer()
	if not cPlayer then
		return
	end
	local nBuff1 = cPlayer.GetBuff(4405,1)
	if nBuff1.nStackNum == 3 then
		cPlayer.DelBuff(4405,1)
		cPlayer.DelBuff(4405,1)
		cPlayer.DelBuff(4405,1)
		cPlayer.AddBuff(0,99,4403,1)
	end
	local nBuff2 = cPlayer.GetBuff(4405,2)
	if nBuff2.nStackNum == 3 then
		cPlayer.DelBuff(4405,2)
		cPlayer.DelBuff(4405,2)
		cPlayer.DelBuff(4405,2)
		cPlayer.AddBuff(0,99,4403,2)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com