---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_��»ɽ_���ս�����buff.lua
-- ����ʱ��:	2014/3/7 11:40:52
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end

	if scene.dwMapID == 182 then
		if player.nMoveState == MOVE_STATE.ON_RUN then
			player.CastSkill(8940, 1)
		end
	end

	if scene.dwMapID == 183 then
		if player.nMoveState == MOVE_STATE.ON_RUN then
			player.CastSkill(8940, 2)
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com