---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_中秋buff监控_每跳.lua
-- 更新时间:	2016/9/7 20:19:49
-- 更新用户:	FENGMENGJIE
-- 脚本说明:
----------------------------------------------------------------------<
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--检查BUFF和NPC存在与否
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.dwBackItemIndex ~= 19081 then
		player.DelBuff(11173, 1)
		return
	end

	local bFLAG = true

	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("tree_fxf1609_" .. player.dwID)
	if not npc then
		bFLAG = false
	end

	if player.bFightState then
		bFLAG = false
	end

	if player.nMoveState == MOVE_STATE.ON_DEATH then
		bFLAG = false
	end

	if bFLAG then
		if player.GetDynamicSkillGroup() == 0 then
			if scene.dwMapID == 258 then
				player.SetDynamicSkillGroup(306)
			else
				player.SetDynamicSkillGroup(304)
			end
		end
	else
		player.DelBuff(11173, 1)
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com