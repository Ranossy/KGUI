---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/儿童节/发糖果延时.lua
-- 更新时间:	2015/5/28 17:44:27
-- 更新用户:	jiangzhefei1
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Map/节日儿童节/include/榴芒兔函数汇总.lua")

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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com