------------------------------------------------
-- ������    :  CBG
-- ����ʱ��  :  2011-04-16
-- ��;(ģ��):  �书����
-- �书����  :  
-- �书����  :  ��

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.025
	player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.025
	if player.nCurrentLife > player.nMaxLife then
		player.nCurrentLife = player.nMaxLife
	end
	if player.nCurrentMana > player.nMaxMana then
		player.nCurrentMana = player.nMaxMana
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com