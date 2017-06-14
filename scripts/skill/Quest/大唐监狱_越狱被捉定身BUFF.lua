---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/大唐监狱_越狱被捉定身BUFF.lua
-- 更新时间:	2013/5/6 16:33:25
-- 更新用户:	gaoweilong
-- 脚本说明:	
----------------------------------------------------------------------<

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.SetTimer(1, "scripts/skill/Quest/大唐监狱_越狱被捉定身BUFF.lua", 1, 1)	
end

function OnTimer(player, nP1, nP2)
	player.AddBuff(0, 99, 4940, 1, 10)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com