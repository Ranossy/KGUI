---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/唐门/90级奇穴/判定机关加成效果.lua
-- 更新时间:	2017/3/1 12:37:05
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc_self = GetNpc(dwCharacterID)
	if not npc_self then
		return
	end

	local player = npc_self.GetEmployer()
	if not player then
		return
	end

	if GetDistanceSq(player.nX, player.nY, player.nZ, npc_self.nX, npc_self.nY, npc_self.nZ) > 25 * 64 * 25 * 64 == true then
		if player.GetBuff(6112, 1)then
			player.DelBuff(6112, 1)
		end
	end
	
	if GetDistanceSq(player.nX, player.nY, player.nZ, npc_self.nX, npc_self.nY, npc_self.nZ) > 25 * 64 * 25 * 64 == true then
		if player.GetBuff(6113, 1)then
			player.DelBuff(6113, 1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com