---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/ؤ����������_��̽���AOEBUFF.lua
-- ����ʱ��:	2016/10/11 0:33:27
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		--player.PlaySfx(1179, player.nX, player.nY, player.nZ)
		--	player.CastSkill(17025, 1)
		--player.DelBuff(9585, 1)

	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	local scene = player.GetScene()
	if scene then
		--	local anqingxu = scene.GetNpcByNickName("anqingxu")
		--	if anqingxu and anqingxu.bFightState == true then
		--		anqingxu.CastSkill(16592, 1)
		--		anqingxu.PlaySfx(1471, player.nX, player.nY, player.nZ + 150)
		--	end
		if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
			--player.PlaySfx(1179, player.nX, player.nY, player.nZ)
		--	player.PlaySfx(63, player.nX, player.nY, player.nZ)
		--	player.PlaySfx(63, player.nX, player.nY, player.nZ)
		--	player.PlaySfx(63, player.nX, player.nY, player.nZ)
		--	player.PlaySfx(63, player.nX, player.nY, player.nZ)
			player.PlaySfx(63, player.nX, player.nY, player.nZ)
			player.PlaySfx(1492, player.nX, player.nY, player.nZ)
			player.CastSkill(17040, 1)
			player.DelGroupBuff(11416, 1)
			--player.DelBuff(9585, 1)

		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com