------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2012-9-19
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local nBuff1 = cPlayer.GetBuff(4470, 1)
	if nBuff1 then
		if nBuff1.nStackNum > 4 then
			for i = 1,6 do
				cPlayer.DelBuff(4470,1)
			end
			cPlayer.AddBuff(0,99,4472,1)
		else
			cPlayer.AddBuff(0,99,4470,1)
		end
	end
	
	local nBuff2 = cPlayer.GetBuff(4470, 2)
	if nBuff2 then
		if nBuff2.nStackNum > 4 then
			for i = 1,6 do
				cPlayer.DelBuff(4470,2)
			end
			cPlayer.AddBuff(0,99,4472,2)
		else
			cPlayer.AddBuff(0,99,4470,2)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com