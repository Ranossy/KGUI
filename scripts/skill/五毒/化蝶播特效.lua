---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/五毒/化蝶播特效.lua
-- 更新时间:	2013/10/30 11:01:47
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.PlaySfx(617, player.nX, player.nY, player.nZ + 2000)
	player.CastSkill(17599,1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com