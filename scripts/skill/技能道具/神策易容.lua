---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/神策易容.lua
-- 更新时间:	09/14/09 16:25:24
-- 更新用户:	tangyiming
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
		player.DoAction(0, 10102)
		player.DoCustomOTAction(0, 1, 3 * GLOBAL.GAME_FPS, TARGET.NO_TARGET, 0, 
				"scripts/skill/技能道具/神策易容.lua", SKILL_STRING_TABLE[22959]
		)
	-- 必须要有两个返回值来确定: 1] 是否继续使用道具自带技能 2] 是否销毁此道具
	return false, false
end

function OnCustomEvent(player)
	local nItemAmount = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 4893)
	if nItemAmount == 0 then
		player.SendSystemMessage(SKILL_STRING_TABLE[22958])
		return
	end
	if player.nRoleType == ROLE_TYPE.LITTLE_GIRL or player.nRoleType == ROLE_TYPE.SEXY_FEMALE or player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
		player.AddBuff(0, 99, 1409, 1)
	else
		player.AddBuff(0, 99, 1409, 2)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com