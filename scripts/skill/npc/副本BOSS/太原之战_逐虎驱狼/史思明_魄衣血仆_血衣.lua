---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_逐虎驱狼/史思明_魄衣血仆_血衣.lua
-- 更新时间:	2014/9/25 15:06:36
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)

end
function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetNpc(nCharacterID)
	if not npc or npc.bFightState ~= true then
		return
	end
	
	local scene = npc.GetScene()
	
	for i = 1, 50 do
		local blood = scene.GetNpcByNickName("xianxue" .. i)
		if not blood then
			--召唤NPC
			npc.PlaySfx(1036, npc.nX, npc.nY, npc.nZ)
			if scene.dwMapID == 192 then
				scene.CreateNpc(37042, npc.nX, npc.nY, npc.nZ, 0, 120 * 16, "xianxue" .. i)
			elseif scene.dwMapID == 199 then
				scene.CreateNpc(40962, npc.nX, npc.nY, npc.nZ, 0, 120 * 16, "xianxue" .. i)
			elseif scene.dwMapID == 206 then
				scene.CreateNpc(42182, npc.nX, npc.nY, npc.nZ, 0, 120 * 16, "xianxue" .. i)
			elseif scene.dwMapID == 212 then
				scene.CreateNpc(42710, npc.nX, npc.nY, npc.nZ, 0, 120 * 16, "xianxue" .. i)
			end		
			return
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com