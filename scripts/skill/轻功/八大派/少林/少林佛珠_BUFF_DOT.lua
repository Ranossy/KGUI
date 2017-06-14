---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/轻功/八大派/少林/少林佛珠_BUFF_DOT.lua
-- 更新时间:	2016/4/16 13:46:47
-- 更新用户:	zhangyan-pc
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--print(11111)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.nMoveState == MOVE_STATE.ON_SWIM then
		--退出滞空
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end

	if player.nMoveState == MOVE_STATE.ON_STAND then
		--退出滞空
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end

	if player.nMoveState == MOVE_STATE.ON_DEATH then
		--退出滞空
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end

	if player.bOnHorse then
		--退出滞空
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end

	local nH, nType = player.GetAltitude()
	--print(nH .. "__" ..nType)
	--if nH < 2000 and nType == 1 then
	--player.DelBuff(9891, 1)
	--end
	--]]

end

function UnApply(dwCharacterID)

end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com