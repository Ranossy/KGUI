---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/轻功/长_鱼头_BUFF_BOT.lua
-- 更新时间:	2015/10/21 0:40:00
-- 更新用户:	zhangyan3
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--print(11111)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.nMoveState == MOVE_STATE.ON_SWIM then
		--退出滞空
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end
	
	if player.nMoveState == MOVE_STATE.ON_STAND then
		--退出滞空
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end
	
	if player.nMoveState == MOVE_STATE.ON_DEATH then
		--退出滞空
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end

	if player.bOnHorse then
		--退出滞空
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end
	
	local nH,nType = player.GetAltitude()
	--print(nH .. "__" ..nType)
	--if nH < 2000 and nType == 1 then
		--player.DelBuff(9891, 1)
	--end
	--]]
	--战斗中浮空，的气力扣减，每秒
	if player.bSprintFlag and player.bFightState then
		local nNumValue = 100 * 100
		local nNumPoint = player.nSprintPower
		if nNumPoint ~= 0 then
			if nNumPoint > nNumValue then
				if not (player.nDisableSprintPowerCost > 0) then
					player.SetSprintPower(0, nNumPoint - nNumValue)--扣减气力值 0代表人,1代表马
				end
			else
				if not (player.nDisableSprintPowerCost > 0) then
					player.SetSprintPower(0, 0)
				end
			end
		end
	end
end


function UnApply(dwCharacterID)
	
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com