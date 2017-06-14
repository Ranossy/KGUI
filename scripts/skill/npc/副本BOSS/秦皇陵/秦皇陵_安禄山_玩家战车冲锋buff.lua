---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/秦皇陵_安禄山_玩家战车冲锋buff.lua
-- 更新时间:	2014/3/7 11:40:52
-- 更新用户:	ks13376-PC
-- 脚本说明:
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com