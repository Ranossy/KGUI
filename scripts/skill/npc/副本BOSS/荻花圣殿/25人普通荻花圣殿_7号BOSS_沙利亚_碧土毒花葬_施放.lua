------------------------------------------------
-- 创建人   :  张豪		
-- 创建时间	:  2010-9-20
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
 		return
 	end
		local scene = npc.GetScene()
		if not scene then
			return
		end
		for i = 1, 10 do
			local npcTemp = scene.GetNpcByNickName("minghualianwu_" .. i)
			if not npcTemp then
				scene.CreateNpc(13540, npc.nX, npc.nY, npc.nZ, 0, 1920, "minghualianwu_" .. i)
				break
			end
		end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com