---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/������������_Ѱ�׻�ɽ����ʱbuffÿ��.lua
-- ����ʱ��:	2016/9/2 14:43:34
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		
		player.PlaySfx(1429, player.nX, player.nY, player.nZ-128)
		player.PlaySfx(1443, player.nX, player.nY, player.nZ-128)
		player.PlaySfx(1444, player.nX, player.nY, player.nZ-128)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com