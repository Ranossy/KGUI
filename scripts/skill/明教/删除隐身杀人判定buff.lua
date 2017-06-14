------------------------------------------------
-- 创建人   :  郑海星	
-- 创建时间	:  20120613
-- 效果备注	:  明教技能
------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	if (not player.GetBuff(4052,1)) and (not player.GetBuff(4052,3)) then
		player.DelBuff(5496, 1)
	end
end



 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com