---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/�»�����AOEbuff_25�˰�.lua
-- ����ʱ��:	2016/9/27 15:21:53
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
				--player.PlaySfx(1179, player.nX, player.nY, player.nZ)
				--player.CastSkill(15633, 1)
				--player.DelBuff(9585, 1)
				yuehua.CastSkillXYZ(15633, 2, player.nX, player.nY, player.nZ)
				yuehua.PlaySfx(1458, player.nX, player.nY, player.nZ)
			end
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com