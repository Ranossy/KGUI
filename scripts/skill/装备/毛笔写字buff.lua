---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/毛笔写字buff.lua
-- 更新时间:	2014/1/16 11:54:42
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.ResetCD(681)
	player.NotifyPainting(player.dwID, 0)
	player.DelBuff(2587,3)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com