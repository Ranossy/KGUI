------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-11-4
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

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
	if scene.dwMapID == 175 then	
		npc.nCurrentLife = npc.nCurrentLife + npc.nMaxLife * 0.02
	else
		npc.nCurrentLife = npc.nCurrentLife + npc.nMaxLife * 0.02
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com