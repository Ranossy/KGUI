--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 8407 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 135)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com