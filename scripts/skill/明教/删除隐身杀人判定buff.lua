------------------------------------------------
-- ������   :  ֣����	
-- ����ʱ��	:  20120613
-- Ч����ע	:  ���̼���
------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	if (not player.GetBuff(4052,1)) and (not player.GetBuff(4052,3)) then
		player.DelBuff(5496, 1)
	end
end



 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com