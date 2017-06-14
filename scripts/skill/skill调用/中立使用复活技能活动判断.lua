---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/skill����/����ʹ�ø���ܻ�ж�.lua
-- ����ʱ��:	2014/3/13 22:01:20
-- �����û�:	hanzhengchun
-- �ű�˵��:	
----------------------------------------------------------------------<
Include("scripts/Map/��¹��ԭ/include/�ݵ�����_Data.lh")

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

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com