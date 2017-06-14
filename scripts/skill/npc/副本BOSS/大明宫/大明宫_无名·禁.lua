------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-4-9
-- 效果备注	:  默认的技能脚本
------------------------------------------------


--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	
	if  player.nMoveState == MOVE_STATE.ON_SWIM or player.nMoveState == MOVE_STATE.ON_FLOAT then
		if player.nCurrentLife > 4200 then
			player.nCurrentLife = player.nCurrentLife - 4200
		else
			player.Die()
		end
	end

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com