---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/skill调用/中立使用复活技能活动判断.lua
-- 更新时间:	2014/3/13 22:01:20
-- 更新用户:	hanzhengchun
-- 脚本说明:	
----------------------------------------------------------------------<
Include("scripts/Map/逐鹿中原/include/据点争夺_Data.lh")

function CheckCamp(player)
	local scene = player.GetScene()
	if not scene then
		return true
	end

	local nTargetType, dwTargetID = player.GetTarget()
	local player_target = GetPlayer(dwTargetID)
	if not player_target then
		return true
	end

	if player.nCamp == player_target.nCamp then
		return true
	end

	local CastleFightResult = CastleFight.CanCastReviveSkill(player)
	local CampFigheResult = CheckCampFight(player)
	--if CampFigheResult then
	if not CastleFightResult or not CampFigheResult then
		return false
	else
		return true
	end
	return true
end

function CheckCampFight(player)
	local scene = player.GetScene()
	if not scene then
		return true
	end

	if IsActivityOn(41) then
		local nWeekday = GetCurrentWeekDay()
		if nWeekday == 6 and  scene.dwMapID == 25 then
			return false
		end
		if nWeekday == 0 and  scene.dwMapID == 27 then
			return false
		end
	else
		return true
	end
	return true
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com