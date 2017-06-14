---------------------------------------------------------------------->
-- 脚本名称:	scripts/Traffic/AutoFly.lua
-- 更新时间:	2015-10-22 9:35:40
-- 更新用户:	meizhu-PC
-- 脚本说明:	逻辑上交通前的调用，true为可以乘交通，false为不可以
----------------------------------------------------------------------<

function CanAutoFly(player)

	if player.dwShapeShiftID ~= 0 then	-- 玩家乘坐载具状态
		return false
	end
	if player.GetBuff(7732, 1) then
		player.SendSystemMessage(GetEditorString(6, 5293))
		return false
	end
	if player.GetBuff(9982, 1) then
		player.SendSystemMessage(GetEditorString(8, 6807))
		return false
	end
	if player.GetBuff(9506, 1) then
		player.SendSystemMessage(GetEditorString(8, 9045))
		return false
	end
	--双人动作在锁定阶段上交通的表现处理
	if player.GetBuff(9219, 1) then
		player.SendSystemMessage(GetEditorString(8, 9045))
		return false
	end
	--通用禁止传送BUFF
	if player.GetBuff(10826, 1) then
		player.SendSystemMessage(GetEditorString(8, 9045))
		return false
	end
	return true
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com