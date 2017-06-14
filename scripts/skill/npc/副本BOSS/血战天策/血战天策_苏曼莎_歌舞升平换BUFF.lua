------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2014-3-10
-- 效果备注	:  默认的技能脚本
------------------------------------------------


--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID == 175 then
		npc.AddBuff(0, 99, 6966, 1)
	elseif scene.dwMapID ==176 then
		npc.AddBuff(0, 99, 6966, 2)
	elseif scene.dwMapID == 182 then
		npc.AddBuff(0, 99, 6966, 5)
	elseif scene.dwMapID == 183 then
		npc.AddBuff(0, 99, 6966, 6)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com