---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/��������Ѫ��.lua
-- ����ʱ��:	2013/6/23 21:44:17
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.nCurrentLife <= player.nMaxLife * 0.4 then
		player.AddBuff(dwCharacterID, player.nLevel, 6339, 1, 1)
	else
		--����ά��8��
		player.AddBuff(dwCharacterID, player.nLevel, 9832, 1, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com