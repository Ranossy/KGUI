---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��ɽ����_�Զ�����.lua
-- ����ʱ��:	2016/8/19 16:51:22
-- �����û�:	linjiajia2
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  zhx
-- ����ʱ��  :  20111208
------------------------------------------------

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.dwShapeShiftID == 0 and player.nCurrentMana / player.nMaxMana < 0.1 and not player.GetBuff(3610, 2) then
		player.nCurrentMana = player.nMaxMana
		player.AddBuff(0, 99, 3610, 2)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com