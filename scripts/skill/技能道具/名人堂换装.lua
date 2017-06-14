---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/名人堂换装.lua
-- 更新时间:	07/22/10 09:25:37
-- 更新用户:	zhouhengda2
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	local nBuffID = 2073 --男帮主
	local nBuffLevel = 1 --男帮主
	if player.GetBuff(nBuffID, 1) or player.GetBuff(nBuffID, 2) then
		player.SendSystemMessage(SKILL_STRING_TABLE[33123])
	 	return false, false
	 end
	if player.nRoleType == ROLE_TYPE.STANDARD_FEMALE or player.nRoleType == ROLE_TYPE.LITTLE_GIRL then
		nBuffLevel = 2 --女帮主换装
	end
	player.AddBuff(0, 99, nBuffID, nBuffLevel)
	
	local tAroundPlayerID = player.GetAroundPlayerID()
	for i = 1, #tAroundPlayerID do
		local playerAround = GetPlayer(tAroundPlayerID[i])
		if playerAround and player.dwTongID == playerAround.dwTongID and player.dwTongID ~= 0 and GetCharacterDistance(playerAround.dwID, player.dwID) < 8 * 64 then
			playerAround.DoAction(0, 10150)
		end
	end
	return false, false
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com