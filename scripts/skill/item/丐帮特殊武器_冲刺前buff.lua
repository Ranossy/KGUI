---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/ؤ����������_���ǰbuff.lua
-- ����ʱ��:	2016/10/11 23:24:09
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		--player.PlaySfx(1179, player.nX, player.nY, player.nZ)
		--local npc = player.GetSelectCharacter()
		local nType, nID = player.GetTarget()
		if nType == TARGET.NPC then
			local npc = GetNpc(nID)
			if npc then
				if not IsPlayer(npc.dwID) then
					player.TurnToCharacter(npc.dwID)
					--local nDis = GetCharacterDistance(player.dwID, npc.dwID)
					--print(nDis)
					--local tPos = CustomFunction.GetFrontNpcPosition(player.nX, player.nY, player.nFaceDirection, nDis - 150)
					player.CastSkillXYZ(17029, 1, npc.nX, npc.nY, npc.nZ)
					player.AddBuff(player.dwID, player.nLevel, 11397, 1)
					--player.DelBuff(9585, 1)
				end
			end
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com