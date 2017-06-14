---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/雁门关之役/雁门关之役_逃往雁门关_血崩.lua
-- 更新时间:	2014/9/12 16:04:38
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local npctarget = GetNpc(dwCharacterID)

	if player then
		if player.nCurrentLife == player.nMaxLife then
			player.DelGroupBuff(8243, 1)
		end
	end

	if npctarget then
		if npctarget.nCurrentLife == npctarget.nMaxLife then
			npctarget.DelGroupBuff(8243, 1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com