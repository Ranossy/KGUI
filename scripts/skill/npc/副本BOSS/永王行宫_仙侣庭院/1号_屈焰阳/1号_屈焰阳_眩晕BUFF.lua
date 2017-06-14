---------------------------------------------------------------------->
-- 脚本名称:	scripts/Map/太原之战_逐虎驱狼/skill/白陶/跳舞buff.lua
-- 更新时间:	2014/7/14 17:04:12
-- 更新用户:	ZHOUMING
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		--if not player.GetBuff(8198, 0) then
		player.Stop()
		--end	
		player.CastSkill(14166, 1)
		
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com