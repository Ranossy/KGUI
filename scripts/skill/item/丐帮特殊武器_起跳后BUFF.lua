---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/ؤ����������_������BUFF.lua
-- ����ʱ��:	2016/10/12 20:21:16
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		--	player.DoAction(0,15151)
		--player.AddBuff(player.dwID, player.nLevel, 11392, 1)
		--if player.nRoleType == ROLE_TYPE.STANDARD_MALE then --M2
		player.CastSkill(17028, 1)

		--elseif player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then --f2
		--	player.CastSkill(17028, 2)

		--elseif player.nRoleType == ROLE_TYPE.LITTLE_BOY then --m1
		--	player.CastSkill(17028, 3)

		--elseif player.nRoleType == ROLE_TYPE.LITTLE_GIRL then --f1
		--	player.CastSkill(17028, 4)
		--end

	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com