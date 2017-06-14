---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/唐门/90级奇穴/唐门延时删除buff.lua
-- 更新时间:	2013/5/16 11:09:56
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.DelGroupBuff(5784, 1)
	player.DelGroupBuff(5785, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com