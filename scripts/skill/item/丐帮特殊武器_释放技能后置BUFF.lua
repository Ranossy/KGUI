---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/ؤ����������_�ͷż��ܺ���BUFF.lua
-- ����ʱ��:	2016/10/9 16:03:01
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		--	player.DoAction(0,15151)
		player.AddBuff(player.dwID, player.nLevel, 11392, 1)

	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com