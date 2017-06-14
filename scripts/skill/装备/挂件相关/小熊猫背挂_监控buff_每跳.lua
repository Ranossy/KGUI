---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/小熊猫背挂_监控buff_每跳.lua
-- 更新时间:	2016/4/19 17:21:27
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

	-- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 17504 and player.dwBackItemIndex ~= 19262 then
		player.DelBuff(10685, 1)
		return
	end

	local bFLAG = true

	local scene = player.GetScene()
	local npc = GetNpc(player.dwFellowPetID)
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
			player.SetDynamicSkillGroup(252)
		end
	else
		player.DelBuff(10685, 1)
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com