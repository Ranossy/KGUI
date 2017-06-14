---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/鹤梅_撑起BUFF监控_每跳.lua
-- 更新时间:	2015/11/27 15:35:55
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
	local scene = player.GetScene()

	local doodad_now = scene.GetDoodadByNickName("HeMeiZHUOZI_" .. player.dwID)
	if doodad_now then
		local dwDistance_Fanwei = GetDistanceSq(doodad_now.nX, doodad_now.nY, 0, player.nX, player.nY, 0) ^ 0.5
		if dwDistance_Fanwei > 1 * 64 then
			doodad_now.SetDisappearFrames(1, 0)
		end
	end

	if player.dwBackItemIndex ~= 16872 then
		player.DelBuff(10276, 1)
		return
	end

	local bFLAG = false

	local scene = player.GetScene()

	local npcX = scene.GetNpcByNickName("hm_fxf1127_" .. player.dwID)
	if npcX then
		bFLAG = true
	end

	local buff = player.GetBuff(1575, 15)
	if buff then
		bFLAG = true
	end

	if bFLAG then
		if player.GetDynamicSkillGroup() == 0 then
			player.SetDynamicSkillGroup(231)
		end
	else
		player.DelBuff(10276, 1)
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com