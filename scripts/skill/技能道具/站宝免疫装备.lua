---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/站宝免疫装备.lua
-- 更新时间:	03/10/10 10:59:39
-- 更新用户:	wujuan
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	-- 必须要有两个返回值来确定: 1] 是否继续使用道具自带技能 2] 是否销毁此道具
	local nX, nY = 52436, 58310
	local nMapID = 46
	local nDis = 5100
	local nDisNow = ((player.nX - nX) ^ 2 + (player.nY - nY) ^ 2) ^ 0.5
	local scene = player.GetScene()
	if scene and scene.dwMapID == nMapID and nDisNow <= nDis then
		player.AddBuff(0, 99, 1731, 1)
	else
		player.SendSystemMessage(SKILL_STRING_TABLE[26474])
	end
	return false, false
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com