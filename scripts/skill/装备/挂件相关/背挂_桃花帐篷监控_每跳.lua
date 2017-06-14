---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_桃花帐篷监控_每跳.lua
-- 更新时间:	2017/5/17 22:22:42
-- 更新用户:	ZHANGYAN0-PC
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

	local buff1 = player.GetBuff(10262, 1)  --主人
	if buff1 then
		----print(11)
		if player.dwBackItemIndex ~= 19465 then
			bFLAG1 = false
		end
		----print(12)

		local npc1 = scene.GetNpcByNickName("qq_fxf0520" .. player.dwID)
		if not npc1 then
			bFLAG1 = false
		end
		----print(13)

		if player.bFightState then
			bFLAG1 = false
		end
		----print(14)

		if player.nMoveState == MOVE_STATE.ON_DEATH then
			bFLAG1 = false
		end

		if bFLAG1 then
			if player.GetDynamicSkillGroup() == 0 then
				player.SetDynamicSkillGroup(340)
			end
		else
			player.DelBuff(11973, 1)
			----print(16)
		end
	end

	local buff2 = player.GetBuff(10796, 1)
	if buff2 then
		----print(17)
		local buff3 = player.GetBuff(11973, 1)
		local owner = GetPlayer(buff3.nCustomValue)
		if owner then
			----print(18)
			local npc2 = scene.GetNpcByNickName("qq_fxf0520" .. owner.dwID)
			if not npc2 then
				bFLAG2 = false
			end
			----print(19)

			if player.bFightState then
				bFLAG2 = false
			end

			if player.nMoveState == MOVE_STATE.ON_DEATH then
				bFLAG2 = false
			end

			if bFLAG2 then
				if player.GetDynamicSkillGroup() == 0 then
					player.SetDynamicSkillGroup(341)
				end
			else
				player.DelBuff(11973, 1)
				----print(20)
			end
		else
			player.DelBuff(11973, 1)
			----print(21)
		end
	end
end

function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com