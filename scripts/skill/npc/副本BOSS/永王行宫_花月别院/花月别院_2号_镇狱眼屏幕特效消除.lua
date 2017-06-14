---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/永王行宫_花月别院/花月别院_2号_镇狱眼屏幕特效消除.lua
-- 更新时间:	2015/6/16 19:05:57
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<
 function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
 	local player = GetPlayer(nCharacterID)
	local scene = player.GetScene()
	if not scene then
		return
	end
 	
	if player then
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "Character_StopFullScreenSFX", player.dwID)
	end
 end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com