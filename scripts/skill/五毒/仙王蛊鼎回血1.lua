------------------------------------------------
-- 创建人    :  CBG
-- 创建时间  :  2011-04-16
-- 用途(模块):  武功技能
-- 武功门派  :  
-- 武功类型  :  无

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
		player.AddBuff(0,99,3441,1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com