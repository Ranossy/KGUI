---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��ͯ��/���ǹ���ʱ.lua
-- ����ʱ��:	2015/5/28 17:44:27
-- �����û�:	jiangzhefei1
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Map/���ն�ͯ��/include/��â�ú�������.lua")

function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
	local nSum = GetAwardNum(npc)
	local nTimes = 26 - npc.GetCustomInteger1(0) + 1
	local nAve = math.floor(nSum / nTimes)
	local nAwardThis = math.max(math.floor(Random(5, 20) / 10 * nAve), 1)
	if npc.GetCustomInteger1(0) == 26 then
		nAwardThis = nSum
	end
	--if nSum < nAwardThis then
	--nAwardThis = 3
	--elseif nPatrolPathIndex + 9 >= tPoint[dwMapID].nMax and  nSum > 3 * 12 then
	--nAwardThis = nSum - 3 * 12
	--end
	MinusAwardNum(npc, nAwardThis)
	local nX_NPC, nY_NPC, nZ_NPC = npc.nX, npc.nY, npc.nZ
	local tDoodad = {5178, 5174, 5175, 5179, 5180, 5181}
	for i = 1, nAwardThis do
		local nAngle = Random(99999) % 255
		local nRadius = Random(6 * 64)
		local nX_Plus = nX_NPC + nRadius * math.cos(nAngle / 128 * math.pi)
		local nY_Plus = nY_NPC + nRadius * math.sin(nAngle / 128 * math.pi)
		local doodad = scene.CreateDoodad(tDoodad[Random(#tDoodad)], nX_Plus, nY_Plus, nZ_NPC + 64 * 8 * 5, Random(256))
		doodad.SetDisappearFrames(1 * 60 * GLOBAL.GAME_FPS)
	end
	--npc.Die()
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com