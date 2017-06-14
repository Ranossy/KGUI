---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/宠物交互相关/少林猴子_讲经控制.lua
-- 更新时间:	2016/4/22 22:40:22
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	--提前结束（玩家手动取消）则通知总控清场--
	if nLeftFrame > 0 then
		local player = GetPlayer(nCharacterID)
		if not player then
			return
		end
		local scene = player.GetScene()
		if not scene then
			return
		end
		local npc = scene.GetNpcByNickName("ZK_jiangjing" .. player.dwID)
		if npc then
			npc.FireAIEvent(2002, 0, 0)   --2002事件是立即清场
		end
		player.CloseLonelyMode()
		player.Jump(0, 0)
	end

end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com