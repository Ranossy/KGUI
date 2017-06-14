---------------------------------------------------------------------->
-- 脚本名称:	scripts/Map/荻花宫后山/skill/逃避.lua
-- 更新时间:	03/01/11 15:38:32
-- 更新用户:	yule-PC
-- 脚本说明:	
----------------------------------------------------------------------<


-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
		if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
			local tBuff = player.GetBuff(2298, 1)
			if tBuff then
				if tBuff.nStackNum >= 3 then
					player.AddBuff(0,99,2594,1)
				end				
				if tBuff.nStackNum >= 5 then
					player.Die()
				end
			end
		end
	end
end

-- 技能反应用脚本, 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com