---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_逐虎驱狼/史思明_鲜血护盾.lua
-- 更新时间:	2014/10/2 17:59:57
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
---[[
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetNpc(nCharacterID)
	if not npc or npc.bFightState ~= true then
		return
	end

	local scene = npc.GetScene()
	--删除NPC身上的内功减伤BUFF----------
	npc.DelBuff(8831, 1)
	for i = 1, 50 do
		local blood = scene.GetNpcByNickName("xianxue" .. i)
		if not blood then
			--召唤NPC
			npc.PlaySfx(1035, npc.nX, npc.nY, npc.nZ)
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
--]]
function Apply(dwCharacterID)
	
end
function UnApply(dwCharacterID)
--[[
	local npc = GetNpc(dwCharacterID)
	if not npc or npc.bFightState ~= true then
		return
	end

	local scene = npc.GetScene()

	for i = 1, 50 do
		local blood = scene.GetNpcByNickName("xianxue" .. i)
		if not blood then
			--召唤NPC
			npc.PlaySfx(1035, npc.nX, npc.nY, npc.nZ)
			if scene.dwMapID == 192 then
				scene.CreateNpc(37042, npc.nX, npc.nY, npc.nZ, 0, 120 * 16, "xianxue" .. i)
			else
				scene.CreateNpc(40962, npc.nX, npc.nY, npc.nZ, 0, 120 * 16, "xianxue" .. i)
			end
			print(i)
			return
		end
	end
	--]]
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com