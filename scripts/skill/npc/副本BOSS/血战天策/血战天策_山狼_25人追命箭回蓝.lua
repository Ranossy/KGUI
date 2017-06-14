---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/血战天策_山狼_25人追命箭回蓝.lua
-- 更新时间:	2013/11/4 20:25:58
-- 更新用户:	ks13376-PC
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	
	npc.nCurrentMana = npc.nCurrentMana + npc.nMaxMana * 0.0625
	if npc.nCurrentMana >= npc.nMaxMana * 0.9 then
		npc.FireAIEvent(2002, 0, 0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com