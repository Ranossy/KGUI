---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/ؤ����������_�����ӳ�BUFF.lua
-- ����ʱ��:	2016/10/9 15:56:30
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		player.PlaySfx(1531, player.nX, player.nY, player.nZ)
		player.DoAction(0,15151)
		player.AddBuff(player.dwID, player.nLevel, 11394, 1)

	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com