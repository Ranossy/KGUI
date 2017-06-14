---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/苍云特殊武器_寻首击山倒计时buff每跳.lua
-- 更新时间:	2016/9/2 14:43:34
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		
		player.PlaySfx(1429, player.nX, player.nY, player.nZ-128)
		player.PlaySfx(1443, player.nX, player.nY, player.nZ-128)
		player.PlaySfx(1444, player.nX, player.nY, player.nZ-128)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com