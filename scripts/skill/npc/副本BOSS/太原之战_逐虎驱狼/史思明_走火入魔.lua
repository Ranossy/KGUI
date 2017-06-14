---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_逐虎驱狼/史思明_走火入魔.lua
-- 更新时间:	2014/10/2 19:32:56
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetPlayer(nCharacterID)
	if not npc or npc.bFightState ~= true then
		return
	end

	npc.FireAIEvent(2008, 0, 0)
	
--[[
	if nLeftFrame == 0 then    -----自然结束，添加增强BUFF
		local LV = 1
		if scene.dwMapID ~= 192 then
			LV = 2
		end
		player.AddBuff(0, 99, 8342, LV)
	else                       --提前结束，向BOSS发事件
		
	end
	--]]
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com