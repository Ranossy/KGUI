---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_花门_buff监控_每跳.lua
-- 更新时间:	2016/11/8 10:10:15
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

	if player.dwBackItemIndex ~= 20208 then
		player.DelBuff(11499, 1)
		if player.GetBuff(11500, 1) then
			player.DelBuff(11500, 1)
		end
		return
	end

	local bFLAG = true

	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("fxby_N_fxf201611" .. player.dwID)
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
			player.SetDynamicSkillGroup(313)
		end
	else
		player.DelBuff(11499, 1)
		if player.GetBuff(11500, 1) then
			player.DelBuff(11500, 1)
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com