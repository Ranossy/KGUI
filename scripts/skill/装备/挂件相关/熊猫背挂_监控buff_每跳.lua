---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/熊猫背挂_监控buff_每跳.lua
-- 更新时间:	2016/2/20 16:31:26
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
	
	if player.dwBackItemIndex ~= 17236 and player.dwBackItemIndex ~= 19238 then--增加限时版判断
		player.DelBuff(10507, 1)
		return
	end
	
	local bFLAG = true

	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
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
			player.SetDynamicSkillGroup(247)
		end
	else
		player.DelBuff(10507, 1)		
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com