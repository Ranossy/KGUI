------------------------------------------------
-- �ļ���    :  ��������.lua
-- ������    :  CBG
-- ����ʱ��  :  2011-04-08
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  ��������
-- ����Ч��  :  
----------------------------


--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and IsPlayer(dwCharacterID) then
		player.nCurrentMana = player.nCurrentMana + player.nMaxMana *0.3
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com