---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/骑乘的滑翔监控.lua
-- 更新时间:	2015/6/5 15:11:29
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--print(1)
	local item = player.GetEquippedHorse()
	if item and item.dwIndex == 13784 then
		if player.bOnHorse then
			
			local nNumValue = 60 * 100
			local nNumPoint = player.nHorseSprintPower
			if nNumPoint > nNumValue then
				player.SetSprintPower(1, nNumPoint - nNumValue)--扣减气力值 0代表人,1代表马
			end
			
			return
		end
	end
	
	if item and item.dwIndex == 13790 then
		if player.bOnHorse then
			--print(2)
			local nNumValue = 52 * 100
			local nNumPoint = player.nHorseSprintPower
			if nNumPoint > nNumValue then
				player.SetSprintPower(1, nNumPoint - nNumValue)--扣减气力值 0代表人,1代表马
			end
			
			return
		end
	end
	
	if player.nMoveState == MOVE_STATE.ON_FLY_JUMP then
	--	print(3)
		player.EndFlyJump()
		player.SetTurnRange(128, 128, 64, -64)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com