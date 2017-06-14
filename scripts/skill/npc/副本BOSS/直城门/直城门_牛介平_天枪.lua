------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-8-21
-- 效果备注	:  默认的技能脚本
------------------------------------------------


--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	if not npc.GetBuff(6565, 1) then
		return
	end
	if npc.GetBuff(6565, 1).nStackNum == 5 then
		npc.DelGroupBuff(6565, 1)
		npc.AddBuff(0,99,6567,1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com