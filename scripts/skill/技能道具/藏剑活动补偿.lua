---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/藏剑活动补偿.lua
-- 更新时间:	07/09/10 11:54:43
-- 更新用户:	zhouhengda2
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	if player.GetBuff(2064, 1) then
		player.SendSystemMessage(SKILL_STRING_TABLE[32199])
		return false, false
	end
	
	for i = 1, 5 do 
		player.AddBuff(0, 99, 2064, 1)
	end
	return false, true
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com