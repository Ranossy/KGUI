---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_������/ʷ˼��_��Ѫ����.lua
-- ����ʱ��:	2014/10/2 17:59:57
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
---[[
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npc = GetNpc(nCharacterID)
	if not npc or npc.bFightState ~= true then
		return
	end

	local scene = npc.GetScene()
	--ɾ��NPC���ϵ��ڹ�����BUFF----------
	npc.DelBuff(8831, 1)
	for i = 1, 50 do
		local blood = scene.GetNpcByNickName("xianxue" .. i)
		if not blood then
			--�ٻ�NPC
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
			--�ٻ�NPC
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com