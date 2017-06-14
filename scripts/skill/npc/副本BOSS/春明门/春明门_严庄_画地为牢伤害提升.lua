---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/春明门/春明门_严庄_画地为牢伤害提升.lua
-- 更新时间:	2014/5/27 15:53:57
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.GetBuff(7876, 1) then
		if player.GetBuff(7876, 1).nLeftActiveCount <= 595 and player.GetBuff(7876, 1).nLeftActiveCount > 590 then
			if not player.GetBuff(7877, 1) then
				player.AddBuff(0, 99, 7877, 1, 600)
			end
		end

		if player.GetBuff(7876, 1).nLeftActiveCount <= 590 and player.GetBuff(7876, 1).nLeftActiveCount > 585 then
			player.DelBuff(7877, 1)
			if not player.GetBuff(7878, 1) then
				player.AddBuff(0, 99, 7878, 1, 600)
			end
		end

		if player.GetBuff(7876, 1).nLeftActiveCount <= 585 then
			player.DelBuff(7878, 1)
			if not player.GetBuff(7941, 1) then
				player.AddBuff(0, 99, 7941, 1, 600)
			end
		end
	end
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com