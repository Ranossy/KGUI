------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-10-15
-- 效果备注	:  默认的技能脚本
------------------------------------------------
--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID == 175 then
		npc.CastSkill(8359, 1)
	else
		npc.CastSkill(8359, 2)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com