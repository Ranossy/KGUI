---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/�»�_̹�˶�ҩ�˺�.lua
-- ����ʱ��:	2016/8/22 16:31:24
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if scene then
		local yuehua = scene.GetNpcByNickName("yuehua")
		if yuehua and yuehua.bFightState == true then
			if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
				player.CustomDamage(yuehua.dwID, 16496, 1, 0, player.nMaxLife * 0.1)
				--print("̹�˶�ҩ")
			end
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com