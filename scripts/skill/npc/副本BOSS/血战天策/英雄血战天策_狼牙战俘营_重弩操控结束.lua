---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/英雄血战天策_狼牙战俘营_重弩操控结束.lua
-- 更新时间:	2013/12/16 17:35:19
-- 更新用户:	liguanghao2
-- 脚本说明:	
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	player.SetDynamicSkillGroup(0)
	if nLeftFrame > 0 then
		if player.GetDynamicSkillGroup() == 78 or player.GetDynamicSkillGroup() == 93 then
			player.SetDynamicSkillGroup(0)
		end
		local npcZN = GetNpc(nCustomValue)
		if npcZN then
			npcZN.SetDialogFlag(1)
			npcZN.SetCustomBoolean(1, false)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com