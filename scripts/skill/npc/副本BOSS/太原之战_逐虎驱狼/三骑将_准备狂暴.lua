---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_逐虎驱狼/三骑将_准备狂暴.lua
-- 更新时间:	2014/9/4 16:12:16
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	--[[
	local boss = GetNpc(nCharacterID)
	if not boss then
		return
	end

	if nLeftFrame == 0 then
		boss.AddBuff(0, 99, 8202, 1)
	end
	--]]
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com