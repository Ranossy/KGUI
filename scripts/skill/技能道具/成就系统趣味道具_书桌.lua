---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/成就系统趣味道具_书桌.lua
-- 更新时间:	01/25/10 16:06:06
-- 更新用户:	liuhengzhi1
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnOpen(doodad, player)
	-- 必须要有一个返回值来确定是否允许玩家打开此DOODAD
	
	local nTargetType, dwTargetID = player.GetTarget()
	if nTargetType ~= TARGET.DOODAD then
		return false
	end
	
	local doodadTarget = GetDoodad(dwTargetID)
	if not doodadTarget then
		return false
	end
	
	local nBuffLeftCount = 31 - (GetCurrentTime() - doodadTarget.GetCustomUnsigned4(0))
	
	if nBuffLeftCount > 0 then
		player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
		player.DoAction(player.dwID, 20961)
		player.AddBuff(0, 99, 1527, 1, nBuffLeftCount)  --添加用于计时播动作的BUFF
	end
	
	return false
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com