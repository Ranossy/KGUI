---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_瑞鹤仙灯_buff监控_每跳.lua
-- 更新时间:	2017/4/18 14:58:20
-- 更新用户:	ZHANGYAN0-PC
-- 脚本说明:
----------------------------------------------------------------------<
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--检查BUFF和NPC存在与否
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.dwBackItemIndex ~= 19438 then
		player.DelBuff(11913, 1)
		return
	end

	local bFLAG = true

	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("rhxd_zy201704" .. player.dwID)
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
			player.SetDynamicSkillGroup(336)
		end
	else
		player.DelBuff(11913, 1)
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com