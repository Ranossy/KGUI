---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/秘笈/龙池乐加蓝1.lua
-- 更新时间:	2016/9/21 12:54:23
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  纯阳秘笈.lua
-- 创建人    :  CBG
-- 创建时间  :  2011-04-08
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  秘笈
-- 武功套路  :
-- 技能名称  :  纯阳秘笈
-- 技能效果  :
----------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and IsPlayer(dwCharacterID) then
		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.08
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com