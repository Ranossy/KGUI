---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_秋千buff监控_魔法.lua
-- 更新时间:	2016/6/7 0:30:37
-- 更新用户:	FENGMENGJIE
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
	----print(2020000)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	----print(2020001)
	local scene = player.GetScene()
	if not scene then
		return
	end

	local npc = scene.GetNpcByNickName("qq_fxf0520" .. player.dwID)
	if npc then
		npc.FireAIEvent(2001, 0, 0)
	end
	----print(2020002)
	local buff1 = player.GetBuff(10262, 1)
	if buff1 then
		local npc1 = scene.GetNpcByNickName("qq_fxf0520" .. player.dwID)
		if npc1 then
			local player_fjID = npc1.GetPlayerIDBySocketIndex(1)
			if player_fjID ~= nil then

				local player_fj = GetPlayer(player_fjID)
				if player_fj then

					if player_fj.GetDynamicSkillGroup() == 257 or player_fj.GetDynamicSkillGroup() == 258 then
						player_fj.SetDynamicSkillGroup(0)
					end

					player_fj.DelBuff(10796, 1)
				end
			end
			npc1.SetPlayerToSocket(0, 0)
			npc1.SetPlayerToSocket(1, 0)
			--print(900002)
			npc1.SetDisappearFrames(1, 0)
		end

		if player.dwBackItemIndex == 17536 or player.dwBackItemIndex == 19241 then --增加限时版的判断处理
			player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 335)
		end

		player.DelBuff(10262, 1)
		----print(2020003)
	end

	local buff2 = player.GetBuff(10796, 1)
	if buff2 then
		local buff3 = player.GetBuff(10802, 1)
		if buff3 then----
		--	--print(99)
			local npc2 = scene.GetNpcByNickName("qq_fxf0520" .. buff3.nCustomValue)
			if npc2 then
				npc2.SetPlayerToSocket(1, 0)
				--print(900001)
			end
		end
		player.DelBuff(10796, 1)
	end
----print(2020005)
	player.SetDynamicSkillGroup(0)
	player.DoAction(0, 10000)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com