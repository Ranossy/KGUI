---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/90级奇穴/无相驱散反弹.lua
-- 更新时间:	2013/4/24 20:11:15
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
	player.DelBuff(5703, 1)

	--无相结束奇穴气血值低于50%额外获得3秒60%减伤
	if player.GetSkillLevel(14761) == 1 then
		if player.nCurrentLife <= player.nMaxLife * 0.5 then
			player.AddBuff(player.dwID, player.nLevel, 9836, 1)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com