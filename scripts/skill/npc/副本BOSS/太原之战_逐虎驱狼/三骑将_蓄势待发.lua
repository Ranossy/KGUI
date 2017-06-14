---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_逐虎驱狼/三骑将_蓄势待发.lua
-- 更新时间:	2014/9/3 16:54:34
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local boss = GetNpc(nCharacterID)
	if not boss then
		return
	end

	if nLeftFrame == 0 then
	
		if boss.GetCustomInteger1(6) == 1 then
			boss.FireAIEvent(2006, 0, 0)      --步兵切换到骑兵
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com