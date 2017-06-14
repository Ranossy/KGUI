---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_秋千2监控buff_魔法.lua
-- 更新时间:	2017/2/13 14:17:35
-- 更新用户:	FENGMENGJIE-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end

	local npc = scene.GetNpcByNickName("QIUQ_fxf0124" .. player.dwID)
	if npc then
		npc.FireAIEvent(2001, 0, 0)
	end

	local buff1 = player.GetBuff(11687, 1)
	if buff1 then
		local npc1 = scene.GetNpcByNickName("QIUQ_fxf0124" .. player.dwID)
		if npc1 then
			local player_fjID = npc1.GetPlayerIDBySocketIndex(1)
			if player_fjID ~= nil then

				local player_fj = GetPlayer(player_fjID)
				if player_fj then

					if player_fj.GetDynamicSkillGroup() == 327 or player_fj.GetDynamicSkillGroup() == 326 then
						player_fj.SetDynamicSkillGroup(0)
					end

					player_fj.DelBuff(11688, 1)
				end
			end
			npc1.SetPlayerToSocket(0, 0)
			npc1.SetPlayerToSocket(1, 0)
			npc1.SetDisappearFrames(1, 0)
		end

		if player.dwBackItemIndex == 20294 then
			player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 379)
		end

		player.DelBuff(11687, 1)
	end

	local buff2 = player.GetBuff(11688, 1)
	if buff2 then
		local buff3 = player.GetBuff(11686, 1)
		if buff3 then----
			local npc2 = scene.GetNpcByNickName("QIUQ_fxf0124" .. buff3.nCustomValue)
			if npc2 then
				npc2.SetPlayerToSocket(1, 0)
			end
		end
		player.DelBuff(11688, 1)
	end

	player.SetDynamicSkillGroup(0)
	player.DoAction(0, 10000)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com