------------------------------------------------
-- 创建人   :  张豪		
-- 创建时间	:  2011-3-23
-- 效果备注	:  荻花圣殿慕容夫人技能，施放子弹
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
local tDirection = {}
	tDirection[1] = npc.nFaceDirection
	tDirection[2] = npc.nFaceDirection - 30 % 256
	tDirection[3] = npc.nFaceDirection + 30 % 256
	tDirection[4] = npc.nFaceDirection - 60 % 256
	tDirection[5] = npc.nFaceDirection + 60 % 256
	tDirection[6] = npc.nFaceDirection - 80 % 256
	tDirection[7] = npc.nFaceDirection + 80 % 256
	tDirection[8] = npc.nFaceDirection - 120 % 256
	for	i = 1, 8 do
		local nY = npc.nY + math.floor(math.sin(tDirection[i] / 128 * math.pi) * 40 * 64)
		local nX = npc.nX + math.floor(math.cos(tDirection[i] / 128 * math.pi) * 40 * 64)
		local scene = npc.GetScene()
		if not scene then
			return
		end
		local npcYb = scene.CreateNpc(14961, npc.nX, npc.nY, npc.nZ, npc.nFaceDirection, 8 * GLOBAL.GAME_FPS)
		if npcYb then
			npcYb.RunTo(nX, nY)
		end
	end


end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com