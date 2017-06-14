---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/血战天策_阻援_瞄准层数判断.lua
-- 更新时间:	2013/9/4 14:10:28
-- 更新用户:	ks13376-PC
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local scene = player.GetScene()
	if scene.dwMapID == 175 then
		if player.GetBuff(6677, 1) then
			if player.GetBuff(6677, 1).nStackNum >= 6 then
				player.PlaySfx(554, player.nX, player.nY, player.nZ)
				player.PlaySfx(553, player.nX, player.nY, player.nZ + 500)
				player.Die()
			end
		end
	end
	
	if scene.dwMapID == 176 then
		if player.GetBuff(6677, 2) then
			if player.GetBuff(6677, 2).nStackNum >= 6 then
				player.PlaySfx(554, player.nX, player.nY, player.nZ)
				player.PlaySfx(553, player.nX, player.nY, player.nZ + 500)
				player.Die()
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com