------------------------------------------------
-- 创建人   :  张豪		
-- 创建时间	:  2010-9-20
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
local tDirection = {}
	tDirection[1] = npc.nFaceDirection
	tDirection[2] = npc.nFaceDirection - 60 % 256
	tDirection[3] = npc.nFaceDirection + 60 % 256

		local nY = npc.nY + math.floor(math.sin(tDirection[1] / 128 * math.pi) * 40 * 64)
		local nX = npc.nX + math.floor(math.cos(tDirection[1] / 128 * math.pi) * 40 * 64)
		local scene = npc.GetScene()
		if not scene then
			return
		end
		local npcYb = scene.CreateNpc(13472, npc.nX, npc.nY, npc.nZ, npc.nFaceDirection, -1)
		if npcYb then
			npcYb.RunTo(nX, nY)
		end


end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com