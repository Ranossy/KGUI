---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/��������Ч.lua
-- ����ʱ��:	2013/10/30 11:01:47
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.PlaySfx(617, player.nX, player.nY, player.nZ + 2000)
	player.CastSkill(17599,1)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com