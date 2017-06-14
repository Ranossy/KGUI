---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/唐门特殊武器_左转.lua
-- 更新时间:	2016/1/27 16:15:02
-- 更新用户:	zhangchennan
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	if target.GetBuff(4166, 1) then
	target.DelBuff(4166, 1)
	target.TurnTo(target.nFaceDirection + 64)
		target.AddBuff(0, 99, 4166, 1)
	end
		if target.GetBuff(10478, 1) then
	target.DelBuff(10478, 1)
	target.TurnTo(target.nFaceDirection + 64)
		target.AddBuff(0, 99, 10478, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com