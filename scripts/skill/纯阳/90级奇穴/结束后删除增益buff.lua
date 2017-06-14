---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/90级奇穴/结束后删除增益buff.lua
-- 更新时间:	2013/4/18 20:22:57
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if not player.GetBuff(374, 1) then
		player.DelBuff(5653, 1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com