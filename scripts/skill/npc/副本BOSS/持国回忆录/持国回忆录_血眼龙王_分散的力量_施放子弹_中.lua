--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
local tDirection = {}
	tDirection[1] = npc.nFaceDirection
	tDirection[2] = npc.nFaceDirection - 45 % 256
	tDirection[3] = npc.nFaceDirection + 45 % 256
	tDirection[4] = npc.nFaceDirection + 135 % 256
	tDirection[5] = npc.nFaceDirection -135 % 256
	tDirection[6] = npc.nFaceDirection - 90 % 256
	tDirection[7] = npc.nFaceDirection + 90 % 256
	tDirection[8] = npc.nFaceDirection + 180 % 256
	for i = 1 ,8 do
		local nY = npc.nY + math.floor(math.sin(tDirection[i] / 128 * math.pi) * 40 * 64)
		local nX = npc.nX + math.floor(math.cos(tDirection[i] / 128 * math.pi) * 40 * 64)
		local scene = npc.GetScene()
		if not scene then
			return
		end
		if scene.dwMapID == 131 then
		local npcYb = scene.CreateNpc(16353, npc.nX, npc.nY, npc.nZ, npc.nFaceDirection, -1)
		if npcYb then
			npcYb.RunTo(nX, nY)
		end
		elseif scene.dwMapID == 148 then
		local npcYb = scene.CreateNpc(18321, npc.nX, npc.nY, npc.nZ, npc.nFaceDirection, -1)
		if npcYb then
			npcYb.RunTo(nX, nY)
		end
		end
	end

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com