---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/血战天策_黑齿元佑_幽灵变身_结束调用.lua
-- 更新时间:	2013/9/27 11:53:35
-- 更新用户:	wangpengfei1
-- 脚本说明:	
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nLeftFrame > 0 then
		player.SetDynamicSkillGroup(0)
		RemoteCallToClient(player.dwID, "EnableColorShift", false)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com