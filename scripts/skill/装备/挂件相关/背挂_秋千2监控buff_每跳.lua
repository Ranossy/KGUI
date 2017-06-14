---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_秋千2监控buff_每跳.lua
-- 更新时间:	2017/2/13 14:17:26
-- 更新用户:	FENGMENGJIE-PC
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	--检查BUFF和NPC存在与否
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end

	local bFLAG1 = true
	local bFLAG2 = true

	local buff1 = player.GetBuff(11687, 1)  --主人
	if buff1 then
		if player.dwBackItemIndex ~= 20294 then
			bFLAG1 = false
		end

		local npc1 = scene.GetNpcByNickName("QIUQ_fxf0124" .. player.dwID)
		if not npc1 then
			bFLAG1 = false
		end

		if player.bFightState then
			bFLAG1 = false
		end

		if player.nMoveState == MOVE_STATE.ON_DEATH then
			bFLAG1 = false
		end

		if bFLAG1 then
			if player.GetDynamicSkillGroup() == 0 then
				if player.nRoleType == ROLE_TYPE.STANDARD_MALE then
					player.SetDynamicSkillGroup(325)
				elseif player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
					player.SetDynamicSkillGroup(324)
				elseif player.nRoleType == ROLE_TYPE.LITTLE_BOY then
					player.SetDynamicSkillGroup(325)
				else
					player.SetDynamicSkillGroup(324)
				end
			end
		else
			player.DelBuff(11686, 1)
		end
	end

	local buff2 = player.GetBuff(11688, 1)
	if buff2 then
		local buff3 = player.GetBuff(11686, 1)
		local owner = GetPlayer(buff3.nCustomValue)
		if owner then
			local npc2 = scene.GetNpcByNickName("QIUQ_fxf0124" .. owner.dwID)
			if not npc2 then
				bFLAG2 = false
			end

			if player.bFightState then
				bFLAG2 = false
			end

			if player.nMoveState == MOVE_STATE.ON_DEATH then
				bFLAG2 = false
			end

			if bFLAG2 then
				if player.GetDynamicSkillGroup() == 0 then
					if player.nRoleType == ROLE_TYPE.STANDARD_MALE then
						player.SetDynamicSkillGroup(327)
					elseif player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
						player.SetDynamicSkillGroup(326)
					elseif player.nRoleType == ROLE_TYPE.LITTLE_BOY then
						player.SetDynamicSkillGroup(327)
					else
						player.SetDynamicSkillGroup(326)
					end
				end
			else
				player.DelBuff(11686, 1)
			end
		else
			player.DelBuff(11686, 1)
		end
	end
end

function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com