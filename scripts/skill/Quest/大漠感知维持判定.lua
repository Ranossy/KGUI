---------------------------------------------------------------------->
-- 脚本名称:	F:/zhugan/client/scripts/skill/Quest/大漠感知维持判定.lua
-- 更新时间:	2012/11/27 19:39:32
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	local tbuff1 = target.GetBuff(4052, 1)
	local tbuff2 = target.GetBuff(4052, 2)
	local tbuff3 = target.GetBuff(4052, 3)
	local tbuff4 = target.GetBuff(4052, 4)
	if (not tbuff1) and (not tbuff2) and (not tbuff3) and (not tbuff4)  then
		target.DelBuff(4496, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com