---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/雁门关之役/雁门关之役_独孤问俗血崩.lua
-- 更新时间:	2014/10/29 15:12:32
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local npctarget = GetNpc(dwCharacterID)
	--local scene = player.GetScene()
	if player then
		local scene = player.GetScene()
		if player.nCurrentLife == player.nMaxLife then
			if scene.dwMapID == 195 then
				player.DelGroupBuff(8480, 1)
			elseif scene.dwMapID == 196 then
				player.DelGroupBuff(8480, 2)
			end
		end
	end

	if npctarget then
		local scene = npctarget.GetScene()
		if npctarget.nCurrentLife == npctarget.nMaxLife then
			if scene.dwMapID == 195 then
				if player then
					player.DelGroupBuff(8480, 1)
				end
			elseif scene.dwMapID == 196 then
				if player then
					player.DelGroupBuff(8480, 2)
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com