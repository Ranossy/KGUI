---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/霸刀场景/搬运美酒.lua
-- 更新时间:	2016/8/30 16:30:56
-- 更新用户:	wangwei2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	--player.DelBuff(2587, 10)
	if player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, 27084) >= 1 then		
		--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "你正在搬运美酒。", 4)
		player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, 27084, 1)
		return false
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com