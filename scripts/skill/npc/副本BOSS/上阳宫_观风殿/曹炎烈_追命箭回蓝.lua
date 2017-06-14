---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/曹炎烈_追命箭回蓝.lua
-- 更新时间:	2016/3/22 19:37:55
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
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