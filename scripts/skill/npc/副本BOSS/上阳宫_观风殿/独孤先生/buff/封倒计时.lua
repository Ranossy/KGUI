---------------------------------------------------------------------->
-- 脚本名称:	scripts\skill\npc\副本BOSS\上阳宫_观风殿\独孤先生\buff\泉涌.lua
-- 更新时间:	2014/7/14 17:06:43
-- 更新用户:	ZHENGYUCHAO
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/Map/上阳宫_观风殿/include/独孤先生通用数据.lua")

-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local huanShen = GetNpc(dwCharacterID)
	if huanShen then
		huanShen.FireAIEvent(2003, huanShen.dwID, 1)
	end
end
-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com